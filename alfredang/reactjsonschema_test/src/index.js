import React from 'react';
import ReactDOM from 'react-dom';
import Form from "@rjsf/core";

const schema = {
  title: "Test form",
  type: "string"
};

ReactDOM.render((
  <Form schema={schema} />
), document.getElementById("root"));



//const schema = {
  //title: "Todo",
  //type: "object",
  //required: ["title"],
  //properties: {
    //title: {  type: String,
              //title: "Title",
              //default: "A new task" },
    //done:  {  type: "boolean",
              //title: "Done?",
              //default: false }
  //}
//};


//const log = (type) => {console.log.bind(console, type)};

//ReactDOM.render((
  //<Form schema={schema}
        //onChange={log("changed")}
        //onSubmit={log("submitted")}
        //onError={log("errors")} /> 
  //), document.getElementById("app"));
