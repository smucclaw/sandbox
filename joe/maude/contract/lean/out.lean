namespace Maude

-- Sorts
inductive MSort
	| Bool
	| Action
	| ActionEvent
	| ActiveRule
	| Actor
	| ActorDeonticActionDeadline
	| ActorState
	| Attribute
	| AttributeSet
	| Char
	| Cid
	| Configuration
	| ContractState
	| ContractStatus
	| Coordinator
	| Date
	| Deadline
	| Deontic
	| Duration
	| Event
	| FindResult
	| HenceLest
	| Id
	| Message
	| Msg
	| Names
	| Nat
	| «NeSet{ActionEvent}»
	| «NeSet{Qid}»
	| «NeSet{Rule}»
	| NzNat
	| Object
	| Oid
	| Portal
	| PreCoordinator
	| Qid
	| Rule
	| «Set{ActionEvent}»
	| «Set{Qid}»
	| «Set{Rule}»
	| Situation
	| String
	| TickEvent
	| Zero

-- Generator of the subsort relation
def subsort : MSort → MSort → Prop
	| MSort.Qid MSort.Action := true
	| MSort.Attribute MSort.AttributeSet := true
	| MSort.Actor MSort.Cid := true
	| MSort.Coordinator MSort.Cid := true
	| MSort.PreCoordinator MSort.Cid := true
	| MSort.Msg MSort.Configuration := true
	| MSort.Object MSort.Configuration := true
	| MSort.Portal MSort.Configuration := true
	| MSort.ActionEvent MSort.Event := true
	| MSort.TickEvent MSort.Event := true
	| MSort.Nat MSort.FindResult := true
	| MSort.Oid MSort.Id := true
	| MSort.Event MSort.Message := true
	| MSort.Message MSort.Msg := true
	| MSort.Qid MSort.Names := true
	| MSort.NzNat MSort.Nat := true
	| MSort.Zero MSort.Nat := true
	| MSort.ActionEvent MSort.«NeSet{ActionEvent}» := true
	| MSort.Qid MSort.«NeSet{Qid}» := true
	| MSort.Rule MSort.«NeSet{Rule}» := true
	| MSort.Qid MSort.Oid := true
	| MSort.Coordinator MSort.PreCoordinator := true
	| MSort.«NeSet{ActionEvent}» MSort.«Set{ActionEvent}» := true
	| MSort.Names MSort.«Set{Qid}» := true
	| MSort.«NeSet{Qid}» MSort.«Set{Qid}» := true
	| MSort.«NeSet{Rule}» MSort.«Set{Rule}» := true
	| MSort.Bool MSort.Situation := true
	| MSort.Qid MSort.Situation := true
	| MSort.Char MSort.String := true
	| _ _ := false

-- Kinds and their operators
constants kActiveRule kActorState kDate : Type

inductive kDeontic
	| MAY
	| MUST
	| SHANT

mutual inductive kAction, kActorDeonticActionDeadline, kAttributeSet, kCid, kConfiguration, kContractState, kContractStatus, kDeadline, kDuration, kFindResult, kHenceLest, kString, k«Set{Rule}»

with kAction : Type
	| true
	| false
	| and : kAction → kAction → kAction
	| or : kAction → kAction → kAction
	| xor : kAction → kAction → kAction
	| not : kAction → kAction
	| implies : kAction → kAction → kAction
	| «$diff» : kAction → kAction → kAction → kAction
	| «$intersect» : kAction → kAction → kAction → kAction
	| NOTHING
	| containsActor : kConfiguration → kAction → kAction
	| containsRuleWithEvent : k«Set{Rule}» → kConfiguration → kAction
	| in₀ : kConfiguration → kConfiguration → kAction
	| in₁ : kAction → kAction → kAction
	| in₂ : k«Set{Rule}» → k«Set{Rule}» → kAction
	| psubset₀ : kConfiguration → kConfiguration → kAction
	| psubset₁ : kAction → kAction → kAction
	| psubset₂ : k«Set{Rule}» → k«Set{Rule}» → kAction
	| subset₀ : kConfiguration → kConfiguration → kAction
	| subset₁ : kAction → kAction → kAction
	| subset₂ : k«Set{Rule}» → k«Set{Rule}» → kAction
	| delete : kAction → kAction → kAction
	| insert : kAction → kAction → kAction
	| intersection : kAction → kAction → kAction
	| union : kAction → kAction → kAction
	| ltQidsgt
	| DO : kAction → kAction
	| lteq₀ : kFindResult → kFindResult → kAction
	| lteq₁ : kString → kString → kAction
	| lt₀ : kFindResult → kFindResult → kAction
	| lt₁ : kString → kString → kAction
	| gteq₀ : kFindResult → kFindResult → kAction
	| gteq₁ : kString → kString → kAction
	| gt₀ : kFindResult → kFindResult → kAction
	| gt₁ : kString → kString → kAction
	| AND : kAction → kAction → kAction
	| bslash : kAction → kAction → kAction
	| «`,» : kAction → kAction → kAction
	| andsubthen : kAction → kAction → kAction
	| divides : kFindResult → kFindResult → kAction
	| orsubelse : kAction → kAction → kAction
	| empty
	| qid : kString → kAction
	| ifthenelsefi : kAction → kAction → kAction → kAction
	| eqslasheq₀ : kConfiguration → kConfiguration → kAction
	| eqslasheq₁ : kAction → kAction → kAction
	| eqslasheq₂ : k«Set{Rule}» → k«Set{Rule}» → kAction
	| eqeq₀ : kAction → kAction → kAction
	| eqeq₁ : kDeontic → kDeontic → kAction
	| eqeq₂ : kContractStatus → kContractStatus → kAction

with kActorDeonticActionDeadline : Type
	| PARTY₀ : kAction → kDeadline → kDeontic → kAction → kActorDeonticActionDeadline
	| PARTY₁ : kAction → kDeontic → kAction → kDeadline → kActorDeonticActionDeadline
	| PARTY₂ : kAction → kDeontic → kDeadline → kAction → kActorDeonticActionDeadline
	| PARTY₃ : kDeadline → kAction → kDeontic → kAction → kActorDeonticActionDeadline

with kAttributeSet : Type
	| «`,» : kAttributeSet → kAttributeSet → kAttributeSet
	| «contractState`colon» : kContractState → kAttributeSet
	| none
	| «rules`colon» : k«Set{Rule}» → kAttributeSet
	| «time`colon» : kFindResult → kAttributeSet

with kCid : Type
	| Actor
	| Coordinator
	| PreCoordinator
	| getClass : kConfiguration → kCid

with kConfiguration : Type
	| «$diff» : kConfiguration → kConfiguration → kConfiguration → kConfiguration
	| «$intersect» : kConfiguration → kConfiguration → kConfiguration → kConfiguration
	| delete : kConfiguration → kConfiguration → kConfiguration
	| getAction : kConfiguration → kConfiguration
	| getAllActions : k«Set{Rule}» → kConfiguration
	| insert : kConfiguration → kConfiguration → kConfiguration
	| intersection : kConfiguration → kConfiguration → kConfiguration
	| pretty : kConfiguration → kConfiguration
	| transpileAux : k«Set{Rule}» → kConfiguration → kConfiguration
	| transpile : k«Set{Rule}» → kConfiguration
	| union : kConfiguration → kConfiguration → kConfiguration
	| ltgt
	| ltcolonbargt : kAction → kCid → kAttributeSet → kConfiguration
	| «ltcolonbar`gt» : kAction → kCid → kConfiguration
	| bslash : kConfiguration → kConfiguration → kConfiguration
	| join : kConfiguration → kConfiguration → kConfiguration
	| «`,» : kConfiguration → kConfiguration → kConfiguration
	| did : kAction → kAction → kConfiguration
	| do : kAction → kAction → kConfiguration
	| does : kAction → kAction → kConfiguration
	| empty
	| none
	| tau
	| tick
	| ifthenelsefi : kAction → kConfiguration → kConfiguration → kConfiguration

with kContractState : Type
	| deltaAction : k«Set{Rule}» → kConfiguration → kContractState → kContractState
	| deltaTick : k«Set{Rule}» → kContractState → kContractState
	| Active : k«Set{Rule}» → kContractState
	| Breached : kAction → kContractState
	| Fulfilled
	| pow : kContractState → kContractState → kContractState
	| ifthenelsefi : kAction → kContractState → kContractState → kContractState

with kContractStatus : Type
	| configToStatus : kConfiguration → kContractStatus
	| contractStateToStatus : kContractState → kContractStatus
	| Active
	| Breached
	| Fulfilled

with kDeadline : Type
	| BY : kFindResult → kDeadline
	| WITHIN : kDuration → kDeadline

with kDuration : Type
	| DAY : kFindResult → kDuration
	| MONTH : kFindResult → kDuration
	| WEEK : kFindResult → kDuration
	| YEAR : kFindResult → kDuration

with kFindResult : Type
	| «$card»₀ : kConfiguration → kFindResult → kFindResult
	| «$card»₁ : kAction → kFindResult → kFindResult
	| «$card»₂ : k«Set{Rule}» → kFindResult → kFindResult
	| barbar₀ : kConfiguration → kFindResult
	| barbar₁ : kAction → kFindResult
	| barbar₂ : k«Set{Rule}» → kFindResult
	| zero
	| amp : kFindResult → kFindResult → kFindResult
	| mul : kFindResult → kFindResult → kFindResult
	| sum : kFindResult → kFindResult → kFindResult
	| ltlt : kFindResult → kFindResult → kFindResult
	| gtgt : kFindResult → kFindResult → kFindResult
	| pow : kFindResult → kFindResult → kFindResult
	| quo : kFindResult → kFindResult → kFindResult
	| rem : kFindResult → kFindResult → kFindResult
	| xor : kFindResult → kFindResult → kFindResult
	| bar : kFindResult → kFindResult → kFindResult
	| ascii : kString → kFindResult
	| find : kString → kString → kFindResult → kFindResult
	| gcd : kFindResult → kFindResult → kFindResult
	| lcm : kFindResult → kFindResult → kFindResult
	| length : kString → kFindResult
	| max : kFindResult → kFindResult → kFindResult
	| min : kFindResult → kFindResult → kFindResult
	| modExp : kFindResult → kFindResult → kFindResult → kFindResult
	| notFound
	| rfind : kString → kString → kFindResult → kFindResult
	| s : kFindResult → kFindResult
	| sd : kFindResult → kFindResult → kFindResult
	| ifthenelsefi : kAction → kFindResult → kFindResult → kFindResult

with kHenceLest : Type
	| HENCE : kAction → kHenceLest
	| HENCELEST : kAction → kAction → kHenceLest
	| LEST : kAction → kHenceLest
	| LESTHENCE : kAction → kAction → kHenceLest

with kString : Type
	| ltStringsgt
	| sum : kString → kString → kString
	| char : kFindResult → kString
	| lowerCase : kString → kString
	| string : kAction → kString
	| substr : kString → kFindResult → kFindResult → kString
	| upperCase : kString → kString

with k«Set{Rule}» : Type
	| «$diff» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| «$intersect» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| delete : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| getRulesWithNames : k«Set{Rule}» → kAction → k«Set{Rule}»
	| insert : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| intersection : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| union : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| RULE₀ : kAction → kActorDeonticActionDeadline → k«Set{Rule}»
	| RULE₁ : kAction → kActorDeonticActionDeadline → kHenceLest → k«Set{Rule}»
	| bslash : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| «`,» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
	| empty
	| ifthenelsefi : kAction → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»

