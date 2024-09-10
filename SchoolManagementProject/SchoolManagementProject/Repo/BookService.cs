using Microsoft.EntityFrameworkCore;
using SchoolManagementProject.Data;
using SchoolManagementProject.Models;

namespace SchoolManagementProject.Repo
{
    public class BookService : BookRepository
    {
       private readonly ApplicationDbContext db;
    public BookService(ApplicationDbContext db)
        {
            this.db = db;
        }

        public List<Book> GetAllBooks()
        { 
           var data= db.books.FromSqlRaw($"exec GetAllBooks ").ToList();
            return data;
        }

        public Book GetBookById(int id)
        {
            var data = db.books.FromSqlRaw($"exec GetBookById {id} ").ToList().SingleOrDefault();
            return data;
        }

        public void AddBook(Book book)
        {
            db.Database.ExecuteSqlRaw($"exec InsertBook1 '{book.Title}','{book.Author}','{book.ISBN}','{book.PublishedDate}',{book.AvailableCopies}");
           
           
        }

        public void UpdateBook(Book book) 
        {
            db.Database.ExecuteSqlRaw($"exec UpdateAll1 '{book.Title}','{book.Author}','{book.ISBN}','{book.PublishedDate}',{book.AvailableCopies}" );
            
        }

        public void DeleteBook(int id)
        {
            var data=db.books.Find(id);
            if (data != null)
            {

                db.books.Remove(data);
                db.SaveChanges();

            }
        }

       
        
    }
}
