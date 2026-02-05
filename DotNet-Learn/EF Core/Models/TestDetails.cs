namespace EF_Core.Models
{
    public class TestDetails
    {
        public int Id { get; set; }
        public int TestId { get; set; }
        public string DetailData1 { get; set; }
        public string DetailData2 { get; set; }
        public DateTimeOffset CreatedOn { get; set; }
        public bool IsDeleted { get; set; }
        public virtual Test Test { get; set; }
    }
}
