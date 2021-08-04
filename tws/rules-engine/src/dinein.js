const { Engine } = require('json-rules-engine')

let drRule = {
    any: [{
        all: [{
            fact: 'areAllElligible',
            operator: 'equal',
            value: true
        }, {
            fact: 'noPersons',
            operator: 'lessThanInclusive',
            value: 5
        }],
    }, {
        all: [{
            fact: 'areAllElligible',
            operator: 'equal',
            value: false
        }, {
            fact: 'noPersons',
            operator: 'lessThanInclusive',
            value: 2
        }]
    }]
}

let childrenRule = {
    any: [{
        all: [{
            fact: 'areChildrenFromSameHousehold',
            operator: 'equal',
            value: true
        }, {
            fact: 'noChildren',
            operator: 'lessThanInclusive',
            value: 4
        }],
    }, {
        all: [{
            fact: 'areChildrenFromSameHousehold',
            operator: 'equal',
            value: false
        }, {
            fact: 'noChildren',
            operator: 'lessThanInclusive',
            value: 3
        }]
    }]
}
// Math.floor()

let dineInRule = {
    conditions: drRule,
    event: {
        type: 'allowed',
        params: {
            message: 'Dine in allowed with those rules'
        }
    }
}

// Define rule
async function start(){
    let engine = new Engine()
    engine.addRule(dineInRule)

    let facts = {
        noPersons: 7,
        areAllElligible: true
    }

    engine
        .on('success', (event, almanac, ruleResult) => {
        console.log('Elligible!')
    })
        .on('failure', (event, almanac, ruleResult) => {
        console.log('Not elligible!')
    })

    await engine.run(facts)
}

start()
