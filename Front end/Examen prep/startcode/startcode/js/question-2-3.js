const todos = [
  { name: 'Study for exam', isDone: true, duration: 3 },
  { name: 'Finish exam', isDone: false, duration: 2 },
  { name: 'ZIP exam', isDone: false, duration: 1 },
  { name: 'Turn in exam', isDone: false, duration: 1 },
];

function listNaarString(item)
{
 // Add Properties
let object = "Name: " + item.name + "-Status: " + item.isDone + ", Duration: " + item.duration + " hour(s)"; 
return object
}

function addList(text, index) {
  const color = todos[index].isDone ? "green" : "red";
    document.getElementById("todos").innerHTML +=`<li onclick="changestatus(${index})" style="color:${color}">${text}</li>`;
}

function DisplayList() {
  const ul = document.getElementById("todos");
  ul.innerHTML = "";

  for (let i = 0; i < todos.length; i++) {
    addList(listNaarString(todos[i]), i);
  }
}

function changestatus(index) {
  todos[index].isDone = !todos[index].isDone;
  filterByDuration()
}
function filterByDuration() {
  maxDuration = Number(document.getElementById("durationFilter").value);
  document.getElementById("filter").innerHTML = "";
  if(maxDuration >= 100){
  document.getElementById("filter").innerHTML += "<p> Value must be less than 100 </p>"
 }
 else if(maxDuration <= 0){
    document.getElementById("filter").innerHTML += "<p> Value must be above 0 </p>"
 }
 else{
  document.getElementById("todos").innerHTML = "";

  for (let i = 0; i < todos.length; i++) {
    if (todos[i].duration <= maxDuration) {
      addList(listNaarString(todos[i]), i);
    }
  }}
}


DisplayList()