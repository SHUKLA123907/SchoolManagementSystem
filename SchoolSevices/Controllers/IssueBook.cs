using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SchoolSevices.Models;
using System.Net.Http;
using System.Text;

namespace SchoolSevices.Controllers
{
    public class IssueBook : Controller
    {

        HttpClient Client;

        public IssueBook()
        {
            HttpClientHandler clientHandler = new HttpClientHandler();
            clientHandler.ServerCertificateCustomValidationCallback = (sender
                , Cert, chain, SslPolicyErrors) =>
            { return true; };
            Client = new HttpClient(clientHandler);
        }
        public IActionResult Index()
        {
            List<IssuedBook> issuedBook = new List<IssuedBook>();
            string url = "http://localhost:5211/api/IssuedBook/GetAllIssuedBooks";
            HttpResponseMessage response = Client.GetAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;

                var obj = JsonConvert.DeserializeObject<List<IssuedBook>>(jsondata);
                if (obj != null)
                {

                    issuedBook = obj;
                }

            }
            return View(issuedBook);
        }

        public IActionResult IssueBookAdd()
        {
            return View();
        }

        [HttpPost]
        public IActionResult IssueBookAdd(IssuedBook issuedBook)
        {
            string url = "http://localhost:5211/api/IssuedBook/IssueBook";
            var jsondata = JsonConvert.SerializeObject(issuedBook);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = Client.PostAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            return View();
            
        }

        public IActionResult ReturnBook()
        {
            return View();
        }
        [HttpPut]
        public IActionResult ReturnBook(int id, string returnDate)
        {
            string url = $"http://localhost:5211/api/Book/UpdateBook/{id}{returnDate}";
            
            HttpResponseMessage response = Client.PutAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
);
       
        }


    }
}
