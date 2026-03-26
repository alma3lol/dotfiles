return {
  { "nsidorenco/neotest-vstest" },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio" },
    lazy = false,
    opts = function()
      local function create_vstest_adapter()
        local client_discovery = require("neotest-vstest.client")
        local dotnet_utils = require("neotest-vstest.dotnet_utils")
        local files = require("neotest-vstest.files")
        local mtp_client = require("neotest-vstest.mtp")
        local nio = require("nio")
        local vstest_client = require("neotest-vstest.vstest")

        if not client_discovery._daralmazad_slnx_patch then
          local clients = {}

          local TestClient = {}
          TestClient.__index = TestClient

          function TestClient:new(project, sub_client)
            local client = {
              sub_client = sub_client,
              project = project,
              semaphore = nio.control.semaphore(1),
              last_discovered = nil,
            }

            setmetatable(client, self)
            return client
          end

          function TestClient:discover_tests(path)
            self.semaphore.acquire()

            local last_modified
            local test_cases = self.sub_client.test_cases or {}

            if self.last_discovered == nil then
              last_modified = dotnet_utils.get_project_last_modified(self.project)
              self.last_discovered = last_modified or 0
              test_cases = self.sub_client:discover_tests()
            else
              if path then
                last_modified = files.get_path_last_modified(path)
              else
                last_modified = dotnet_utils.get_project_last_modified(self.project)
              end

              if last_modified and last_modified > self.last_discovered then
                dotnet_utils.build_project(self.project)
                last_modified = dotnet_utils.get_project_last_modified(self.project)
                self.last_discovered = last_modified or 0
                test_cases = self.sub_client:discover_tests()
              end
            end

            self.semaphore.release()
            return test_cases
          end

          function TestClient:discover_tests_for_path(path)
            local tests = self:discover_tests(path)
            return tests[vim.fs.normalize(path)]
          end

          function TestClient:run_tests(ids)
            return self.sub_client:run_tests(ids)
          end

          function TestClient:debug_tests(ids)
            return self.sub_client:debug_tests(ids)
          end

          client_discovery._daralmazad_slnx_patch = true

          client_discovery.get_client_for_project = function(project, _)
            if not project then
              return nil
            end

            if clients[project.proj_file] ~= nil then
              return clients[project.proj_file]
            end

            local sub_client

            if project.is_mtp_project then
              sub_client = mtp_client:new(project)
            end

            if not sub_client and project.is_test_project then
              sub_client = vstest_client:new(project)
            end

            if not sub_client then
              clients[project.proj_file] = nil
              return nil
            end

            clients[project.proj_file] = TestClient:new(project, sub_client)
            return clients[project.proj_file]
          end
        end

        local adapter = require("neotest-vstest")({
          solution_selector = function(solutions)
            table.sort(solutions, function(a, b)
              return #a < #b
            end)
            return solutions[1]
          end,
        })

        adapter.filter_dir = function(name)
          return name ~= "bin" and name ~= "obj"
        end

        return adapter
      end

      vim.g.neotest_vstest = vim.tbl_deep_extend("force", vim.g.neotest_vstest or {}, {
        broad_recursive_discovery = true,
        discovery_directory_filter = function(search_path)
          return not search_path:match("/%.")
        end,
      })

      return {
        run = {
          enabled = true,
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        adapters = {
          create_vstest_adapter(),
        },
      }
    end,
  },
}
