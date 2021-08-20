const { Client, logger } = require('camunda-external-task-client-js');
const open = require('open');

// configuration for the Client:
//  - 'baseUrl': url to the Process Engine
//  - 'logger': utility to automatically log important events
//  - 'asyncResponseTimeout': long polling timeout (then a new request will be issued)
const config = { baseUrl: 'http://localhost:8080/engine-rest', use: logger, asyncResponseTimeout: 10000 };

// create a Client instance with custom configuration
const client = new Client(config);

// susbscribe to the topic: 'charge-card'
client.subscribe('report-findings', async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const x = task.variables.get('x');
  const y = task.variables.get('y');
  const xGTy = task.variables.get('xGTy');
  const teletubby = task.variables.get('teletubby');

  console.log(`The variables are:`);
  console.log(`x: ${x}`);
  console.log(`y: ${y}`);

  console.log(`The calculated parameters are:`);
  console.log(`xGTy: ${xGTy}`);
  console.log(`teletubby: ${teletubby}`);

  // Complete the task
  await taskService.complete(task);
});

