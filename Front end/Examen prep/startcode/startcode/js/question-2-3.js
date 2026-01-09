const todos = [
  { name: 'Study for exam', isDone: true, duration: 3 },
  { name: 'Finish exam', isDone: false, duration: 2 },
  { name: 'ZIP exam', isDone: false, duration: 1 },
  { name: 'Turn in exam', isDone: false, duration: 1 },
];
function listNaarString(todos)
{
 // Add Properties
let object = "Name: " + todos.name + "-Status: " + todos.isDone + ", Rating: " + todos.duration; 
return object
}

function displayList(todos){
  document.getElementById("todos").innerHTML =
    document.getElementById("todos").innerHTML +
    todos.map(todo => `<li>${todo.name}</li>`).join("");
}
displayList(listNaarString(todos));
