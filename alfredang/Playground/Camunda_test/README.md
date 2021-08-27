Involved: @johsi-k, @alfredats, @Martin-Strecker

The tools required for working with Camunda consists of 2 parts: the Camunda modeler, & the Camunda Platform. 
For the purposes of establishing whether Camunda would be a viable tool as "middleware", we went through the installation processes of both tools, went through the quickstart guide to familiarize ourselves with using them, then tried to implement a scenario of our own (the financial advisor scenario).

The criteria of evaluation consists of the following: 
- Installation process
- Ease of use 
- Possible integrations

## General Impression
 The on-ramp in terms of getting installing the Camunda toolsuite is wonderfully easy. The tools themselves look nice and are relatively user friendly. One could get an basic understanding of how to use the tools through the "Getting Started" guide. However, trying to implement anything outside of the examples is a time-intensive process. The platform is highly opaque, and we cannot peek under the hood easily without extensive knowledge on Java. We'd have to be familiar with Java project structure, the eco-system, & any frameworks that they might use. Nonetheless, it would be highly useful to adopt if (1) we can verify that people actually use BPMN, and (2) we have enough knowledge of java to hack on it.

## Installation
- Various containter instances of an "easy setup" called "Camunda Platform Run" provided; Alfred used the docker one.
- Jo hsi set up a version of Camunda Platform that builds from source. 
- Camunda Modeler is a single tar file (for Linux) and a dmg (for Mac).

## Ease of Use

### Workflow
- Would be friendlier to people who like to work with GUIs; Requires lots of clicking in order to set up anything meaningful
- DMN tables lack composability; cannot be deployed independently & necessarily have to be embedded within a bpmn process diagram 
- "External tasks" functionality provide some form of interaction with the "outside world" using a client-server model, but would require custom work (see worker.js files in various project folders) 
- We do not have a concrete mental model for how the tool works, or how everything fits together (Working on an example provides us with some semblance of one, but we cannot verify that it is indeed correct)

### Documentation 
- [Platform Setup & Modification] Documentation has 2 branches, a "simple/easy setup" branch and a "customized platform" branch
- [Platform Setup & Modification] Sometimes the "simple/easy setup branch" documentation references tips within the "customized platform branch", but implementation of tips requires a new build of the platform 
- [Application Creation] Heavily example driven, but the examples are too simple for our purposes
- [Application Creation] Does not touch on principles / general guidelines on how to build a good bpmn/dmn process
- [Application Creation] The user has no points of reference with regards to implementing a definitively "good" custom application
- [Understanding the Documentation] Requires a large amount of trial-and-error within the tool (handicapped by poor developer feedback loop), combined with cross-referencing the documentation, before any understanding as to how the tool might work can be yielded
- [Getting Help] We would be highly dependent on "developer advocates" for help when it comes to implementing any significantly complex diagrams

### Scripting engines 
- We're allowed to add our own scripting engines (through the addition of some "jar" files). However, using FEEL & Javascript for expressions within DMN was good enough; Did not configure scripting engines

## Integration (Mostly questions)
### BPMN
- While it is possible that BPMN has the diagrammatic complexity to represent more abstract functionality like recursion & asynchronivity, learning the various diagrams and tools is equivalent to learning an entire programming language in itself. 
- How likely is it that people would actually use it?

### Integration with front-end
- It is unclear if custom forms are possible. One could imagine having a BPMN external task launch some sort of front-end?  
- [Modeling a front-end in BPMN] How would we model a "reactive" front end with BPMN?
- [Connecting a front-end to Camunda] How would the custom front-end "connect" to camunda? 

See:
- https://camunda.com/blog/2015/08/start-and-complete-process-with-rest-api/
- Camunda for Modern Web Applications: https://www.youtube.com/watch?v=HhxghzKMFBg
- https://blog.bernd-ruecker.com/use-camunda-without-touching-java-and-get-an-easy-to-use-rest-based-orchestration-and-workflow-7bdf25ac198e

### Integration with baby-L4 
- Intention of programmatically generating a camunda-compatible xml is complicated by the need of a "bpmn:diagram" element consisting of descriptions (coordinate information, shapes, arrows)
- Are there certain things that cannot be expressed with DMN tables? How would we represent predicate logic with DMN? 
