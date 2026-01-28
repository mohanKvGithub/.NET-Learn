using Authorization_and_Authentication.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace Authorization_and_Authentication.Controllers
{
    [Authorize(AuthenticationSchemes=JwtBearerDefaults.AuthenticationScheme)]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("453kl4j534lk45434k5lj3443k5lj34k453kl4j534lk45434k5lj3443k5lj34k"));
            var credentials=new SigningCredentials(securityKey,SecurityAlgorithms.HmacSha512);
            var securityToken = new JwtSecurityToken(signingCredentials:credentials);
            var token = new JwtSecurityTokenHandler().WriteToken(securityToken);

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
    }
}
