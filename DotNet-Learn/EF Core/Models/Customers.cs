using System.ComponentModel.DataAnnotations;

namespace EF_Core.Models
{
    public class Customers
    {
        public int CustomerId { get;set; }
        public string FirstName { get;set; }
        public string LastName { get;set; }
        public string Email { get;set; }
        public string Phone { get;set; }
        public DateTime CreatedDate { get; set; }
    }
}
