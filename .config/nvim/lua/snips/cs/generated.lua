local ls                   = require("luasnip")
local fmt                  = require "luasnip.extras.fmt".fmt
local s                    = ls.snippet
local i                    = ls.insert_node
local c                    = ls.choice_node
local t                    = ls.text_node
local sn                   = ls.snippet_node
local f                    = ls.function_node
local r                    = require "luasnip.extras".rep
local fmta                 = require("luasnip.extras.fmt").fmta
local d                    = ls.dynamic_node

local l                    = function(index)
  return f(function(args)
    return args[1][1]:lower()
  end, { index })
end

local uppercaseFirstLetter = function(index)
  return f(function(args)
    return args[1][1]:sub(1, 1):upper() .. args[1][1]:sub(2)
  end, { index })
end

local function trim(x)
  return (x or ""):gsub("^%s+", ""):gsub("%s+$", "")
end

local function parse_props(args)
  local props = {}
  local groups = math.floor(#args / 4)

  for n = 1, groups do
    local base  = (n - 1) * 4
    local typ   = trim(args[base + 1][1])
    local name  = trim(args[base + 2][1])
    local req   = args[base + 3][1] or ""
    local scope = trim(args[base + 4][1] or "all")

    if name ~= "" and scope ~= "skip" then
      props[#props + 1] = { type = typ, name = name, req = req, scope = scope }
    end
  end

  return props
end

local function prop_refs(start_idx, max_props)
  local refs = {}
  local idx = start_idx
  for _ = 1, max_props do
    refs[#refs + 1] = idx
    refs[#refs + 1] = idx + 1
    refs[#refs + 1] = idx + 2
    refs[#refs + 1] = idx + 3
    idx = idx + 4
  end
  return refs
end

local function ensure_nullable(typ)
  typ = trim(typ)
  if typ == "" then return "" end
  if typ:sub(-1) == "?" then return typ end
  return typ .. "?"
end

local function ensure_nonnullable(typ)
  typ = trim(typ)
  if typ == "" then return "" end
  if typ:sub(-1) == "?" then return typ:sub(1, -2) end
  return typ
end

local function scope_has_create(scope)
  return scope == "all" or scope == "dto+create"
end

local function scope_has_update(scope)
  return scope == "all" or scope == "dto+update"
end

local function gen_dto_props(args)
  local props = parse_props(args)
  local out = {}
  for _, p in ipairs(props) do
    local is_id = p.name:lower() == "id"
    local req_kw = is_id and " required" or p.req

    local typ = (req_kw ~= "") and ensure_nonnullable(p.type) or ensure_nullable(p.type)
    table.insert(out, ("    public%s %s %s { get; set; }"):format(req_kw, typ, p.name))
  end
  return out
end

local function gen_create_props(args)
  local props = parse_props(args)
  local out = {}
  for _, p in ipairs(props) do
    local is_id = p.name:lower() == "id"
    if (not is_id) and scope_has_create(p.scope) then
      local req_kw = p.req
      local typ = (req_kw ~= "") and ensure_nonnullable(p.type) or ensure_nullable(p.type)
      table.insert(out, ("    public%s %s %s { get; set; }"):format(req_kw, typ, p.name))
    end
  end
  return out
end

local function gen_update_props(args)
  local props = parse_props(args)
  local out = {}

  for _, p in ipairs(props) do
    local is_id = p.name:lower() == "id"
    if (not is_id) and scope_has_update(p.scope) then
      local typ = ensure_nullable(p.type)
      table.insert(out, ("    public %s %s { get; set; }"):format(typ, p.name))
    end
  end
  return out
end

local function dto_body(refs)
  return fmta([[
  public class <>DTO
  {
<>
  }

  public class Create<>DTO
  {
<>
  }

  public class Update<>DTO
  {
<>
  }

  public class List<>DTO
  {
    public string? <> { get; set; }
  }
]], {
    i(2, "Entity"), -- entity
    f(gen_dto_props, refs),

    r(2),
    f(gen_create_props, refs),

    r(2),
    f(gen_update_props, refs),

    r(2),
    i(3, "Search"),
  })
end

local function extend(dst, src)
  for _, n in ipairs(src) do dst[#dst + 1] = n end
end

local function build_dto(max_props)
  max_props = tonumber(max_props) or 12
  if max_props < 1 then max_props = 1 end
  if max_props > 50 then max_props = 50 end -- safety

  local nodes = {}

  -- header
  nodes[#nodes + 1] = t("namespace ")
  nodes[#nodes + 1] = i(1, "DarAlmazadAPI")
  nodes[#nodes + 1] = t(".Models")
  nodes[#nodes + 1] = t({ "", "{", "", "  // PROPS editor:", "  // scope: all | dto | dto+create | dto+update | skip", "" })

  -- props editor (ROOT LEVEL)
  local base = 4
  for n = 1, max_props do
    local type_i      = c(base,
      { t "string", t "int", t "Decimal", t "bool", t "Guid", t "DateTime", t "TimeOnly", t "DayOfWeek", i(1) })
    local name_i      = i(base + 1, "")
    local req_c       = c(base + 2, { t(" required"), t("") })
    local scp_c       = c(base + 3, { t("all"), t("dto"), t("dto+create"), t("dto+update"), t("skip") })

    nodes[#nodes + 1] = t(("  // %02d) "):format(n))
    nodes[#nodes + 1] = scp_c
    nodes[#nodes + 1] = t(" | public")
    nodes[#nodes + 1] = req_c
    nodes[#nodes + 1] = t(" ")
    nodes[#nodes + 1] = type_i
    nodes[#nodes + 1] = t(" ")
    nodes[#nodes + 1] = name_i
    nodes[#nodes + 1] = t({ "", "" })

    base              = base + 4
  end

  local refs = prop_refs(4, max_props)

  -- append DTOs block (fresh fmta nodes each time!)
  extend(nodes, dto_body(refs))

  nodes[#nodes + 1] = t({ "", "}", "" })
  nodes[#nodes + 1] = i(0)

  return sn(nil, nodes)
end

local function service_body(propsList)
  return fmta([=[
using <namespace>.Data;
using <namespaceCopy>.Data.Entities;
using <namespaceCopy>.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace <namespaceCopy>.Services
{
  public class <entity>Service(
      ApplicationDbContext context,
      UserManager<<User>> userManager,
      IHttpContextAccessor httpContextAccessor,
      ILogger<<BaseService<<<entityCopy>, <entityCopy>DTO, Create<entityCopy>DTO, Update<entityCopy>DTO, List<entityCopy>DTO>>>> logger
      ) : BaseService<<<entityCopy>, <entityCopy>DTO, Create<entityCopy>DTO, Update<entityCopy>DTO, List<entityCopy>DTO>>(context, userManager, logger, httpContextAccessor), IBaseService<<<entityCopy>, <entityCopy>DTO>>
  {
    private IQueryable<<<entityCopy>>> <entityCopy>s =>> _context.Set<<<entityCopy>>>();
    public override async Task<<<entityCopy>DTO>> CreateAsync(Create<entityCopy>DTO request)
    {
      var username = _httpContextAccessor.HttpContext?.User?.Claims.ToList()[0].Value ?? "";
      var user = await _userManager.FindByNameAsync(username) ?? throw new InvalidOperationException("User not defined. Forged token?");
      var now = DateTime.UtcNow;
      var entity = new <entityCopy>()
      {<props>
        <user>Id = user.Id,
        CreatedAt = now,
        UpdatedAt = now,
      };
      _context.Add(entity);
      await _context.SaveChangesAsync();
      return ConvertToDto(entity);
    }

    public override async Task<<bool>> DeleteAsync(Guid Id)
    {
      var entity = await <entityCopy>s.FirstOrDefaultAsync(<lower> =>> <lower>.Id == Id) ?? throw new InvalidOperationException("Entity not found");
      _context.Remove(entity);
      await _context.SaveChangesAsync();
      return true;
    }

    public override async Task<<List<<<entityCopy>DTO>>>> ListAsync(List<entityCopy>DTO? request = null)
    {
      return await <entityCopy>s.Select(<lower> =>> ConvertToDto(<lower>)).ToListAsync();
    }

    public override async Task<<<entityCopy>DTO>> UpdateAsync(Guid Id, Update<entityCopy>DTO request)
    {
      var entity = await <entityCopy>s.FirstOrDefaultAsync(<lower> =>> <lower>.Id == Id) ?? throw new InvalidOperationException("Entity not found");<propsUpdate>
      entity.UpdatedAt = DateTime.UtcNow;
      _context.Update(entity);
      await _context.SaveChangesAsync();
      return ConvertToDto(entity);
    }

    public static <entityCopy>DTO ConvertToDto(<entityCopy> entity)
    {
      return new()
      {
        Id = entity.Id,<propsDto>
        <userCopy> = UserService.ConvertToDto(entity.<userCopy>),
      };
    }
  }
}
]=], {
    namespace = i(1, "DarAlmazadAPI"),
    namespaceCopy = r(1),
    entity = i(2, "Entity"),
    entityCopy = r(2),
    lower = l(2), -- <- this one is weird, keep it -1 from the one before it :/
    user = i(3, "CreatedBy"),
    userCopy = r(3),
    props = f(function()
      local nodes = { "" }
      for _, item in ipairs(propsList) do
        nodes[#nodes + 1] = ("\t\t\t\t%s = request.%s,"):format(item, item)
      end
      return nodes
    end, {}),
    propsUpdate = f(function()
      local nodes = { "" }
      for _, item in ipairs(propsList) do
        nodes[#nodes + 1] = ("\t\t\tentity.%s = request.%s ?? entity.%s;"):format(item, item, item)
      end
      return nodes
    end, {}),
    propsDto = f(function()
      local nodes = { "" }
      for _, item in ipairs(propsList) do
        nodes[#nodes + 1] = ("\t\t\t\t%s = entity.%s,"):format(item, item)
      end
      return nodes
    end, {}),
  })
end

local function build_service(props)
  local propsList = {}
  for str in string.gmatch(props, "([^,]+)") do
    table.insert(propsList, str)
  end
  return sn(nil, service_body(propsList))
end

return {
  s(
    "rep",
    fmt([=[
[Required]
public required {} {} {{get; set;}}
]=], {
      i(2, "string"),
      i(1, "Password"),
    })
  ),

  s(
    "cm",
    fmt([=[
    [Route("{route}")]
    [Http{methodType}]{authorization}
    public async Task<IActionResult> {methodName}({args})
    {{
      {}
    }}
]=], {
      route = i(1, "/"),
      methodType = c(2, {
        t("Get"),
        t("Post"),
        t("Delete"),
        t("Put"),
        t("Patch"),
        t("Head"),
        t("Options")
      }),
      authorization = c(3, {
        t(""),
        t({ "", "[AllowAnonymous]" }),
        t({ "", "[Authorize]" }),
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(")]") },
        { t({ "", "[Authorize(Policy = " }),                i(1, ""), t(")]") },
        { t({ "", "[Authorize(Roles = " }),                 i(1, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Policy = "), i(2, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Roles = "),  i(2, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Policy = "), i(2, ""), t(", Roles = "), i(3, ""), t(")]") },
        { t({ "", "[Authorize(Policy = " }),                i(1, ""), t(", Roles = "),  i(2, ""), t(")]") },
      }),
      methodName = i(4, "MethodName"),
      args = c(5, {
        t(""),
        { t("[FromBody] "), i(1, "RequestType"), t(" "), i(2, "request"), }
      }),
      i(0),
    })
  ),

  s(
    "nec",
    fmt([=[
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;

namespace {project}.Data.Entities;

[Table("{table}")]
public class {class} : BaseEntity
{{
  public static void Map(ModelBuilder modelBuilder)
  {{
    var builder = modelBuilder.Entity<{classEntity}>();
    {}
    BaseMapping(builder);
  }}
}}
]=], {
      project = i(1, "DarAlmazadAPI"),
      table = i(2, "Table"),
      class = i(3, "ClassName"),
      classEntity = r(3),
      i(0),
    })
  ),

  s(
    "epml",
    fmt([=[
[MaxLength({})]
]=], {
      i(1, "100")
    })
  ),

  s(
    "epnm",
    fmt([=[
[NotMapped]
]=], {
    })
  ),

  s(
    "epr",
    fmt([=[
[Required]
]=], {
    })
  ),

  s(
    "epra",
    fmt([=[
[Range({}, {})]
]=], {
      i(1, "0"),
      i(2, "100"),
    })
  ),

  s(
    "epk",
    fmt([=[
[Key]
]=], {
    })
  ),

  s(
    "epea",
    fmt([=[
[EmailAddress]
]=], {
    })
  ),

  s(
    "epre",
    fmt([=[
[RegularExpression(@"{}", ErrorMessage = "{}")]
]=], {
      i(1, ""),
      i(2, ""),
    })
  ),

  s(
    "epc",
    fmt([=[
{}{} ICollection<{}> {} {{ get; set; }} = new List<{}>();
]=], {
      c(1, {
        t("public"),
        t("private"),
        t("protected"),
      }),
      c(2, { t "", t " required" }),
      i(3, "CollectionType"),
      i(4, "CollectionName"),
      r(3),
    })
  ),

  s(
    "ep",
    fmt([=[
{}{} {}{} {} {{ get; set; }}{}
]=], {
      c(1, {
        t("public"),
        t("private"),
        t("protected"),
      }),
      c(2, { t "", t " required" }),
      c(3, { t "string", t "int", t "Decimal", t "bool", t "Guid", t "DateTime", t "TimeOnly", t "DayOfWeek", i(2) }),
      c(4, { t "", t "?" }),
      i(5, "PropertyName"),
      c(6, {
        t "",
        sn(1, { t " = ", i(1, ""), t(";") }),
        t " = null;",
        t " = null!;",
      }),
    })
  ),

  s(
    "bhm",
    fmt([=[
builder.HasMany({entity0} => {entity1}.{collectionName}).WithOne({otherEntity0} => {otherEntity1}.{entityThere0}).HasForeignKey({otherEntity2} => {otherEntity3}.{entityThere1}Id).HasPrincipalKey({entity2} => {entity3}.Id);
]=], {
      entity0 = i(1, "ThisEntity"),
      entity1 = r(1),
      entity2 = r(1),
      entity3 = r(1),
      collectionName = i(2, "CollectionName"),
      otherEntity0 = i(3, "OtherEntity"),
      otherEntity1 = r(3),
      otherEntity2 = r(3),
      otherEntity3 = r(3),
      entityThere0 = i(4, "ThisEntityThere"),
      entityThere1 = r(4),
    })
  ),

  s(
    "bho",
    fmt([=[
builder.HasOne({entity0} => {entity1}.{relationName0}).WithOne({otherEntity0} => {otherEntity1}.{entityThere}).HasForeignKey<{entityType}>({entity2} => {entity3}.{relationName1}Id).IsRequired();
]=], {
      entity0 = i(1, "ThisEntity"),
      entity1 = r(1),
      entity2 = r(1),
      entity3 = r(1),
      relationName0 = i(2, "RelationName"),
      relationName1 = r(2),
      otherEntity0 = i(3, "OtherEntity"),
      otherEntity1 = r(3),
      entityThere = i(4, "ThisEntityThere"),
      entityType = i(5, "ThisEntityType"),
    })
  ),

  s(
    "bai",
    fmt([=[
builder.Navigation({} => {}.{}).AutoInclude();
]=], {
      i(1, "ThisEntity"),
      r(1),
      i(2, "RelationName"),
    })
  ),

  s("dto", d(1, function() return build_dto(6) end, {})),

  s({ trig = "dto:(%d+)", trigEngine = "pattern", wordTrig = false },
    d(1, function(_, snip)
      return build_dto(tonumber(snip.captures[1]) or 6)
    end, {})
  ),
  s(
    "newapicontroller",
    fmt([=[
using {namespace}.Models;
using {namespaceCopy}.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace {namespaceCopy}.Controllers
{{

  [Route("api/{entity}s")]
  [ApiController]
  [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
  public class {entityUppercaseFirstLetter}sController(
      ILogger<{entityUppercaseFirstLetter}sController> logger,
      {entityUppercaseFirstLetter}Service service
  ) : ControllerBase
  {{
    private readonly ILogger<{entityUppercaseFirstLetter}sController> _logger = logger;
    private readonly {entityUppercaseFirstLetter}Service _service = service;

    [HttpGet]
    public async Task<IActionResult> List{entityUppercaseFirstLetter}s([FromQuery] string? Search)
    {{
      _logger.LogInformation("Listing {entityCopy}s");
      return Ok(await _service.ListAsync(new() {{ Search = Search }}));
    }}

    [HttpPost]
    public async Task<IActionResult> Create{entityUppercaseFirstLetter}([FromBody] Create{entityUppercaseFirstLetter}DTO request)
    {{
      _logger.LogInformation("Creating a {entityCopy}");
      return Ok(await _service.CreateAsync(request));
    }}

    [Route("{{id}}")]
    [HttpPut]
    public async Task<IActionResult> Update{entityUppercaseFirstLetter}(string id, [FromBody] Update{entityUppercaseFirstLetter}DTO request)
    {{
      _logger.LogInformation("Updating a {entityCopy}");
      return Ok(await _service.UpdateAsync(Guid.Parse(id), request));
    }}

    [Route("{{id}}")]
    [HttpDelete]
    public async Task<IActionResult> Delete{entityUppercaseFirstLetter}(string Id)
    {{
      _logger.LogInformation("Deleting a {entityCopy}");
      return Ok(await _service.DeleteAsync(Guid.Parse(Id)));
    }}
  }}
}}
]=], {
      namespace = i(1, "DarAlmazadAPI"),
      namespaceCopy = r(1),
      entity = i(2, "entity"),
      entityUppercaseFirstLetter = uppercaseFirstLetter(2),
      entityCopy = r(2),
    })
  ),

  s("newsrvc", d(1, function() return build_service("") end, {})),
  s(
    { trig = "newsrvc:(.+)", trigEngine = "pattern", wordTrig = false },
    d(1, function(_, snip)
      return build_service(snip.captures[1] or "")
    end)
  ),

  ------------------------------------------------------ Snippets goes here
}
