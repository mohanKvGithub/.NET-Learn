namespace EF_Core.Models
{
    public class Test
    {
        public int Id { get; set; }
        public string Data1 { get; set; }
        public float Data2 { get; set; }
        public double Data3 { get; set; }
        public DateTimeOffset CreatedOn { get; set; }
        public bool IsDeleted { get; set; }
        public virtual List<TestDetails> TestDetails { get; set; } = new List<TestDetails>();
    }
}
