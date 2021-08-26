import ReactDOM from 'react-dom';
import { App } from './components.js'
import { startInstance } from './async.js'
// https://www.youtube.com/watch?v=FzlurzsCW4M


// To start a camunda process instance:
//  https://docs.camunda.org/manual/7.15/reference/rest/process-definition/post-start-process-instance/

// Retrieve defaults:
//  https://docs.camunda.org/manual/7.15/reference/rest/process-instance/variables/get-variables/

const process_defKey = 'event-driven'

startInstance(process_defKey).then(
  (response) => {
    const process_id = response.data.id
    // console.log(response) 
    ReactDOM.render(
      <App process_id={process_id} />,
      // <h1>hello</h1>,
      document.getElementById('root')
    );

  }
)



// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals