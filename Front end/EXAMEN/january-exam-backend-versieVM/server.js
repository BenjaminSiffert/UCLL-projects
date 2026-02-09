const express = require("express");
const cors = require("cors");

const books = [
  { id: 1, title: "Pride and Prejudice", author: "Jane Austen", pages: 279, available: true },
  { id: 2, title: "1984", author: "George Orwell", pages: 328, available: true },
  { id: 3, title: "The Color Purple", author: "Alice Walker", pages: 295, available: true },
  { id: 4, title: "The Hobbit", author: "J.R.R. Tolkien", pages: 310, available: false },
  { id: 5, title: "Jane Eyre", author: "Charlotte Brontë", pages: 507, available: true },
  { id: 6, title: "The Picture of Dorian Gray", author: "Oscar Wilde", pages: 254, available: true },
];

const app = express();

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  res.send("Exam back-end app is running...");
});

app.get("/books", (req, res) => {
  const { sort } = req.query;
  let result = [...books];

  if (sort === 'author') {
    result.sort((a, b) => a.author.localeCompare(b.author));
  }

  res.json(result);
});

app.post("/books/borrow/:id", (req, res) => {
  const { id } = req.params;
  const book = books.find(b => b.id === Number(id));
  if (!book) {
    res.status(400).send("Book not found");
    return;
  }
  book.available = false;
  res.sendStatus(200);
});

app.listen(3000, () => {
  console.log("server listening on port 3000");
});
