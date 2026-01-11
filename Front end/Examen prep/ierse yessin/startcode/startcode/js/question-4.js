// Wait until the HTML page is fully loaded
document.addEventListener("DOMContentLoaded", async () => {

  // 1️⃣ Fetch all todo items from the backend
  // This sends a GET request to http://localhost:3000/todos
  const response = await fetch("http://localhost:3000/todos");

  // Convert the response (JSON text) into a JavaScript array
  const todos = await response.json();

  // 2️⃣ Select the empty table from the HTML
  const table = document.getElementById("todoTable");

  // 3️⃣ Create the table header (column titles)
  const thead = document.createElement("thead");

  // Add one row with three columns
  thead.innerHTML = `
    <tr>
      <th>Name</th>
      <th>Status</th>
      <th>Done?</th>
    </tr>
  `;

  // Add the header to the table
  table.appendChild(thead);

  // 4️⃣ Create the table body (this will contain the todo rows)
  const tbody = document.createElement("tbody");

  // 5️⃣ Loop over each todo item from the backend
  todos.forEach(todo => {

    // Create a new table row
    const tr = document.createElement("tr");

    // ----- NAME COLUMN -----
    const nameTd = document.createElement("td");
    nameTd.textContent = todo.name;

    // ----- STATUS COLUMN -----
    const statusTd = document.createElement("td");

    // Show human-readable text instead of true/false
    statusTd.textContent = todo.isDone ? "Done" : "Not done";

    // ----- CHECKBOX COLUMN -----
    const checkboxTd = document.createElement("td");
    const checkbox = document.createElement("input");

    // Create a checkbox input
    checkbox.type = "checkbox";

    // If isDone is true, the checkbox is checked
    checkbox.checked = todo.isDone;

    // 6️⃣ Listen for changes on the checkbox
    checkbox.addEventListener("change", async () => {

      // Send a POST request to toggle the todo status on the backend
      await fetch(`http://localhost:3000/todos/toggle/${todo.id}`, {
        method: "POST"
      });

      // Update the local todo object
      // checkbox.checked is true or false
      todo.isDone = checkbox.checked;

      // Update the status text in the table
      statusTd.textContent = todo.isDone ? "Done" : "Not done";
    });

    // Add checkbox to its table cell
    checkboxTd.appendChild(checkbox);

    // Add all cells to the row
    tr.appendChild(nameTd);
    tr.appendChild(statusTd);
    tr.appendChild(checkboxTd);

    // Add the row to the table body
    tbody.appendChild(tr);
  });

  // 7️⃣ Add the table body to the table
  table.appendChild(tbody);
});
