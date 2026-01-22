using System.Diagnostics;
using System.Security.Cryptography.Xml;
using Mapster;
using Mapster_lib_.DTO;
using Mapster_lib_.Models;
using Microsoft.AspNetCore.Mvc;

namespace Mapster_lib_.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            var student=new StudentDto
            {
                StudentId = 1,
                StudentName = "John Doe",
                StudentAge = 20,
                ClassId = 101,
                TeacherId = 201,
                Class = new ClassDto
                {
                    Id = 101,
                    ClassName = "Mathematics"
                },
                Teachers = new List<TeachersDto>
                {
                    new TeachersDto { Id = 201, Name = "Mr. Smith", Subject = "Mathematics" },
                    new TeachersDto { Id = 202, Name = "Ms. Johnson", Subject = "Science" }
                }
            };
            var studentObject = new Student();
            studentObject = student.Adapt<Student>();
            studentObject.Id = 10;
            studentObject.Name = "mohan";
            studentObject.Adapt(student);
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
    }
}
