local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node

return {
  s(
    "apiController",
    fmt([=[
 using Microsoft.AspNetCore.Mvc;

namespace {}.Controllers
{{

  [Route("api/[controller]")]
  [ApiController]
  public class {}Controller : ControllerBase
  {{
    [HttpGet]
    public ActionResult<{}> {}()
    {{
      return Ok({});
    }}
  }}
}}
]=], {
      i(1, "DarAlmazadAPI"),
      i(2, "WeatherForecast"),
      i(4, "int"),
      i(3, "GetRandomInt"),
      i(5, "Random.Shared.Next(0, 100)"),
    })
  ),

  ------------------------------------------------------ Snippets goes here
}
