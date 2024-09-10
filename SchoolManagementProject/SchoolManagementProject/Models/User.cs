using System.ComponentModel.DataAnnotations;

namespace SchoolManagementProject.Models
{
    public class User
    {
        public int Id { get; set; }

        public int UserId { get; set; }

       
        public string? Password { get; set; }

       
        public string? Urole { get; set; }
    }
}
