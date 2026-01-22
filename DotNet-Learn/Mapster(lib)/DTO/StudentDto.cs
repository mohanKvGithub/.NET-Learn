using Mapster;

namespace Mapster_lib_.DTO
{
    public class StudentDto
    {
        [AdaptMember("Id")]
        public int StudentId { get; set; }

        [AdaptMember("Name")]
        public string StudentName { get; set; }
        [AdaptMember("Age")]
        public int StudentAge { get; set; }    
        public int ClassId { get; set; }
        public int TeacherId { get; set; }
        public ClassDto Class { get; set; }
        public  List<TeachersDto> Teachers { get; set; }
    }
}
