import ReactDOM from 'react-dom';

import { App } from './components.js'
import { startInstance } from './async.js'
// https://www.youtube.com/watch?v=FzlurzsCW4M


// To start a camunda process instance:
//  https://docs.camunda.org/manual/7.15/reference/rest/process-definition/post-start-process-instance/

// Retrieve defaults:
//  https://docs.camunda.org/manual/7.15/reference/rest/process-instance/variables/get-variables/

export const process_defKey = 'pdpa-dbno'

startInstance(process_defKey).then((response, error) => {
  if (error) return (<h1>Error occurred: { error }</h1>);
  const process_id = response.data.id;
  console.log(process_id);

  ReactDOM.render(
    <App process_id = { process_id }/>,
    document.getElementById('root')
  );
})




// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals