using Microsoft.EntityFrameworkCore;
using SchoolManagementProject.Models;

namespace SchoolManagementProject.Data
{
    public class ApplicationDbContext :DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext>Options) : base(Options) { }
        public DbSet<User> Users { get; set; }
        public DbSet<Book> books { get; set; }

        public DbSet<IssuedBook> issues { get; set; }

        public DbSet<Reservation> Reservations { get; set; }



    }
}
