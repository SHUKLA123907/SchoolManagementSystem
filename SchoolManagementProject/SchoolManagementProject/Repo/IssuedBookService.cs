using Microsoft.EntityFrameworkCore;
using SchoolManagementProject.Data;
using SchoolManagementProject.Models;

namespace SchoolManagementProject.Repo
{
    public class IssuedBookService : IssuedBookRepo
    {

        private readonly ApplicationDbContext db;

        public IssuedBookService(ApplicationDbContext db)
        {
            this.db = db;
        }

        public decimal CalculateLateFee(int id, string returnDate)
        {
            var data = db.issues.FromSqlRaw($"exec CalculateLateFee2 {id},'{returnDate}'").AsEnumerable()
                .Select(ib => ib.LateFee)  
                .SingleOrDefault();
            return data  ;
            
        }

        public List<IssuedBook> GetAllIssuedBooks()
        {
            var data = db.issues.FromSqlRaw($"exec GetAllIssuedBooks ").ToList();
            return data;
        }

       public IssuedBook GetIssuedBookById(int id)
        {
            var data = db.issues.FromSqlRaw($"exec GetIssuedBookById {id} ").AsEnumerable().SingleOrDefault();
            return data;
        }

        public void IssueBook(IssuedBook issuedBook)
        {
            db.Database.ExecuteSqlRaw($"exec IssueBook1 {issuedBook.BookId},{issuedBook.UserId},'{issuedBook.IssueDate}','{issuedBook.ReturnDate}',{issuedBook.LateFee}");
        }

       public void ReturnBook(int id, string returnDate)
        {
            db.Database.ExecuteSqlRaw($"exec ReturnBook {id},'{returnDate}'");
        }


    }
}
