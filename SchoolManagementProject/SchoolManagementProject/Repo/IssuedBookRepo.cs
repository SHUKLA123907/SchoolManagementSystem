using SchoolManagementProject.Models;

namespace SchoolManagementProject.Repo
{
    public interface IssuedBookRepo
    {
        List<IssuedBook> GetAllIssuedBooks();
        IssuedBook GetIssuedBookById(int id);
        void IssueBook(IssuedBook issuedBook);
        void ReturnBook(int id, string returnDate);
        decimal CalculateLateFee(int id, string returnDate);

    }
}
