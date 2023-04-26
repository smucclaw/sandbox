module StateMachine::Main

import IO;
import ParseTree;

import StateMachine::Syntax;
import StateMachine::Analyze;

void main(){
  machine = parse(#start[Machine], |cwd:///StateMachine/example.sm|).top;
  // iprintToFile(|cwd:///example.txt|, machine);
  iprintToFile(|cwd:///StateMachine/.workdir/state0.txt|, machine.states[0]);

  unreachableIds = unreachable(machine);
  println(unreachableIds);
}