document.addEventListener("DOMContentLoaded", async () => {

  const response = await fetch("http://localhost:3000/books");

  const books = await response.json();

  const table = document.getElementById("books-overview");

  const thead = document.createElement("thead");

  thead.innerHTML = `
    <tr>
      <th>titel</th>
      <th>ID</th>
      <th>author</th>
    </tr>
  `;

  table.appendChild(thead);

  const tbody = document.createElement("tbody");

  books.forEach(book => {

    const tr = document.createElement("tr");

    const idTd = document.createElement("td");
    idTd.textContent = book.id;
    const nameTd = document.createElement("td");
    nameTd.textContent = book.title;
     const pagesTd = document.createElement("td");
    pagesTd.textContent = book.pages;

    const authorTd = document.createElement("td");

    const availableTd = document.createElement("td");
    availableTd.textContent = book.available;
    authorTd.textContent = book.author;

    tr.appendChild(nameTd);
    tr.appendChild(idTd);
    tr.appendChild(authorTd);
    tr.appendChild(availableTd);

    tbody.appendChild(tr);
  });

  table.appendChild(tbody);
});