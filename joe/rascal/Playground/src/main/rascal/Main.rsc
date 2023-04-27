module Main

import IO;
import ParseTree;

import StateMachine::Syntax;
import StateMachine::Analyze;

void main(){
  machine = parse(
    #start[Machine],
    |project://Playground/src/main/rascal/StateMachine/example.sm|
  ).top;
  // iprintToFile(|cwd:///example.txt|, machine);
  iprintToFile(|project://Playground/.workdir/state0.txt|, machine.states[0]);

  unreachableIds = unreachable(machine);
  println(unreachableIds);
}