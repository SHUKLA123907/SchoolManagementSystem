using SchoolManagementProject.Models;

namespace SchoolManagementProject.Repo
{
    public interface BookRepository
    {
        
        List<Book> GetAllBooks();
        Book GetBookById(int id);
        void AddBook(Book book);
        void UpdateBook(Book book);
        void DeleteBook(int id);
    }
}
