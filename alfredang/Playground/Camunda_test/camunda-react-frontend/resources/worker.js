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
client.subscribe('report-investment-strategy', async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const investmentStrategy = task.variables.get('investmentStrategy');
  const amountSaved = task.variables.get('minimumIncome');

  console.log(`The variables are:`);
  console.log(`amount saved: ${ amountSaved }`);

  console.log(`The calculated parameters are:`);
  console.log(`investment strategy: ${ investmentStrategy }`);


  // Complete the task
  await taskService.complete(task);
});
