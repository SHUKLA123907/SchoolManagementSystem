using System.ComponentModel.DataAnnotations;

namespace SchoolManagementProject.Models
{
    public class Reservation
    {
        [Key]
        public int ReservationId { get; set; }
        public int BookId { get; set; }
        public int UserId { get; set; }
        public DateTime ReservationDate { get; set; }
        public string? Status { get; set; }
    }
}
