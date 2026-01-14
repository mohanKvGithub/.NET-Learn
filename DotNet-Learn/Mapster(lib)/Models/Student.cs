using Mapster_lib_.DTO;

namespace Mapster_lib_.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }    
        public int ClassId { get; set; }
        public int TeacherId { get; set; }
        public Class Class { get; set; }
        public List<TeachersDto> Teachers { get; set; }
    }
}