-- Kind assignment
def kind : MSort → Type
	| MSort.Bool := kAction
	| MSort.Action := kAction
	| MSort.ActionEvent := kConfiguration
	| MSort.ActiveRule := kActiveRule
	| MSort.Actor := kCid
	| MSort.ActorDeonticActionDeadline := kActorDeonticActionDeadline
	| MSort.ActorState := kActorState
	| MSort.Attribute := kAttributeSet
	| MSort.AttributeSet := kAttributeSet
	| MSort.Char := kString
	| MSort.Cid := kCid
	| MSort.Configuration := kConfiguration
	| MSort.ContractState := kContractState
	| MSort.ContractStatus := kContractStatus
	| MSort.Coordinator := kCid
	| MSort.Date := kDate
	| MSort.Deadline := kDeadline
	| MSort.Deontic := kDeontic
	| MSort.Duration := kDuration
	| MSort.Event := kConfiguration
	| MSort.FindResult := kFindResult
	| MSort.HenceLest := kHenceLest
	| MSort.Id := kAction
	| MSort.Message := kConfiguration
	| MSort.Msg := kConfiguration
	| MSort.Names := kAction
	| MSort.Nat := kFindResult
	| MSort.«NeSet{ActionEvent}» := kConfiguration
	| MSort.«NeSet{Qid}» := kAction
	| MSort.«NeSet{Rule}» := k«Set{Rule}»
	| MSort.NzNat := kFindResult
	| MSort.Object := kConfiguration
	| MSort.Oid := kAction
	| MSort.Portal := kConfiguration
	| MSort.PreCoordinator := kCid
	| MSort.Qid := kAction
	| MSort.Rule := k«Set{Rule}»
	| MSort.«Set{ActionEvent}» := kConfiguration
	| MSort.«Set{Qid}» := kAction
	| MSort.«Set{Rule}» := k«Set{Rule}»
	| MSort.Situation := kAction
	| MSort.String := kString
	| MSort.TickEvent := kConfiguration
	| MSort.Zero := kFindResult

-- Predicates recognizing constructor terms
mutual def kAction.ctor_only, kConfiguration.ctor_only, kActiveRule.ctor_only, kCid.ctor_only, kActorDeonticActionDeadline.ctor_only, kActorState.ctor_only, kAttributeSet.ctor_only, kString.ctor_only, kContractState.ctor_only, kContractStatus.ctor_only, kDate.ctor_only, kDeadline.ctor_only, kDeontic.ctor_only, kDuration.ctor_only, kFindResult.ctor_only, kHenceLest.ctor_only, k«Set{Rule}».ctor_only

