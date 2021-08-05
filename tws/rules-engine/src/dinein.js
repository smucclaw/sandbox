const { Engine } = require('json-rules-engine')

async function start () {
    // Add new engine
    const engine = new Engine()

    // Add elligible rule
    const elligibleRule = {
        conditions: {
            any: [{
                all: [{
                    fact: 'areAllElligible',
                    operator: 'equal',
                    value: true
                },{
                    fact: 'noPersons',
                    operator: 'lessThanInclusive',
                    value: 5
                }]
            }, {
                all: [{
                    fact: 'areAllElligible',
                    operator: 'equal',
                    value: false
                },{
                    fact: 'noPersons',
                    operator: 'lessThanInclusive',
                    value: 2
                }]
            }]
        },
        event: {
            type: 'elligible-dinein'
        },
        priority: 10,
        onSuccess: async (event, almanac) => {
            console.log('yes can dine in large group')
            almanac.addRuntimeFact('canDineInLargeGroup', true)
        },
        onFailure: async (event, almanac) => {
            console.log('no cannot dine in large group')
            almanac.addRuntimeFact('canDineInLargeGroup', false)
        }
    }
    engine.addRule(elligibleRule)

    // Add large dine in group rule
    const dineInLargeGroupRule = {
        conditions: {
            all: [{
                fact: 'canDineInLargeGroup',
                operator: 'equal',
                value: true
            },{
                fact: 'areChildrenFromSameHousehold',
                operator: 'equal',
                value: true
            }]
        },
        priority: 9,
        event: {
            type: 'dinein-large-group'
        },
        onSuccess: async (event, almanac) => {
            console.log('children same household')
            almanac.addRuntimeFact('maxNoChildren', 4)
        },
        onFailure: async (event, almanac) => {
            console.log('children different houehold')
            const noPaxInParty = await almanac.factValue('noPersons')
            const maxNoChildren = Math.floor(noPaxInParty / 2)
            console.log('max no children', maxNoChildren)
            almanac.addRuntimeFact('maxNoChildren', maxNoChildren)
        }
    }
    engine.addRule(dineInLargeGroupRule)

    // Add children rule
    const childrenRule = {
        conditions: {
            all: [{
                fact: 'noChildren',
                operator: 'lessThanInclusive',
                value: {
                    fact: 'maxNoChildren'
                }
            }]
        },
        event: {
            type: 'children-rule'
        },
        priority: 8
    }
    engine.addRule(childrenRule)

    engine
        .on('success', (event, almanac, ruleResult) => {
        console.log('Allowed!')
    })
        .on('failure', (event, almanac, ruleResult) => {
        console.log('Not allowed!')
    })
    
    const facts = {
        noPersons: 5,
        noChildren: 2,
        areAllElligible: false,
        areChildrenFromSameHousehold: true
    }

    await engine.run(facts)
}
start()
