namespace Mapster_lib_.DTO
{
    public class StudentDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }    
        public int ClassId { get; set; }
        public int TeacherId { get; set; }
        public ClassDto Class { get; set; }
        public  List<TeachersDto> Teachers { get; set; }
    }
}