with kAction.ctor_only : kAction → Prop
	| kAction.true := true
	| kAction.false := true
	| (kAction.DO a) := a.ctor_only
	| (kAction.«`,» a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| kAction.empty := true
	| _ := false

with kConfiguration.ctor_only : kConfiguration → Prop
	| kConfiguration.ltgt := true
	| (kConfiguration.ltcolonbargt a₀ a₁ a₂) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only
	| (kConfiguration.join a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| (kConfiguration.«`,» a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| kConfiguration.empty := true
	| kConfiguration.none := true
	| kConfiguration.tau := true
	| kConfiguration.tick := true
	| _ := false

with kActiveRule.ctor_only : kActiveRule → Prop
	| _ := true

with kCid.ctor_only : kCid → Prop
	| _ := false

with kActorDeonticActionDeadline.ctor_only : kActorDeonticActionDeadline → Prop
	| (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
	| (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
	| (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
	| (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only

with kActorState.ctor_only : kActorState → Prop
	| _ := true

with kAttributeSet.ctor_only : kAttributeSet → Prop
	| (kAttributeSet.«`,» a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| kAttributeSet.none := true
	| _ := false

with kString.ctor_only : kString → Prop
	| _ := false

with kContractState.ctor_only : kContractState → Prop
	| (kContractState.Active a) := a.ctor_only
	| (kContractState.Breached a) := a.ctor_only
	| kContractState.Fulfilled := true
	| _ := false

with kContractStatus.ctor_only : kContractStatus → Prop
	| kContractStatus.Active := true
	| kContractStatus.Breached := true
	| kContractStatus.Fulfilled := true
	| _ := false

with kDate.ctor_only : kDate → Prop
	| _ := true

with kDeadline.ctor_only : kDeadline → Prop
	| (kDeadline.BY a) := a.ctor_only
	| (kDeadline.WITHIN a) := a.ctor_only

with kDeontic.ctor_only : kDeontic → Prop
	| kDeontic.MAY := true
	| kDeontic.MUST := true
	| kDeontic.SHANT := true

with kDuration.ctor_only : kDuration → Prop
	| (kDuration.DAY a) := a.ctor_only
	| (kDuration.MONTH a) := a.ctor_only
	| (kDuration.WEEK a) := a.ctor_only
	| (kDuration.YEAR a) := a.ctor_only

with kFindResult.ctor_only : kFindResult → Prop
	| kFindResult.zero := true
	| kFindResult.notFound := true
	| (kFindResult.s a) := a.ctor_only
	| _ := false

with kHenceLest.ctor_only : kHenceLest → Prop
	| (kHenceLest.HENCE a) := a.ctor_only
	| (kHenceLest.HENCELEST a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| (kHenceLest.LEST a) := a.ctor_only
	| (kHenceLest.LESTHENCE a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only

with k«Set{Rule}».ctor_only : k«Set{Rule}» → Prop
	| (k«Set{Rule}».RULE₀ a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| (k«Set{Rule}».RULE₁ a₀ a₁ a₂) := a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only
	| (k«Set{Rule}».«`,» a₀ a₁) := a₀.ctor_only ∧ a₁.ctor_only
	| k«Set{Rule}».empty := true
	| _ := false

-- Equality modulo axioms
mutual inductive kAction.eqa, kConfiguration.eqa, kActiveRule.eqa, kCid.eqa, kActorDeonticActionDeadline.eqa, kActorState.eqa, kAttributeSet.eqa, kString.eqa, kContractState.eqa, kContractStatus.eqa, kDate.eqa, kDeadline.eqa, kDeontic.eqa, kDuration.eqa, kFindResult.eqa, kHenceLest.eqa, k«Set{Rule}».eqa

with kAction.eqa : kAction → kAction → Prop
	| refl {a} : kAction.eqa a a
	| symm {a b} : kAction.eqa a b → kAction.eqa b a
	| trans {a b c} : kAction.eqa a b → kAction.eqa b c → kAction.eqa a c
	-- Congruence axioms for each operator
	| eqa_and {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.and a₀ a₁) (kAction.and b₀ b₁)
	| eqa_or {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.or a₀ a₁) (kAction.or b₀ b₁)
	| eqa_xor {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.xor a₀ a₁) (kAction.xor b₀ b₁)
	| eqa_not {a b : kAction} : kAction.eqa a b → kAction.eqa (kAction.not a) (kAction.not b)
	| eqa_implies {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.implies a₀ a₁) (kAction.implies b₀ b₁)
	| eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa a₂ b₂ → kAction.eqa (kAction.«$diff» a₀ a₁ a₂) (kAction.«$diff» b₀ b₁ b₂)
	| eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa a₂ b₂ → kAction.eqa (kAction.«$intersect» a₀ a₁ a₂) (kAction.«$intersect» b₀ b₁ b₂)
	| eqa_containsActor {a₀ b₀ : kConfiguration} {a₁ b₁ : kAction} : kConfiguration.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.containsActor a₀ a₁) (kAction.containsActor b₀ b₁)
	| eqa_containsRuleWithEvent {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} : k«Set{Rule}».eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.containsRuleWithEvent a₀ a₁) (kAction.containsRuleWithEvent b₀ b₁)
	| eqa_in₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.in₀ a₀ a₁) (kAction.in₀ b₀ b₁)
	| eqa_in₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.in₁ a₀ a₁) (kAction.in₁ b₀ b₁)
	| eqa_in₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kAction.eqa (kAction.in₂ a₀ a₁) (kAction.in₂ b₀ b₁)
	| eqa_psubset₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.psubset₀ a₀ a₁) (kAction.psubset₀ b₀ b₁)
	| eqa_psubset₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.psubset₁ a₀ a₁) (kAction.psubset₁ b₀ b₁)
	| eqa_psubset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kAction.eqa (kAction.psubset₂ a₀ a₁) (kAction.psubset₂ b₀ b₁)
	| eqa_subset₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.subset₀ a₀ a₁) (kAction.subset₀ b₀ b₁)
	| eqa_subset₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.subset₁ a₀ a₁) (kAction.subset₁ b₀ b₁)
	| eqa_subset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kAction.eqa (kAction.subset₂ a₀ a₁) (kAction.subset₂ b₀ b₁)
	| eqa_delete {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.delete a₀ a₁) (kAction.delete b₀ b₁)
	| eqa_insert {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.insert a₀ a₁) (kAction.insert b₀ b₁)
	| eqa_intersection {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.intersection a₀ a₁) (kAction.intersection b₀ b₁)
	| eqa_union {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.union a₀ a₁) (kAction.union b₀ b₁)
	| eqa_DO {a b : kAction} : kAction.eqa a b → kAction.eqa (kAction.DO a) (kAction.DO b)
	| eqa_lteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kAction.eqa (kAction.lteq₀ a₀ a₁) (kAction.lteq₀ b₀ b₁)
	| eqa_lteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kAction.eqa (kAction.lteq₁ a₀ a₁) (kAction.lteq₁ b₀ b₁)
	| eqa_lt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kAction.eqa (kAction.lt₀ a₀ a₁) (kAction.lt₀ b₀ b₁)
	| eqa_lt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kAction.eqa (kAction.lt₁ a₀ a₁) (kAction.lt₁ b₀ b₁)
	| eqa_gteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kAction.eqa (kAction.gteq₀ a₀ a₁) (kAction.gteq₀ b₀ b₁)
	| eqa_gteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kAction.eqa (kAction.gteq₁ a₀ a₁) (kAction.gteq₁ b₀ b₁)
	| eqa_gt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kAction.eqa (kAction.gt₀ a₀ a₁) (kAction.gt₀ b₀ b₁)
	| eqa_gt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kAction.eqa (kAction.gt₁ a₀ a₁) (kAction.gt₁ b₀ b₁)
	| eqa_AND {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.AND a₀ a₁) (kAction.AND b₀ b₁)
	| eqa_bslash {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.bslash a₀ a₁) (kAction.bslash b₀ b₁)
	| eqa_«`,» {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.«`,» a₀ a₁) (kAction.«`,» b₀ b₁)
	| eqa_andsubthen {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.andsubthen a₀ a₁) (kAction.andsubthen b₀ b₁)
	| eqa_divides {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kAction.eqa (kAction.divides a₀ a₁) (kAction.divides b₀ b₁)
	| eqa_orsubelse {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.orsubelse a₀ a₁) (kAction.orsubelse b₀ b₁)
	| eqa_qid {a b : kString} : kString.eqa a b → kAction.eqa (kAction.qid a) (kAction.qid b)
	| eqa_ifthenelsefi {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa a₂ b₂ → kAction.eqa (kAction.ifthenelsefi a₀ a₁ a₂) (kAction.ifthenelsefi b₀ b₁ b₂)
	| eqa_eqslasheq₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.eqslasheq₀ a₀ a₁) (kAction.eqslasheq₀ b₀ b₁)
	| eqa_eqslasheq₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.eqslasheq₁ a₀ a₁) (kAction.eqslasheq₁ b₀ b₁)
	| eqa_eqslasheq₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kAction.eqa (kAction.eqslasheq₂ a₀ a₁) (kAction.eqslasheq₂ b₀ b₁)
	| eqa_eqeq₀ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.eqeq₀ a₀ a₁) (kAction.eqeq₀ b₀ b₁)
	| eqa_eqeq₁ {a₀ b₀ a₁ b₁ : kDeontic} : kDeontic.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kAction.eqa (kAction.eqeq₁ a₀ a₁) (kAction.eqeq₁ b₀ b₁)
	| eqa_eqeq₂ {a₀ b₀ a₁ b₁ : kContractStatus} : kContractStatus.eqa a₀ b₀ → kContractStatus.eqa a₁ b₁ → kAction.eqa (kAction.eqeq₂ a₀ a₁) (kAction.eqeq₂ b₀ b₁)
	-- Structural axioms
	| and_comm {a b} : kAction.eqa (kAction.and a b) (kAction.and b a)
	| and_assoc {a b c} : kAction.eqa (kAction.and a (kAction.and b c)) (kAction.and (kAction.and a b) c)
	| or_comm {a b} : kAction.eqa (kAction.or a b) (kAction.or b a)
	| or_assoc {a b c} : kAction.eqa (kAction.or a (kAction.or b c)) (kAction.or (kAction.or a b) c)
	| xor_comm {a b} : kAction.eqa (kAction.xor a b) (kAction.xor b a)
	| xor_assoc {a b c} : kAction.eqa (kAction.xor a (kAction.xor b c)) (kAction.xor (kAction.xor a b) c)
	| AND_comm {a b} : kAction.eqa (kAction.AND a b) (kAction.AND b a)
	| AND_assoc {a b c} : kAction.eqa (kAction.AND a (kAction.AND b c)) (kAction.AND (kAction.AND a b) c)
	| AND_left_id {a} : kAction.eqa (kAction.AND kAction.empty a) a
	| AND_right_id {a} : kAction.eqa (kAction.AND a kAction.empty) a
	| «`,»_comm {a b} : kAction.eqa (kAction.«`,» a b) (kAction.«`,» b a)
	| «`,»_assoc {a b c} : kAction.eqa (kAction.«`,» a (kAction.«`,» b c)) (kAction.«`,» (kAction.«`,» a b) c)
	| «`,»_left_id {a} : kAction.eqa (kAction.«`,» kAction.empty a) a
	| «`,»_right_id {a} : kAction.eqa (kAction.«`,» a kAction.empty) a

with kConfiguration.eqa : kConfiguration → kConfiguration → Prop
	| refl {a} : kConfiguration.eqa a a
	| symm {a b} : kConfiguration.eqa a b → kConfiguration.eqa b a
	| trans {a b c} : kConfiguration.eqa a b → kConfiguration.eqa b c → kConfiguration.eqa a c
	-- Congruence axioms for each operator
	| eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.«$diff» a₀ a₁ a₂) (kConfiguration.«$diff» b₀ b₁ b₂)
	| eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.«$intersect» a₀ a₁ a₂) (kConfiguration.«$intersect» b₀ b₁ b₂)
	| eqa_delete {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.delete a₀ a₁) (kConfiguration.delete b₀ b₁)
	| eqa_getAction {a b : kConfiguration} : kConfiguration.eqa a b → kConfiguration.eqa (kConfiguration.getAction a) (kConfiguration.getAction b)
	| eqa_getAllActions {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kConfiguration.eqa (kConfiguration.getAllActions a) (kConfiguration.getAllActions b)
	| eqa_insert {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.insert a₀ a₁) (kConfiguration.insert b₀ b₁)
	| eqa_intersection {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.intersection a₀ a₁) (kConfiguration.intersection b₀ b₁)
	| eqa_pretty {a b : kConfiguration} : kConfiguration.eqa a b → kConfiguration.eqa (kConfiguration.pretty a) (kConfiguration.pretty b)
	| eqa_transpileAux {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} : k«Set{Rule}».eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.transpileAux a₀ a₁) (kConfiguration.transpileAux b₀ b₁)
	| eqa_transpile {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kConfiguration.eqa (kConfiguration.transpile a) (kConfiguration.transpile b)
	| eqa_union {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.union a₀ a₁) (kConfiguration.union b₀ b₁)
	| eqa_ltcolonbargt {a₀ b₀ : kAction} {a₁ b₁ : kCid} {a₂ b₂ : kAttributeSet} : kAction.eqa a₀ b₀ → kCid.eqa a₁ b₁ → kAttributeSet.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.ltcolonbargt a₀ a₁ a₂) (kConfiguration.ltcolonbargt b₀ b₁ b₂)
	| eqa_«ltcolonbar`gt» {a₀ b₀ : kAction} {a₁ b₁ : kCid} : kAction.eqa a₀ b₀ → kCid.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.«ltcolonbar`gt» a₀ a₁) (kConfiguration.«ltcolonbar`gt» b₀ b₁)
	| eqa_bslash {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.bslash a₀ a₁) (kConfiguration.bslash b₀ b₁)
	| eqa_join {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.join a₀ a₁) (kConfiguration.join b₀ b₁)
	| eqa_«`,» {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.«`,» a₀ a₁) (kConfiguration.«`,» b₀ b₁)
	| eqa_did {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.did a₀ a₁) (kConfiguration.did b₀ b₁)
	| eqa_do {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.do a₀ a₁) (kConfiguration.do b₀ b₁)
	| eqa_does {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.does a₀ a₁) (kConfiguration.does b₀ b₁)
	| eqa_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kConfiguration} : kAction.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.ifthenelsefi a₀ a₁ a₂) (kConfiguration.ifthenelsefi b₀ b₁ b₂)
	-- Structural axioms
	| join_comm {a b} : kConfiguration.eqa (kConfiguration.join a b) (kConfiguration.join b a)
	| join_assoc {a b c} : kConfiguration.eqa (kConfiguration.join a (kConfiguration.join b c)) (kConfiguration.join (kConfiguration.join a b) c)
	| join_left_id {a} : kConfiguration.eqa (kConfiguration.join kConfiguration.none a) a
	| join_right_id {a} : kConfiguration.eqa (kConfiguration.join a kConfiguration.none) a
	| «`,»_comm {a b} : kConfiguration.eqa (kConfiguration.«`,» a b) (kConfiguration.«`,» b a)
	| «`,»_assoc {a b c} : kConfiguration.eqa (kConfiguration.«`,» a (kConfiguration.«`,» b c)) (kConfiguration.«`,» (kConfiguration.«`,» a b) c)
	| «`,»_left_id {a} : kConfiguration.eqa (kConfiguration.«`,» kConfiguration.empty a) a
	| «`,»_right_id {a} : kConfiguration.eqa (kConfiguration.«`,» a kConfiguration.empty) a

with kActiveRule.eqa : kActiveRule → kActiveRule → Prop
	| refl {a} : kActiveRule.eqa a a
	| symm {a b} : kActiveRule.eqa a b → kActiveRule.eqa b a
	| trans {a b c} : kActiveRule.eqa a b → kActiveRule.eqa b c → kActiveRule.eqa a c
	-- Congruence axioms for each operator

with kCid.eqa : kCid → kCid → Prop
	| refl {a} : kCid.eqa a a
	| symm {a b} : kCid.eqa a b → kCid.eqa b a
	| trans {a b c} : kCid.eqa a b → kCid.eqa b c → kCid.eqa a c
	-- Congruence axioms for each operator
	| eqa_getClass {a b : kConfiguration} : kConfiguration.eqa a b → kCid.eqa (kCid.getClass a) (kCid.getClass b)

with kActorDeonticActionDeadline.eqa : kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
	| refl {a} : kActorDeonticActionDeadline.eqa a a
	| symm {a b} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b a
	| trans {a b c} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b c → kActorDeonticActionDeadline.eqa a c
	-- Congruence axioms for each operator
	| eqa_PARTY₀ {a₀ b₀ : kAction} {a₁ b₁ : kDeadline} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kAction.eqa a₀ b₀ → kDeadline.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b₀ b₁ b₂ b₃)
	| eqa_PARTY₁ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kAction} {a₃ b₃ : kDeadline} : kAction.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kAction.eqa a₂ b₂ → kDeadline.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b₀ b₁ b₂ b₃)
	| eqa_PARTY₂ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kDeadline} {a₃ b₃ : kAction} : kAction.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kDeadline.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b₀ b₁ b₂ b₃)
	| eqa_PARTY₃ {a₀ b₀ : kDeadline} {a₁ b₁ : kAction} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kDeadline.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b₀ b₁ b₂ b₃)

with kActorState.eqa : kActorState → kActorState → Prop
	| refl {a} : kActorState.eqa a a
	| symm {a b} : kActorState.eqa a b → kActorState.eqa b a
	| trans {a b c} : kActorState.eqa a b → kActorState.eqa b c → kActorState.eqa a c
	-- Congruence axioms for each operator

with kAttributeSet.eqa : kAttributeSet → kAttributeSet → Prop
	| refl {a} : kAttributeSet.eqa a a
	| symm {a b} : kAttributeSet.eqa a b → kAttributeSet.eqa b a
	| trans {a b c} : kAttributeSet.eqa a b → kAttributeSet.eqa b c → kAttributeSet.eqa a c
	-- Congruence axioms for each operator
	| eqa_«`,» {a₀ b₀ a₁ b₁ : kAttributeSet} : kAttributeSet.eqa a₀ b₀ → kAttributeSet.eqa a₁ b₁ → kAttributeSet.eqa (kAttributeSet.«`,» a₀ a₁) (kAttributeSet.«`,» b₀ b₁)
	| eqa_«contractState`colon» {a b : kContractState} : kContractState.eqa a b → kAttributeSet.eqa (kAttributeSet.«contractState`colon» a) (kAttributeSet.«contractState`colon» b)
	| eqa_«rules`colon» {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kAttributeSet.eqa (kAttributeSet.«rules`colon» a) (kAttributeSet.«rules`colon» b)
	| eqa_«time`colon» {a b : kFindResult} : kFindResult.eqa a b → kAttributeSet.eqa (kAttributeSet.«time`colon» a) (kAttributeSet.«time`colon» b)
	-- Structural axioms
	| «`,»_comm {a b} : kAttributeSet.eqa (kAttributeSet.«`,» a b) (kAttributeSet.«`,» b a)
	| «`,»_assoc {a b c} : kAttributeSet.eqa (kAttributeSet.«`,» a (kAttributeSet.«`,» b c)) (kAttributeSet.«`,» (kAttributeSet.«`,» a b) c)
	| «`,»_left_id {a} : kAttributeSet.eqa (kAttributeSet.«`,» kAttributeSet.none a) a
	| «`,»_right_id {a} : kAttributeSet.eqa (kAttributeSet.«`,» a kAttributeSet.none) a

with kString.eqa : kString → kString → Prop
	| refl {a} : kString.eqa a a
	| symm {a b} : kString.eqa a b → kString.eqa b a
	| trans {a b c} : kString.eqa a b → kString.eqa b c → kString.eqa a c
	-- Congruence axioms for each operator
	| eqa_sum {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kString.eqa (kString.sum a₀ a₁) (kString.sum b₀ b₁)
	| eqa_char {a b : kFindResult} : kFindResult.eqa a b → kString.eqa (kString.char a) (kString.char b)
	| eqa_lowerCase {a b : kString} : kString.eqa a b → kString.eqa (kString.lowerCase a) (kString.lowerCase b)
	| eqa_string {a b : kAction} : kAction.eqa a b → kString.eqa (kString.string a) (kString.string b)
	| eqa_substr {a₀ b₀ : kString} {a₁ b₁ a₂ b₂ : kFindResult} : kString.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kString.eqa (kString.substr a₀ a₁ a₂) (kString.substr b₀ b₁ b₂)
	| eqa_upperCase {a b : kString} : kString.eqa a b → kString.eqa (kString.upperCase a) (kString.upperCase b)

with kContractState.eqa : kContractState → kContractState → Prop
	| refl {a} : kContractState.eqa a a
	| symm {a b} : kContractState.eqa a b → kContractState.eqa b a
	| trans {a b c} : kContractState.eqa a b → kContractState.eqa b c → kContractState.eqa a c
	-- Congruence axioms for each operator
	| eqa_deltaAction {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} {a₂ b₂ : kContractState} : k«Set{Rule}».eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kContractState.eqa a₂ b₂ → kContractState.eqa (kContractState.deltaAction a₀ a₁ a₂) (kContractState.deltaAction b₀ b₁ b₂)
	| eqa_deltaTick {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kContractState} : k«Set{Rule}».eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa (kContractState.deltaTick a₀ a₁) (kContractState.deltaTick b₀ b₁)
	| eqa_Active {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kContractState.eqa (kContractState.Active a) (kContractState.Active b)
	| eqa_Breached {a b : kAction} : kAction.eqa a b → kContractState.eqa (kContractState.Breached a) (kContractState.Breached b)
	| eqa_pow {a₀ b₀ a₁ b₁ : kContractState} : kContractState.eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa (kContractState.pow a₀ a₁) (kContractState.pow b₀ b₁)
	| eqa_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kContractState} : kAction.eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa a₂ b₂ → kContractState.eqa (kContractState.ifthenelsefi a₀ a₁ a₂) (kContractState.ifthenelsefi b₀ b₁ b₂)
	-- Structural axioms
	| pow_comm {a b} : kContractState.eqa (kContractState.pow a b) (kContractState.pow b a)
	| pow_assoc {a b c} : kContractState.eqa (kContractState.pow a (kContractState.pow b c)) (kContractState.pow (kContractState.pow a b) c)
	| pow_left_id {a} : kContractState.eqa (kContractState.pow kContractState.Fulfilled a) a
	| pow_right_id {a} : kContractState.eqa (kContractState.pow a kContractState.Fulfilled) a

with kContractStatus.eqa : kContractStatus → kContractStatus → Prop
	| refl {a} : kContractStatus.eqa a a
	| symm {a b} : kContractStatus.eqa a b → kContractStatus.eqa b a
	| trans {a b c} : kContractStatus.eqa a b → kContractStatus.eqa b c → kContractStatus.eqa a c
	-- Congruence axioms for each operator
	| eqa_configToStatus {a b : kConfiguration} : kConfiguration.eqa a b → kContractStatus.eqa (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
	| eqa_contractStateToStatus {a b : kContractState} : kContractState.eqa a b → kContractStatus.eqa (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)

with kDate.eqa : kDate → kDate → Prop
	| refl {a} : kDate.eqa a a
	| symm {a b} : kDate.eqa a b → kDate.eqa b a
	| trans {a b c} : kDate.eqa a b → kDate.eqa b c → kDate.eqa a c
	-- Congruence axioms for each operator

with kDeadline.eqa : kDeadline → kDeadline → Prop
	| refl {a} : kDeadline.eqa a a
	| symm {a b} : kDeadline.eqa a b → kDeadline.eqa b a
	| trans {a b c} : kDeadline.eqa a b → kDeadline.eqa b c → kDeadline.eqa a c
	-- Congruence axioms for each operator
	| eqa_BY {a b : kFindResult} : kFindResult.eqa a b → kDeadline.eqa (kDeadline.BY a) (kDeadline.BY b)
	| eqa_WITHIN {a b : kDuration} : kDuration.eqa a b → kDeadline.eqa (kDeadline.WITHIN a) (kDeadline.WITHIN b)

with kDeontic.eqa : kDeontic → kDeontic → Prop
	| refl {a} : kDeontic.eqa a a
	| symm {a b} : kDeontic.eqa a b → kDeontic.eqa b a
	| trans {a b c} : kDeontic.eqa a b → kDeontic.eqa b c → kDeontic.eqa a c
	-- Congruence axioms for each operator

with kDuration.eqa : kDuration → kDuration → Prop
	| refl {a} : kDuration.eqa a a
	| symm {a b} : kDuration.eqa a b → kDuration.eqa b a
	| trans {a b c} : kDuration.eqa a b → kDuration.eqa b c → kDuration.eqa a c
	-- Congruence axioms for each operator
	| eqa_DAY {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.DAY a) (kDuration.DAY b)
	| eqa_MONTH {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.MONTH a) (kDuration.MONTH b)
	| eqa_WEEK {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.WEEK a) (kDuration.WEEK b)
	| eqa_YEAR {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.YEAR a) (kDuration.YEAR b)

with kFindResult.eqa : kFindResult → kFindResult → Prop
	| refl {a} : kFindResult.eqa a a
	| symm {a b} : kFindResult.eqa a b → kFindResult.eqa b a
	| trans {a b c} : kFindResult.eqa a b → kFindResult.eqa b c → kFindResult.eqa a c
	-- Congruence axioms for each operator
	| eqa_«$card»₀ {a₀ b₀ : kConfiguration} {a₁ b₁ : kFindResult} : kConfiguration.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₀ a₀ a₁) (kFindResult.«$card»₀ b₀ b₁)
	| eqa_«$card»₁ {a₀ b₀ : kAction} {a₁ b₁ : kFindResult} : kAction.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₁ a₀ a₁) (kFindResult.«$card»₁ b₀ b₁)
	| eqa_«$card»₂ {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kFindResult} : k«Set{Rule}».eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₂ a₀ a₁) (kFindResult.«$card»₂ b₀ b₁)
	| eqa_barbar₀ {a b : kConfiguration} : kConfiguration.eqa a b → kFindResult.eqa (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
	| eqa_barbar₁ {a b : kAction} : kAction.eqa a b → kFindResult.eqa (kFindResult.barbar₁ a) (kFindResult.barbar₁ b)
	| eqa_barbar₂ {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kFindResult.eqa (kFindResult.barbar₂ a) (kFindResult.barbar₂ b)
	| eqa_amp {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.amp a₀ a₁) (kFindResult.amp b₀ b₁)
	| eqa_mul {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.mul a₀ a₁) (kFindResult.mul b₀ b₁)
	| eqa_sum {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.sum a₀ a₁) (kFindResult.sum b₀ b₁)
	| eqa_ltlt {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.ltlt a₀ a₁) (kFindResult.ltlt b₀ b₁)
	| eqa_gtgt {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.gtgt a₀ a₁) (kFindResult.gtgt b₀ b₁)
	| eqa_pow {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.pow a₀ a₁) (kFindResult.pow b₀ b₁)
	| eqa_quo {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.quo a₀ a₁) (kFindResult.quo b₀ b₁)
	| eqa_rem {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.rem a₀ a₁) (kFindResult.rem b₀ b₁)
	| eqa_xor {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.xor a₀ a₁) (kFindResult.xor b₀ b₁)
	| eqa_bar {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.bar a₀ a₁) (kFindResult.bar b₀ b₁)
	| eqa_ascii {a b : kString} : kString.eqa a b → kFindResult.eqa (kFindResult.ascii a) (kFindResult.ascii b)
	| eqa_find {a₀ b₀ a₁ b₁ : kString} {a₂ b₂ : kFindResult} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kFindResult.eqa (kFindResult.find a₀ a₁ a₂) (kFindResult.find b₀ b₁ b₂)
	| eqa_gcd {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.gcd a₀ a₁) (kFindResult.gcd b₀ b₁)
	| eqa_lcm {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.lcm a₀ a₁) (kFindResult.lcm b₀ b₁)
	| eqa_length {a b : kString} : kString.eqa a b → kFindResult.eqa (kFindResult.length a) (kFindResult.length b)
	| eqa_max {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.max a₀ a₁) (kFindResult.max b₀ b₁)
	| eqa_min {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.min a₀ a₁) (kFindResult.min b₀ b₁)
	| eqa_modExp {a₀ b₀ a₁ b₁ a₂ b₂ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kFindResult.eqa (kFindResult.modExp a₀ a₁ a₂) (kFindResult.modExp b₀ b₁ b₂)
	| eqa_rfind {a₀ b₀ a₁ b₁ : kString} {a₂ b₂ : kFindResult} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kFindResult.eqa (kFindResult.rfind a₀ a₁ a₂) (kFindResult.rfind b₀ b₁ b₂)
	| eqa_s {a b : kFindResult} : kFindResult.eqa a b → kFindResult.eqa (kFindResult.s a) (kFindResult.s b)
	| eqa_sd {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.sd a₀ a₁) (kFindResult.sd b₀ b₁)
	| eqa_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kFindResult} : kAction.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kFindResult.eqa (kFindResult.ifthenelsefi a₀ a₁ a₂) (kFindResult.ifthenelsefi b₀ b₁ b₂)
	-- Structural axioms
	| amp_comm {a b} : kFindResult.eqa (kFindResult.amp a b) (kFindResult.amp b a)
	| amp_assoc {a b c} : kFindResult.eqa (kFindResult.amp a (kFindResult.amp b c)) (kFindResult.amp (kFindResult.amp a b) c)
	| mul_comm {a b} : kFindResult.eqa (kFindResult.mul a b) (kFindResult.mul b a)
	| mul_assoc {a b c} : kFindResult.eqa (kFindResult.mul a (kFindResult.mul b c)) (kFindResult.mul (kFindResult.mul a b) c)
	| sum_comm {a b} : kFindResult.eqa (kFindResult.sum a b) (kFindResult.sum b a)
	| sum_assoc {a b c} : kFindResult.eqa (kFindResult.sum a (kFindResult.sum b c)) (kFindResult.sum (kFindResult.sum a b) c)
	| xor_comm {a b} : kFindResult.eqa (kFindResult.xor a b) (kFindResult.xor b a)
	| xor_assoc {a b c} : kFindResult.eqa (kFindResult.xor a (kFindResult.xor b c)) (kFindResult.xor (kFindResult.xor a b) c)
	| bar_comm {a b} : kFindResult.eqa (kFindResult.bar a b) (kFindResult.bar b a)
	| bar_assoc {a b c} : kFindResult.eqa (kFindResult.bar a (kFindResult.bar b c)) (kFindResult.bar (kFindResult.bar a b) c)
	| gcd_comm {a b} : kFindResult.eqa (kFindResult.gcd a b) (kFindResult.gcd b a)
	| gcd_assoc {a b c} : kFindResult.eqa (kFindResult.gcd a (kFindResult.gcd b c)) (kFindResult.gcd (kFindResult.gcd a b) c)
	| lcm_comm {a b} : kFindResult.eqa (kFindResult.lcm a b) (kFindResult.lcm b a)
	| lcm_assoc {a b c} : kFindResult.eqa (kFindResult.lcm a (kFindResult.lcm b c)) (kFindResult.lcm (kFindResult.lcm a b) c)
	| max_comm {a b} : kFindResult.eqa (kFindResult.max a b) (kFindResult.max b a)
	| max_assoc {a b c} : kFindResult.eqa (kFindResult.max a (kFindResult.max b c)) (kFindResult.max (kFindResult.max a b) c)
	| min_comm {a b} : kFindResult.eqa (kFindResult.min a b) (kFindResult.min b a)
	| min_assoc {a b c} : kFindResult.eqa (kFindResult.min a (kFindResult.min b c)) (kFindResult.min (kFindResult.min a b) c)
	| sd_comm {a b} : kFindResult.eqa (kFindResult.sd a b) (kFindResult.sd b a)

with kHenceLest.eqa : kHenceLest → kHenceLest → Prop
	| refl {a} : kHenceLest.eqa a a
	| symm {a b} : kHenceLest.eqa a b → kHenceLest.eqa b a
	| trans {a b c} : kHenceLest.eqa a b → kHenceLest.eqa b c → kHenceLest.eqa a c
	-- Congruence axioms for each operator
	| eqa_HENCE {a b : kAction} : kAction.eqa a b → kHenceLest.eqa (kHenceLest.HENCE a) (kHenceLest.HENCE b)
	| eqa_HENCELEST {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.HENCELEST a₀ a₁) (kHenceLest.HENCELEST b₀ b₁)
	| eqa_LEST {a b : kAction} : kAction.eqa a b → kHenceLest.eqa (kHenceLest.LEST a) (kHenceLest.LEST b)
	| eqa_LESTHENCE {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.LESTHENCE a₀ a₁) (kHenceLest.LESTHENCE b₀ b₁)

with k«Set{Rule}».eqa : k«Set{Rule}» → k«Set{Rule}» → Prop
	| refl {a} : k«Set{Rule}».eqa a a
	| symm {a b} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqa b a
	| trans {a b c} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqa b c → k«Set{Rule}».eqa a c
	-- Congruence axioms for each operator
	| eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».«$diff» a₀ a₁ a₂) (k«Set{Rule}».«$diff» b₀ b₁ b₂)
	| eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».«$intersect» a₀ a₁ a₂) (k«Set{Rule}».«$intersect» b₀ b₁ b₂)
	| eqa_delete {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».delete a₀ a₁) (k«Set{Rule}».delete b₀ b₁)
	| eqa_getRulesWithNames {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kAction} : k«Set{Rule}».eqa a₀ b₀ → kAction.eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».getRulesWithNames a₀ a₁) (k«Set{Rule}».getRulesWithNames b₀ b₁)
	| eqa_insert {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».insert a₀ a₁) (k«Set{Rule}».insert b₀ b₁)
	| eqa_intersection {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».intersection a₀ a₁) (k«Set{Rule}».intersection b₀ b₁)
	| eqa_union {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».union a₀ a₁) (k«Set{Rule}».union b₀ b₁)
	| eqa_RULE₀ {a₀ b₀ : kAction} {a₁ b₁ : kActorDeonticActionDeadline} : kAction.eqa a₀ b₀ → kActorDeonticActionDeadline.eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».RULE₀ a₀ a₁) (k«Set{Rule}».RULE₀ b₀ b₁)
	| eqa_RULE₁ {a₀ b₀ : kAction} {a₁ b₁ : kActorDeonticActionDeadline} {a₂ b₂ : kHenceLest} : kAction.eqa a₀ b₀ → kActorDeonticActionDeadline.eqa a₁ b₁ → kHenceLest.eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».RULE₁ a₀ a₁ a₂) (k«Set{Rule}».RULE₁ b₀ b₁ b₂)
	| eqa_bslash {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».bslash a₀ a₁) (k«Set{Rule}».bslash b₀ b₁)
	| eqa_«`,» {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».«`,» a₀ a₁) (k«Set{Rule}».«`,» b₀ b₁)
	| eqa_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : k«Set{Rule}»} : kAction.eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) (k«Set{Rule}».ifthenelsefi b₀ b₁ b₂)
	-- Structural axioms
	| «`,»_comm {a b} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a b) (k«Set{Rule}».«`,» b a)
	| «`,»_assoc {a b c} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a (k«Set{Rule}».«`,» b c)) (k«Set{Rule}».«`,» (k«Set{Rule}».«`,» a b) c)
	| «`,»_left_id {a} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» k«Set{Rule}».empty a) a
	| «`,»_right_id {a} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a k«Set{Rule}».empty) a

-- Sort membership and equality modulo equations

mutual inductive kAction.has_sort, kConfiguration.has_sort, kActiveRule.has_sort, kCid.has_sort, kActorDeonticActionDeadline.has_sort, kActorState.has_sort, kAttributeSet.has_sort, kString.has_sort, kContractState.has_sort, kContractStatus.has_sort, kDate.has_sort, kDeadline.has_sort, kDeontic.has_sort, kDuration.has_sort, kFindResult.has_sort, kHenceLest.has_sort, k«Set{Rule}».has_sort, kAction.eqe, kConfiguration.eqe, kActiveRule.eqe, kCid.eqe, kActorDeonticActionDeadline.eqe, kActorState.eqe, kAttributeSet.eqe, kString.eqe, kContractState.eqe, kContractStatus.eqe, kDate.eqe, kDeadline.eqe, kDeontic.eqe, kDuration.eqe, kFindResult.eqe, kHenceLest.eqe, k«Set{Rule}».eqe
with kAction.has_sort : kAction → MSort → Prop
	| subsort {t a b} : subsort a b → kAction.has_sort t a → kAction.has_sort t b
	-- Implicit membership axioms (operator declarations)
	| true_decl₀ : kAction.has_sort kAction.true MSort.Bool
	| true_decl₁ : kAction.has_sort kAction.true MSort.Bool
	| false_decl₀ : kAction.has_sort kAction.false MSort.Bool
	| false_decl₁ : kAction.has_sort kAction.false MSort.Bool
	| and_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.and a₀ a₁) MSort.Bool
	| and_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.and a₀ a₁) MSort.Bool
	| or_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.or a₀ a₁) MSort.Bool
	| or_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.or a₀ a₁) MSort.Bool
	| xor_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.xor a₀ a₁) MSort.Bool
	| xor_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.xor a₀ a₁) MSort.Bool
	| not_decl₀ {a : kAction} : kAction.has_sort a MSort.Bool → kAction.has_sort (kAction.not a) MSort.Bool
	| not_decl₁ {a : kAction} : kAction.has_sort a MSort.Bool → kAction.has_sort (kAction.not a) MSort.Bool
	| implies_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.implies a₀ a₁) MSort.Bool
	| implies_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.implies a₀ a₁) MSort.Bool
	| «$diff»_decl {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.«$diff» a₀ a₁ a₂) MSort.«Set{Qid}»
	| «$intersect»_decl {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.«$intersect» a₀ a₁ a₂) MSort.«Set{Qid}»
	| NOTHING_decl : kAction.has_sort kAction.NOTHING MSort.Names
	| containsActor_decl {a₀ : kConfiguration} {a₁ : kAction} : kConfiguration.has_sort a₀ MSort.Configuration → kAction.has_sort a₁ MSort.Qid → kAction.has_sort (kAction.containsActor a₀ a₁) MSort.Bool
	| containsRuleWithEvent_decl {a₀ : k«Set{Rule}»} {a₁ : kConfiguration} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kConfiguration.has_sort a₁ MSort.ActionEvent → kAction.has_sort (kAction.containsRuleWithEvent a₀ a₁) MSort.Bool
	| in₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.in₀ a₀ a₁) MSort.Bool
	| in₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.in₁ a₀ a₁) MSort.Bool
	| in₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.in₂ a₀ a₁) MSort.Bool
	| psubset₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.psubset₀ a₀ a₁) MSort.Bool
	| psubset₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.psubset₁ a₀ a₁) MSort.Bool
	| psubset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.psubset₂ a₀ a₁) MSort.Bool
	| subset₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.subset₀ a₀ a₁) MSort.Bool
	| subset₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.subset₁ a₀ a₁) MSort.Bool
	| subset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.subset₂ a₀ a₁) MSort.Bool
	| delete_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.delete a₀ a₁) MSort.«Set{Qid}»
	| insert_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.insert a₀ a₁) MSort.«Set{Qid}»
	| intersection_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.intersection a₀ a₁) MSort.«Set{Qid}»
	| union_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«NeSet{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«NeSet{Qid}»
	| union_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«NeSet{Qid}»
	| union_decl₂ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«Set{Qid}»
	| ltQidsgt_decl : kAction.has_sort kAction.ltQidsgt MSort.Qid
	| DO_decl {a : kAction} : kAction.has_sort a MSort.Qid → kAction.has_sort (kAction.DO a) MSort.Action
	| lteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.lteq₀ a₀ a₁) MSort.Bool
	| lteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.lteq₁ a₀ a₁) MSort.Bool
	| lt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.lt₀ a₀ a₁) MSort.Bool
	| lt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.lt₁ a₀ a₁) MSort.Bool
	| gteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.gteq₀ a₀ a₁) MSort.Bool
	| gteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.gteq₁ a₀ a₁) MSort.Bool
	| gt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.gt₀ a₀ a₁) MSort.Bool
	| gt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.gt₁ a₀ a₁) MSort.Bool
	| AND_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Names → kAction.has_sort a₁ MSort.Names → kAction.has_sort (kAction.AND a₀ a₁) MSort.Names
	| bslash_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.bslash a₀ a₁) MSort.«Set{Qid}»
	| «`,»_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«NeSet{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«NeSet{Qid}»
	| «`,»_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«Set{Qid}»
	| «`,»_decl₂ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«NeSet{Qid}»
	| andsubthen_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.andsubthen a₀ a₁) MSort.Bool
	| divides_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.divides a₀ a₁) MSort.Bool
	| orsubelse_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.orsubelse a₀ a₁) MSort.Bool
	| empty_decl : kAction.has_sort kAction.empty MSort.«Set{Qid}»
	| ifthenelsefi_decl₁ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Action → kAction.has_sort a₂ MSort.Action → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Action
	| ifthenelsefi_decl₂ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.«Set{Qid}»
	| ifthenelsefi_decl₃ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Id → kAction.has_sort a₂ MSort.Id → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Id
	| ifthenelsefi_decl₄ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Situation → kAction.has_sort a₂ MSort.Situation → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Situation
	| ifthenelsefi_decl₅ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Names → kAction.has_sort a₂ MSort.Names → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Names
	| ifthenelsefi_decl₆ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort a₂ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{Qid}»
	| ifthenelsefi_decl₇ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Oid → kAction.has_sort a₂ MSort.Oid → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Oid
	| ifthenelsefi_decl₈ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort a₂ MSort.Bool → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Bool
	| ifthenelsefi_decl₉ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Qid → kAction.has_sort a₂ MSort.Qid → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Qid
	| eqslasheq₀_decl {a₀ a₁ : kConfiguration} : kAction.has_sort (kAction.eqslasheq₀ a₀ a₁) MSort.Bool
	| eqslasheq₁_decl {a₀ a₁ : kAction} : kAction.has_sort (kAction.eqslasheq₁ a₀ a₁) MSort.Bool
	| eqslasheq₂_decl {a₀ a₁ : k«Set{Rule}»} : kAction.has_sort (kAction.eqslasheq₂ a₀ a₁) MSort.Bool
	| eqeq₀_decl {a₀ a₁ : kAction} : kAction.has_sort (kAction.eqeq₀ a₀ a₁) MSort.Bool
	| eqeq₁_decl {a₀ a₁ : kDeontic} : kAction.has_sort (kAction.eqeq₁ a₀ a₁) MSort.Bool
	| eqeq₂_decl {a₀ a₁ : kContractStatus} : kAction.has_sort (kAction.eqeq₂ a₀ a₁) MSort.Bool

with kConfiguration.has_sort : kConfiguration → MSort → Prop
	| subsort {t a b} : subsort a b → kConfiguration.has_sort t a → kConfiguration.has_sort t b
	-- Implicit membership axioms (operator declarations)
	| «$diff»_decl {a₀ a₁ a₂ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«$diff» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
	| «$intersect»_decl {a₀ a₁ a₂ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«$intersect» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
	| delete_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.delete a₀ a₁) MSort.«Set{ActionEvent}»
	| getAction_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Configuration → kConfiguration.has_sort (kConfiguration.getAction a) MSort.ActionEvent
	| getAllActions_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kConfiguration.has_sort (kConfiguration.getAllActions a) MSort.«Set{ActionEvent}»
	| insert_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.insert a₀ a₁) MSort.«Set{ActionEvent}»
	| intersection_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.intersection a₀ a₁) MSort.«Set{ActionEvent}»
	| pretty_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Configuration → kConfiguration.has_sort (kConfiguration.pretty a) MSort.Configuration
	| transpileAux_decl {a₀ : k«Set{Rule}»} {a₁ : kConfiguration} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort (kConfiguration.transpileAux a₀ a₁) MSort.Configuration
	| transpile_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kConfiguration.has_sort (kConfiguration.transpile a) MSort.Configuration
	| union_decl₀ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«NeSet{ActionEvent}»
	| union_decl₁ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«NeSet{ActionEvent}»
	| union_decl₂ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«Set{ActionEvent}»
	| ltgt_decl : kConfiguration.has_sort kConfiguration.ltgt MSort.Portal
	| ltcolonbargt_decl {a₀ : kAction} {a₁ : kCid} {a₂ : kAttributeSet} : kAction.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kAttributeSet.has_sort a₂ MSort.AttributeSet → kConfiguration.has_sort (kConfiguration.ltcolonbargt a₀ a₁ a₂) MSort.Object
	| «ltcolonbar`gt»_decl {a₀ : kAction} {a₁ : kCid} : kAction.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kConfiguration.has_sort (kConfiguration.«ltcolonbar`gt» a₀ a₁) MSort.Object
	| bslash_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.bslash a₀ a₁) MSort.«Set{ActionEvent}»
	| join_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.Configuration → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort (kConfiguration.join a₀ a₁) MSort.Configuration
	| «`,»_decl₀ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
	| «`,»_decl₁ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«Set{ActionEvent}»
	| «`,»_decl₂ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
	| did_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.did a₀ a₁) MSort.ActionEvent
	| do_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.do a₀ a₁) MSort.ActionEvent
	| does_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.does a₀ a₁) MSort.ActionEvent
	| empty_decl : kConfiguration.has_sort kConfiguration.empty MSort.«Set{ActionEvent}»
	| none_decl : kConfiguration.has_sort kConfiguration.none MSort.Configuration
	| tau_decl : kConfiguration.has_sort kConfiguration.tau MSort.ActionEvent
	| tick_decl : kConfiguration.has_sort kConfiguration.tick MSort.TickEvent
	| ifthenelsefi_decl₁ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort a₂ MSort.Configuration → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Configuration
	| ifthenelsefi_decl₂ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.«Set{ActionEvent}»
	| ifthenelsefi_decl₃ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Msg → kConfiguration.has_sort a₂ MSort.Msg → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Msg
	| ifthenelsefi_decl₄ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Object → kConfiguration.has_sort a₂ MSort.Object → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Object
	| ifthenelsefi_decl₅ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Portal → kConfiguration.has_sort a₂ MSort.Portal → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Portal
	| ifthenelsefi_decl₆ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{ActionEvent}»
	| ifthenelsefi_decl₇ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Message → kConfiguration.has_sort a₂ MSort.Message → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Message
	| ifthenelsefi_decl₈ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Event → kConfiguration.has_sort a₂ MSort.Event → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Event
	| ifthenelsefi_decl₉ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.ActionEvent → kConfiguration.has_sort a₂ MSort.ActionEvent → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.ActionEvent
