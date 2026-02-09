const books = [
  { title: "Pride and Prejudice", author: "Jane Austen", pages: 279, available: true },
  { title: "1984", author: "George Orwell", pages: 328, available: true },
  { title: "The Color Purple", author: "Alice Walker", pages: 295, available: true },
  { title: "The Hobbit", author: "J.R.R. Tolkien", pages: 310, available: true },
  { title: "Jane Eyre", author: "Charlotte Brontë", pages: 507, available: true },
  { title: "The Picture of Dorian Gray", author: "Oscar Wilde", pages: 254, available: true },
];
let books_overview = "books-overview"
function listNaarString(book)
{
let object = "Title: " + book.title + "Author: " + book.author + ", Pages: " + book.pages + " pages" + "Status : " + book.available; 
return object
}

function addList(text, index) {
  const classname = books[index].available ? "" : "not-available";
  document.getElementById(books_overview).innerHTML +=`<ul onclick="changestatus(${index})" class="${classname}">${text}</ul>`;
}

function DisplayList() {
  document.getElementById(books_overview).innerHTML = "";
  minimumPages = Number(document.getElementById("pages-filter").number);
  document.getElementsByClassName("topbar").innerHTML = "";
  document.getElementById(books_overview);
  for (let i = 0; i < books.length; i++) {
    //if (books[i].pages >= minimumPages) {

    addList(listNaarString(books[i]), i);
    console.log(books[i].pages);
    }
  }
//}

function changestatus(index) {
  if(books[index].available == true){
  books[index].available = !books[index].available;
  DisplayList()}
  else{
    console.log("not available")
  }

}


DisplayList()
