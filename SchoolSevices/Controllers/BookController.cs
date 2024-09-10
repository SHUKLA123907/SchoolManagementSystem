using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SchoolSevices.Models;
using System.Text;

namespace SchoolSevices.Controllers
{
    public class BookController : Controller
    {
        HttpClient Client;

        public BookController()
        {
            HttpClientHandler clientHandler = new HttpClientHandler();
            clientHandler.ServerCertificateCustomValidationCallback = (sender
                , Cert, chain, SslPolicyErrors) =>
            { return true; };
            Client = new HttpClient(clientHandler);
        }


        public IActionResult Index()
        {
            List<Book> book = new List<Book>();
            string url = "http://localhost:5211/api/Book/GetBook";

          
            HttpResponseMessage response = Client.GetAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
               
                var obj = JsonConvert.DeserializeObject<List<Book>>(jsondata);
                if (obj != null)
                {

                    book = obj;
                }

            }
            return View(book);
        }

        public IActionResult AddBook()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddBook(Book book)
        {
            string url = "http://localhost:5211/api/Book/AddBook";
            var jsondata = JsonConvert.SerializeObject(book);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = Client.PostAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            return View();
        }
        [HttpGet]
        public IActionResult DeleteBook(int id)
        {
            string url = $"http://localhost:5211/api/Book/DeleteBook/{id}";
            HttpResponseMessage response = Client.DeleteAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            else 
            { return View(); 
            }


        }

        
        public IActionResult UpdateBook(int id)
        {
            Book book = new Book();
            string url = $"http://localhost:5211/api/Book/GetBookById/{id}";

            HttpResponseMessage response = Client.GetAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
                var obj = JsonConvert.DeserializeObject<Book>(jsondata);
                if (obj != null)
                {
                    book = obj;
                }
            }
            return View(book);
        }

        [HttpPost]
        public IActionResult UpdateBook(Book book)
        {
            string url = "http://localhost:5211/api/Book/UpdateBook";
            var jsondata = JsonConvert.SerializeObject(book);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = Client.PutAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            return View(book);
        }





    }
}
