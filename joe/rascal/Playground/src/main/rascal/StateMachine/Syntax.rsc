module StateMachine::Syntax

extend lang::std::Layout;
extend lang::std::Id;

start syntax Machine = machine: State+ states;
syntax State = state: "state" Id name Trans* out;
syntax Trans = trans: Id event ":" Id to;