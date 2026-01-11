const express = require('express');
const cors = require('cors');

const todos = [
  { id: 1, name: 'Write some async code', isDone: false, duration: 3 },
  { id: 2, name: 'Test my code', isDone: false, duration: 2 },
  { id: 3, name: 'Cry for help', isDone: false, duration: 1 },
  { id: 4, name: 'Grab a coffee', isDone: true, duration: 1 },
];

const app = express();

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.send('To-do back-end app is running...');
});

app.post('/todos/toggle/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const todo = todos.find((todo) => todo.id === id);
  todo.isDone = !todo.isDone;
  res.sendStatus(200);
});

app.post('/todos/random', (req, res) => {
  const todo = {
    id: todos.length + 1,
    name: 'New todo ' + (todos.length + 1),
    isDone: false,
    duration: Math.floor(Math.random() * 5) + 1,
  };
  todos.push(todo);
  res.send(200);
});

app.get('/todos', (req, res) => {
  res.json(todos);
});

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

app.listen(3000, () => {
  console.log('server listening on port 3000');
});
