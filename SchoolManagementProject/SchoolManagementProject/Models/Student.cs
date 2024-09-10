using System.ComponentModel.DataAnnotations;

namespace SchoolManagementProject.Models
{
    public class Student
    {
        [Key]
       
        public int StudentId { get; set; }

        public int UserId { get; set; }

        public string? FirstName { get; set; }

        public string? MiddleName { get; set; }

        public string? LastName { get; set; }

        public int Progress_ReportID { get; set; }

        
        public DateTime DOB { get; set; }

        public string? Gender {  get; set; }

        public string? Address { get; set; }

        public string? Email { get; set; }

        public string? Phone { get; set; }

        public DateTime EnrollmentDate { get; set; }

        public int? Guardian_Id { get; set; }

        public int ClassId { get; set; }




    }
}
