import React from 'react';
import ReactDOM from 'react-dom';
import Form from "@rjsf/core";



const sign = {
  title: "sign",
  type: "string",
  enum: ["Rock", "Paper", "Scissors"], 
};



const rpsSchema = {
  title: "Rock Paper Scissors, a Game",
  type: "object",
  properties: {
    player1:  { 
      title: "Player 1",
      type: "object",
      properties: {
        name: {type: "string"},
        sign: sign,
      }
    },
    player2: {
      title: "Player 2",
      type: "object",
      properties: {
        name: {type: "string"},
        sign: sign,
      }
    }
  }
}


ReactDOM.render((
  <Form schema={rpsSchema} />
  ), document.getElementById("root"));
