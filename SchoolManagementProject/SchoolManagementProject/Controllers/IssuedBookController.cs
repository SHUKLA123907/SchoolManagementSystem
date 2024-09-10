using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SchoolManagementProject.Models;
using SchoolManagementProject.Repo;

namespace SchoolManagementProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IssuedBookController : ControllerBase
    {
        private readonly IssuedBookRepo repo;
        public IssuedBookController(IssuedBookRepo repo)
        {
            this.repo = repo;
        }


        [Route("GetAllIssuedBooks")]
        [HttpGet]
        public IActionResult GetAllIssuedBooks()
        {
            var d = repo.GetAllIssuedBooks();
            return Ok(d);
        }

        [Route("GetIssuedBookById/{id}")]
        [HttpGet]
        public IActionResult GetIssuedBookById(int id)
        {
            var b = repo.GetIssuedBookById(id);
            if (b == null)
            {
                return NotFound("Book not found");
            }
            return Ok(b);
        }

        [Route("IssueBook")]
        [HttpPost]
        public IActionResult IssueBook(IssuedBook issuedBook)
        {
            repo.IssueBook(issuedBook);

            return Ok("Book issued successfully");
        }




        [Route("Return/{id}")]
        [HttpPut]
        public ActionResult ReturnBook(int id, string returnDate)
        {
            repo.ReturnBook(id, returnDate);
            return Ok(new { message = "Book returned successfully" });
        }

        [Route("late/{id}")]
        [HttpGet]
        public ActionResult<decimal> CalculateLateFee(int id,  string returnDate)
        {
            var lateFee = repo.CalculateLateFee(id, returnDate);
            return Ok(lateFee);
        }

    }
}
