import React from 'react';
import ReactDOM from 'react-dom';
import Form from "@rjsf/core";

// =======================================
//  Schema 
// ======================================

const rpsSchema = {
  title: "Rock Paper Scissors, a Game",
  type: "object",
  properties: {
    player1: player('1'),
    player2: player('2')
  }  
}

function player(i) {
  return ({ 
    title: 'Player '.concat(i),
    type: 'object',
    properties: {
      name: {
        type: "string"
      },
      age: {
        type: "number"
      }      
    }
  })
}

const sign = {
  title: "sign",
  type: "string",
  enum: ["Rock", "Paper", "Scissors"], 
};


const testSchema = {
  title: "oi",
  type: "string"
}


// =======================================
//  Components
// ======================================

class RPSresult extends React.Component {
  render () {
    return (
      <p>This is where the result goes</p> 
    )
  }
}


class RPSfull extends React.Component {
  //constructor(props) {
    //super(props);
    //this.state = {
      //formSubmitted: false,
    //}
  //}

  //handleSubmit() {
    //this.setState({
      //formSubmitted: !this.state.formSubmitted
    //});
  //}

  render() {
    return (
      <div>
        <Form schema={rpsSchema} />
        <RPSresult />
      </div>
  )};
}


ReactDOM.render((
  <Form schema={rpsSchema} />
  ), document.getElementById("root"));
