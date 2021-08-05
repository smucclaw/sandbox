# JSON Rules Engine

This is a demo of the `json-rules-engine`, a lightweight yet powerful rules engine written in Node.

## Components

### Rules

- Set of conditions and a single event
- Examples:
    - If business is in first schedule of LPA 2015, legal practitioner cannot accept any executive appointment
    - If children are from different household, number of children within group should be half

### Facts

- Methods / constraints registered with engine **prior** to runtime and referenced within rule conditions
- Examples:
    - The Dean of YPHSL is not in a housing or estate agency business
    - There are 3 children in our household

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
node src/<name_of_file>.js
```

## Comparison / Relevance to Work at CCLAW

- vs imperative model - sequence of steps
    - "If at least one not vaccinated, immediately maximum 2 pax"
    - "If all are vaccinated, then we can get more people who must also be fully vaccinated"
- Similar to the expert systems done at CCLAW (e.g. docAssemble), but with less complexity
- Can be used off the shelf - possible to have a L4 -> Node implementation?

## Resources & Other Work

- [json-rules-engine](https://github.com/CacheControl/json-rules-engine)
- [Microsoft Rules Engine](https://github.com/microsoft/RulesEngine)
- [Explanation on Rules Engine](https://martinfowler.com/bliki/RulesEngine.html)
- [Another Explanation on Rules Engine](http://www.mastertheboss.com/bpm/drools/what-is-a-rule-engine/)
