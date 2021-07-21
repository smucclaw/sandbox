import React from 'react';
import ReactDOM from 'react-dom';
import Form from "@rjsf/core";

const schema = {
  title: "Todo",
  type: "object",
  required: ["title"],
  properties: {
    title: {  type: "string",
              title: "Title",
              default: "A new task" },
    done:  {  type: "boolean",
              title: "Done?",
              default: false }
  }
};


function log(type) {console.log(console, type)};

ReactDOM.render((
  <Form schema={schema}
        onChange={() => log("changed")}
        onSubmit={() => log("submitted")}
        onError={() => log("errors")} /> 
  ), document.getElementById("root"));
