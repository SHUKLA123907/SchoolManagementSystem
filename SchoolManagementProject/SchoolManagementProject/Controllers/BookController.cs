
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SchoolManagementProject.Models;
using SchoolManagementProject.Repo;

namespace SchoolManagementProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly BookRepository repo;
        public BookController(BookRepository repo)
        {
            this.repo = repo;
        }



        [Route("GetBook")]
        [HttpGet]
        public IActionResult GetAllBooks() 
        {
            var d= repo.GetAllBooks();
            return Ok(d); 
        }



        [Route("GetBookById/{id}")]
        [HttpGet]
        public IActionResult GetBook(int id)
        {
            var book = repo.GetBookById(id);
            if (book == null)
            {
                return NotFound("Book not found");
            }
            return Ok(book);
        }

        [Route("AddBook")]
        [HttpPost]
        public IActionResult AddBook(Book b )
        {
            repo.AddBook(b);

            return Ok("Book added Successfully");
        }

    


        [Route("UpdateBook")]
        [HttpGet]
        public IActionResult UpdateBook( Book book)
        {
            var d = repo.GetBookById(book.BookId);
            if (d == null)
            {
                return NotFound("Book not found");
            }

            repo.UpdateBook(d);
            return Ok("Book updated successfully");
        }


        

        [Route("DeleteBook/{id}")]
        [HttpDelete]
        public IActionResult DeleteBook(int id)
        {
            var d = repo.GetBookById(id);
            if (d == null)
            {
                return NotFound("Book not found");
            }

            repo.DeleteBook(id);
            return Ok("Book deleted successfully");
        }





    }
}
