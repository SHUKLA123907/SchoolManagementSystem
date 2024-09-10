﻿namespace SchoolManagementProject.Models
{
    public class Book
    {

        public int BookId { get; set; }
        public string? Title { get; set; }
        public string? Author { get; set; }
        public string? ISBN { get; set; }
        public string PublishedDate { get; set; }
        public int AvailableCopies { get; set; }
    }
}
