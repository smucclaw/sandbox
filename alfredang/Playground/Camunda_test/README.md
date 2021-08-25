Involved: @johsi-k, @alfredats, @Martin-Strecker

The tools required for working with Camunda consists of 2 parts: the Camunda modeler, & the Camunda Platform. 
For the purposes of establishing whether Camunda would be a viable tool as "middleware", we went through the installation processes of both tools, went through the quickstart guide to familiarize ourselves with using them, then tried to implement a scenario of our own (the financial advisor scenario).

The criteria of evaluation consists of the following: 
- Installation process
- Ease of use 
- Possible integrations

## General Impression
- The tool is highly opaque, and we cannot peek under the hood easily without extensive knowledge on Java. We'd have to be familiar with Java project structure, the eco-system, & any frameworks that they might use.

## Installation
- Various containter instances of an "easy setup" called "Camunda Platform Run" provided; Alfred used the docker one.
- Later, Jo hsi set up a version that built from scratch. 
- Camunda Modeler is a single tar file. When unzipped it yields an executable.

## Ease of Use

### Workflow
- DMN tables necessarily have to be embedded within a bpmn process diagram (lacks composability)
- Requires lots of clicking in order to set up anything meaningful
- External tasks provide some form of interaction with the "outside world", but would require custom work (worker.js) 
- We do not have a concrete mental model for how the tool works, or how everything fits together (Working on an example provides us with some semblance of one, but we cannot verify that it is indeed correct)

### Documentation 
- [Platform Setup & Modification] Documentation has 2 branches, a "simple/easy setup" branch and a "customized platform" branch
- [Platform Setup & Modification] Sometimes the "simple/easy setup branch" documentation references tips within the "customized platform branch", but trying to implement tips from the "customized platform" branch requires an entirely new build  
- [Application Creation] Heavily example driven, but the examples are too simple for our purposes
- [Application Creation] Does not touch on principles / general guidelines on how to build a good bpmn/dmn process
- [Application Creation] The user has no points of reference with regards to implementing a definitively "good" custom application
- [Getting Help] We would be highly dependent on the "developer advocates" for help when it comes to implementing any significantly complex diagrams (to mention the dependent columns in dmn tables)
- [Understanding the Documentation] Requires a large amount of trial-and-error within the tool (handicapped by poor developer feedback loop), combined with cross-referencing the documentation, before any understanding as to how the tool might work can be yielded

### Scripting engines 
- We're allowed to add our own scripting engines (through the addition of some "jar" files). However, using FEEL & Javascript for expressions within DMN was good enough; Did not configure scripting engines

## Integration 
### BPMN
- While it is possible that BPMN has the diagrammatic complexity to represent more abstract functionality like recursion & asynchronivity, learning the various diagrams and tools is equivalent to learning an entire programming language in itself. 
- How likely is it that people would actually use it?

### Integration with front-end
- custom forms possible? 
- Unlikely that a "reactive" front end would be representable by BPMN (How would you model a unending process?)

See:
- https://camunda.com/blog/2015/08/start-and-complete-process-with-rest-api/
- Camunda for Modern Web Applications: https://www.youtube.com/watch?v=HhxghzKMFBg
- https://blog.bernd-ruecker.com/use-camunda-without-touching-java-and-get-an-easy-to-use-rest-based-orchestration-and-workflow-7bdf25ac198e

### Integration with baby-L4 
- Intention of programmatically generating a camunda-compatible xml is complicated by the need of a "bpmn:diagram" element consisting of descriptions (coordinate information, shapes, arrows)
- Certain things cannot be expressed with DMN tables? How would we represent predicate logic with DMN? 

