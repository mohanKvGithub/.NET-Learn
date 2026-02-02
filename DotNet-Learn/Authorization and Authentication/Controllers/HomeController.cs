using Authorization_and_Authentication.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using System.Security.Claims;

namespace Authorization_and_Authentication.Controllers
{
    [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
    public class HomeController(IHttpContextAccessor contextAccessor, ILogger<HomeController> logger) : Controller
    {
        private readonly ILogger<HomeController> _logger=logger;

        [AllowAnonymous]
        public IActionResult Index()
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name, "TestUser"),
                new Claim(ClaimTypes.Role, "Admin"),
                new Claim("CustomClaimType", "CustomClaimValue")
            };
            var claimIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimIdentity));
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult GenerateToken()
        {

            return View();
        }
        [AllowAnonymous]
        public IActionResult NotAuthentic()
        {

            return View();
        }
        public IActionResult Claims()
        {
            var claims=contextAccessor.HttpContext.User.Claims.ToList();
            ViewBag.Claims=claims;
            return View();
        }
    }
}
