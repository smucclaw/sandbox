# JSON Rules Engine

This is a demo of the `json-rules-engine`, a lightweight yet powerful rules engine written in Node.

## Components

### Rules

- Set of conditions and a single event
- Examples:
    - If all vaccinated, group size should be less than or equal to 5
    - If children are from different household, number of children within group should be half

### Facts

- Methods / constraints registered with engine **prior** to runtime and referenced within rule conditions
- e.g. It is known that there is a CCLAW lunch gathering of 6 people with no children and all are vaccinated

### Engine

- Stores and execute rules based on facts
- Example: With the rules, the CCLAW lunch gathering of 6 people is not possible
- Determines, with the rule constraints, whether the facts can be met

### Almanac

- Act as cache for the engine
- Collects facts during an engine run cycle
- Can be used to define additional facts during engine runtime

## Demo

```console
node src/dinein.js
```

## Relevance to Work at CCLAW

- Our work in FV revolves around verifiying facts based on a set of rules
- Possible to find a solution that we can easily take off the shelf, and then use it to ???

## Resources & Other Work

- [json-rules-engine](https://github.com/CacheControl/json-rules-engine)
- [Microsoft Rules Engine](https://github.com/microsoft/RulesEngine)
