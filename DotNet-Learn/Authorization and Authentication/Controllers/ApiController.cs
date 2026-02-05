using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

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
            var claims = new List<Claim>()
                {
                    new Claim(ClaimTypes.Role, "role"),
                    new Claim("UserId", "UserId"),
                    new Claim(ClaimTypes.Name, "Name"),
                    new Claim(JwtRegisteredClaimNames.Sub, "Email"),
                    new Claim(JwtRegisteredClaimNames.Jti,$"{Guid.NewGuid()}"),
                };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("0123456789ABCDEF0123456789ABCDEF"));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken("https://localhost:7047", "https://localhost:7047", claims, expires: DateTime.UtcNow.AddMinutes(Convert.ToInt64(20)), signingCredentials: creds);
            var AccessToken = new JwtSecurityTokenHandler().WriteToken(token);
            return Ok("Authenticated");
        }
        public IActionResult Home()
        {
            return Ok("This is Home page");
        }
    }
}
