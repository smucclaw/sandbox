const { Engine } = require('json-rules-engine')

async function start () {
    // Add new engine
    const engine = new Engine()

    // R34 S1b
    const r34s1b = {
        conditions: {
            any: [{
                fact: 'interfereWithPrimaryOccupation',
                operator: 'equal',
                value: true
            }, {
                fact: 'interfereWithAvailability',
                operator: 'equal',
                value: true
            }, {
                fact: 'interfereWithRepresentation',
                operator: 'equal',
                value: true
            }]
        },
        event: {
            type: 'rule34-1b'
        }
    }
    engine.addRule(r34s1b)
    
    engine
        .on('success', async (event, almanac) => {
            // Must not accept executive appointment
            const business = await almanac.factValue('business')
            const name = await almanac.factValue('name')
            console.log(`${name} must not accept executive appointment associated with ${business}.`)
    })
        .on('failure', async (event, almanac) => {
            // Can accept executive appointment
            const business = await almanac.factValue('business')
            const name = await almanac.factValue('name')
            console.log(`${name} can accept executive appointment associated with ${business}.`)
    })

    const facts = [{
        name: 'Tan Ah Kow',
        business: 'Jin Buay Song',
        interfereWithRepresentation: false,
        interfereWithAvailability: false,
        interfereWithPrimaryOccupation: true
    },{
        name: 'Goh Yihan',
        business: 'Singapore Management University',
        interfereWithRepresentation: false,
        interfereWithAvailability: false,
        interfereWithPrimaryOccupation: false
    }]

    facts.forEach(async (fact) => {
        await engine.run(fact)
    })
}
start()
