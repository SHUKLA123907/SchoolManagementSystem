using System.ComponentModel.DataAnnotations;

namespace SchoolManagementProject.Models
{
    public class IssuedBook
    {
        [Key]
        public int IssueId { get; set; }
        public int BookId { get; set; }
        public int UserId { get; set; }
        public String IssueDate { get; set; }
        public String ReturnDate { get; set; }
        public string? Status { get; set; }

        public decimal LateFee { get; set; }
    }
}
