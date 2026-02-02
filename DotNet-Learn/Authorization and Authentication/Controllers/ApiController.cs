using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Authorization_and_Authentication.Controllers
{
    [ApiController]
    [Route("api/test")]
    [Authorize(AuthenticationSchemes =JwtBearerDefaults.AuthenticationScheme)]
    public class ApiController : ControllerBase
    {
        [AllowAnonymous]
        public IActionResult Login()
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name, "TestUser"),
                new Claim(ClaimTypes.Role, "Admin"),
                new Claim("CustomClaimType", "CustomClaimValue")
            };
            return Ok("Authenticated");
        }
        public IActionResult Home()
        {
            return Ok("This is Home page");
        }
    }
}
