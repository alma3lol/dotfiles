local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local sn = ls.snippet_node

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
    "entity",
    fmt([=[
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DarAlmazadAPI.Data.Entities;

[Table("{}")]
public class {} : BaseEntity
{{
  {}
}}
]=], {
      i(2, "Users"),
      i(1, "User"),
      i(0)
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
      methodType = i(2, "Get"),
      authorization = c(3, {
        t(""),
        t({ "", "[AllowAnonymous]" }),
        t({ "", "[Authorize]" }),
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(")]") },
        { t({ "", "[Authorize(Policy = " }),               i(1, ""), t(")]") },
        { t({ "", "[Authorize(Roles = " }),                i(1, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Policy = "), i(2, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Roles = "), i(2, ""), t(")]") },
        { t({ "", "[Authorize(AuthenticationSchemes = " }), i(1, ""), t(", Policy = "), i(2, ""), t(", Roles = "), i(3, ""), t(")]") },
        { t({ "", "[Authorize(Policy = " }),               i(1, ""), t(", Roles = "),  i(2, ""), t(")]") },
      }),
      methodName = i(4, "MethodName"),
      args = c(5, {
        t(""),
        sn(1, {
          t("[FromBody] "),
          i(1, "RequestType "),
          i(2, "request"),
        })
      }),
      i(0),
    })
  ),

  ------------------------------------------------------ Snippets goes here
}
