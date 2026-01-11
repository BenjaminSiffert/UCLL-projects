const express = require('express');
const cors = require('cors');

const todos = [
  { id: 1, name: 'Write some async code', isDone: false, duration: 3 },
  { id: 2, name: 'Test my code', isDone: false, duration: 2 },
  { id: 3, name: 'Cry for help', isDone: false, duration: 1 },
  { id: 4, name: 'Grab a coffee', isDone: true, duration: 1 },
];

// Create the Express app (this is the main object used to build the server)
const app = express();

// Tell the app to automatically read JSON data sent to it
app.use(express.json());

// Tell the app to allow requests coming from other websites/apps
app.use(cors());

// Tell the app what to do when someone opens the homepage (/)
app.get('/', (req, res) => {
  res.send('To-do back-end app is running...');
});

// Tell the app what to do when a request is sent to toggle a todo
app.post('/todos/toggle/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const todo = todos.find((todo) => todo.id === id);
  todo.isDone = !todo.isDone;
  res.sendStatus(200);
});

// Tell the app what to do when a request is sent to create a random todo
app.post('/todos/random', (req, res) => {
  const todo = {
    id: todos.length + 1,
    name: 'New todo ' + (todos.length + 1),
    isDone: false,
    duration: Math.floor(Math.random() * 5) + 1,
  };
  todos.push(todo);
  res.sendStatus(200);
});

// Tell the app what to do when someone asks for all todos
app.get('/todos', (req, res) => {
  res.json(todos);
});

// Tell the app how to handle requests for sorted todos
app.get('/todos/sorted/:ord', (req, res) => {
  const ord = req.params.ord;
  let sortedTodos;

  if (ord === 'asc') {
    sortedTodos = [...todos].sort((a, b) => a.duration - b.duration);
  } else if (ord === 'desc') {
    sortedTodos = [...todos].sort((a, b) => b.duration - a.duration);
  } else {
    res.status(400).send('Invalid sort order');
    return;
  }

  res.json(sortedTodos);
});

// Tell the app to start running and listen for requests on port 3000
app.listen(3000, () => {
  console.log('server listening on port 3000');
});
