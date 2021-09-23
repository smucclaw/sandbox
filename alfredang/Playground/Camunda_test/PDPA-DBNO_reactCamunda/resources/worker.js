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
client.subscribe('report-current-fields', async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const act26b_1 = task.variables.get('act26b_1');
  const act26b_4 = task.variables.get('act26b_4');
  const act26b_1_a = task.variables.get('act26b_1_a');
  const act26b_1_b = task.variables.get('act26b_1_b');

  console.log(`The variables are:`);
  console.log(`act26b_4: ${ act26b_4}`);
  console.log(`act26b_1_a: ${ act26b_1_a }`);
  console.log(`act26b_1_b: ${ act26b_1_b }`);

  console.log(`The calculated parameters are:`);
  console.log(`act26b_1: ${ act26b_1}`);


  // Complete the task
  await taskService.complete(task);
});
