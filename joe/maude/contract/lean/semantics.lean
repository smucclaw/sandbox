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
:= fun a0 a1 => match (a0, a1) with
  | (MSort.Qid, MSort.Action) => true
  | (MSort.Attribute, MSort.AttributeSet) => true
  | (MSort.Actor, MSort.Cid) => true
  | (MSort.Coordinator, MSort.Cid) => true
  | (MSort.PreCoordinator, MSort.Cid) => true
  | (MSort.Msg, MSort.Configuration) => true
  | (MSort.Object, MSort.Configuration) => true
  | (MSort.Portal, MSort.Configuration) => true
  | (MSort.ActionEvent, MSort.Event) => true
  | (MSort.TickEvent, MSort.Event) => true
  | (MSort.Nat, MSort.FindResult) => true
  | (MSort.Oid, MSort.Id) => true
  | (MSort.Event, MSort.Message) => true
  | (MSort.Message, MSort.Msg) => true
  | (MSort.Qid, MSort.Names) => true
  | (MSort.NzNat, MSort.Nat) => true
  | (MSort.Zero, MSort.Nat) => true
  | (MSort.ActionEvent, MSort.«NeSet{ActionEvent}») => true
  | (MSort.Qid, MSort.«NeSet{Qid}») => true
  | (MSort.Rule, MSort.«NeSet{Rule}») => true
  | (MSort.Qid, MSort.Oid) => true
  | (MSort.Coordinator, MSort.PreCoordinator) => true
  | (MSort.«NeSet{ActionEvent}», MSort.«Set{ActionEvent}») => true
  | (MSort.Names, MSort.«Set{Qid}») => true
  | (MSort.«NeSet{Qid}», MSort.«Set{Qid}») => true
  | (MSort.«NeSet{Rule}», MSort.«Set{Rule}») => true
  | (MSort.Bool, MSort.Situation) => true
  | (MSort.Qid, MSort.Situation) => true
  | (MSort.Char, MSort.String) => true
  | (_, _) => false

-- Kinds and their operators
opaques kActiveRule kActorState kDate : Type

inductive kDeontic
  | MAY
  | MUST
  | SHANT

mutual

  inductive kAction
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
    | «in»₀ : kConfiguration → kConfiguration → kAction
    | «in»₁ : kAction → kAction → kAction
    | «in»₂ : k«Set{Rule}» → k«Set{Rule}» → kAction
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

  inductive kActorDeonticActionDeadline
    | PARTY₀ : kAction → kDeadline → kDeontic → kAction → kActorDeonticActionDeadline
    | PARTY₁ : kAction → kDeontic → kAction → kDeadline → kActorDeonticActionDeadline
    | PARTY₂ : kAction → kDeontic → kDeadline → kAction → kActorDeonticActionDeadline
    | PARTY₃ : kDeadline → kAction → kDeontic → kAction → kActorDeonticActionDeadline

  inductive kAttributeSet
    | «`,» : kAttributeSet → kAttributeSet → kAttributeSet
    | «contractState`colon» : kContractState → kAttributeSet
    | none
    | «rules`colon» : k«Set{Rule}» → kAttributeSet
    | «time`colon» : kFindResult → kAttributeSet

  inductive kCid
    | Actor
    | Coordinator
    | PreCoordinator
    | getClass : kConfiguration → kCid

  inductive kConfiguration
    | «$diff» : kConfiguration → kConfiguration → kConfiguration → kConfiguration
    | «$intersect» : kConfiguration → kConfiguration → kConfiguration → kConfiguration
    | delete : kConfiguration → kConfiguration → kConfiguration
    | getAction : kConfiguration → kConfiguration
    | getAllActions : k«Set{Rule}» → kConfiguration
    | initAux : k«Set{Rule}» → kConfiguration → kConfiguration
    | init : k«Set{Rule}» → kConfiguration
    | insert : kConfiguration → kConfiguration → kConfiguration
    | intersection : kConfiguration → kConfiguration → kConfiguration
    | pretty : kConfiguration → kConfiguration
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

  inductive kContractState
    | deltaAction : k«Set{Rule}» → kConfiguration → kContractState → kContractState
    | deltaTick : k«Set{Rule}» → kContractState → kContractState
    | Active : k«Set{Rule}» → kContractState
    | Breached : kAction → kContractState
    | Fulfilled
    | pow : kContractState → kContractState → kContractState
    | ifthenelsefi : kAction → kContractState → kContractState → kContractState

  inductive kContractStatus
    | configToStatus : kConfiguration → kContractStatus
    | contractStateToStatus : kContractState → kContractStatus
    | Active
    | Breached
    | Fulfilled

  inductive kDeadline
    | BY : kFindResult → kDeadline
    | WITHIN : kDuration → kDeadline

  inductive kDuration
    | DAY : kFindResult → kDuration
    | MONTH : kFindResult → kDuration
    | WEEK : kFindResult → kDuration
    | YEAR : kFindResult → kDuration

  inductive kFindResult
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

  inductive kHenceLest
    | HENCE : kAction → kHenceLest
    | HENCELEST : kAction → kAction → kHenceLest
    | LEST : kAction → kHenceLest
    | LESTHENCE : kAction → kAction → kHenceLest

  inductive kString
    | ltStringsgt
    | sum : kString → kString → kString
    | char : kFindResult → kString
    | lowerCase : kString → kString
    | string : kAction → kString
    | substr : kString → kFindResult → kFindResult → kString
    | upperCase : kString → kString

  inductive k«Set{Rule}»
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
end

-- Kind assignment
def kind : MSort → Type
  | MSort.Bool => kAction
  | MSort.Action => kAction
  | MSort.ActionEvent => kConfiguration
  | MSort.ActiveRule => kActiveRule
  | MSort.Actor => kCid
  | MSort.ActorDeonticActionDeadline => kActorDeonticActionDeadline
  | MSort.ActorState => kActorState
  | MSort.Attribute => kAttributeSet
  | MSort.AttributeSet => kAttributeSet
  | MSort.Char => kString
  | MSort.Cid => kCid
  | MSort.Configuration => kConfiguration
  | MSort.ContractState => kContractState
  | MSort.ContractStatus => kContractStatus
  | MSort.Coordinator => kCid
  | MSort.Date => kDate
  | MSort.Deadline => kDeadline
  | MSort.Deontic => kDeontic
  | MSort.Duration => kDuration
  | MSort.Event => kConfiguration
  | MSort.FindResult => kFindResult
  | MSort.HenceLest => kHenceLest
  | MSort.Id => kAction
  | MSort.Message => kConfiguration
  | MSort.Msg => kConfiguration
  | MSort.Names => kAction
  | MSort.Nat => kFindResult
  | MSort.«NeSet{ActionEvent}» => kConfiguration
  | MSort.«NeSet{Qid}» => kAction
  | MSort.«NeSet{Rule}» => k«Set{Rule}»
  | MSort.NzNat => kFindResult
  | MSort.Object => kConfiguration
  | MSort.Oid => kAction
  | MSort.Portal => kConfiguration
  | MSort.PreCoordinator => kCid
  | MSort.Qid => kAction
  | MSort.Rule => k«Set{Rule}»
  | MSort.«Set{ActionEvent}» => kConfiguration
  | MSort.«Set{Qid}» => kAction
  | MSort.«Set{Rule}» => k«Set{Rule}»
  | MSort.Situation => kAction
  | MSort.String => kString
  | MSort.TickEvent => kConfiguration
  | MSort.Zero => kFindResult

-- Predicates recognizing constructor terms
mutual

  def kAction.ctor_only : kAction → Prop
    | kAction.true => true
    | kAction.false => true
    | (kAction.DO a) => a.ctor_only
    | (kAction.«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kAction.empty => true
    | _ => false

  def kConfiguration.ctor_only : kConfiguration → Prop
    | kConfiguration.ltgt => true
    | (kConfiguration.ltcolonbargt a₀ a₁ a₂) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only
    | (kConfiguration.join a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kConfiguration.«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kConfiguration.empty => true
    | kConfiguration.none => true
    | kConfiguration.tau => true
    | kConfiguration.tick => true
    | _ => false

  def kActiveRule.ctor_only : kActiveRule → Prop
    | _ => true

  def kCid.ctor_only : kCid → Prop
    | _ => false

  def kActorDeonticActionDeadline.ctor_only : kActorDeonticActionDeadline → Prop
    | (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
    | (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
    | (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only
    | (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only ∧ a₃.ctor_only

  def kActorState.ctor_only : kActorState → Prop
    | _ => true

  def kAttributeSet.ctor_only : kAttributeSet → Prop
    | (kAttributeSet.«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kAttributeSet.none => true
    | _ => false

  def kString.ctor_only : kString → Prop
    | _ => false

  def kContractState.ctor_only : kContractState → Prop
    | (kContractState.Active a) => a.ctor_only
    | (kContractState.Breached a) => a.ctor_only
    | kContractState.Fulfilled => true
    | _ => false

  def kContractStatus.ctor_only : kContractStatus → Prop
    | kContractStatus.Active => true
    | kContractStatus.Breached => true
    | kContractStatus.Fulfilled => true
    | _ => false

  def kDate.ctor_only : kDate → Prop
    | _ => true

  def kDeadline.ctor_only : kDeadline → Prop
    | (kDeadline.BY a) => a.ctor_only
    | (kDeadline.WITHIN a) => a.ctor_only

  def kDeontic.ctor_only : kDeontic → Prop
    | kDeontic.MAY => true
    | kDeontic.MUST => true
    | kDeontic.SHANT => true

  def kDuration.ctor_only : kDuration → Prop
    | (kDuration.DAY a) => a.ctor_only
    | (kDuration.MONTH a) => a.ctor_only
    | (kDuration.WEEK a) => a.ctor_only
    | (kDuration.YEAR a) => a.ctor_only

  def kFindResult.ctor_only : kFindResult → Prop
    | kFindResult.zero => true
    | kFindResult.notFound => true
    | (kFindResult.s a) => a.ctor_only
    | _ => false

  def kHenceLest.ctor_only : kHenceLest → Prop
    | (kHenceLest.HENCE a) => a.ctor_only
    | (kHenceLest.HENCELEST a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kHenceLest.LEST a) => a.ctor_only
    | (kHenceLest.LESTHENCE a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only

  def k«Set{Rule}».ctor_only : k«Set{Rule}» → Prop
    | (k«Set{Rule}».RULE₀ a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (k«Set{Rule}».RULE₁ a₀ a₁ a₂) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only
    | (k«Set{Rule}».«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | k«Set{Rule}».empty => true
    | _ => false
end

-- Equality modulo axioms
mutual

  inductive kAction.eqa: kAction → kAction → Prop
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
    | eqa_«in»₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kAction.eqa (kAction.«in»₀ a₀ a₁) (kAction.«in»₀ b₀ b₁)
    | eqa_«in»₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kAction.eqa (kAction.«in»₁ a₀ a₁) (kAction.«in»₁ b₀ b₁)
    | eqa_«in»₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kAction.eqa (kAction.«in»₂ a₀ a₁) (kAction.«in»₂ b₀ b₁)
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

  inductive kConfiguration.eqa: kConfiguration → kConfiguration → Prop
    | refl {a} : kConfiguration.eqa a a
    | symm {a b} : kConfiguration.eqa a b → kConfiguration.eqa b a
    | trans {a b c} : kConfiguration.eqa a b → kConfiguration.eqa b c → kConfiguration.eqa a c
    -- Congruence axioms for each operator
    | eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.«$diff» a₀ a₁ a₂) (kConfiguration.«$diff» b₀ b₁ b₂)
    | eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa a₂ b₂ → kConfiguration.eqa (kConfiguration.«$intersect» a₀ a₁ a₂) (kConfiguration.«$intersect» b₀ b₁ b₂)
    | eqa_delete {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.delete a₀ a₁) (kConfiguration.delete b₀ b₁)
    | eqa_getAction {a b : kConfiguration} : kConfiguration.eqa a b → kConfiguration.eqa (kConfiguration.getAction a) (kConfiguration.getAction b)
    | eqa_getAllActions {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kConfiguration.eqa (kConfiguration.getAllActions a) (kConfiguration.getAllActions b)
    | eqa_initAux {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} : k«Set{Rule}».eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.initAux a₀ a₁) (kConfiguration.initAux b₀ b₁)
    | eqa_init {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kConfiguration.eqa (kConfiguration.init a) (kConfiguration.init b)
    | eqa_insert {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.insert a₀ a₁) (kConfiguration.insert b₀ b₁)
    | eqa_intersection {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqa a₀ b₀ → kConfiguration.eqa a₁ b₁ → kConfiguration.eqa (kConfiguration.intersection a₀ a₁) (kConfiguration.intersection b₀ b₁)
    | eqa_pretty {a b : kConfiguration} : kConfiguration.eqa a b → kConfiguration.eqa (kConfiguration.pretty a) (kConfiguration.pretty b)
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

  inductive kActiveRule.eqa: kActiveRule → kActiveRule → Prop
    | refl {a} : kActiveRule.eqa a a
    | symm {a b} : kActiveRule.eqa a b → kActiveRule.eqa b a
    | trans {a b c} : kActiveRule.eqa a b → kActiveRule.eqa b c → kActiveRule.eqa a c
    -- Congruence axioms for each operator

  inductive kCid.eqa: kCid → kCid → Prop
    | refl {a} : kCid.eqa a a
    | symm {a b} : kCid.eqa a b → kCid.eqa b a
    | trans {a b c} : kCid.eqa a b → kCid.eqa b c → kCid.eqa a c
    -- Congruence axioms for each operator
    | eqa_getClass {a b : kConfiguration} : kConfiguration.eqa a b → kCid.eqa (kCid.getClass a) (kCid.getClass b)

  inductive kActorDeonticActionDeadline.eqa: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | refl {a} : kActorDeonticActionDeadline.eqa a a
    | symm {a b} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b a
    | trans {a b c} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b c → kActorDeonticActionDeadline.eqa a c
    -- Congruence axioms for each operator
    | eqa_PARTY₀ {a₀ b₀ : kAction} {a₁ b₁ : kDeadline} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kAction.eqa a₀ b₀ → kDeadline.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b₀ b₁ b₂ b₃)
    | eqa_PARTY₁ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kAction} {a₃ b₃ : kDeadline} : kAction.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kAction.eqa a₂ b₂ → kDeadline.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b₀ b₁ b₂ b₃)
    | eqa_PARTY₂ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kDeadline} {a₃ b₃ : kAction} : kAction.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kDeadline.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b₀ b₁ b₂ b₃)
    | eqa_PARTY₃ {a₀ b₀ : kDeadline} {a₁ b₁ : kAction} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kDeadline.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kAction.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b₀ b₁ b₂ b₃)

  inductive kActorState.eqa: kActorState → kActorState → Prop
    | refl {a} : kActorState.eqa a a
    | symm {a b} : kActorState.eqa a b → kActorState.eqa b a
    | trans {a b c} : kActorState.eqa a b → kActorState.eqa b c → kActorState.eqa a c
    -- Congruence axioms for each operator

  inductive kAttributeSet.eqa: kAttributeSet → kAttributeSet → Prop
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

  inductive kString.eqa: kString → kString → Prop
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

  inductive kContractState.eqa: kContractState → kContractState → Prop
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

  inductive kContractStatus.eqa: kContractStatus → kContractStatus → Prop
    | refl {a} : kContractStatus.eqa a a
    | symm {a b} : kContractStatus.eqa a b → kContractStatus.eqa b a
    | trans {a b c} : kContractStatus.eqa a b → kContractStatus.eqa b c → kContractStatus.eqa a c
    -- Congruence axioms for each operator
    | eqa_configToStatus {a b : kConfiguration} : kConfiguration.eqa a b → kContractStatus.eqa (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
    | eqa_contractStateToStatus {a b : kContractState} : kContractState.eqa a b → kContractStatus.eqa (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)

  inductive kDate.eqa: kDate → kDate → Prop
    | refl {a} : kDate.eqa a a
    | symm {a b} : kDate.eqa a b → kDate.eqa b a
    | trans {a b c} : kDate.eqa a b → kDate.eqa b c → kDate.eqa a c
    -- Congruence axioms for each operator

  inductive kDeadline.eqa: kDeadline → kDeadline → Prop
    | refl {a} : kDeadline.eqa a a
    | symm {a b} : kDeadline.eqa a b → kDeadline.eqa b a
    | trans {a b c} : kDeadline.eqa a b → kDeadline.eqa b c → kDeadline.eqa a c
    -- Congruence axioms for each operator
    | eqa_BY {a b : kFindResult} : kFindResult.eqa a b → kDeadline.eqa (kDeadline.BY a) (kDeadline.BY b)
    | eqa_WITHIN {a b : kDuration} : kDuration.eqa a b → kDeadline.eqa (kDeadline.WITHIN a) (kDeadline.WITHIN b)

  inductive kDeontic.eqa: kDeontic → kDeontic → Prop
    | refl {a} : kDeontic.eqa a a
    | symm {a b} : kDeontic.eqa a b → kDeontic.eqa b a
    | trans {a b c} : kDeontic.eqa a b → kDeontic.eqa b c → kDeontic.eqa a c
    -- Congruence axioms for each operator

  inductive kDuration.eqa: kDuration → kDuration → Prop
    | refl {a} : kDuration.eqa a a
    | symm {a b} : kDuration.eqa a b → kDuration.eqa b a
    | trans {a b c} : kDuration.eqa a b → kDuration.eqa b c → kDuration.eqa a c
    -- Congruence axioms for each operator
    | eqa_DAY {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.DAY a) (kDuration.DAY b)
    | eqa_MONTH {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.MONTH a) (kDuration.MONTH b)
    | eqa_WEEK {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.WEEK a) (kDuration.WEEK b)
    | eqa_YEAR {a b : kFindResult} : kFindResult.eqa a b → kDuration.eqa (kDuration.YEAR a) (kDuration.YEAR b)

  inductive kFindResult.eqa: kFindResult → kFindResult → Prop
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

  inductive kHenceLest.eqa: kHenceLest → kHenceLest → Prop
    | refl {a} : kHenceLest.eqa a a
    | symm {a b} : kHenceLest.eqa a b → kHenceLest.eqa b a
    | trans {a b c} : kHenceLest.eqa a b → kHenceLest.eqa b c → kHenceLest.eqa a c
    -- Congruence axioms for each operator
    | eqa_HENCE {a b : kAction} : kAction.eqa a b → kHenceLest.eqa (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | eqa_HENCELEST {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.HENCELEST a₀ a₁) (kHenceLest.HENCELEST b₀ b₁)
    | eqa_LEST {a b : kAction} : kAction.eqa a b → kHenceLest.eqa (kHenceLest.LEST a) (kHenceLest.LEST b)
    | eqa_LESTHENCE {a₀ b₀ a₁ b₁ : kAction} : kAction.eqa a₀ b₀ → kAction.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.LESTHENCE a₀ a₁) (kHenceLest.LESTHENCE b₀ b₁)

  inductive k«Set{Rule}».eqa: k«Set{Rule}» → k«Set{Rule}» → Prop
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
end

-- Sort membership and equality modulo equations

mutual
  inductive kAction.has_sort: kAction → MSort → Prop
    | subsort {t a b} : subsort a b → kAction.has_sort t a → kAction.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op true : -> Bool .
    | true_decl₀ : kAction.has_sort kAction.true MSort.Bool
    -- op true : -> Bool .
    | true_decl₁ : kAction.has_sort kAction.true MSort.Bool
    -- op false : -> Bool .
    | false_decl₀ : kAction.has_sort kAction.false MSort.Bool
    -- op false : -> Bool .
    | false_decl₁ : kAction.has_sort kAction.false MSort.Bool
    -- op _and_ : Bool Bool -> Bool .
    | and_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.and a₀ a₁) MSort.Bool
    -- op _and_ : Bool Bool -> Bool .
    | and_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.and a₀ a₁) MSort.Bool
    -- op _or_ : Bool Bool -> Bool .
    | or_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.or a₀ a₁) MSort.Bool
    -- op _or_ : Bool Bool -> Bool .
    | or_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.or a₀ a₁) MSort.Bool
    -- op _xor_ : Bool Bool -> Bool .
    | xor_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.xor a₀ a₁) MSort.Bool
    -- op _xor_ : Bool Bool -> Bool .
    | xor_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.xor a₀ a₁) MSort.Bool
    -- op not_ : Bool -> Bool .
    | not_decl₀ {a : kAction} : kAction.has_sort a MSort.Bool → kAction.has_sort (kAction.not a) MSort.Bool
    -- op not_ : Bool -> Bool .
    | not_decl₁ {a : kAction} : kAction.has_sort a MSort.Bool → kAction.has_sort (kAction.not a) MSort.Bool
    -- op _implies_ : Bool Bool -> Bool .
    | implies_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.implies a₀ a₁) MSort.Bool
    -- op _implies_ : Bool Bool -> Bool .
    | implies_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.implies a₀ a₁) MSort.Bool
    -- op $diff : Set{Qid} Set{Qid} Set{Qid} -> Set{Qid} .
    | «$diff»_decl {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.«$diff» a₀ a₁ a₂) MSort.«Set{Qid}»
    -- op $intersect : Set{Qid} Set{Qid} Set{Qid} -> Set{Qid} .
    | «$intersect»_decl {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.«$intersect» a₀ a₁ a₂) MSort.«Set{Qid}»
    -- op NOTHING : -> Names .
    | NOTHING_decl : kAction.has_sort kAction.NOTHING MSort.Names
    -- op _containsActor_ : Configuration Qid -> Bool .
    | containsActor_decl {a₀ : kConfiguration} {a₁ : kAction} : kConfiguration.has_sort a₀ MSort.Configuration → kAction.has_sort a₁ MSort.Qid → kAction.has_sort (kAction.containsActor a₀ a₁) MSort.Bool
    -- op _containsRuleWithEvent_ : Set{Rule} ActionEvent -> Bool .
    | containsRuleWithEvent_decl {a₀ : k«Set{Rule}»} {a₁ : kConfiguration} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kConfiguration.has_sort a₁ MSort.ActionEvent → kAction.has_sort (kAction.containsRuleWithEvent a₀ a₁) MSort.Bool
    -- op _in_ : ActionEvent Set{ActionEvent} -> Bool .
    | «in»₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.«in»₀ a₀ a₁) MSort.Bool
    -- op _in_ : Qid Set{Qid} -> Bool .
    | «in»₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.«in»₁ a₀ a₁) MSort.Bool
    -- op _in_ : Rule Set{Rule} -> Bool .
    | «in»₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.«in»₂ a₀ a₁) MSort.Bool
    -- op _psubset_ : Set{ActionEvent} Set{ActionEvent} -> Bool .
    | psubset₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.psubset₀ a₀ a₁) MSort.Bool
    -- op _psubset_ : Set{Qid} Set{Qid} -> Bool .
    | psubset₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.psubset₁ a₀ a₁) MSort.Bool
    -- op _psubset_ : Set{Rule} Set{Rule} -> Bool .
    | psubset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.psubset₂ a₀ a₁) MSort.Bool
    -- op _subset_ : Set{ActionEvent} Set{ActionEvent} -> Bool .
    | subset₀_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kAction.has_sort (kAction.subset₀ a₀ a₁) MSort.Bool
    -- op _subset_ : Set{Qid} Set{Qid} -> Bool .
    | subset₁_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.subset₁ a₀ a₁) MSort.Bool
    -- op _subset_ : Set{Rule} Set{Rule} -> Bool .
    | subset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kAction.has_sort (kAction.subset₂ a₀ a₁) MSort.Bool
    -- op delete : Qid Set{Qid} -> Set{Qid} .
    | delete_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.delete a₀ a₁) MSort.«Set{Qid}»
    -- op insert : Qid Set{Qid} -> Set{Qid} .
    | insert_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Qid → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.insert a₀ a₁) MSort.«Set{Qid}»
    -- op intersection : Set{Qid} Set{Qid} -> Set{Qid} .
    | intersection_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.intersection a₀ a₁) MSort.«Set{Qid}»
    -- op union : NeSet{Qid} Set{Qid} -> NeSet{Qid} .
    | union_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«NeSet{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«NeSet{Qid}»
    -- op union : Set{Qid} NeSet{Qid} -> NeSet{Qid} .
    | union_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«NeSet{Qid}»
    -- op union : Set{Qid} Set{Qid} -> Set{Qid} .
    | union_decl₂ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.union a₀ a₁) MSort.«Set{Qid}»
    -- op <Qids> : -> Qid .
    | ltQidsgt_decl : kAction.has_sort kAction.ltQidsgt MSort.Qid
    -- op DO_ : Qid -> Action .
    | DO_decl {a : kAction} : kAction.has_sort a MSort.Qid → kAction.has_sort (kAction.DO a) MSort.Action
    -- op _<=_ : Nat Nat -> Bool .
    | lteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.lteq₀ a₀ a₁) MSort.Bool
    -- op _<=_ : String String -> Bool .
    | lteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.lteq₁ a₀ a₁) MSort.Bool
    -- op _<_ : Nat Nat -> Bool .
    | lt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.lt₀ a₀ a₁) MSort.Bool
    -- op _<_ : String String -> Bool .
    | lt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.lt₁ a₀ a₁) MSort.Bool
    -- op _>=_ : Nat Nat -> Bool .
    | gteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.gteq₀ a₀ a₁) MSort.Bool
    -- op _>=_ : String String -> Bool .
    | gteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.gteq₁ a₀ a₁) MSort.Bool
    -- op _>_ : Nat Nat -> Bool .
    | gt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.gt₀ a₀ a₁) MSort.Bool
    -- op _>_ : String String -> Bool .
    | gt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kAction.has_sort (kAction.gt₁ a₀ a₁) MSort.Bool
    -- op _AND_ : Names Names -> Names .
    | AND_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Names → kAction.has_sort a₁ MSort.Names → kAction.has_sort (kAction.AND a₀ a₁) MSort.Names
    -- op _\_ : Set{Qid} Set{Qid} -> Set{Qid} .
    | bslash_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.bslash a₀ a₁) MSort.«Set{Qid}»
    -- op _`,_ : NeSet{Qid} Set{Qid} -> NeSet{Qid} .
    | «`,»_decl₀ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«NeSet{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«NeSet{Qid}»
    -- op _`,_ : Set{Qid} Set{Qid} -> Set{Qid} .
    | «`,»_decl₁ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«Set{Qid}»
    -- op _`,_ : Set{Qid} NeSet{Qid} -> NeSet{Qid} .
    | «`,»_decl₂ {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.«`,» a₀ a₁) MSort.«NeSet{Qid}»
    -- op _and-then_ : Bool Bool -> Bool .
    | andsubthen_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.andsubthen a₀ a₁) MSort.Bool
    -- op _divides_ : NzNat Nat -> Bool .
    | divides_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kAction.has_sort (kAction.divides a₀ a₁) MSort.Bool
    -- op _or-else_ : Bool Bool -> Bool .
    | orsubelse_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort (kAction.orsubelse a₀ a₁) MSort.Bool
    -- op empty : -> Set{Qid} .
    | empty_decl : kAction.has_sort kAction.empty MSort.«Set{Qid}»
    -- op if_then_else_fi : Bool Action Action -> Action .
    | ifthenelsefi_decl₁ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Action → kAction.has_sort a₂ MSort.Action → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Action
    -- op if_then_else_fi : Bool Set{Qid} Set{Qid} -> Set{Qid} .
    | ifthenelsefi_decl₂ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.«Set{Qid}» → kAction.has_sort a₂ MSort.«Set{Qid}» → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.«Set{Qid}»
    -- op if_then_else_fi : Bool Id Id -> Id .
    | ifthenelsefi_decl₃ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Id → kAction.has_sort a₂ MSort.Id → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Id
    -- op if_then_else_fi : Bool Situation Situation -> Situation .
    | ifthenelsefi_decl₄ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Situation → kAction.has_sort a₂ MSort.Situation → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Situation
    -- op if_then_else_fi : Bool Names Names -> Names .
    | ifthenelsefi_decl₅ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Names → kAction.has_sort a₂ MSort.Names → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Names
    -- op if_then_else_fi : Bool NeSet{Qid} NeSet{Qid} -> NeSet{Qid} .
    | ifthenelsefi_decl₆ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.«NeSet{Qid}» → kAction.has_sort a₂ MSort.«NeSet{Qid}» → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{Qid}»
    -- op if_then_else_fi : Bool Oid Oid -> Oid .
    | ifthenelsefi_decl₇ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Oid → kAction.has_sort a₂ MSort.Oid → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Oid
    -- op if_then_else_fi : Bool Bool Bool -> Bool .
    | ifthenelsefi_decl₈ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Bool → kAction.has_sort a₂ MSort.Bool → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Bool
    -- op if_then_else_fi : Bool Qid Qid -> Qid .
    | ifthenelsefi_decl₉ {a₀ a₁ a₂ : kAction} : kAction.has_sort a₀ MSort.Bool → kAction.has_sort a₁ MSort.Qid → kAction.has_sort a₂ MSort.Qid → kAction.has_sort (kAction.ifthenelsefi a₀ a₁ a₂) MSort.Qid
    -- op _=/=_ : [Configuration,Set{ActionEvent}] [Configuration,Set{ActionEvent}] -> Bool .
    | eqslasheq₀_decl {a₀ a₁ : kConfiguration} : kAction.has_sort (kAction.eqslasheq₀ a₀ a₁) MSort.Bool
    -- op _=/=_ : [Action,Set{Qid},Id,Situation] [Action,Set{Qid},Id,Situation] -> Bool .
    | eqslasheq₁_decl {a₀ a₁ : kAction} : kAction.has_sort (kAction.eqslasheq₁ a₀ a₁) MSort.Bool
    -- op _=/=_ : [Set{Rule}] [Set{Rule}] -> Bool .
    | eqslasheq₂_decl {a₀ a₁ : k«Set{Rule}»} : kAction.has_sort (kAction.eqslasheq₂ a₀ a₁) MSort.Bool
    -- op _==_ : [Action,Set{Qid},Id,Situation] [Action,Set{Qid},Id,Situation] -> Bool .
    | eqeq₀_decl {a₀ a₁ : kAction} : kAction.has_sort (kAction.eqeq₀ a₀ a₁) MSort.Bool
    -- op _==_ : [Deontic] [Deontic] -> Bool .
    | eqeq₁_decl {a₀ a₁ : kDeontic} : kAction.has_sort (kAction.eqeq₁ a₀ a₁) MSort.Bool
    -- op _==_ : [ContractStatus] [ContractStatus] -> Bool .
    | eqeq₂_decl {a₀ a₁ : kContractStatus} : kAction.has_sort (kAction.eqeq₂ a₀ a₁) MSort.Bool

  inductive kConfiguration.has_sort: kConfiguration → MSort → Prop
    | subsort {t a b} : subsort a b → kConfiguration.has_sort t a → kConfiguration.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op $diff : Set{ActionEvent} Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | «$diff»_decl {a₀ a₁ a₂ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«$diff» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    -- op $intersect : Set{ActionEvent} Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | «$intersect»_decl {a₀ a₁ a₂ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«$intersect» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    -- op delete : ActionEvent Set{ActionEvent} -> Set{ActionEvent} .
    | delete_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.delete a₀ a₁) MSort.«Set{ActionEvent}»
    -- op getAction_ : Configuration -> ActionEvent .
    | getAction_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Configuration → kConfiguration.has_sort (kConfiguration.getAction a) MSort.ActionEvent
    -- op getAllActions_ : Set{Rule} -> Set{ActionEvent} .
    | getAllActions_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kConfiguration.has_sort (kConfiguration.getAllActions a) MSort.«Set{ActionEvent}»
    -- op initAux__ : Set{Rule} Configuration -> Configuration .
    | initAux_decl {a₀ : k«Set{Rule}»} {a₁ : kConfiguration} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort (kConfiguration.initAux a₀ a₁) MSort.Configuration
    -- op init_ : Set{Rule} -> Configuration .
    | init_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kConfiguration.has_sort (kConfiguration.init a) MSort.Configuration
    -- op insert : ActionEvent Set{ActionEvent} -> Set{ActionEvent} .
    | insert_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.ActionEvent → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.insert a₀ a₁) MSort.«Set{ActionEvent}»
    -- op intersection : Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | intersection_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.intersection a₀ a₁) MSort.«Set{ActionEvent}»
    -- op pretty_ : Configuration -> Configuration .
    | pretty_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Configuration → kConfiguration.has_sort (kConfiguration.pretty a) MSort.Configuration
    -- op union : NeSet{ActionEvent} Set{ActionEvent} -> NeSet{ActionEvent} .
    | union_decl₀ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«NeSet{ActionEvent}»
    -- op union : Set{ActionEvent} NeSet{ActionEvent} -> NeSet{ActionEvent} .
    | union_decl₁ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«NeSet{ActionEvent}»
    -- op union : Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | union_decl₂ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.union a₀ a₁) MSort.«Set{ActionEvent}»
    -- op <> : -> Portal .
    | ltgt_decl : kConfiguration.has_sort kConfiguration.ltgt MSort.Portal
    -- op <_:_|_> : Oid Cid AttributeSet -> Object .
    | ltcolonbargt_decl {a₀ : kAction} {a₁ : kCid} {a₂ : kAttributeSet} : kAction.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kAttributeSet.has_sort a₂ MSort.AttributeSet → kConfiguration.has_sort (kConfiguration.ltcolonbargt a₀ a₁ a₂) MSort.Object
    -- op <_:_|`> : Oid Cid -> Object .
    | «ltcolonbar`gt»_decl {a₀ : kAction} {a₁ : kCid} : kAction.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kConfiguration.has_sort (kConfiguration.«ltcolonbar`gt» a₀ a₁) MSort.Object
    -- op _\_ : Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | bslash_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.bslash a₀ a₁) MSort.«Set{ActionEvent}»
    -- op __ : Configuration Configuration -> Configuration .
    | join_decl {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.Configuration → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort (kConfiguration.join a₀ a₁) MSort.Configuration
    -- op _`,_ : NeSet{ActionEvent} Set{ActionEvent} -> NeSet{ActionEvent} .
    | «`,»_decl₀ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
    -- op _`,_ : Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | «`,»_decl₁ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«Set{ActionEvent}»
    -- op _`,_ : Set{ActionEvent} NeSet{ActionEvent} -> NeSet{ActionEvent} .
    | «`,»_decl₂ {a₀ a₁ : kConfiguration} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
    -- op _did_ : Id Id -> ActionEvent .
    | did_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.did a₀ a₁) MSort.ActionEvent
    -- op _do_ : Id Id -> ActionEvent .
    | do_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.do a₀ a₁) MSort.ActionEvent
    -- op _does_ : Id Id -> ActionEvent .
    | does_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.Id → kAction.has_sort a₁ MSort.Id → kConfiguration.has_sort (kConfiguration.does a₀ a₁) MSort.ActionEvent
    -- op empty : -> Set{ActionEvent} .
    | empty_decl : kConfiguration.has_sort kConfiguration.empty MSort.«Set{ActionEvent}»
    -- op none : -> Configuration .
    | none_decl : kConfiguration.has_sort kConfiguration.none MSort.Configuration
    -- op tau : -> ActionEvent .
    | tau_decl : kConfiguration.has_sort kConfiguration.tau MSort.ActionEvent
    -- op tick : -> TickEvent .
    | tick_decl : kConfiguration.has_sort kConfiguration.tick MSort.TickEvent
    -- op if_then_else_fi : Bool Configuration Configuration -> Configuration .
    | ifthenelsefi_decl₁ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Configuration → kConfiguration.has_sort a₂ MSort.Configuration → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Configuration
    -- op if_then_else_fi : Bool Set{ActionEvent} Set{ActionEvent} -> Set{ActionEvent} .
    | ifthenelsefi_decl₂ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.«Set{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«Set{ActionEvent}» → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    -- op if_then_else_fi : Bool Msg Msg -> Msg .
    | ifthenelsefi_decl₃ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Msg → kConfiguration.has_sort a₂ MSort.Msg → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Msg
    -- op if_then_else_fi : Bool Object Object -> Object .
    | ifthenelsefi_decl₄ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Object → kConfiguration.has_sort a₂ MSort.Object → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Object
    -- op if_then_else_fi : Bool Portal Portal -> Portal .
    | ifthenelsefi_decl₅ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Portal → kConfiguration.has_sort a₂ MSort.Portal → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Portal
    -- op if_then_else_fi : Bool NeSet{ActionEvent} NeSet{ActionEvent} -> NeSet{ActionEvent} .
    | ifthenelsefi_decl₆ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort a₂ MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{ActionEvent}»
    -- op if_then_else_fi : Bool Message Message -> Message .
    | ifthenelsefi_decl₇ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Message → kConfiguration.has_sort a₂ MSort.Message → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Message
    -- op if_then_else_fi : Bool Event Event -> Event .
    | ifthenelsefi_decl₈ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.Event → kConfiguration.has_sort a₂ MSort.Event → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.Event
    -- op if_then_else_fi : Bool ActionEvent ActionEvent -> ActionEvent .
    | ifthenelsefi_decl₉ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.ActionEvent → kConfiguration.has_sort a₂ MSort.ActionEvent → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.ActionEvent
    -- op if_then_else_fi : Bool TickEvent TickEvent -> TickEvent .
    | ifthenelsefi_decl₁₀ {a₀ : kAction} {a₁ a₂ : kConfiguration} : kAction.has_sort a₀ MSort.Bool → kConfiguration.has_sort a₁ MSort.TickEvent → kConfiguration.has_sort a₂ MSort.TickEvent → kConfiguration.has_sort (kConfiguration.ifthenelsefi a₀ a₁ a₂) MSort.TickEvent

  inductive kActiveRule.has_sort: kActiveRule → MSort → Prop
    | subsort {t a b} : subsort a b → kActiveRule.has_sort t a → kActiveRule.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kCid.has_sort: kCid → MSort → Prop
    | subsort {t a b} : subsort a b → kCid.has_sort t a → kCid.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op Actor : -> Actor .
    | Actor_decl : kCid.has_sort kCid.Actor MSort.Actor
    -- op Coordinator : -> Coordinator .
    | Coordinator_decl : kCid.has_sort kCid.Coordinator MSort.Coordinator
    -- op PreCoordinator : -> PreCoordinator .
    | PreCoordinator_decl : kCid.has_sort kCid.PreCoordinator MSort.PreCoordinator
    -- op getClass : Object -> Cid .
    | getClass_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Object → kCid.has_sort (kCid.getClass a) MSort.Cid

  inductive kActorDeonticActionDeadline.has_sort: kActorDeonticActionDeadline → MSort → Prop
    | subsort {t a b} : subsort a b → kActorDeonticActionDeadline.has_sort t a → kActorDeonticActionDeadline.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op PARTY____ : Qid Deadline Deontic Action -> ActorDeonticActionDeadline .
    | PARTY₀_decl {a₀ : kAction} {a₁ : kDeadline} {a₂ : kDeontic} {a₃ : kAction} : kAction.has_sort a₀ MSort.Qid → kDeadline.has_sort a₁ MSort.Deadline → kDeontic.has_sort a₂ MSort.Deontic → kAction.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    -- op PARTY____ : Qid Deontic Action Deadline -> ActorDeonticActionDeadline .
    | PARTY₁_decl {a₀ : kAction} {a₁ : kDeontic} {a₂ : kAction} {a₃ : kDeadline} : kAction.has_sort a₀ MSort.Qid → kDeontic.has_sort a₁ MSort.Deontic → kAction.has_sort a₂ MSort.Action → kDeadline.has_sort a₃ MSort.Deadline → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    -- op PARTY____ : Qid Deontic Deadline Action -> ActorDeonticActionDeadline .
    | PARTY₂_decl {a₀ : kAction} {a₁ : kDeontic} {a₂ : kDeadline} {a₃ : kAction} : kAction.has_sort a₀ MSort.Qid → kDeontic.has_sort a₁ MSort.Deontic → kDeadline.has_sort a₂ MSort.Deadline → kAction.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    -- op _PARTY___ : Deadline Qid Deontic Action -> ActorDeonticActionDeadline .
    | PARTY₃_decl {a₀ : kDeadline} {a₁ : kAction} {a₂ : kDeontic} {a₃ : kAction} : kDeadline.has_sort a₀ MSort.Deadline → kAction.has_sort a₁ MSort.Qid → kDeontic.has_sort a₂ MSort.Deontic → kAction.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline

  inductive kActorState.has_sort: kActorState → MSort → Prop
    | subsort {t a b} : subsort a b → kActorState.has_sort t a → kActorState.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kAttributeSet.has_sort: kAttributeSet → MSort → Prop
    | subsort {t a b} : subsort a b → kAttributeSet.has_sort t a → kAttributeSet.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op _`,_ : AttributeSet AttributeSet -> AttributeSet .
    | «`,»_decl {a₀ a₁ : kAttributeSet} : kAttributeSet.has_sort a₀ MSort.AttributeSet → kAttributeSet.has_sort a₁ MSort.AttributeSet → kAttributeSet.has_sort (kAttributeSet.«`,» a₀ a₁) MSort.AttributeSet
    -- op contractState`:_ : ContractState -> Attribute .
    | «contractState`colon»_decl {a : kContractState} : kContractState.has_sort a MSort.ContractState → kAttributeSet.has_sort (kAttributeSet.«contractState`colon» a) MSort.Attribute
    -- op none : -> AttributeSet .
    | none_decl : kAttributeSet.has_sort kAttributeSet.none MSort.AttributeSet
    -- op rules`:_ : Set{Rule} -> Attribute .
    | «rules`colon»_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kAttributeSet.has_sort (kAttributeSet.«rules`colon» a) MSort.Attribute
    -- op time`:_ : Nat -> Attribute .
    | «time`colon»_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kAttributeSet.has_sort (kAttributeSet.«time`colon» a) MSort.Attribute

  inductive kString.has_sort: kString → MSort → Prop
    | subsort {t a b} : subsort a b → kString.has_sort t a → kString.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op <Strings> : -> Char .
    | ltStringsgt_decl₀ : kString.has_sort kString.ltStringsgt MSort.Char
    -- op <Strings> : -> String .
    | ltStringsgt_decl₁ : kString.has_sort kString.ltStringsgt MSort.String
    -- op _+_ : String String -> String .
    | sum_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kString.has_sort (kString.sum a₀ a₁) MSort.String
    -- op lowerCase : String -> String .
    | lowerCase_decl {a : kString} : kString.has_sort a MSort.String → kString.has_sort (kString.lowerCase a) MSort.String
    -- op string : Qid -> String .
    | string_decl {a : kAction} : kAction.has_sort a MSort.Qid → kString.has_sort (kString.string a) MSort.String
    -- op substr : String Nat Nat -> String .
    | substr_decl {a₀ : kString} {a₁ a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort a₂ MSort.Nat → kString.has_sort (kString.substr a₀ a₁ a₂) MSort.String
    -- op upperCase : String -> String .
    | upperCase_decl {a : kString} : kString.has_sort a MSort.String → kString.has_sort (kString.upperCase a) MSort.String

  inductive kContractState.has_sort: kContractState → MSort → Prop
    | subsort {t a b} : subsort a b → kContractState.has_sort t a → kContractState.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op deltaAction___ : Set{Rule} ActionEvent ContractState -> ContractState .
    | deltaAction_decl {a₀ : k«Set{Rule}»} {a₁ : kConfiguration} {a₂ : kContractState} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kConfiguration.has_sort a₁ MSort.ActionEvent → kContractState.has_sort a₂ MSort.ContractState → kContractState.has_sort (kContractState.deltaAction a₀ a₁ a₂) MSort.ContractState
    -- op deltaTick__ : Set{Rule} ContractState -> ContractState .
    | deltaTick_decl {a₀ : k«Set{Rule}»} {a₁ : kContractState} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort (kContractState.deltaTick a₀ a₁) MSort.ContractState
    -- op Active_ : Set{Rule} -> ContractState .
    | Active_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kContractState.has_sort (kContractState.Active a) MSort.ContractState
    -- op Breached_ : Set{Qid} -> ContractState .
    | Breached_decl {a : kAction} : kAction.has_sort a MSort.«Set{Qid}» → kContractState.has_sort (kContractState.Breached a) MSort.ContractState
    -- op Fulfilled : -> ContractState .
    | Fulfilled_decl : kContractState.has_sort kContractState.Fulfilled MSort.ContractState
    -- op _^_ : ContractState ContractState -> ContractState .
    | pow_decl {a₀ a₁ : kContractState} : kContractState.has_sort a₀ MSort.ContractState → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort (kContractState.pow a₀ a₁) MSort.ContractState
    -- op if_then_else_fi : Bool ContractState ContractState -> ContractState .
    | ifthenelsefi_decl₁ {a₀ : kAction} {a₁ a₂ : kContractState} : kAction.has_sort a₀ MSort.Bool → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort a₂ MSort.ContractState → kContractState.has_sort (kContractState.ifthenelsefi a₀ a₁ a₂) MSort.ContractState

  inductive kContractStatus.has_sort: kContractStatus → MSort → Prop
    | subsort {t a b} : subsort a b → kContractStatus.has_sort t a → kContractStatus.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op configToStatus_ : Configuration -> ContractStatus .
    | configToStatus_decl {a : kConfiguration} : kConfiguration.has_sort a MSort.Configuration → kContractStatus.has_sort (kContractStatus.configToStatus a) MSort.ContractStatus
    -- op contractStateToStatus_ : ContractState -> ContractStatus .
    | contractStateToStatus_decl {a : kContractState} : kContractState.has_sort a MSort.ContractState → kContractStatus.has_sort (kContractStatus.contractStateToStatus a) MSort.ContractStatus
    -- op Active : -> ContractStatus .
    | Active_decl : kContractStatus.has_sort kContractStatus.Active MSort.ContractStatus
    -- op Breached : -> ContractStatus .
    | Breached_decl : kContractStatus.has_sort kContractStatus.Breached MSort.ContractStatus
    -- op Fulfilled : -> ContractStatus .
    | Fulfilled_decl : kContractStatus.has_sort kContractStatus.Fulfilled MSort.ContractStatus

  inductive kDate.has_sort: kDate → MSort → Prop
    | subsort {t a b} : subsort a b → kDate.has_sort t a → kDate.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kDeadline.has_sort: kDeadline → MSort → Prop
    | subsort {t a b} : subsort a b → kDeadline.has_sort t a → kDeadline.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op BY_ : Nat -> Deadline .
    | BY_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDeadline.has_sort (kDeadline.BY a) MSort.Deadline
    -- op WITHIN_ : Duration -> Deadline .
    | WITHIN_decl {a : kDuration} : kDuration.has_sort a MSort.Duration → kDeadline.has_sort (kDeadline.WITHIN a) MSort.Deadline

  inductive kDeontic.has_sort: kDeontic → MSort → Prop
    | subsort {t a b} : subsort a b → kDeontic.has_sort t a → kDeontic.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op MAY : -> Deontic .
    | MAY_decl : kDeontic.has_sort kDeontic.MAY MSort.Deontic
    -- op MUST : -> Deontic .
    | MUST_decl : kDeontic.has_sort kDeontic.MUST MSort.Deontic
    -- op SHANT : -> Deontic .
    | SHANT_decl : kDeontic.has_sort kDeontic.SHANT MSort.Deontic

  inductive kDuration.has_sort: kDuration → MSort → Prop
    | subsort {t a b} : subsort a b → kDuration.has_sort t a → kDuration.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op _DAY : Nat -> Duration .
    | DAY_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.DAY a) MSort.Duration
    -- op _MONTH : Nat -> Duration .
    | MONTH_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.MONTH a) MSort.Duration
    -- op _WEEK : Nat -> Duration .
    | WEEK_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.WEEK a) MSort.Duration
    -- op _YEAR : Nat -> Duration .
    | YEAR_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.YEAR a) MSort.Duration

  inductive kFindResult.has_sort: kFindResult → MSort → Prop
    | subsort {t a b} : subsort a b → kFindResult.has_sort t a → kFindResult.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op $card : Set{ActionEvent} Nat -> Nat .
    | «$card»₀_decl {a₀ : kConfiguration} {a₁ : kFindResult} : kConfiguration.has_sort a₀ MSort.«Set{ActionEvent}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₀ a₀ a₁) MSort.Nat
    -- op $card : Set{Qid} Nat -> Nat .
    | «$card»₁_decl {a₀ : kAction} {a₁ : kFindResult} : kAction.has_sort a₀ MSort.«Set{Qid}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₁ a₀ a₁) MSort.Nat
    -- op $card : Set{Rule} Nat -> Nat .
    | «$card»₂_decl {a₀ : k«Set{Rule}»} {a₁ : kFindResult} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₂ a₀ a₁) MSort.Nat
    -- op |_| : NeSet{ActionEvent} -> NzNat .
    | barbar₀_decl₀ {a : kConfiguration} : kConfiguration.has_sort a MSort.«NeSet{ActionEvent}» → kFindResult.has_sort (kFindResult.barbar₀ a) MSort.NzNat
    -- op |_| : Set{ActionEvent} -> Nat .
    | barbar₀_decl₁ {a : kConfiguration} : kConfiguration.has_sort a MSort.«Set{ActionEvent}» → kFindResult.has_sort (kFindResult.barbar₀ a) MSort.Nat
    -- op |_| : NeSet{Qid} -> NzNat .
    | barbar₁_decl₀ {a : kAction} : kAction.has_sort a MSort.«NeSet{Qid}» → kFindResult.has_sort (kFindResult.barbar₁ a) MSort.NzNat
    -- op |_| : Set{Qid} -> Nat .
    | barbar₁_decl₁ {a : kAction} : kAction.has_sort a MSort.«Set{Qid}» → kFindResult.has_sort (kFindResult.barbar₁ a) MSort.Nat
    -- op |_| : NeSet{Rule} -> NzNat .
    | barbar₂_decl₀ {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«NeSet{Rule}» → kFindResult.has_sort (kFindResult.barbar₂ a) MSort.NzNat
    -- op |_| : Set{Rule} -> Nat .
    | barbar₂_decl₁ {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kFindResult.has_sort (kFindResult.barbar₂ a) MSort.Nat
    -- op 0 : -> Zero .
    | zero_decl : kFindResult.has_sort kFindResult.zero MSort.Zero
    -- op _&_ : Nat Nat -> Nat .
    | amp_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.amp a₀ a₁) MSort.Nat
    -- op _*_ : Nat Nat -> Nat .
    | mul_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.mul a₀ a₁) MSort.Nat
    -- op _*_ : NzNat NzNat -> NzNat .
    | mul_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.mul a₀ a₁) MSort.NzNat
    -- op _+_ : Nat Nat -> Nat .
    | sum_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.Nat
    -- op _+_ : NzNat Nat -> NzNat .
    | sum_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.NzNat
    -- op _+_ : Nat NzNat -> NzNat .
    | sum_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.NzNat
    -- op _<<_ : Nat Nat -> Nat .
    | ltlt_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.ltlt a₀ a₁) MSort.Nat
    -- op _>>_ : Nat Nat -> Nat .
    | gtgt_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gtgt a₀ a₁) MSort.Nat
    -- op _^_ : Nat Nat -> Nat .
    | pow_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.pow a₀ a₁) MSort.Nat
    -- op _^_ : NzNat Nat -> NzNat .
    | pow_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.pow a₀ a₁) MSort.NzNat
    -- op _quo_ : Nat NzNat -> Nat .
    | quo_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.quo a₀ a₁) MSort.Nat
    -- op _rem_ : Nat NzNat -> Nat .
    | rem_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.rem a₀ a₁) MSort.Nat
    -- op _xor_ : Nat Nat -> Nat .
    | xor_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.xor a₀ a₁) MSort.Nat
    -- op _|_ : Nat Nat -> Nat .
    | bar_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.Nat
    -- op _|_ : NzNat Nat -> NzNat .
    | bar_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.NzNat
    -- op _|_ : Nat NzNat -> NzNat .
    | bar_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.NzNat
    -- op ascii : Char -> Nat .
    | ascii_decl {a : kString} : kString.has_sort a MSort.Char → kFindResult.has_sort (kFindResult.ascii a) MSort.Nat
    -- op find : String String Nat -> FindResult .
    | find_decl {a₀ a₁ : kString} {a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.find a₀ a₁ a₂) MSort.FindResult
    -- op gcd : Nat Nat -> Nat .
    | gcd_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.Nat
    -- op gcd : NzNat Nat -> NzNat .
    | gcd_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.NzNat
    -- op gcd : Nat NzNat -> NzNat .
    | gcd_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.NzNat
    -- op lcm : Nat Nat -> Nat .
    | lcm_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.lcm a₀ a₁) MSort.Nat
    -- op lcm : NzNat NzNat -> NzNat .
    | lcm_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.lcm a₀ a₁) MSort.NzNat
    -- op length : String -> Nat .
    | length_decl {a : kString} : kString.has_sort a MSort.String → kFindResult.has_sort (kFindResult.length a) MSort.Nat
    -- op max : Nat Nat -> Nat .
    | max_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.Nat
    -- op max : NzNat Nat -> NzNat .
    | max_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.NzNat
    -- op max : Nat NzNat -> NzNat .
    | max_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.NzNat
    -- op min : Nat Nat -> Nat .
    | min_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.min a₀ a₁) MSort.Nat
    -- op min : NzNat NzNat -> NzNat .
    | min_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.min a₀ a₁) MSort.NzNat
    -- op notFound : -> FindResult .
    | notFound_decl : kFindResult.has_sort kFindResult.notFound MSort.FindResult
    -- op rfind : String String Nat -> FindResult .
    | rfind_decl {a₀ a₁ : kString} {a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.rfind a₀ a₁ a₂) MSort.FindResult
    -- op s_ : Nat -> NzNat .
    | s_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kFindResult.has_sort (kFindResult.s a) MSort.NzNat
    -- op sd : Nat Nat -> Nat .
    | sd_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sd a₀ a₁) MSort.Nat
    -- op if_then_else_fi : Bool FindResult FindResult -> FindResult .
    | ifthenelsefi_decl₁ {a₀ : kAction} {a₁ a₂ : kFindResult} : kAction.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.FindResult → kFindResult.has_sort a₂ MSort.FindResult → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.FindResult
    -- op if_then_else_fi : Bool Nat Nat -> Nat .
    | ifthenelsefi_decl₂ {a₀ : kAction} {a₁ a₂ : kFindResult} : kAction.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.Nat
    -- op if_then_else_fi : Bool NzNat NzNat -> NzNat .
    | ifthenelsefi_decl₃ {a₀ : kAction} {a₁ a₂ : kFindResult} : kAction.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort a₂ MSort.NzNat → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.NzNat
    -- op if_then_else_fi : Bool Zero Zero -> Zero .
    | ifthenelsefi_decl₄ {a₀ : kAction} {a₁ a₂ : kFindResult} : kAction.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.Zero → kFindResult.has_sort a₂ MSort.Zero → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.Zero

  inductive kHenceLest.has_sort: kHenceLest → MSort → Prop
    | subsort {t a b} : subsort a b → kHenceLest.has_sort t a → kHenceLest.has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op HENCE_ : Set{Qid} -> HenceLest .
    | HENCE_decl {a : kAction} : kAction.has_sort a MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.HENCE a) MSort.HenceLest
    -- op HENCE_LEST_ : Set{Qid} Set{Qid} -> HenceLest .
    | HENCELEST_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.HENCELEST a₀ a₁) MSort.HenceLest
    -- op LEST_ : Set{Qid} -> HenceLest .
    | LEST_decl {a : kAction} : kAction.has_sort a MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.LEST a) MSort.HenceLest
    -- op LEST_HENCE_ : Set{Qid} Set{Qid} -> HenceLest .
    | LESTHENCE_decl {a₀ a₁ : kAction} : kAction.has_sort a₀ MSort.«Set{Qid}» → kAction.has_sort a₁ MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.LESTHENCE a₀ a₁) MSort.HenceLest

  inductive k«Set{Rule}».has_sort: k«Set{Rule}» → MSort → Prop
    | subsort {t a b} : subsort a b → k«Set{Rule}».has_sort t a → k«Set{Rule}».has_sort t b
    -- Implicit membership axioms (operator declarations)
    -- op $diff : Set{Rule} Set{Rule} Set{Rule} -> Set{Rule} .
    | «$diff»_decl {a₀ a₁ a₂ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«$diff» a₀ a₁ a₂) MSort.«Set{Rule}»
    -- op $intersect : Set{Rule} Set{Rule} Set{Rule} -> Set{Rule} .
    | «$intersect»_decl {a₀ a₁ a₂ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«$intersect» a₀ a₁ a₂) MSort.«Set{Rule}»
    -- op delete : Rule Set{Rule} -> Set{Rule} .
    | delete_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».delete a₀ a₁) MSort.«Set{Rule}»
    -- op getRulesWithNames__ : Set{Rule} Set{Qid} -> Set{Rule} .
    | getRulesWithNames_decl {a₀ : k«Set{Rule}»} {a₁ : kAction} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kAction.has_sort a₁ MSort.«Set{Qid}» → k«Set{Rule}».has_sort (k«Set{Rule}».getRulesWithNames a₀ a₁) MSort.«Set{Rule}»
    -- op insert : Rule Set{Rule} -> Set{Rule} .
    | insert_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».insert a₀ a₁) MSort.«Set{Rule}»
    -- op intersection : Set{Rule} Set{Rule} -> Set{Rule} .
    | intersection_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».intersection a₀ a₁) MSort.«Set{Rule}»
    -- op union : NeSet{Rule} Set{Rule} -> NeSet{Rule} .
    | union_decl₀ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«NeSet{Rule}»
    -- op union : Set{Rule} NeSet{Rule} -> NeSet{Rule} .
    | union_decl₁ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«NeSet{Rule}»
    -- op union : Set{Rule} Set{Rule} -> Set{Rule} .
    | union_decl₂ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«Set{Rule}»
    -- op RULE__ : Qid ActorDeonticActionDeadline -> Rule .
    | RULE₀_decl {a₀ : kAction} {a₁ : kActorDeonticActionDeadline} : kAction.has_sort a₀ MSort.Qid → kActorDeonticActionDeadline.has_sort a₁ MSort.ActorDeonticActionDeadline → k«Set{Rule}».has_sort (k«Set{Rule}».RULE₀ a₀ a₁) MSort.Rule
    -- op RULE___ : Qid ActorDeonticActionDeadline HenceLest -> Rule .
    | RULE₁_decl {a₀ : kAction} {a₁ : kActorDeonticActionDeadline} {a₂ : kHenceLest} : kAction.has_sort a₀ MSort.Qid → kActorDeonticActionDeadline.has_sort a₁ MSort.ActorDeonticActionDeadline → kHenceLest.has_sort a₂ MSort.HenceLest → k«Set{Rule}».has_sort (k«Set{Rule}».RULE₁ a₀ a₁ a₂) MSort.Rule
    -- op _\_ : Set{Rule} Set{Rule} -> Set{Rule} .
    | bslash_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».bslash a₀ a₁) MSort.«Set{Rule}»
    -- op _`,_ : NeSet{Rule} Set{Rule} -> NeSet{Rule} .
    | «`,»_decl₀ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«NeSet{Rule}»
    -- op _`,_ : Set{Rule} Set{Rule} -> Set{Rule} .
    | «`,»_decl₁ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«Set{Rule}»
    -- op _`,_ : Set{Rule} NeSet{Rule} -> NeSet{Rule} .
    | «`,»_decl₂ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«NeSet{Rule}»
    -- op empty : -> Set{Rule} .
    | empty_decl : k«Set{Rule}».has_sort k«Set{Rule}».empty MSort.«Set{Rule}»
    -- op if_then_else_fi : Bool Set{Rule} Set{Rule} -> Set{Rule} .
    | ifthenelsefi_decl₁ {a₀ : kAction} {a₁ a₂ : k«Set{Rule}»} : kAction.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.«Set{Rule}»
    -- op if_then_else_fi : Bool NeSet{Rule} NeSet{Rule} -> NeSet{Rule} .
    | ifthenelsefi_decl₂ {a₀ : kAction} {a₁ a₂ : k«Set{Rule}»} : kAction.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{Rule}»
    -- op if_then_else_fi : Bool Rule Rule -> Rule .
    | ifthenelsefi_decl₃ {a₀ : kAction} {a₁ a₂ : k«Set{Rule}»} : kAction.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.Rule → k«Set{Rule}».has_sort a₂ MSort.Rule → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.Rule

  inductive kAction.eqe: kAction → kAction → Prop
    | from_eqa {a b} : kAction.eqa a b → kAction.eqe a b
    | symm {a b} : kAction.eqe a b → kAction.eqe b a
    | trans {a b c} : kAction.eqe a b → kAction.eqe b c → kAction.eqe a c
    -- Congruence axioms for each operator
    | eqe_and {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.and a₀ a₁) (kAction.and b₀ b₁)
    | eqe_or {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.or a₀ a₁) (kAction.or b₀ b₁)
    | eqe_xor {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.xor a₀ a₁) (kAction.xor b₀ b₁)
    | eqe_not {a b : kAction} : kAction.eqe a b → kAction.eqe (kAction.not a) (kAction.not b)
    | eqe_implies {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.implies a₀ a₁) (kAction.implies b₀ b₁)
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe a₂ b₂ → kAction.eqe (kAction.«$diff» a₀ a₁ a₂) (kAction.«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe a₂ b₂ → kAction.eqe (kAction.«$intersect» a₀ a₁ a₂) (kAction.«$intersect» b₀ b₁ b₂)
    | eqe_containsActor {a₀ b₀ : kConfiguration} {a₁ b₁ : kAction} : kConfiguration.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.containsActor a₀ a₁) (kAction.containsActor b₀ b₁)
    | eqe_containsRuleWithEvent {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} : k«Set{Rule}».eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kAction.eqe (kAction.containsRuleWithEvent a₀ a₁) (kAction.containsRuleWithEvent b₀ b₁)
    | eqe_«in»₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kAction.eqe (kAction.«in»₀ a₀ a₁) (kAction.«in»₀ b₀ b₁)
    | eqe_«in»₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.«in»₁ a₀ a₁) (kAction.«in»₁ b₀ b₁)
    | eqe_«in»₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kAction.eqe (kAction.«in»₂ a₀ a₁) (kAction.«in»₂ b₀ b₁)
    | eqe_psubset₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kAction.eqe (kAction.psubset₀ a₀ a₁) (kAction.psubset₀ b₀ b₁)
    | eqe_psubset₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.psubset₁ a₀ a₁) (kAction.psubset₁ b₀ b₁)
    | eqe_psubset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kAction.eqe (kAction.psubset₂ a₀ a₁) (kAction.psubset₂ b₀ b₁)
    | eqe_subset₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kAction.eqe (kAction.subset₀ a₀ a₁) (kAction.subset₀ b₀ b₁)
    | eqe_subset₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.subset₁ a₀ a₁) (kAction.subset₁ b₀ b₁)
    | eqe_subset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kAction.eqe (kAction.subset₂ a₀ a₁) (kAction.subset₂ b₀ b₁)
    | eqe_delete {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.delete a₀ a₁) (kAction.delete b₀ b₁)
    | eqe_insert {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.insert a₀ a₁) (kAction.insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.intersection a₀ a₁) (kAction.intersection b₀ b₁)
    | eqe_union {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.union a₀ a₁) (kAction.union b₀ b₁)
    | eqe_DO {a b : kAction} : kAction.eqe a b → kAction.eqe (kAction.DO a) (kAction.DO b)
    | eqe_lteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kAction.eqe (kAction.lteq₀ a₀ a₁) (kAction.lteq₀ b₀ b₁)
    | eqe_lteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kAction.eqe (kAction.lteq₁ a₀ a₁) (kAction.lteq₁ b₀ b₁)
    | eqe_lt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kAction.eqe (kAction.lt₀ a₀ a₁) (kAction.lt₀ b₀ b₁)
    | eqe_lt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kAction.eqe (kAction.lt₁ a₀ a₁) (kAction.lt₁ b₀ b₁)
    | eqe_gteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kAction.eqe (kAction.gteq₀ a₀ a₁) (kAction.gteq₀ b₀ b₁)
    | eqe_gteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kAction.eqe (kAction.gteq₁ a₀ a₁) (kAction.gteq₁ b₀ b₁)
    | eqe_gt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kAction.eqe (kAction.gt₀ a₀ a₁) (kAction.gt₀ b₀ b₁)
    | eqe_gt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kAction.eqe (kAction.gt₁ a₀ a₁) (kAction.gt₁ b₀ b₁)
    | eqe_AND {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.AND a₀ a₁) (kAction.AND b₀ b₁)
    | eqe_bslash {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.bslash a₀ a₁) (kAction.bslash b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.«`,» a₀ a₁) (kAction.«`,» b₀ b₁)
    | eqe_andsubthen {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.andsubthen a₀ a₁) (kAction.andsubthen b₀ b₁)
    | eqe_divides {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kAction.eqe (kAction.divides a₀ a₁) (kAction.divides b₀ b₁)
    | eqe_orsubelse {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.orsubelse a₀ a₁) (kAction.orsubelse b₀ b₁)
    | eqe_qid {a b : kString} : kString.eqe a b → kAction.eqe (kAction.qid a) (kAction.qid b)
    | eqe_ifthenelsefi {a₀ b₀ a₁ b₁ a₂ b₂ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe a₂ b₂ → kAction.eqe (kAction.ifthenelsefi a₀ a₁ a₂) (kAction.ifthenelsefi b₀ b₁ b₂)
    | eqe_eqslasheq₀ {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kAction.eqe (kAction.eqslasheq₀ a₀ a₁) (kAction.eqslasheq₀ b₀ b₁)
    | eqe_eqslasheq₁ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.eqslasheq₁ a₀ a₁) (kAction.eqslasheq₁ b₀ b₁)
    | eqe_eqslasheq₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kAction.eqe (kAction.eqslasheq₂ a₀ a₁) (kAction.eqslasheq₂ b₀ b₁)
    | eqe_eqeq₀ {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kAction.eqe (kAction.eqeq₀ a₀ a₁) (kAction.eqeq₀ b₀ b₁)
    | eqe_eqeq₁ {a₀ b₀ a₁ b₁ : kDeontic} : kDeontic.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kAction.eqe (kAction.eqeq₁ a₀ a₁) (kAction.eqeq₁ b₀ b₁)
    | eqe_eqeq₂ {a₀ b₀ a₁ b₁ : kContractStatus} : kContractStatus.eqe a₀ b₀ → kContractStatus.eqe a₁ b₁ → kAction.eqe (kAction.eqeq₂ a₀ a₁) (kAction.eqeq₂ b₀ b₁)
    -- Equations
    -- eq NOTHING = (empty).Set{Qid} .
    | eq_NOTHING : kAction.eqe kAction.NOTHING kAction.empty
    -- eq $diff((empty).Set{Qid}, S':Set{Qid}, A:Set{Qid}) = A:Set{Qid} .
    | eq_«$diff»₀ {s' a} : kAction.has_sort s' MSort.«Set{Qid}» → kAction.has_sort a MSort.«Set{Qid}» → kAction.eqe (kAction.«$diff» kAction.empty s' a) a
    -- eq $diff((S:Set{Qid}[31m,[0m E:Qid), S':Set{Qid}, A:Set{Qid})[0m = $diff(S:Set{Qid}, S':Set{Qid}, if E:Qid in S':Set{Qid} then A:Set{Qid} else A:Set{Qid}[31m,[0m E:Qid fi)[0m .
    | eq_«$diff»₁ {s e s' a} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort e MSort.Qid → kAction.has_sort s' MSort.«Set{Qid}» → kAction.has_sort a MSort.«Set{Qid}» → kAction.eqe (kAction.«$diff» (kAction.«`,» s e) s' a) (kAction.«$diff» s s' (kAction.ifthenelsefi (kAction.«in»₁ e s') a (kAction.«`,» a e)))
    -- eq $intersect((empty).Set{Qid}, S':Set{Qid}, A:Set{Qid}) = A:Set{Qid} .
    | eq_«$intersect»₀ {s' a} : kAction.has_sort s' MSort.«Set{Qid}» → kAction.has_sort a MSort.«Set{Qid}» → kAction.eqe (kAction.«$intersect» kAction.empty s' a) a
    -- eq $intersect((S:Set{Qid}[31m,[0m E:Qid), S':Set{Qid}, A:Set{Qid})[0m = $intersect(S:Set{Qid}, S':Set{Qid}, if E:Qid in S':Set{Qid} then A:Set{Qid}[31m,[0m E:Qid else A:Set{Qid} fi)[0m .
    | eq_«$intersect»₁ {s e s' a} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort e MSort.Qid → kAction.has_sort s' MSort.«Set{Qid}» → kAction.has_sort a MSort.«Set{Qid}» → kAction.eqe (kAction.«$intersect» (kAction.«`,» s e) s' a) (kAction.«$intersect» s s' (kAction.ifthenelsefi (kAction.«in»₁ e s') (kAction.«`,» a e) a))
    -- eq DO actionName:Qid = actionName:Qid .
    | eq_DO {actionname} : kAction.has_sort actionname MSort.Qid → kAction.eqe (kAction.DO actionname) actionname
    -- eq names:Names[31m AND[0m names':Names[0m = names:Names[31m,[0m names':Names[0m .
    | eq_AND {names names'} : kAction.has_sort names MSort.Names → kAction.has_sort names' MSort.Names → kAction.eqe (kAction.AND names names') (kAction.«`,» names names')
    -- eq S:Set{Qid} \ N:NeSet{Qid} = $diff(S:Set{Qid}, N:NeSet{Qid}, (empty).Set{Qid}) .
    | eq_bslash₀ {s n} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort n MSort.«NeSet{Qid}» → kAction.eqe (kAction.bslash s n) (kAction.«$diff» s n kAction.empty)
    -- eq S:Set{Qid} \ (empty).Set{Qid} = S:Set{Qid} .
    | eq_bslash₁ {s} : kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.bslash s kAction.empty) s
    -- eq N:NeSet{Qid}[31m,[0m N:NeSet{Qid}[0m = N:NeSet{Qid} .
    | eq_«`,» {n} : kAction.has_sort n MSort.«NeSet{Qid}» → kAction.eqe (kAction.«`,» n n) n
    -- eq false and-then B:[Action,Set{Qid},Id,Situation] = false .
    | eq_andsubthen₀ {b} : kAction.eqe (kAction.andsubthen kAction.false b) kAction.false
    -- eq true and-then B:[Action,Set{Qid},Id,Situation] = B:[Action,Set{Qid},Id,Situation] .
    | eq_andsubthen₁ {b} : kAction.eqe (kAction.andsubthen kAction.true b) b
    -- eq A:Bool and A:Bool = A:Bool .
    | eq_and₀ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and a a) a
    -- eq A:Bool and (B:Bool xor C:Bool) = A:Bool and B:Bool xor A:Bool and C:Bool .
    | eq_and₁ {a b c} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.has_sort c MSort.Bool → kAction.eqe (kAction.and a (kAction.xor b c)) (kAction.xor (kAction.and a b) (kAction.and a c))
    -- eq false and A:Bool = false .
    | eq_and₂ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and kAction.false a) kAction.false
    -- eq true and A:Bool = A:Bool .
    | eq_and₃ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and kAction.true a) a
    -- eq (config:Configuration 
  -- [1m[31m<[0m actorName:Qid[1m[31m :[0m V#0:Actor[1m[31m |[0m
  --   V#1:AttributeSet[1m[31m >[0m) containsActor actorName:Qid[0m = true .
    | eq_containsActor₀ {config actorname v#0 v#1} : kConfiguration.has_sort config MSort.Configuration → kAction.has_sort actorname MSort.Qid → kCid.has_sort v#0 MSort.Actor → kAttributeSet.has_sort v#1 MSort.AttributeSet → kAction.eqe (kAction.containsActor (kConfiguration.join config (kConfiguration.ltcolonbargt actorname v#0 v#1)) actorname) kAction.true
    -- eq (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid}) containsRuleWithEvent actorName:Qid does actionName:Qid[0m = true .
    | eq_containsRuleWithEvent₀ {activerules rulename actorname deontic actionname time hence lest} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kAction.eqe (kAction.containsRuleWithEvent (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))) (kConfiguration.does actorname actionname)) kAction.true
    -- eq A:Bool implies B:Bool = not (A:Bool xor A:Bool and B:Bool) .
    | eq_implies₀ {a b} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.eqe (kAction.implies a b) (kAction.not (kAction.xor a (kAction.and a b)))
    -- eq E:ActionEvent in (S:Set{ActionEvent}[31m,[0m E:ActionEvent)[0m = true .
    | eq_«in»₀₀ {e s} : kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kAction.eqe (kAction.«in»₀ e (kConfiguration.«`,» s e)) kAction.true
    -- eq E:Qid in (S:Set{Qid}[31m,[0m E:Qid)[0m = true .
    | eq_«in»₁₀ {e s} : kAction.has_sort e MSort.Qid → kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.«in»₁ e (kAction.«`,» s e)) kAction.true
    -- eq E:Rule in (S:Set{Rule}[31m,[0m E:Rule)[0m = true .
    | eq_«in»₂₀ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kAction.eqe (kAction.«in»₂ e (k«Set{Rule}».«`,» s e)) kAction.true
    -- eq false or-else B:[Action,Set{Qid},Id,Situation] = B:[Action,Set{Qid},Id,Situation] .
    | eq_orsubelse₀ {b} : kAction.eqe (kAction.orsubelse kAction.false b) b
    -- eq true or-else B:[Action,Set{Qid},Id,Situation] = true .
    | eq_orsubelse₁ {b} : kAction.eqe (kAction.orsubelse kAction.true b) kAction.true
    -- eq A:Bool or B:Bool = A:Bool and B:Bool xor A:Bool xor B:Bool .
    | eq_or₀ {a b} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.eqe (kAction.or a b) (kAction.xor (kAction.and a b) (kAction.xor a b))
    -- eq S:Set{ActionEvent} psubset S':Set{ActionEvent} = S:Set{ActionEvent} =/= S':Set{ActionEvent} and-then S:Set{ActionEvent} subset S':Set{ActionEvent} .
    | eq_psubset₀ {s s'} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kAction.eqe (kAction.psubset₀ s s') (kAction.andsubthen (kAction.eqslasheq₀ s s') (kAction.subset₀ s s'))
    -- eq S:Set{Qid} psubset S':Set{Qid} = S:Set{Qid} =/= S':Set{Qid} and-then S:Set{Qid} subset S':Set{Qid} .
    | eq_psubset₁ {s s'} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort s' MSort.«Set{Qid}» → kAction.eqe (kAction.psubset₁ s s') (kAction.andsubthen (kAction.eqslasheq₁ s s') (kAction.subset₁ s s'))
    -- eq S:Set{Rule} psubset S':Set{Rule} = S:Set{Rule} =/= S':Set{Rule} and-then S:Set{Rule} subset S':Set{Rule} .
    | eq_psubset₂ {s s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kAction.eqe (kAction.psubset₂ s s') (kAction.andsubthen (kAction.eqslasheq₂ s s') (kAction.subset₂ s s'))
    -- eq (empty).Set{ActionEvent} subset S':Set{ActionEvent} = true .
    | eq_subset₀₀ {s'} : kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kAction.eqe (kAction.subset₀ kConfiguration.empty s') kAction.true
    -- eq (empty).Set{Qid} subset S':Set{Qid} = true .
    | eq_subset₁₀ {s'} : kAction.has_sort s' MSort.«Set{Qid}» → kAction.eqe (kAction.subset₁ kAction.empty s') kAction.true
    -- eq (empty).Set{Rule} subset S':Set{Rule} = true .
    | eq_subset₂₀ {s'} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kAction.eqe (kAction.subset₂ k«Set{Rule}».empty s') kAction.true
    -- eq (S:Set{ActionEvent}[31m,[0m E:ActionEvent) subset S':Set{ActionEvent}[0m = E:ActionEvent in S':Set{ActionEvent} and-then S:Set{ActionEvent} subset S':Set{ActionEvent} .
    | eq_subset₀₁ {s e s'} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kAction.eqe (kAction.subset₀ (kConfiguration.«`,» s e) s') (kAction.andsubthen (kAction.«in»₀ e s') (kAction.subset₀ s s'))
    -- eq (S:Set{Qid}[31m,[0m E:Qid) subset S':Set{Qid}[0m = E:Qid in S':Set{Qid} and-then S:Set{Qid} subset S':Set{Qid} .
    | eq_subset₁₁ {s e s'} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort e MSort.Qid → kAction.has_sort s' MSort.«Set{Qid}» → kAction.eqe (kAction.subset₁ (kAction.«`,» s e) s') (kAction.andsubthen (kAction.«in»₁ e s') (kAction.subset₁ s s'))
    -- eq (S:Set{Rule}[31m,[0m E:Rule) subset S':Set{Rule}[0m = E:Rule in S':Set{Rule} and-then S:Set{Rule} subset S':Set{Rule} .
    | eq_subset₂₁ {s e s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kAction.eqe (kAction.subset₂ (k«Set{Rule}».«`,» s e) s') (kAction.andsubthen (kAction.«in»₂ e s') (kAction.subset₂ s s'))
    -- eq A:Bool xor A:Bool = false .
    | eq_xor₀ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.xor a a) kAction.false
    -- eq false xor A:Bool = A:Bool .
    | eq_xor₁ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.xor kAction.false a) a
    -- eq delete(E:Qid, (S:Set{Qid}[31m,[0m E:Qid))[0m = delete(E:Qid, S:Set{Qid}) .
    | eq_delete₀ {e s} : kAction.has_sort e MSort.Qid → kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.delete e (kAction.«`,» s e)) (kAction.delete e s)
    -- eq insert(E:Qid, S:Set{Qid}) = S:Set{Qid}[31m,[0m E:Qid[0m .
    | eq_insert {e s} : kAction.has_sort e MSort.Qid → kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.insert e s) (kAction.«`,» s e)
    -- eq intersection(S:Set{Qid}, N:NeSet{Qid}) = $intersect(S:Set{Qid}, N:NeSet{Qid}, (empty).Set{Qid}) .
    | eq_intersection₀ {s n} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort n MSort.«NeSet{Qid}» → kAction.eqe (kAction.intersection s n) (kAction.«$intersect» s n kAction.empty)
    -- eq intersection(S:Set{Qid}, (empty).Set{Qid}) = (empty).Set{Qid} .
    | eq_intersection₁ {s} : kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.intersection s kAction.empty) kAction.empty
    -- eq not A:Bool = true xor A:Bool .
    | eq_not₀ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.not a) (kAction.xor kAction.true a)
    -- eq union(S:Set{Qid}, S':Set{Qid}) = S:Set{Qid}[31m,[0m S':Set{Qid}[0m .
    | eq_union {s s'} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort s' MSort.«Set{Qid}» → kAction.eqe (kAction.union s s') (kAction.«`,» s s')
    -- eq config:Configuration containsActor actorName:Qid = false [owise] .
    | eq_containsActor₁ {config actorname} : kConfiguration.has_sort config MSort.Configuration → kAction.has_sort actorname MSort.Qid → kAction.eqe (kAction.containsActor config actorname) kAction.false
    -- eq activeRules:Set{Rule} containsRuleWithEvent actionEvent:ActionEvent = false [owise] .
    | eq_containsRuleWithEvent₁ {activerules actionevent} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kConfiguration.has_sort actionevent MSort.ActionEvent → kAction.eqe (kAction.containsRuleWithEvent activerules actionevent) kAction.false
    -- eq E:ActionEvent in S:Set{ActionEvent} = false [owise] .
    | eq_«in»₀₁ {e s} : kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kAction.eqe (kAction.«in»₀ e s) kAction.false
    -- eq E:Qid in S:Set{Qid} = false [owise] .
    | eq_«in»₁₁ {e s} : kAction.has_sort e MSort.Qid → kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.«in»₁ e s) kAction.false
    -- eq E:Rule in S:Set{Rule} = false [owise] .
    | eq_«in»₂₁ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kAction.eqe (kAction.«in»₂ e s) kAction.false
    -- eq delete(E:Qid, S:Set{Qid}) = S:Set{Qid} [owise] .
    | eq_delete₁ {e s} : kAction.has_sort e MSort.Qid → kAction.has_sort s MSort.«Set{Qid}» → kAction.eqe (kAction.delete e s) s
    -- eq true and A:Bool = A:Bool .
    | eq_and₄ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and kAction.true a) a
    -- eq false and A:Bool = false .
    | eq_and₅ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and kAction.false a) kAction.false
    -- eq A:Bool and A:Bool = A:Bool .
    | eq_and₆ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.and a a) a
    -- eq false xor A:Bool = A:Bool .
    | eq_xor₂ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.xor kAction.false a) a
    -- eq A:Bool xor A:Bool = false .
    | eq_xor₃ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.xor a a) kAction.false
    -- eq A:Bool and (B:Bool xor C:Bool) = A:Bool and B:Bool xor A:Bool and C:Bool .
    | eq_and₇ {a b c} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.has_sort c MSort.Bool → kAction.eqe (kAction.and a (kAction.xor b c)) (kAction.xor (kAction.and a b) (kAction.and a c))
    -- eq not A:Bool = true xor A:Bool .
    | eq_not₁ {a} : kAction.has_sort a MSort.Bool → kAction.eqe (kAction.not a) (kAction.xor kAction.true a)
    -- eq A:Bool or B:Bool = A:Bool and B:Bool xor A:Bool xor B:Bool .
    | eq_or₁ {a b} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.eqe (kAction.or a b) (kAction.xor (kAction.and a b) (kAction.xor a b))
    -- eq A:Bool implies B:Bool = not (A:Bool xor A:Bool and B:Bool) .
    | eq_implies₁ {a b} : kAction.has_sort a MSort.Bool → kAction.has_sort b MSort.Bool → kAction.eqe (kAction.implies a b) (kAction.not (kAction.xor a (kAction.and a b)))
    -- eq if true then L:[Action,Set{Qid},Id,Situation] else R:[Action,Set{Qid},Id,Situation] fi = L:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_itet {l r} : kAction.eqe (kAction.ifthenelsefi kAction.true l r) l
    -- eq if false then L:[Action,Set{Qid},Id,Situation] else R:[Action,Set{Qid},Id,Situation] fi = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_itef {l r} : kAction.eqe (kAction.ifthenelsefi kAction.false l r) r
    -- ceq L:[Action,Set{Qid},Id,Situation] =/= R:[Action,Set{Qid},Id,Situation] = false if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqslasheq₀ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqslasheq₀ l r) kAction.false
    -- ceq L:[Action,Set{Qid},Id,Situation] =/= R:[Action,Set{Qid},Id,Situation] = false if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqslasheq₁ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqslasheq₁ l r) kAction.false
    -- ceq L:[Action,Set{Qid},Id,Situation] =/= R:[Action,Set{Qid},Id,Situation] = false if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqslasheq₂ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqslasheq₂ l r) kAction.false
    -- ceq L:[Action,Set{Qid},Id,Situation] == R:[Action,Set{Qid},Id,Situation] = true if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqeq₀ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqeq₀ l r) kAction.true
    -- ceq L:[Action,Set{Qid},Id,Situation] == R:[Action,Set{Qid},Id,Situation] = true if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqeq₁ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqeq₁ l r) kAction.true
    -- ceq L:[Action,Set{Qid},Id,Situation] == R:[Action,Set{Qid},Id,Situation] = true if L:[Action,Set{Qid},Id,Situation] = R:[Action,Set{Qid},Id,Situation] [fake] .
    | eq_eqeq₂ {l r} : kAction.eqe l r → kAction.eqe (kAction.eqeq₂ l r) kAction.true

  inductive kConfiguration.eqe: kConfiguration → kConfiguration → Prop
    | from_eqa {a b} : kConfiguration.eqa a b → kConfiguration.eqe a b
    | symm {a b} : kConfiguration.eqe a b → kConfiguration.eqe b a
    | trans {a b c} : kConfiguration.eqe a b → kConfiguration.eqe b c → kConfiguration.eqe a c
    -- Congruence axioms for each operator
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe a₂ b₂ → kConfiguration.eqe (kConfiguration.«$diff» a₀ a₁ a₂) (kConfiguration.«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe a₂ b₂ → kConfiguration.eqe (kConfiguration.«$intersect» a₀ a₁ a₂) (kConfiguration.«$intersect» b₀ b₁ b₂)
    | eqe_delete {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.delete a₀ a₁) (kConfiguration.delete b₀ b₁)
    | eqe_getAction {a b : kConfiguration} : kConfiguration.eqe a b → kConfiguration.eqe (kConfiguration.getAction a) (kConfiguration.getAction b)
    | eqe_getAllActions {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kConfiguration.eqe (kConfiguration.getAllActions a) (kConfiguration.getAllActions b)
    | eqe_initAux {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} : k«Set{Rule}».eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.initAux a₀ a₁) (kConfiguration.initAux b₀ b₁)
    | eqe_init {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kConfiguration.eqe (kConfiguration.init a) (kConfiguration.init b)
    | eqe_insert {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.insert a₀ a₁) (kConfiguration.insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.intersection a₀ a₁) (kConfiguration.intersection b₀ b₁)
    | eqe_pretty {a b : kConfiguration} : kConfiguration.eqe a b → kConfiguration.eqe (kConfiguration.pretty a) (kConfiguration.pretty b)
    | eqe_union {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.union a₀ a₁) (kConfiguration.union b₀ b₁)
    | eqe_ltcolonbargt {a₀ b₀ : kAction} {a₁ b₁ : kCid} {a₂ b₂ : kAttributeSet} : kAction.eqe a₀ b₀ → kCid.eqe a₁ b₁ → kAttributeSet.eqe a₂ b₂ → kConfiguration.eqe (kConfiguration.ltcolonbargt a₀ a₁ a₂) (kConfiguration.ltcolonbargt b₀ b₁ b₂)
    | eqe_«ltcolonbar`gt» {a₀ b₀ : kAction} {a₁ b₁ : kCid} : kAction.eqe a₀ b₀ → kCid.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.«ltcolonbar`gt» a₀ a₁) (kConfiguration.«ltcolonbar`gt» b₀ b₁)
    | eqe_bslash {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.bslash a₀ a₁) (kConfiguration.bslash b₀ b₁)
    | eqe_join {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.join a₀ a₁) (kConfiguration.join b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : kConfiguration} : kConfiguration.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.«`,» a₀ a₁) (kConfiguration.«`,» b₀ b₁)
    | eqe_did {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.did a₀ a₁) (kConfiguration.did b₀ b₁)
    | eqe_do {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.do a₀ a₁) (kConfiguration.do b₀ b₁)
    | eqe_does {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kConfiguration.eqe (kConfiguration.does a₀ a₁) (kConfiguration.does b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kConfiguration} : kAction.eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kConfiguration.eqe a₂ b₂ → kConfiguration.eqe (kConfiguration.ifthenelsefi a₀ a₁ a₂) (kConfiguration.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    -- eq $diff((empty).Set{ActionEvent}, S':Set{ActionEvent}, A:Set{ActionEvent}) = A:Set{ActionEvent} .
    | eq_«$diff»₀ {s' a} : kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kConfiguration.has_sort a MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.«$diff» kConfiguration.empty s' a) a
    -- eq $diff((S:Set{ActionEvent}[31m,[0m E:ActionEvent), S':Set{ActionEvent}, A:Set{ActionEvent})[0m = $diff(S:Set{ActionEvent}, S':Set{ActionEvent}, if E:ActionEvent in S':Set{ActionEvent} then A:Set{ActionEvent} else A:Set{ActionEvent}[31m,[0m E:ActionEvent fi)[0m .
    | eq_«$diff»₁ {s e s' a} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kConfiguration.has_sort a MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.«$diff» (kConfiguration.«`,» s e) s' a) (kConfiguration.«$diff» s s' (kConfiguration.ifthenelsefi (kAction.«in»₀ e s') a (kConfiguration.«`,» a e)))
    -- eq $intersect((empty).Set{ActionEvent}, S':Set{ActionEvent}, A:Set{ActionEvent}) = A:Set{ActionEvent} .
    | eq_«$intersect»₀ {s' a} : kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kConfiguration.has_sort a MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.«$intersect» kConfiguration.empty s' a) a
    -- eq $intersect((S:Set{ActionEvent}[31m,[0m E:ActionEvent), S':Set{ActionEvent}, A:Set{ActionEvent})[0m = $intersect(S:Set{ActionEvent}, S':Set{ActionEvent}, if E:ActionEvent in S':Set{ActionEvent} then A:Set{ActionEvent}[31m,[0m E:ActionEvent else A:Set{ActionEvent} fi)[0m .
    | eq_«$intersect»₁ {s e s' a} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kConfiguration.has_sort a MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.«$intersect» (kConfiguration.«`,» s e) s' a) (kConfiguration.«$intersect» s s' (kConfiguration.ifthenelsefi (kAction.«in»₀ e s') (kConfiguration.«`,» a e) a))
    -- eq S:Set{ActionEvent} \ N:NeSet{ActionEvent} = $diff(S:Set{ActionEvent}, N:NeSet{ActionEvent}, (empty).Set{ActionEvent}) .
    | eq_bslash₀ {s n} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort n MSort.«NeSet{ActionEvent}» → kConfiguration.eqe (kConfiguration.bslash s n) (kConfiguration.«$diff» s n kConfiguration.empty)
    -- eq S:Set{ActionEvent} \ (empty).Set{ActionEvent} = S:Set{ActionEvent} .
    | eq_bslash₁ {s} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.bslash s kConfiguration.empty) s
    -- eq N:NeSet{ActionEvent}[31m,[0m N:NeSet{ActionEvent}[0m = N:NeSet{ActionEvent} .
    | eq_«`,» {n} : kConfiguration.has_sort n MSort.«NeSet{ActionEvent}» → kConfiguration.eqe (kConfiguration.«`,» n n) n
    -- eq actorName:Id did actionName:Id = actorName:Id does actionName:Id .
    | eq_did {actorname actionname} : kAction.has_sort actorname MSort.Id → kAction.has_sort actionname MSort.Id → kConfiguration.eqe (kConfiguration.did actorname actionname) (kConfiguration.does actorname actionname)
    -- eq actorName:Id do actionName:Id = actorName:Id did actionName:Id .
    | eq_do {actorname actionname} : kAction.has_sort actorname MSort.Id → kAction.has_sort actionname MSort.Id → kConfiguration.eqe (kConfiguration.do actorname actionname) (kConfiguration.did actorname actionname)
    -- eq delete(E:ActionEvent, (S:Set{ActionEvent}[31m,[0m E:ActionEvent))[0m = delete(E:ActionEvent, S:Set{ActionEvent}) .
    | eq_delete₀ {e s} : kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.delete e (kConfiguration.«`,» s e)) (kConfiguration.delete e s)
    -- eq getAction (config:Configuration actorName:Qid does actionName:Qid) = actorName:Qid does actionName:Qid .
    | eq_getAction {config actorname actionname} : kConfiguration.has_sort config MSort.Configuration → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kConfiguration.eqe (kConfiguration.getAction (kConfiguration.join config (kConfiguration.does actorname actionname))) (kConfiguration.does actorname actionname)
    -- eq getAllActions empty = (empty).Set{ActionEvent} .
    | eq_getAllActions₀ : kConfiguration.eqe (kConfiguration.getAllActions k«Set{Rule}».empty) kConfiguration.empty
    -- eq getAllActions (rules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = getAllActions rules:Set{Rule}[31m,[0m actorName:Qid does actionName:Qid[0m .
    | eq_getAllActions₁ {rules rulename actorname deontic actionname deadline hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kConfiguration.eqe (kConfiguration.getAllActions (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest)))) (kConfiguration.«`,» (kConfiguration.getAllActions rules) (kConfiguration.does actorname actionname))
    -- eq initAux empty config:Configuration = tau config:Configuration .
    | eq_initAux₀ {config} : kConfiguration.has_sort config MSort.Configuration → kConfiguration.eqe (kConfiguration.initAux k«Set{Rule}».empty config) (kConfiguration.join kConfiguration.tau config)
    -- eq initAux (rules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline HENCE hence:Set{Qid} LEST lest:Set{Qid}) config:Configuration[0m = initAux rules:Set{Rule} config:Configuration if config:Configuration containsActor actorName:Qid then none else 
  -- [1m[31m<[0m actorName:Qid[1m[31m :[0m Actor[1m[31m |[0m
  --   none[1m[31m >[0m fi[0m .
    | eq_initAux₁ {rules rulename actorname deontic actionname deadline hence lest config} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kConfiguration.has_sort config MSort.Configuration → kConfiguration.eqe (kConfiguration.initAux (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest))) config) (kConfiguration.initAux rules (kConfiguration.join config (kConfiguration.ifthenelsefi (kAction.containsActor config actorname) kConfiguration.none (kConfiguration.ltcolonbargt actorname kCid.Actor kAttributeSet.none))))
    -- eq init rules:Set{Rule} = initAux rules:Set{Rule} 
  -- [1m[31m<[0m 'coordinator[1m[31m :[0m Coordinator[1m[31m |[0m
  --   [0mrules : rules:Set{Rule}[1m[31m,
  --   [0m[0mcontractState : Active (getRulesWithNames rules:Set{Rule} 'START)[1m[31m,
  --   [0mtime : 0[0m[0m[1m[31m >[0m[0m .
    | eq_init {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kConfiguration.eqe (kConfiguration.init rules) (kConfiguration.initAux rules (kConfiguration.ltcolonbargt kAction.ltQidsgt kCid.Coordinator (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».getRulesWithNames rules kAction.ltQidsgt))) (kAttributeSet.«time`colon» kFindResult.zero)))))
    -- eq insert(E:ActionEvent, S:Set{ActionEvent}) = S:Set{ActionEvent}[31m,[0m E:ActionEvent[0m .
    | eq_insert {e s} : kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.insert e s) (kConfiguration.«`,» s e)
    -- eq intersection(S:Set{ActionEvent}, N:NeSet{ActionEvent}) = $intersect(S:Set{ActionEvent}, N:NeSet{ActionEvent}, (empty).Set{ActionEvent}) .
    | eq_intersection₀ {s n} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort n MSort.«NeSet{ActionEvent}» → kConfiguration.eqe (kConfiguration.intersection s n) (kConfiguration.«$intersect» s n kConfiguration.empty)
    -- eq intersection(S:Set{ActionEvent}, (empty).Set{ActionEvent}) = (empty).Set{ActionEvent} .
    | eq_intersection₁ {s} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.intersection s kConfiguration.empty) kConfiguration.empty
    -- eq pretty (config:Configuration event:Event 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#6:Coordinator[1m[31m |[0m
  --   [0mV#9:AttributeSet[1m[31m,
  --   [0m[0mcontractState : contractState:ContractState[1m[31m,
  --   [0m[0mrules : V#7:Set{Rule}[1m[31m,
  --   [0mtime : V#8:Nat[0m[0m[0m[1m[31m >[0m)[0m = config:Configuration 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m PreCoordinator[1m[31m |[0m
  --   contractState : contractState:ContractState[1m[31m >[0m[0m .
    | eq_pretty {config event coordinator v#6 v#9 contractstate v#7 v#8} : kConfiguration.has_sort config MSort.Configuration → kConfiguration.has_sort event MSort.Event → kAction.has_sort coordinator MSort.Qid → kCid.has_sort v#6 MSort.Coordinator → kAttributeSet.has_sort v#9 MSort.AttributeSet → kContractState.has_sort contractstate MSort.ContractState → k«Set{Rule}».has_sort v#7 MSort.«Set{Rule}» → kFindResult.has_sort v#8 MSort.Nat → kConfiguration.eqe (kConfiguration.pretty (kConfiguration.join config (kConfiguration.join event (kConfiguration.ltcolonbargt coordinator v#6 (kAttributeSet.«`,» v#9 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#7) (kAttributeSet.«time`colon» v#8)))))))) (kConfiguration.join config (kConfiguration.ltcolonbargt coordinator kCid.PreCoordinator (kAttributeSet.«contractState`colon» contractstate)))
    -- eq union(S:Set{ActionEvent}, S':Set{ActionEvent}) = S:Set{ActionEvent}[31m,[0m S':Set{ActionEvent}[0m .
    | eq_union {s s'} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort s' MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.union s s') (kConfiguration.«`,» s s')
    -- eq delete(E:ActionEvent, S:Set{ActionEvent}) = S:Set{ActionEvent} [owise] .
    | eq_delete₁ {e s} : kConfiguration.has_sort e MSort.ActionEvent → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.eqe (kConfiguration.delete e s) s
    -- eq if true then L:[Configuration,Set{ActionEvent}] else R:[Configuration,Set{ActionEvent}] fi = L:[Configuration,Set{ActionEvent}] [fake] .
    | eq_itet {l r} : kConfiguration.eqe (kConfiguration.ifthenelsefi kAction.true l r) l
    -- eq if false then L:[Configuration,Set{ActionEvent}] else R:[Configuration,Set{ActionEvent}] fi = R:[Configuration,Set{ActionEvent}] [fake] .
    | eq_itef {l r} : kConfiguration.eqe (kConfiguration.ifthenelsefi kAction.false l r) r

  inductive kActiveRule.eqe: kActiveRule → kActiveRule → Prop
    | from_eqa {a b} : kActiveRule.eqa a b → kActiveRule.eqe a b
    | symm {a b} : kActiveRule.eqe a b → kActiveRule.eqe b a
    | trans {a b c} : kActiveRule.eqe a b → kActiveRule.eqe b c → kActiveRule.eqe a c
    -- Congruence axioms for each operator

  inductive kCid.eqe: kCid → kCid → Prop
    | from_eqa {a b} : kCid.eqa a b → kCid.eqe a b
    | symm {a b} : kCid.eqe a b → kCid.eqe b a
    | trans {a b c} : kCid.eqe a b → kCid.eqe b c → kCid.eqe a c
    -- Congruence axioms for each operator
    | eqe_getClass {a b : kConfiguration} : kConfiguration.eqe a b → kCid.eqe (kCid.getClass a) (kCid.getClass b)
    -- Equations
    -- eq getClass(
  -- [1m[31m<[0m O:Oid[1m[31m :[0m C:Cid[1m[31m |[0m
  --   A:AttributeSet[1m[31m >[0m)[0m = C:Cid .
    | eq_getClass {o c a} : kAction.has_sort o MSort.Oid → kCid.has_sort c MSort.Cid → kAttributeSet.has_sort a MSort.AttributeSet → kCid.eqe (kCid.getClass (kConfiguration.ltcolonbargt o c a)) c

  inductive kActorDeonticActionDeadline.eqe: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | from_eqa {a b} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqe a b
    | symm {a b} : kActorDeonticActionDeadline.eqe a b → kActorDeonticActionDeadline.eqe b a
    | trans {a b c} : kActorDeonticActionDeadline.eqe a b → kActorDeonticActionDeadline.eqe b c → kActorDeonticActionDeadline.eqe a c
    -- Congruence axioms for each operator
    | eqe_PARTY₀ {a₀ b₀ : kAction} {a₁ b₁ : kDeadline} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kAction.eqe a₀ b₀ → kDeadline.eqe a₁ b₁ → kDeontic.eqe a₂ b₂ → kAction.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b₀ b₁ b₂ b₃)
    | eqe_PARTY₁ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kAction} {a₃ b₃ : kDeadline} : kAction.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kAction.eqe a₂ b₂ → kDeadline.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b₀ b₁ b₂ b₃)
    | eqe_PARTY₂ {a₀ b₀ : kAction} {a₁ b₁ : kDeontic} {a₂ b₂ : kDeadline} {a₃ b₃ : kAction} : kAction.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kDeadline.eqe a₂ b₂ → kAction.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b₀ b₁ b₂ b₃)
    | eqe_PARTY₃ {a₀ b₀ : kDeadline} {a₁ b₁ : kAction} {a₂ b₂ : kDeontic} {a₃ b₃ : kAction} : kDeadline.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kDeontic.eqe a₂ b₂ → kAction.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b₀ b₁ b₂ b₃)
    -- Equations
    -- eq PARTY actorName:Qid deadline:Deadline deontic:Deontic actionName:Qid = PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline .
    | eq_PARTY₀ {actorname deadline deontic actionname} : kAction.has_sort actorname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₀ actorname deadline deontic actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)
    -- eq PARTY actorName:Qid deontic:Deontic deadline:Deadline actionName:Qid = PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline .
    | eq_PARTY₂ {actorname deontic deadline actionname} : kAction.has_sort actorname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₂ actorname deontic deadline actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)
    -- eq deadline:Deadline PARTY actorName:Qid deontic:Deontic actionName:Qid = PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline .
    | eq_PARTY₃ {deadline actorname deontic actionname} : kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₃ deadline actorname deontic actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)

  inductive kActorState.eqe: kActorState → kActorState → Prop
    | from_eqa {a b} : kActorState.eqa a b → kActorState.eqe a b
    | symm {a b} : kActorState.eqe a b → kActorState.eqe b a
    | trans {a b c} : kActorState.eqe a b → kActorState.eqe b c → kActorState.eqe a c
    -- Congruence axioms for each operator

  inductive kAttributeSet.eqe: kAttributeSet → kAttributeSet → Prop
    | from_eqa {a b} : kAttributeSet.eqa a b → kAttributeSet.eqe a b
    | symm {a b} : kAttributeSet.eqe a b → kAttributeSet.eqe b a
    | trans {a b c} : kAttributeSet.eqe a b → kAttributeSet.eqe b c → kAttributeSet.eqe a c
    -- Congruence axioms for each operator
    | eqe_«`,» {a₀ b₀ a₁ b₁ : kAttributeSet} : kAttributeSet.eqe a₀ b₀ → kAttributeSet.eqe a₁ b₁ → kAttributeSet.eqe (kAttributeSet.«`,» a₀ a₁) (kAttributeSet.«`,» b₀ b₁)
    | eqe_«contractState`colon» {a b : kContractState} : kContractState.eqe a b → kAttributeSet.eqe (kAttributeSet.«contractState`colon» a) (kAttributeSet.«contractState`colon» b)
    | eqe_«rules`colon» {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kAttributeSet.eqe (kAttributeSet.«rules`colon» a) (kAttributeSet.«rules`colon» b)
    | eqe_«time`colon» {a b : kFindResult} : kFindResult.eqe a b → kAttributeSet.eqe (kAttributeSet.«time`colon» a) (kAttributeSet.«time`colon» b)

  inductive kString.eqe: kString → kString → Prop
    | from_eqa {a b} : kString.eqa a b → kString.eqe a b
    | symm {a b} : kString.eqe a b → kString.eqe b a
    | trans {a b c} : kString.eqe a b → kString.eqe b c → kString.eqe a c
    -- Congruence axioms for each operator
    | eqe_sum {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kString.eqe (kString.sum a₀ a₁) (kString.sum b₀ b₁)
    | eqe_char {a b : kFindResult} : kFindResult.eqe a b → kString.eqe (kString.char a) (kString.char b)
    | eqe_lowerCase {a b : kString} : kString.eqe a b → kString.eqe (kString.lowerCase a) (kString.lowerCase b)
    | eqe_string {a b : kAction} : kAction.eqe a b → kString.eqe (kString.string a) (kString.string b)
    | eqe_substr {a₀ b₀ : kString} {a₁ b₁ a₂ b₂ : kFindResult} : kString.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kString.eqe (kString.substr a₀ a₁ a₂) (kString.substr b₀ b₁ b₂)
    | eqe_upperCase {a b : kString} : kString.eqe a b → kString.eqe (kString.upperCase a) (kString.upperCase b)

  inductive kContractState.eqe: kContractState → kContractState → Prop
    | from_eqa {a b} : kContractState.eqa a b → kContractState.eqe a b
    | symm {a b} : kContractState.eqe a b → kContractState.eqe b a
    | trans {a b c} : kContractState.eqe a b → kContractState.eqe b c → kContractState.eqe a c
    -- Congruence axioms for each operator
    | eqe_deltaAction {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kConfiguration} {a₂ b₂ : kContractState} : k«Set{Rule}».eqe a₀ b₀ → kConfiguration.eqe a₁ b₁ → kContractState.eqe a₂ b₂ → kContractState.eqe (kContractState.deltaAction a₀ a₁ a₂) (kContractState.deltaAction b₀ b₁ b₂)
    | eqe_deltaTick {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kContractState} : k«Set{Rule}».eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe (kContractState.deltaTick a₀ a₁) (kContractState.deltaTick b₀ b₁)
    | eqe_Active {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kContractState.eqe (kContractState.Active a) (kContractState.Active b)
    | eqe_Breached {a b : kAction} : kAction.eqe a b → kContractState.eqe (kContractState.Breached a) (kContractState.Breached b)
    | eqe_pow {a₀ b₀ a₁ b₁ : kContractState} : kContractState.eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe (kContractState.pow a₀ a₁) (kContractState.pow b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kContractState} : kAction.eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe a₂ b₂ → kContractState.eqe (kContractState.ifthenelsefi a₀ a₁ a₂) (kContractState.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    -- eq Active empty = (Fulfilled).ContractState .
    | eq_Active : kContractState.eqe (kContractState.Active k«Set{Rule}».empty) kContractState.Fulfilled
    -- eq Active activeRules:Set{Rule} ^ Active activeRules':Set{Rule} = Active (activeRules:Set{Rule}[31m,[0m activeRules':Set{Rule})[0m .
    | eq_pow₀ {activerules activerules'} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules' MSort.«Set{Rule}» → kContractState.eqe (kContractState.pow (kContractState.Active activerules) (kContractState.Active activerules')) (kContractState.Active (k«Set{Rule}».«`,» activerules activerules'))
    -- eq Active activeRules:Set{Rule} ^ Breached actorNames:Set{Qid} = Breached actorNames:Set{Qid} .
    | eq_pow₁ {activerules actornames} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort actornames MSort.«Set{Qid}» → kContractState.eqe (kContractState.pow (kContractState.Active activerules) (kContractState.Breached actornames)) (kContractState.Breached actornames)
    -- eq Breached actorNames:Set{Qid} ^ Breached actorNames':Set{Qid} = Breached (actorNames:Set{Qid}[31m,[0m actorNames':Set{Qid})[0m .
    | eq_pow₂ {actornames actornames'} : kAction.has_sort actornames MSort.«Set{Qid}» → kAction.has_sort actornames' MSort.«Set{Qid}» → kContractState.eqe (kContractState.pow (kContractState.Breached actornames) (kContractState.Breached actornames')) (kContractState.Breached (kAction.«`,» actornames actornames'))
    -- eq deltaAction rules:Set{Rule} actionEvent:ActionEvent Fulfilled = (Fulfilled).ContractState .
    | eq_deltaAction₀ {rules actionevent} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kConfiguration.has_sort actionevent MSort.ActionEvent → kContractState.eqe (kContractState.deltaAction rules actionevent kContractState.Fulfilled) kContractState.Fulfilled
    -- eq deltaAction rules:Set{Rule} actionEvent:ActionEvent Breached actorNames:Set{Qid} = Breached actorNames:Set{Qid} .
    | eq_deltaAction₁ {rules actionevent actornames} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kConfiguration.has_sort actionevent MSort.ActionEvent → kAction.has_sort actornames MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaAction rules actionevent (kContractState.Breached actornames)) (kContractState.Breached actornames)
    -- eq deltaAction rules:Set{Rule} actorName:Qid does actionName:Qid Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid SHANT actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = (deltaAction rules:Set{Rule} actorName:Qid does actionName:Qid Active activeRules:Set{Rule}) ^ if lest:Set{Qid} == (empty).Set{Qid} then Breached actorName:Qid else Active (getRulesWithNames rules:Set{Rule} lest:Set{Qid}) fi .
    | eq_deltaAction₂ {rules actorname actionname activerules rulename time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kFindResult.has_sort time MSort.Nat → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaAction rules (kConfiguration.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.SHANT actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.deltaAction rules (kConfiguration.does actorname actionname) (kContractState.Active activerules)) (kContractState.ifthenelsefi (kAction.eqeq₀ lest kAction.empty) (kContractState.Breached actorname) (kContractState.Active (k«Set{Rule}».getRulesWithNames rules lest))))
    -- eq deltaTick rules:Set{Rule} Fulfilled = (Fulfilled).ContractState .
    | eq_deltaTick₀ {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kContractState.eqe (kContractState.deltaTick rules kContractState.Fulfilled) kContractState.Fulfilled
    -- eq deltaTick rules:Set{Rule} Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid SHANT actionName:Qid WITHIN 0 DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = Active (getRulesWithNames rules:Set{Rule} hence:Set{Qid}) ^ deltaTick rules:Set{Rule} Active activeRules:Set{Rule} .
    | eq_deltaTick₁ {rules activerules rulename actorname actionname hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.SHANT actionname (kDeadline.WITHIN (kDuration.DAY kFindResult.zero))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».getRulesWithNames rules hence)) (kContractState.deltaTick rules (kContractState.Active activerules)))
    -- eq deltaTick rules:Set{Rule} Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN (s time:Nat) DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = Active (RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid}) ^ deltaTick rules:Set{Rule} Active activeRules:Set{Rule} .
    | eq_deltaTick₂ {rules activerules rulename actorname deontic actionname time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY (kFindResult.s time)))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))) (kContractState.deltaTick rules (kContractState.Active activerules)))
    -- eq deltaTick rules:Set{Rule} Breached actorName:Qid = Breached actorName:Qid .
    | eq_deltaTick₃ {rules actorname} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort actorname MSort.Qid → kContractState.eqe (kContractState.deltaTick rules (kContractState.Breached actorname)) (kContractState.Breached actorname)
    -- ceq deltaAction rules:Set{Rule} actorName:Qid does actionName:Qid Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = Active (getRulesWithNames rules:Set{Rule} hence:Set{Qid}) ^ deltaAction rules:Set{Rule} actorName:Qid does actionName:Qid Active activeRules:Set{Rule} if deontic:Deontic == MAY or deontic:Deontic == MUST = true .
    | eq_deltaAction₃ {rules actorname actionname activerules rulename deontic time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kFindResult.has_sort time MSort.Nat → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kAction.eqe (kAction.or (kAction.eqeq₁ deontic kDeontic.MAY) (kAction.eqeq₁ deontic kDeontic.MUST)) kAction.true → kContractState.eqe (kContractState.deltaAction rules (kConfiguration.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».getRulesWithNames rules hence)) (kContractState.deltaAction rules (kConfiguration.does actorname actionname) (kContractState.Active activerules)))
    -- ceq deltaTick rules:Set{Rule} Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN 0 DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[0m = (deltaTick rules:Set{Rule} Active activeRules:Set{Rule}) ^ if lest:Set{Qid} =/= (empty).Set{Qid} or deontic:Deontic == MAY then Active (getRulesWithNames rules:Set{Rule} lest:Set{Qid}) else Breached actorName:Qid fi if deontic:Deontic == MAY or deontic:Deontic == MUST = true .
    | eq_deltaTick₄ {rules activerules rulename actorname deontic actionname hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kAction.eqe (kAction.or (kAction.eqeq₁ deontic kDeontic.MAY) (kAction.eqeq₁ deontic kDeontic.MUST)) kAction.true → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY kFindResult.zero))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.deltaTick rules (kContractState.Active activerules)) (kContractState.ifthenelsefi (kAction.or (kAction.eqslasheq₁ lest kAction.empty) (kAction.eqeq₁ deontic kDeontic.MAY)) (kContractState.Active (k«Set{Rule}».getRulesWithNames rules lest)) (kContractState.Breached actorname)))
    -- eq deltaAction rules:Set{Rule} actionEvent:ActionEvent Active (activeRules:Set{Rule}[31m,[0m activeRule:Rule)[0m = Active activeRule:Rule ^ deltaAction rules:Set{Rule} actionEvent:ActionEvent Active activeRules:Set{Rule} [owise] .
    | eq_deltaAction₄ {rules actionevent activerules activerule} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kConfiguration.has_sort actionevent MSort.ActionEvent → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerule MSort.Rule → kContractState.eqe (kContractState.deltaAction rules actionevent (kContractState.Active (k«Set{Rule}».«`,» activerules activerule))) (kContractState.pow (kContractState.Active activerule) (kContractState.deltaAction rules actionevent (kContractState.Active activerules)))
    -- eq if true then L:[ContractState] else R:[ContractState] fi = L:[ContractState] [fake] .
    | eq_itet {l r} : kContractState.eqe (kContractState.ifthenelsefi kAction.true l r) l
    -- eq if false then L:[ContractState] else R:[ContractState] fi = R:[ContractState] [fake] .
    | eq_itef {l r} : kContractState.eqe (kContractState.ifthenelsefi kAction.false l r) r

  inductive kContractStatus.eqe: kContractStatus → kContractStatus → Prop
    | from_eqa {a b} : kContractStatus.eqa a b → kContractStatus.eqe a b
    | symm {a b} : kContractStatus.eqe a b → kContractStatus.eqe b a
    | trans {a b c} : kContractStatus.eqe a b → kContractStatus.eqe b c → kContractStatus.eqe a c
    -- Congruence axioms for each operator
    | eqe_configToStatus {a b : kConfiguration} : kConfiguration.eqe a b → kContractStatus.eqe (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
    | eqe_contractStateToStatus {a b : kContractState} : kContractState.eqe a b → kContractStatus.eqe (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)
    -- Equations
    -- eq configToStatus (config:Configuration 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#2:Coordinator[1m[31m |[0m
  --   [0mV#5:AttributeSet[1m[31m,
  --   [0m[0mcontractState : contractState:ContractState[1m[31m,
  --   [0m[0mrules : V#3:Set{Rule}[1m[31m,
  --   [0mtime : V#4:Nat[0m[0m[0m[1m[31m >[0m)[0m = contractStateToStatus contractState:ContractState .
    | eq_configToStatus {config coordinator v#2 v#5 contractstate v#3 v#4} : kConfiguration.has_sort config MSort.Configuration → kAction.has_sort coordinator MSort.Qid → kCid.has_sort v#2 MSort.Coordinator → kAttributeSet.has_sort v#5 MSort.AttributeSet → kContractState.has_sort contractstate MSort.ContractState → k«Set{Rule}».has_sort v#3 MSort.«Set{Rule}» → kFindResult.has_sort v#4 MSort.Nat → kContractStatus.eqe (kContractStatus.configToStatus (kConfiguration.join config (kConfiguration.ltcolonbargt coordinator v#2 (kAttributeSet.«`,» v#5 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#3) (kAttributeSet.«time`colon» v#4))))))) (kContractStatus.contractStateToStatus contractstate)
    -- eq contractStateToStatus Fulfilled = (Fulfilled).ContractStatus .
    | eq_contractStateToStatus₀ : kContractStatus.eqe (kContractStatus.contractStateToStatus kContractState.Fulfilled) kContractStatus.Fulfilled
    -- eq contractStateToStatus Active (activeRules:Set{Rule}[31m,[0m activeRule:Rule)[0m = Active .
    | eq_contractStateToStatus₁ {activerules activerule} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerule MSort.Rule → kContractStatus.eqe (kContractStatus.contractStateToStatus (kContractState.Active (k«Set{Rule}».«`,» activerules activerule))) kContractStatus.Active
    -- eq contractStateToStatus Breached actorNames:Set{Qid} = Breached .
    | eq_contractStateToStatus₂ {actornames} : kAction.has_sort actornames MSort.«Set{Qid}» → kContractStatus.eqe (kContractStatus.contractStateToStatus (kContractState.Breached actornames)) kContractStatus.Breached

  inductive kDate.eqe: kDate → kDate → Prop
    | from_eqa {a b} : kDate.eqa a b → kDate.eqe a b
    | symm {a b} : kDate.eqe a b → kDate.eqe b a
    | trans {a b c} : kDate.eqe a b → kDate.eqe b c → kDate.eqe a c
    -- Congruence axioms for each operator

  inductive kDeadline.eqe: kDeadline → kDeadline → Prop
    | from_eqa {a b} : kDeadline.eqa a b → kDeadline.eqe a b
    | symm {a b} : kDeadline.eqe a b → kDeadline.eqe b a
    | trans {a b c} : kDeadline.eqe a b → kDeadline.eqe b c → kDeadline.eqe a c
    -- Congruence axioms for each operator
    | eqe_BY {a b : kFindResult} : kFindResult.eqe a b → kDeadline.eqe (kDeadline.BY a) (kDeadline.BY b)
    | eqe_WITHIN {a b : kDuration} : kDuration.eqe a b → kDeadline.eqe (kDeadline.WITHIN a) (kDeadline.WITHIN b)

  inductive kDeontic.eqe: kDeontic → kDeontic → Prop
    | from_eqa {a b} : kDeontic.eqa a b → kDeontic.eqe a b
    | symm {a b} : kDeontic.eqe a b → kDeontic.eqe b a
    | trans {a b c} : kDeontic.eqe a b → kDeontic.eqe b c → kDeontic.eqe a c
    -- Congruence axioms for each operator

  inductive kDuration.eqe: kDuration → kDuration → Prop
    | from_eqa {a b} : kDuration.eqa a b → kDuration.eqe a b
    | symm {a b} : kDuration.eqe a b → kDuration.eqe b a
    | trans {a b c} : kDuration.eqe a b → kDuration.eqe b c → kDuration.eqe a c
    -- Congruence axioms for each operator
    | eqe_DAY {a b : kFindResult} : kFindResult.eqe a b → kDuration.eqe (kDuration.DAY a) (kDuration.DAY b)
    | eqe_MONTH {a b : kFindResult} : kFindResult.eqe a b → kDuration.eqe (kDuration.MONTH a) (kDuration.MONTH b)
    | eqe_WEEK {a b : kFindResult} : kFindResult.eqe a b → kDuration.eqe (kDuration.WEEK a) (kDuration.WEEK b)
    | eqe_YEAR {a b : kFindResult} : kFindResult.eqe a b → kDuration.eqe (kDuration.YEAR a) (kDuration.YEAR b)

  inductive kFindResult.eqe: kFindResult → kFindResult → Prop
    | from_eqa {a b} : kFindResult.eqa a b → kFindResult.eqe a b
    | symm {a b} : kFindResult.eqe a b → kFindResult.eqe b a
    | trans {a b c} : kFindResult.eqe a b → kFindResult.eqe b c → kFindResult.eqe a c
    -- Congruence axioms for each operator
    | eqe_«$card»₀ {a₀ b₀ : kConfiguration} {a₁ b₁ : kFindResult} : kConfiguration.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₀ a₀ a₁) (kFindResult.«$card»₀ b₀ b₁)
    | eqe_«$card»₁ {a₀ b₀ : kAction} {a₁ b₁ : kFindResult} : kAction.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₁ a₀ a₁) (kFindResult.«$card»₁ b₀ b₁)
    | eqe_«$card»₂ {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kFindResult} : k«Set{Rule}».eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₂ a₀ a₁) (kFindResult.«$card»₂ b₀ b₁)
    | eqe_barbar₀ {a b : kConfiguration} : kConfiguration.eqe a b → kFindResult.eqe (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
    | eqe_barbar₁ {a b : kAction} : kAction.eqe a b → kFindResult.eqe (kFindResult.barbar₁ a) (kFindResult.barbar₁ b)
    | eqe_barbar₂ {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kFindResult.eqe (kFindResult.barbar₂ a) (kFindResult.barbar₂ b)
    | eqe_amp {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.amp a₀ a₁) (kFindResult.amp b₀ b₁)
    | eqe_mul {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.mul a₀ a₁) (kFindResult.mul b₀ b₁)
    | eqe_sum {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.sum a₀ a₁) (kFindResult.sum b₀ b₁)
    | eqe_ltlt {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.ltlt a₀ a₁) (kFindResult.ltlt b₀ b₁)
    | eqe_gtgt {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.gtgt a₀ a₁) (kFindResult.gtgt b₀ b₁)
    | eqe_pow {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.pow a₀ a₁) (kFindResult.pow b₀ b₁)
    | eqe_quo {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.quo a₀ a₁) (kFindResult.quo b₀ b₁)
    | eqe_rem {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.rem a₀ a₁) (kFindResult.rem b₀ b₁)
    | eqe_xor {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.xor a₀ a₁) (kFindResult.xor b₀ b₁)
    | eqe_bar {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.bar a₀ a₁) (kFindResult.bar b₀ b₁)
    | eqe_ascii {a b : kString} : kString.eqe a b → kFindResult.eqe (kFindResult.ascii a) (kFindResult.ascii b)
    | eqe_find {a₀ b₀ a₁ b₁ : kString} {a₂ b₂ : kFindResult} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kFindResult.eqe (kFindResult.find a₀ a₁ a₂) (kFindResult.find b₀ b₁ b₂)
    | eqe_gcd {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.gcd a₀ a₁) (kFindResult.gcd b₀ b₁)
    | eqe_lcm {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.lcm a₀ a₁) (kFindResult.lcm b₀ b₁)
    | eqe_length {a b : kString} : kString.eqe a b → kFindResult.eqe (kFindResult.length a) (kFindResult.length b)
    | eqe_max {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.max a₀ a₁) (kFindResult.max b₀ b₁)
    | eqe_min {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.min a₀ a₁) (kFindResult.min b₀ b₁)
    | eqe_modExp {a₀ b₀ a₁ b₁ a₂ b₂ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kFindResult.eqe (kFindResult.modExp a₀ a₁ a₂) (kFindResult.modExp b₀ b₁ b₂)
    | eqe_rfind {a₀ b₀ a₁ b₁ : kString} {a₂ b₂ : kFindResult} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kFindResult.eqe (kFindResult.rfind a₀ a₁ a₂) (kFindResult.rfind b₀ b₁ b₂)
    | eqe_s {a b : kFindResult} : kFindResult.eqe a b → kFindResult.eqe (kFindResult.s a) (kFindResult.s b)
    | eqe_sd {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.sd a₀ a₁) (kFindResult.sd b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : kFindResult} : kAction.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kFindResult.eqe (kFindResult.ifthenelsefi a₀ a₁ a₂) (kFindResult.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    -- eq $card((empty).Set{ActionEvent}, C:Nat) = C:Nat .
    | eq_«$card»₀₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ kConfiguration.empty c) c
    -- eq $card((empty).Set{Qid}, C:Nat) = C:Nat .
    | eq_«$card»₁₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ kAction.empty c) c
    -- eq $card((empty).Set{Rule}, C:Nat) = C:Nat .
    | eq_«$card»₂₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ k«Set{Rule}».empty c) c
    -- eq $card((N:NeSet{ActionEvent}[31m,[0m N:NeSet{ActionEvent}[31m,[0m S:Set{ActionEvent}), C:Nat)[0m = $card((N:NeSet{ActionEvent}[31m,[0m S:Set{ActionEvent}), C:Nat)[0m .
    | eq_«$card»₀₁ {n s c} : kConfiguration.has_sort n MSort.«NeSet{ActionEvent}» → kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ (kConfiguration.«`,» n (kConfiguration.«`,» n s)) c) (kFindResult.«$card»₀ (kConfiguration.«`,» n s) c)
    -- eq $card((N:NeSet{Qid}[31m,[0m N:NeSet{Qid}[31m,[0m S:Set{Qid}), C:Nat)[0m = $card((N:NeSet{Qid}[31m,[0m S:Set{Qid}), C:Nat)[0m .
    | eq_«$card»₁₁ {n s c} : kAction.has_sort n MSort.«NeSet{Qid}» → kAction.has_sort s MSort.«Set{Qid}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ (kAction.«`,» n (kAction.«`,» n s)) c) (kFindResult.«$card»₁ (kAction.«`,» n s) c)
    -- eq $card((N:NeSet{Rule}[31m,[0m N:NeSet{Rule}[31m,[0m S:Set{Rule}), C:Nat)[0m = $card((N:NeSet{Rule}[31m,[0m S:Set{Rule}), C:Nat)[0m .
    | eq_«$card»₂₁ {n s c} : k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ (k«Set{Rule}».«`,» n (k«Set{Rule}».«`,» n s)) c) (kFindResult.«$card»₂ (k«Set{Rule}».«`,» n s) c)
    -- eq | S:Set{ActionEvent} | = $card(S:Set{ActionEvent}, 0) .
    | eq_barbar₀ {s} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kFindResult.eqe (kFindResult.barbar₀ s) (kFindResult.«$card»₀ s kFindResult.zero)
    -- eq | S:Set{Qid} | = $card(S:Set{Qid}, 0) .
    | eq_barbar₁ {s} : kAction.has_sort s MSort.«Set{Qid}» → kFindResult.eqe (kFindResult.barbar₁ s) (kFindResult.«$card»₁ s kFindResult.zero)
    -- eq | S:Set{Rule} | = $card(S:Set{Rule}, 0) .
    | eq_barbar₂ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kFindResult.eqe (kFindResult.barbar₂ s) (kFindResult.«$card»₂ s kFindResult.zero)
    -- eq $card((S:Set{ActionEvent}[31m,[0m E:ActionEvent), C:Nat)[0m = $card(S:Set{ActionEvent}, C:Nat + 1) [owise] .
    | eq_«$card»₀₂ {s e c} : kConfiguration.has_sort s MSort.«Set{ActionEvent}» → kConfiguration.has_sort e MSort.ActionEvent → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ (kConfiguration.«`,» s e) c) (kFindResult.«$card»₀ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    -- eq $card((S:Set{Qid}[31m,[0m E:Qid), C:Nat)[0m = $card(S:Set{Qid}, C:Nat + 1) [owise] .
    | eq_«$card»₁₂ {s e c} : kAction.has_sort s MSort.«Set{Qid}» → kAction.has_sort e MSort.Qid → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ (kAction.«`,» s e) c) (kFindResult.«$card»₁ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    -- eq $card((S:Set{Rule}[31m,[0m E:Rule), C:Nat)[0m = $card(S:Set{Rule}, C:Nat + 1) [owise] .
    | eq_«$card»₂₂ {s e c} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ (k«Set{Rule}».«`,» s e) c) (kFindResult.«$card»₂ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    -- eq if true then L:[FindResult] else R:[FindResult] fi = L:[FindResult] [fake] .
    | eq_itet {l r} : kFindResult.eqe (kFindResult.ifthenelsefi kAction.true l r) l
    -- eq if false then L:[FindResult] else R:[FindResult] fi = R:[FindResult] [fake] .
    | eq_itef {l r} : kFindResult.eqe (kFindResult.ifthenelsefi kAction.false l r) r

  inductive kHenceLest.eqe: kHenceLest → kHenceLest → Prop
    | from_eqa {a b} : kHenceLest.eqa a b → kHenceLest.eqe a b
    | symm {a b} : kHenceLest.eqe a b → kHenceLest.eqe b a
    | trans {a b c} : kHenceLest.eqe a b → kHenceLest.eqe b c → kHenceLest.eqe a c
    -- Congruence axioms for each operator
    | eqe_HENCE {a b : kAction} : kAction.eqe a b → kHenceLest.eqe (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | eqe_HENCELEST {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kHenceLest.eqe (kHenceLest.HENCELEST a₀ a₁) (kHenceLest.HENCELEST b₀ b₁)
    | eqe_LEST {a b : kAction} : kAction.eqe a b → kHenceLest.eqe (kHenceLest.LEST a) (kHenceLest.LEST b)
    | eqe_LESTHENCE {a₀ b₀ a₁ b₁ : kAction} : kAction.eqe a₀ b₀ → kAction.eqe a₁ b₁ → kHenceLest.eqe (kHenceLest.LESTHENCE a₀ a₁) (kHenceLest.LESTHENCE b₀ b₁)
    -- Equations
    -- eq HENCE hence:Set{Qid} = HENCE hence:Set{Qid} LEST NOTHING .
    | eq_HENCE {hence} : kAction.has_sort hence MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.HENCE hence) (kHenceLest.HENCELEST hence kAction.NOTHING)
    -- eq LEST lest:Set{Qid} = HENCE NOTHING LEST lest:Set{Qid} .
    | eq_LEST {lest} : kAction.has_sort lest MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.LEST lest) (kHenceLest.HENCELEST kAction.NOTHING lest)
    -- eq LEST lest:Set{Qid} HENCE hence:Set{Qid} = HENCE hence:Set{Qid} LEST lest:Set{Qid} .
    | eq_LESTHENCE {lest hence} : kAction.has_sort lest MSort.«Set{Qid}» → kAction.has_sort hence MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.LESTHENCE lest hence) (kHenceLest.HENCELEST hence lest)

  inductive k«Set{Rule}».eqe: k«Set{Rule}» → k«Set{Rule}» → Prop
    | from_eqa {a b} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqe a b
    | symm {a b} : k«Set{Rule}».eqe a b → k«Set{Rule}».eqe b a
    | trans {a b c} : k«Set{Rule}».eqe a b → k«Set{Rule}».eqe b c → k«Set{Rule}».eqe a c
    -- Congruence axioms for each operator
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» a₀ a₁ a₂) (k«Set{Rule}».«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» a₀ a₁ a₂) (k«Set{Rule}».«$intersect» b₀ b₁ b₂)
    | eqe_delete {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».delete a₀ a₁) (k«Set{Rule}».delete b₀ b₁)
    | eqe_getRulesWithNames {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kAction} : k«Set{Rule}».eqe a₀ b₀ → kAction.eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames a₀ a₁) (k«Set{Rule}».getRulesWithNames b₀ b₁)
    | eqe_insert {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».insert a₀ a₁) (k«Set{Rule}».insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».intersection a₀ a₁) (k«Set{Rule}».intersection b₀ b₁)
    | eqe_union {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».union a₀ a₁) (k«Set{Rule}».union b₀ b₁)
    | eqe_RULE₀ {a₀ b₀ : kAction} {a₁ b₁ : kActorDeonticActionDeadline} : kAction.eqe a₀ b₀ → kActorDeonticActionDeadline.eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».RULE₀ a₀ a₁) (k«Set{Rule}».RULE₀ b₀ b₁)
    | eqe_RULE₁ {a₀ b₀ : kAction} {a₁ b₁ : kActorDeonticActionDeadline} {a₂ b₂ : kHenceLest} : kAction.eqe a₀ b₀ → kActorDeonticActionDeadline.eqe a₁ b₁ → kHenceLest.eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».RULE₁ a₀ a₁ a₂) (k«Set{Rule}».RULE₁ b₀ b₁ b₂)
    | eqe_bslash {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».bslash a₀ a₁) (k«Set{Rule}».bslash b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».«`,» a₀ a₁) (k«Set{Rule}».«`,» b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kAction} {a₁ b₁ a₂ b₂ : k«Set{Rule}»} : kAction.eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) (k«Set{Rule}».ifthenelsefi b₀ b₁ b₂)
    -- Equations
    -- eq $diff((empty).Set{Rule}, S':Set{Rule}, A:Set{Rule}) = A:Set{Rule} .
    | eq_«$diff»₀ {s' a} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» k«Set{Rule}».empty s' a) a
    -- eq $diff((S:Set{Rule}[31m,[0m E:Rule), S':Set{Rule}, A:Set{Rule})[0m = $diff(S:Set{Rule}, S':Set{Rule}, if E:Rule in S':Set{Rule} then A:Set{Rule} else A:Set{Rule}[31m,[0m E:Rule fi)[0m .
    | eq_«$diff»₁ {s e s' a} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» (k«Set{Rule}».«`,» s e) s' a) (k«Set{Rule}».«$diff» s s' (k«Set{Rule}».ifthenelsefi (kAction.«in»₂ e s') a (k«Set{Rule}».«`,» a e)))
    -- eq $intersect((empty).Set{Rule}, S':Set{Rule}, A:Set{Rule}) = A:Set{Rule} .
    | eq_«$intersect»₀ {s' a} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» k«Set{Rule}».empty s' a) a
    -- eq $intersect((S:Set{Rule}[31m,[0m E:Rule), S':Set{Rule}, A:Set{Rule})[0m = $intersect(S:Set{Rule}, S':Set{Rule}, if E:Rule in S':Set{Rule} then A:Set{Rule}[31m,[0m E:Rule else A:Set{Rule} fi)[0m .
    | eq_«$intersect»₁ {s e s' a} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» (k«Set{Rule}».«`,» s e) s' a) (k«Set{Rule}».«$intersect» s s' (k«Set{Rule}».ifthenelsefi (kAction.«in»₂ e s') (k«Set{Rule}».«`,» a e) a))
    -- eq RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline = RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline HENCE NOTHING LEST NOTHING .
    | eq_RULE₀ {rulename actorname deontic actionname deadline} : kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → k«Set{Rule}».eqe (k«Set{Rule}».RULE₀ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)) (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST kAction.NOTHING kAction.NOTHING))
    -- eq S:Set{Rule} \ N:NeSet{Rule} = $diff(S:Set{Rule}, N:NeSet{Rule}, (empty).Set{Rule}) .
    | eq_bslash₀ {s n} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».bslash s n) (k«Set{Rule}».«$diff» s n k«Set{Rule}».empty)
    -- eq S:Set{Rule} \ (empty).Set{Rule} = S:Set{Rule} .
    | eq_bslash₁ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».bslash s k«Set{Rule}».empty) s
    -- eq N:NeSet{Rule}[31m,[0m N:NeSet{Rule}[0m = N:NeSet{Rule} .
    | eq_«`,» {n} : k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«`,» n n) n
    -- eq delete(E:Rule, (S:Set{Rule}[31m,[0m E:Rule))[0m = delete(E:Rule, S:Set{Rule}) .
    | eq_delete₀ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».delete e (k«Set{Rule}».«`,» s e)) (k«Set{Rule}».delete e s)
    -- eq getRulesWithNames rules:Set{Rule} empty = (empty).Set{Rule} .
    | eq_getRulesWithNames₀ {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames rules kAction.empty) k«Set{Rule}».empty
    -- eq getRulesWithNames (rules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline HENCE hence:Set{Qid} LEST lest:Set{Qid}) (ruleNames:Set{Qid}[31m,[0m ruleName:Qid)[0m = getRulesWithNames rules:Set{Rule} ruleNames:Set{Qid}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid deadline:Deadline HENCE hence:Set{Qid} LEST lest:Set{Qid}[0m .
    | eq_getRulesWithNames₁ {rules rulename actorname deontic actionname deadline hence lest rulenames} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort rulename MSort.Qid → kAction.has_sort actorname MSort.Qid → kAction.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kAction.has_sort hence MSort.«Set{Qid}» → kAction.has_sort lest MSort.«Set{Qid}» → kAction.has_sort rulenames MSort.«Set{Qid}» → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest))) (kAction.«`,» rulenames rulename)) (k«Set{Rule}».«`,» (k«Set{Rule}».getRulesWithNames rules rulenames) (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest)))
    -- eq insert(E:Rule, S:Set{Rule}) = S:Set{Rule}[31m,[0m E:Rule[0m .
    | eq_insert {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».insert e s) (k«Set{Rule}».«`,» s e)
    -- eq intersection(S:Set{Rule}, N:NeSet{Rule}) = $intersect(S:Set{Rule}, N:NeSet{Rule}, (empty).Set{Rule}) .
    | eq_intersection₀ {s n} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».intersection s n) (k«Set{Rule}».«$intersect» s n k«Set{Rule}».empty)
    -- eq intersection(S:Set{Rule}, (empty).Set{Rule}) = (empty).Set{Rule} .
    | eq_intersection₁ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».intersection s k«Set{Rule}».empty) k«Set{Rule}».empty
    -- eq union(S:Set{Rule}, S':Set{Rule}) = S:Set{Rule}[31m,[0m S':Set{Rule}[0m .
    | eq_union {s s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».union s s') (k«Set{Rule}».«`,» s s')
    -- eq delete(E:Rule, S:Set{Rule}) = S:Set{Rule} [owise] .
    | eq_delete₁ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».delete e s) s
    -- eq getRulesWithNames rules:Set{Rule} (ruleNames:Set{Qid}[31m,[0m ruleName:Qid)[0m = getRulesWithNames rules:Set{Rule} ruleNames:Set{Qid} [owise] .
    | eq_getRulesWithNames₂ {rules rulenames rulename} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kAction.has_sort rulenames MSort.«Set{Qid}» → kAction.has_sort rulename MSort.Qid → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames rules (kAction.«`,» rulenames rulename)) (k«Set{Rule}».getRulesWithNames rules rulenames)
    -- eq if true then L:[Set{Rule}] else R:[Set{Rule}] fi = L:[Set{Rule}] [fake] .
    | eq_itet {l r} : k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi kAction.true l r) l
    -- eq if false then L:[Set{Rule}] else R:[Set{Rule}] fi = R:[Set{Rule}] [fake] .
    | eq_itef {l r} : k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi kAction.false l r) r

end
infix:40 " ⊳ " => kAction.has_sort
infix:40 " ⊳ " => kConfiguration.has_sort
infix:40 " ⊳ " => kActiveRule.has_sort
infix:40 " ⊳ " => kCid.has_sort
infix:40 " ⊳ " => kActorDeonticActionDeadline.has_sort
infix:40 " ⊳ " => kActorState.has_sort
infix:40 " ⊳ " => kAttributeSet.has_sort
infix:40 " ⊳ " => kString.has_sort
infix:40 " ⊳ " => kContractState.has_sort
infix:40 " ⊳ " => kContractStatus.has_sort
infix:40 " ⊳ " => kDate.has_sort
infix:40 " ⊳ " => kDeadline.has_sort
infix:40 " ⊳ " => kDeontic.has_sort
infix:40 " ⊳ " => kDuration.has_sort
infix:40 " ⊳ " => kFindResult.has_sort
infix:40 " ⊳ " => kHenceLest.has_sort
infix:40 " ⊳ " => k«Set{Rule}».has_sort

infix:40 " =A " => kAction.eqa
infix:40 " =A " => kConfiguration.eqa
infix:40 " =A " => kActiveRule.eqa
infix:40 " =A " => kCid.eqa
infix:40 " =A " => kActorDeonticActionDeadline.eqa
infix:40 " =A " => kActorState.eqa
infix:40 " =A " => kAttributeSet.eqa
infix:40 " =A " => kString.eqa
infix:40 " =A " => kContractState.eqa
infix:40 " =A " => kContractStatus.eqa
infix:40 " =A " => kDate.eqa
infix:40 " =A " => kDeadline.eqa
infix:40 " =A " => kDeontic.eqa
infix:40 " =A " => kDuration.eqa
infix:40 " =A " => kFindResult.eqa
infix:40 " =A " => kHenceLest.eqa
infix:40 " =A " => k«Set{Rule}».eqa

infix:40 " =E " => kAction.eqe
infix:40 " =E " => kConfiguration.eqe
infix:40 " =E " => kActiveRule.eqe
infix:40 " =E " => kCid.eqe
infix:40 " =E " => kActorDeonticActionDeadline.eqe
infix:40 " =E " => kActorState.eqe
infix:40 " =E " => kAttributeSet.eqe
infix:40 " =E " => kString.eqe
infix:40 " =E " => kContractState.eqe
infix:40 " =E " => kContractStatus.eqe
infix:40 " =E " => kDate.eqe
infix:40 " =E " => kDeadline.eqe
infix:40 " =E " => kDeontic.eqe
infix:40 " =E " => kDuration.eqe
infix:40 " =E " => kFindResult.eqe
infix:40 " =E " => kHenceLest.eqe
infix:40 " =E " => k«Set{Rule}».eqe

-- Rewriting relations

mutual
  inductive kAction.rw_one: kAction → kAction → Prop
    | eqe_left {a b c : kAction} : a =E b → kAction.rw_one b c → kAction.rw_one a c
    | eqe_right {a b c : kAction} : kAction.rw_one a b → b =E c → kAction.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_and₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.and a a₁) (kAction.and b a₁)
    | sub_and₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.and a₀ a) (kAction.and a₀ b)
    | sub_or₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.or a a₁) (kAction.or b a₁)
    | sub_or₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.or a₀ a) (kAction.or a₀ b)
    | sub_xor₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.xor a a₁) (kAction.xor b a₁)
    | sub_xor₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.xor a₀ a) (kAction.xor a₀ b)
    | sub_not {a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.not a) (kAction.not b)
    | sub_implies₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.implies a a₁) (kAction.implies b a₁)
    | sub_implies₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.implies a₀ a) (kAction.implies a₀ b)
    | sub_«$diff»₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$diff» a a₁ a₂) (kAction.«$diff» b a₁ a₂)
    | sub_«$diff»₁ {a₀ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$diff» a₀ a a₂) (kAction.«$diff» a₀ b a₂)
    | sub_«$diff»₂ {a₀ a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$diff» a₀ a₁ a) (kAction.«$diff» a₀ a₁ b)
    | sub_«$intersect»₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$intersect» a a₁ a₂) (kAction.«$intersect» b a₁ a₂)
    | sub_«$intersect»₁ {a₀ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$intersect» a₀ a a₂) (kAction.«$intersect» a₀ b a₂)
    | sub_«$intersect»₂ {a₀ a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«$intersect» a₀ a₁ a) (kAction.«$intersect» a₀ a₁ b)
    | sub_containsActor₀ {a₁ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.containsActor a a₁) (kAction.containsActor b a₁)
    | sub_containsActor₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.containsActor a₀ a) (kAction.containsActor a₀ b)
    | sub_containsRuleWithEvent₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.containsRuleWithEvent a a₁) (kAction.containsRuleWithEvent b a₁)
    | sub_containsRuleWithEvent₁ {a₀ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.containsRuleWithEvent a₀ a) (kAction.containsRuleWithEvent a₀ b)
    | sub_«in»₀₀ {a₁ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.«in»₀ a a₁) (kAction.«in»₀ b a₁)
    | sub_«in»₀₁ {a₀ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.«in»₀ a₀ a) (kAction.«in»₀ a₀ b)
    | sub_«in»₁₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«in»₁ a a₁) (kAction.«in»₁ b a₁)
    | sub_«in»₁₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«in»₁ a₀ a) (kAction.«in»₁ a₀ b)
    | sub_«in»₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.«in»₂ a a₁) (kAction.«in»₂ b a₁)
    | sub_«in»₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.«in»₂ a₀ a) (kAction.«in»₂ a₀ b)
    | sub_psubset₀₀ {a₁ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.psubset₀ a a₁) (kAction.psubset₀ b a₁)
    | sub_psubset₀₁ {a₀ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.psubset₀ a₀ a) (kAction.psubset₀ a₀ b)
    | sub_psubset₁₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.psubset₁ a a₁) (kAction.psubset₁ b a₁)
    | sub_psubset₁₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.psubset₁ a₀ a) (kAction.psubset₁ a₀ b)
    | sub_psubset₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.psubset₂ a a₁) (kAction.psubset₂ b a₁)
    | sub_psubset₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.psubset₂ a₀ a) (kAction.psubset₂ a₀ b)
    | sub_subset₀₀ {a₁ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.subset₀ a a₁) (kAction.subset₀ b a₁)
    | sub_subset₀₁ {a₀ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.subset₀ a₀ a) (kAction.subset₀ a₀ b)
    | sub_subset₁₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.subset₁ a a₁) (kAction.subset₁ b a₁)
    | sub_subset₁₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.subset₁ a₀ a) (kAction.subset₁ a₀ b)
    | sub_subset₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.subset₂ a a₁) (kAction.subset₂ b a₁)
    | sub_subset₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.subset₂ a₀ a) (kAction.subset₂ a₀ b)
    | sub_delete₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.delete a a₁) (kAction.delete b a₁)
    | sub_delete₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.delete a₀ a) (kAction.delete a₀ b)
    | sub_insert₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.insert a a₁) (kAction.insert b a₁)
    | sub_insert₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.insert a₀ a) (kAction.insert a₀ b)
    | sub_intersection₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.intersection a a₁) (kAction.intersection b a₁)
    | sub_intersection₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.intersection a₀ a) (kAction.intersection a₀ b)
    | sub_union₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.union a a₁) (kAction.union b a₁)
    | sub_union₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.union a₀ a) (kAction.union a₀ b)
    | sub_DO {a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.DO a) (kAction.DO b)
    | sub_lteq₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.lteq₀ a a₁) (kAction.lteq₀ b a₁)
    | sub_lteq₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.lteq₀ a₀ a) (kAction.lteq₀ a₀ b)
    | sub_lteq₁₀ {a₁ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.lteq₁ a a₁) (kAction.lteq₁ b a₁)
    | sub_lteq₁₁ {a₀ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.lteq₁ a₀ a) (kAction.lteq₁ a₀ b)
    | sub_lt₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.lt₀ a a₁) (kAction.lt₀ b a₁)
    | sub_lt₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.lt₀ a₀ a) (kAction.lt₀ a₀ b)
    | sub_lt₁₀ {a₁ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.lt₁ a a₁) (kAction.lt₁ b a₁)
    | sub_lt₁₁ {a₀ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.lt₁ a₀ a) (kAction.lt₁ a₀ b)
    | sub_gteq₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.gteq₀ a a₁) (kAction.gteq₀ b a₁)
    | sub_gteq₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.gteq₀ a₀ a) (kAction.gteq₀ a₀ b)
    | sub_gteq₁₀ {a₁ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.gteq₁ a a₁) (kAction.gteq₁ b a₁)
    | sub_gteq₁₁ {a₀ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.gteq₁ a₀ a) (kAction.gteq₁ a₀ b)
    | sub_gt₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.gt₀ a a₁) (kAction.gt₀ b a₁)
    | sub_gt₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.gt₀ a₀ a) (kAction.gt₀ a₀ b)
    | sub_gt₁₀ {a₁ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.gt₁ a a₁) (kAction.gt₁ b a₁)
    | sub_gt₁₁ {a₀ a b} : kString.rw_one a b →
    kAction.rw_one (kAction.gt₁ a₀ a) (kAction.gt₁ a₀ b)
    | sub_AND₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.AND a a₁) (kAction.AND b a₁)
    | sub_AND₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.AND a₀ a) (kAction.AND a₀ b)
    | sub_bslash₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.bslash a a₁) (kAction.bslash b a₁)
    | sub_bslash₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.bslash a₀ a) (kAction.bslash a₀ b)
    | sub_«`,»₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«`,» a a₁) (kAction.«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.«`,» a₀ a) (kAction.«`,» a₀ b)
    | sub_andsubthen₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.andsubthen a a₁) (kAction.andsubthen b a₁)
    | sub_andsubthen₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.andsubthen a₀ a) (kAction.andsubthen a₀ b)
    | sub_divides₀ {a₁ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.divides a a₁) (kAction.divides b a₁)
    | sub_divides₁ {a₀ a b} : kFindResult.rw_one a b →
    kAction.rw_one (kAction.divides a₀ a) (kAction.divides a₀ b)
    | sub_orsubelse₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.orsubelse a a₁) (kAction.orsubelse b a₁)
    | sub_orsubelse₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.orsubelse a₀ a) (kAction.orsubelse a₀ b)
    | sub_qid {a b} : kString.rw_one a b →
    kAction.rw_one (kAction.qid a) (kAction.qid b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.ifthenelsefi a a₁ a₂) (kAction.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.ifthenelsefi a₀ a a₂) (kAction.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.ifthenelsefi a₀ a₁ a) (kAction.ifthenelsefi a₀ a₁ b)
    | sub_eqslasheq₀₀ {a₁ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.eqslasheq₀ a a₁) (kAction.eqslasheq₀ b a₁)
    | sub_eqslasheq₀₁ {a₀ a b} : kConfiguration.rw_one a b →
    kAction.rw_one (kAction.eqslasheq₀ a₀ a) (kAction.eqslasheq₀ a₀ b)
    | sub_eqslasheq₁₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.eqslasheq₁ a a₁) (kAction.eqslasheq₁ b a₁)
    | sub_eqslasheq₁₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.eqslasheq₁ a₀ a) (kAction.eqslasheq₁ a₀ b)
    | sub_eqslasheq₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.eqslasheq₂ a a₁) (kAction.eqslasheq₂ b a₁)
    | sub_eqslasheq₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kAction.rw_one (kAction.eqslasheq₂ a₀ a) (kAction.eqslasheq₂ a₀ b)
    | sub_eqeq₀₀ {a₁ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.eqeq₀ a a₁) (kAction.eqeq₀ b a₁)
    | sub_eqeq₀₁ {a₀ a b} : kAction.rw_one a b →
    kAction.rw_one (kAction.eqeq₀ a₀ a) (kAction.eqeq₀ a₀ b)
    | sub_eqeq₁₀ {a₁ a b} : kDeontic.rw_one a b →
    kAction.rw_one (kAction.eqeq₁ a a₁) (kAction.eqeq₁ b a₁)
    | sub_eqeq₁₁ {a₀ a b} : kDeontic.rw_one a b →
    kAction.rw_one (kAction.eqeq₁ a₀ a) (kAction.eqeq₁ a₀ b)
    | sub_eqeq₂₀ {a₁ a b} : kContractStatus.rw_one a b →
    kAction.rw_one (kAction.eqeq₂ a a₁) (kAction.eqeq₂ b a₁)
    | sub_eqeq₂₁ {a₀ a b} : kContractStatus.rw_one a b →
    kAction.rw_one (kAction.eqeq₂ a₀ a) (kAction.eqeq₂ a₀ b)

  inductive kConfiguration.rw_one: kConfiguration → kConfiguration → Prop
    | eqe_left {a b c : kConfiguration} : a =E b → kConfiguration.rw_one b c → kConfiguration.rw_one a c
    | eqe_right {a b c : kConfiguration} : kConfiguration.rw_one a b → b =E c → kConfiguration.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«$diff»₀ {a₁ a₂ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$diff» a a₁ a₂) (kConfiguration.«$diff» b a₁ a₂)
    | sub_«$diff»₁ {a₀ a₂ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$diff» a₀ a a₂) (kConfiguration.«$diff» a₀ b a₂)
    | sub_«$diff»₂ {a₀ a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$diff» a₀ a₁ a) (kConfiguration.«$diff» a₀ a₁ b)
    | sub_«$intersect»₀ {a₁ a₂ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$intersect» a a₁ a₂) (kConfiguration.«$intersect» b a₁ a₂)
    | sub_«$intersect»₁ {a₀ a₂ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$intersect» a₀ a a₂) (kConfiguration.«$intersect» a₀ b a₂)
    | sub_«$intersect»₂ {a₀ a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«$intersect» a₀ a₁ a) (kConfiguration.«$intersect» a₀ a₁ b)
    | sub_delete₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.delete a a₁) (kConfiguration.delete b a₁)
    | sub_delete₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.delete a₀ a) (kConfiguration.delete a₀ b)
    | sub_getAction {a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.getAction a) (kConfiguration.getAction b)
    | sub_getAllActions {a b} : k«Set{Rule}».rw_one a b →
    kConfiguration.rw_one (kConfiguration.getAllActions a) (kConfiguration.getAllActions b)
    | sub_initAux₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kConfiguration.rw_one (kConfiguration.initAux a a₁) (kConfiguration.initAux b a₁)
    | sub_initAux₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.initAux a₀ a) (kConfiguration.initAux a₀ b)
    | sub_init {a b} : k«Set{Rule}».rw_one a b →
    kConfiguration.rw_one (kConfiguration.init a) (kConfiguration.init b)
    | sub_insert₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.insert a a₁) (kConfiguration.insert b a₁)
    | sub_insert₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.insert a₀ a) (kConfiguration.insert a₀ b)
    | sub_intersection₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.intersection a a₁) (kConfiguration.intersection b a₁)
    | sub_intersection₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.intersection a₀ a) (kConfiguration.intersection a₀ b)
    | sub_pretty {a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.pretty a) (kConfiguration.pretty b)
    | sub_union₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.union a a₁) (kConfiguration.union b a₁)
    | sub_union₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.union a₀ a) (kConfiguration.union a₀ b)
    | sub_ltcolonbargt₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ltcolonbargt a a₁ a₂) (kConfiguration.ltcolonbargt b a₁ a₂)
    | sub_ltcolonbargt₁ {a₀ a₂ a b} : kCid.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ltcolonbargt a₀ a a₂) (kConfiguration.ltcolonbargt a₀ b a₂)
    | sub_ltcolonbargt₂ {a₀ a₁ a b} : kAttributeSet.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ltcolonbargt a₀ a₁ a) (kConfiguration.ltcolonbargt a₀ a₁ b)
    | sub_«ltcolonbar`gt»₀ {a₁ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«ltcolonbar`gt» a a₁) (kConfiguration.«ltcolonbar`gt» b a₁)
    | sub_«ltcolonbar`gt»₁ {a₀ a b} : kCid.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«ltcolonbar`gt» a₀ a) (kConfiguration.«ltcolonbar`gt» a₀ b)
    | sub_bslash₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.bslash a a₁) (kConfiguration.bslash b a₁)
    | sub_bslash₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.bslash a₀ a) (kConfiguration.bslash a₀ b)
    | sub_join₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.join a a₁) (kConfiguration.join b a₁)
    | sub_join₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.join a₀ a) (kConfiguration.join a₀ b)
    | sub_«`,»₀ {a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«`,» a a₁) (kConfiguration.«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.«`,» a₀ a) (kConfiguration.«`,» a₀ b)
    | sub_did₀ {a₁ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.did a a₁) (kConfiguration.did b a₁)
    | sub_did₁ {a₀ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.did a₀ a) (kConfiguration.did a₀ b)
    | sub_do₀ {a₁ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.do a a₁) (kConfiguration.do b a₁)
    | sub_do₁ {a₀ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.do a₀ a) (kConfiguration.do a₀ b)
    | sub_does₀ {a₁ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.does a a₁) (kConfiguration.does b a₁)
    | sub_does₁ {a₀ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.does a₀ a) (kConfiguration.does a₀ b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ifthenelsefi a a₁ a₂) (kConfiguration.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ifthenelsefi a₀ a a₂) (kConfiguration.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kConfiguration.rw_one a b →
    kConfiguration.rw_one (kConfiguration.ifthenelsefi a₀ a₁ a) (kConfiguration.ifthenelsefi a₀ a₁ b)
    -- Rewrite rules
    -- rl 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#0:Coordinator[1m[31m |[0m
  --   [0mV#1:AttributeSet[1m[31m,
  --   [0m[0mcontractState : contractState:ContractState[1m[31m,
  --   [0m[0mrules : rules:Set{Rule}[1m[31m,
  --   [0mtime : time:Nat[0m[0m[0m[1m[31m >[0m[0m => 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#0:Coordinator[1m[31m |[0m
  --   [0mtime : if contractStateToStatus contractState:ContractState == Active then s time:Nat else time:Nat fi[1m[31m,
  --   [0m[0mcontractState : deltaTick rules:Set{Rule} contractState:ContractState[1m[31m,
  --   [0m[0mV#1:AttributeSet[1m[31m,
  --   [0mrules : rules:Set{Rule}[0m[0m[0m[1m[31m >[0m[0m [label tick] .
    | rl_tick {coordinator : kAction} {v#0 : kCid} {v#1 : kAttributeSet} {contractstate : kContractState} {rules : k«Set{Rule}»} {time : kFindResult} : coordinator ⊳ MSort.Qid → v#0 ⊳ MSort.Coordinator → v#1 ⊳ MSort.AttributeSet → contractstate ⊳ MSort.ContractState → rules ⊳ MSort.«Set{Rule}» → time ⊳ MSort.Nat → kConfiguration.rw_one (kConfiguration.ltcolonbargt coordinator v#0 (kAttributeSet.«`,» v#1 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«time`colon» time))))) (kConfiguration.ltcolonbargt coordinator v#0 (kAttributeSet.«`,» (kAttributeSet.«time`colon» (kFindResult.ifthenelsefi (kAction.eqeq₂ (kContractStatus.contractStateToStatus contractstate) kContractStatus.Active) (kFindResult.s time) time)) (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.deltaTick rules contractstate)) (kAttributeSet.«`,» v#1 (kAttributeSet.«rules`colon» rules)))))
    -- rl event:Event 
  -- [1m[31m<[0m actorName:Qid[1m[31m :[0m V#2:Actor[1m[31m |[0m
  --   V#3:AttributeSet[1m[31m >[0m 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#4:Coordinator[1m[31m |[0m
  --   [0mV#6:AttributeSet[1m[31m,
  --   [0m[0mcontractState : Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[1m[31m,
  --   [0m[0mrules : rules:Set{Rule}[1m[31m,
  --   [0mtime : V#5:Nat[0m[0m[0m[1m[31m >[0m[0m => ((actorName:Qid does actionName:Qid) 
  -- [1m[31m<[0m coordinator:Qid[1m[31m :[0m V#4:Coordinator[1m[31m |[0m
  --   [0mcontractState : deltaAction rules:Set{Rule} actorName:Qid does actionName:Qid Active (activeRules:Set{Rule}[31m,[0m RULE ruleName:Qid PARTY actorName:Qid deontic:Deontic actionName:Qid WITHIN time:Nat DAY HENCE hence:Set{Qid} LEST lest:Set{Qid})[1m[31m,
  --   [0m[0mrules : rules:Set{Rule}[1m[31m,
  --   [0m[0mV#6:AttributeSet[1m[31m,
  --   [0mtime : V#5:Nat[0m[0m[0m[1m[31m >[0m) 
  -- [1m[31m<[0m actorName:Qid[1m[31m :[0m V#2:Actor[1m[31m |[0m
  --   V#3:AttributeSet[1m[31m >[0m[0m [label action] .
    | rl_action {event : kConfiguration} {actorname : kAction} {v#2 : kCid} {v#3 : kAttributeSet} {coordinator : kAction} {v#4 : kCid} {v#6 : kAttributeSet} {activerules : k«Set{Rule}»} {rulename : kAction} {deontic : kDeontic} {actionname : kAction} {time : kFindResult} {hence lest : kAction} {rules : k«Set{Rule}»} {v#5 : kFindResult} : event ⊳ MSort.Event → actorname ⊳ MSort.Qid → v#2 ⊳ MSort.Actor → v#3 ⊳ MSort.AttributeSet → coordinator ⊳ MSort.Qid → v#4 ⊳ MSort.Coordinator → v#6 ⊳ MSort.AttributeSet → activerules ⊳ MSort.«Set{Rule}» → rulename ⊳ MSort.Qid → actionname ⊳ MSort.Qid → time ⊳ MSort.Nat → hence ⊳ MSort.«Set{Qid}» → lest ⊳ MSort.«Set{Qid}» → rules ⊳ MSort.«Set{Rule}» → v#5 ⊳ MSort.Nat → kConfiguration.rw_one (kConfiguration.join event (kConfiguration.join (kConfiguration.ltcolonbargt actorname v#2 v#3) (kConfiguration.ltcolonbargt coordinator v#4 (kAttributeSet.«`,» v#6 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«time`colon» v#5))))))) (kConfiguration.join (kConfiguration.join (kConfiguration.does actorname actionname) (kConfiguration.ltcolonbargt coordinator v#4 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.deltaAction rules (kConfiguration.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest)))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«`,» v#6 (kAttributeSet.«time`colon» v#5)))))) (kConfiguration.ltcolonbargt actorname v#2 v#3))

  inductive kActiveRule.rw_one: kActiveRule → kActiveRule → Prop
    | eqe_left {a b c : kActiveRule} : a =E b → kActiveRule.rw_one b c → kActiveRule.rw_one a c
    | eqe_right {a b c : kActiveRule} : kActiveRule.rw_one a b → b =E c → kActiveRule.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kCid.rw_one: kCid → kCid → Prop
    | eqe_left {a b c : kCid} : a =E b → kCid.rw_one b c → kCid.rw_one a c
    | eqe_right {a b c : kCid} : kCid.rw_one a b → b =E c → kCid.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_getClass {a b} : kConfiguration.rw_one a b →
    kCid.rw_one (kCid.getClass a) (kCid.getClass b)

  inductive kActorDeonticActionDeadline.rw_one: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | eqe_left {a b c : kActorDeonticActionDeadline} : a =E b → kActorDeonticActionDeadline.rw_one b c → kActorDeonticActionDeadline.rw_one a c
    | eqe_right {a b c : kActorDeonticActionDeadline} : kActorDeonticActionDeadline.rw_one a b → b =E c → kActorDeonticActionDeadline.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_PARTY₀₀ {a₁ a₂ a₃ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b a₁ a₂ a₃)
    | sub_PARTY₀₁ {a₀ a₂ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ a₀ b a₂ a₃)
    | sub_PARTY₀₂ {a₀ a₁ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ b a₃)
    | sub_PARTY₀₃ {a₀ a₁ a₂ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ b)
    | sub_PARTY₁₀ {a₁ a₂ a₃ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b a₁ a₂ a₃)
    | sub_PARTY₁₁ {a₀ a₂ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ a₀ b a₂ a₃)
    | sub_PARTY₁₂ {a₀ a₁ a₃ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ b a₃)
    | sub_PARTY₁₃ {a₀ a₁ a₂ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ b)
    | sub_PARTY₂₀ {a₁ a₂ a₃ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b a₁ a₂ a₃)
    | sub_PARTY₂₁ {a₀ a₂ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ a₀ b a₂ a₃)
    | sub_PARTY₂₂ {a₀ a₁ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ b a₃)
    | sub_PARTY₂₃ {a₀ a₁ a₂ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ b)
    | sub_PARTY₃₀ {a₁ a₂ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b a₁ a₂ a₃)
    | sub_PARTY₃₁ {a₀ a₂ a₃ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ a₀ b a₂ a₃)
    | sub_PARTY₃₂ {a₀ a₁ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ b a₃)
    | sub_PARTY₃₃ {a₀ a₁ a₂ a b} : kAction.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ b)

  inductive kActorState.rw_one: kActorState → kActorState → Prop
    | eqe_left {a b c : kActorState} : a =E b → kActorState.rw_one b c → kActorState.rw_one a c
    | eqe_right {a b c : kActorState} : kActorState.rw_one a b → b =E c → kActorState.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kAttributeSet.rw_one: kAttributeSet → kAttributeSet → Prop
    | eqe_left {a b c : kAttributeSet} : a =E b → kAttributeSet.rw_one b c → kAttributeSet.rw_one a c
    | eqe_right {a b c : kAttributeSet} : kAttributeSet.rw_one a b → b =E c → kAttributeSet.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«`,»₀ {a₁ a b} : kAttributeSet.rw_one a b →
    kAttributeSet.rw_one (kAttributeSet.«`,» a a₁) (kAttributeSet.«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : kAttributeSet.rw_one a b →
    kAttributeSet.rw_one (kAttributeSet.«`,» a₀ a) (kAttributeSet.«`,» a₀ b)
    | sub_«contractState`colon» {a b} : kContractState.rw_one a b →
    kAttributeSet.rw_one (kAttributeSet.«contractState`colon» a) (kAttributeSet.«contractState`colon» b)
    | sub_«rules`colon» {a b} : k«Set{Rule}».rw_one a b →
    kAttributeSet.rw_one (kAttributeSet.«rules`colon» a) (kAttributeSet.«rules`colon» b)
    | sub_«time`colon» {a b} : kFindResult.rw_one a b →
    kAttributeSet.rw_one (kAttributeSet.«time`colon» a) (kAttributeSet.«time`colon» b)

  inductive kString.rw_one: kString → kString → Prop
    | eqe_left {a b c : kString} : a =E b → kString.rw_one b c → kString.rw_one a c
    | eqe_right {a b c : kString} : kString.rw_one a b → b =E c → kString.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_sum₀ {a₁ a b} : kString.rw_one a b →
    kString.rw_one (kString.sum a a₁) (kString.sum b a₁)
    | sub_sum₁ {a₀ a b} : kString.rw_one a b →
    kString.rw_one (kString.sum a₀ a) (kString.sum a₀ b)
    | sub_char {a b} : kFindResult.rw_one a b →
    kString.rw_one (kString.char a) (kString.char b)
    | sub_lowerCase {a b} : kString.rw_one a b →
    kString.rw_one (kString.lowerCase a) (kString.lowerCase b)
    | sub_string {a b} : kAction.rw_one a b →
    kString.rw_one (kString.string a) (kString.string b)
    | sub_substr₀ {a₁ a₂ a b} : kString.rw_one a b →
    kString.rw_one (kString.substr a a₁ a₂) (kString.substr b a₁ a₂)
    | sub_substr₁ {a₀ a₂ a b} : kFindResult.rw_one a b →
    kString.rw_one (kString.substr a₀ a a₂) (kString.substr a₀ b a₂)
    | sub_substr₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kString.rw_one (kString.substr a₀ a₁ a) (kString.substr a₀ a₁ b)
    | sub_upperCase {a b} : kString.rw_one a b →
    kString.rw_one (kString.upperCase a) (kString.upperCase b)

  inductive kContractState.rw_one: kContractState → kContractState → Prop
    | eqe_left {a b c : kContractState} : a =E b → kContractState.rw_one b c → kContractState.rw_one a c
    | eqe_right {a b c : kContractState} : kContractState.rw_one a b → b =E c → kContractState.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_deltaAction₀ {a₁ a₂ a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a a₁ a₂) (kContractState.deltaAction b a₁ a₂)
    | sub_deltaAction₁ {a₀ a₂ a b} : kConfiguration.rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a₀ a a₂) (kContractState.deltaAction a₀ b a₂)
    | sub_deltaAction₂ {a₀ a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a₀ a₁ a) (kContractState.deltaAction a₀ a₁ b)
    | sub_deltaTick₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.deltaTick a a₁) (kContractState.deltaTick b a₁)
    | sub_deltaTick₁ {a₀ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.deltaTick a₀ a) (kContractState.deltaTick a₀ b)
    | sub_Active {a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.Active a) (kContractState.Active b)
    | sub_Breached {a b} : kAction.rw_one a b →
    kContractState.rw_one (kContractState.Breached a) (kContractState.Breached b)
    | sub_pow₀ {a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.pow a a₁) (kContractState.pow b a₁)
    | sub_pow₁ {a₀ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.pow a₀ a) (kContractState.pow a₀ b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a a₁ a₂) (kContractState.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a₀ a a₂) (kContractState.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a₀ a₁ a) (kContractState.ifthenelsefi a₀ a₁ b)

  inductive kContractStatus.rw_one: kContractStatus → kContractStatus → Prop
    | eqe_left {a b c : kContractStatus} : a =E b → kContractStatus.rw_one b c → kContractStatus.rw_one a c
    | eqe_right {a b c : kContractStatus} : kContractStatus.rw_one a b → b =E c → kContractStatus.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_configToStatus {a b} : kConfiguration.rw_one a b →
    kContractStatus.rw_one (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
    | sub_contractStateToStatus {a b} : kContractState.rw_one a b →
    kContractStatus.rw_one (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)

  inductive kDate.rw_one: kDate → kDate → Prop
    | eqe_left {a b c : kDate} : a =E b → kDate.rw_one b c → kDate.rw_one a c
    | eqe_right {a b c : kDate} : kDate.rw_one a b → b =E c → kDate.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kDeadline.rw_one: kDeadline → kDeadline → Prop
    | eqe_left {a b c : kDeadline} : a =E b → kDeadline.rw_one b c → kDeadline.rw_one a c
    | eqe_right {a b c : kDeadline} : kDeadline.rw_one a b → b =E c → kDeadline.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_BY {a b} : kFindResult.rw_one a b →
    kDeadline.rw_one (kDeadline.BY a) (kDeadline.BY b)
    | sub_WITHIN {a b} : kDuration.rw_one a b →
    kDeadline.rw_one (kDeadline.WITHIN a) (kDeadline.WITHIN b)

  inductive kDeontic.rw_one: kDeontic → kDeontic → Prop
    | eqe_left {a b c : kDeontic} : a =E b → kDeontic.rw_one b c → kDeontic.rw_one a c
    | eqe_right {a b c : kDeontic} : kDeontic.rw_one a b → b =E c → kDeontic.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kDuration.rw_one: kDuration → kDuration → Prop
    | eqe_left {a b c : kDuration} : a =E b → kDuration.rw_one b c → kDuration.rw_one a c
    | eqe_right {a b c : kDuration} : kDuration.rw_one a b → b =E c → kDuration.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_DAY {a b} : kFindResult.rw_one a b →
    kDuration.rw_one (kDuration.DAY a) (kDuration.DAY b)
    | sub_MONTH {a b} : kFindResult.rw_one a b →
    kDuration.rw_one (kDuration.MONTH a) (kDuration.MONTH b)
    | sub_WEEK {a b} : kFindResult.rw_one a b →
    kDuration.rw_one (kDuration.WEEK a) (kDuration.WEEK b)
    | sub_YEAR {a b} : kFindResult.rw_one a b →
    kDuration.rw_one (kDuration.YEAR a) (kDuration.YEAR b)

  inductive kFindResult.rw_one: kFindResult → kFindResult → Prop
    | eqe_left {a b c : kFindResult} : a =E b → kFindResult.rw_one b c → kFindResult.rw_one a c
    | eqe_right {a b c : kFindResult} : kFindResult.rw_one a b → b =E c → kFindResult.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«$card»₀₀ {a₁ a b} : kConfiguration.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₀ a a₁) (kFindResult.«$card»₀ b a₁)
    | sub_«$card»₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₀ a₀ a) (kFindResult.«$card»₀ a₀ b)
    | sub_«$card»₁₀ {a₁ a b} : kAction.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₁ a a₁) (kFindResult.«$card»₁ b a₁)
    | sub_«$card»₁₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₁ a₀ a) (kFindResult.«$card»₁ a₀ b)
    | sub_«$card»₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₂ a a₁) (kFindResult.«$card»₂ b a₁)
    | sub_«$card»₂₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₂ a₀ a) (kFindResult.«$card»₂ a₀ b)
    | sub_barbar₀ {a b} : kConfiguration.rw_one a b →
    kFindResult.rw_one (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
    | sub_barbar₁ {a b} : kAction.rw_one a b →
    kFindResult.rw_one (kFindResult.barbar₁ a) (kFindResult.barbar₁ b)
    | sub_barbar₂ {a b} : k«Set{Rule}».rw_one a b →
    kFindResult.rw_one (kFindResult.barbar₂ a) (kFindResult.barbar₂ b)
    | sub_amp₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.amp a a₁) (kFindResult.amp b a₁)
    | sub_amp₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.amp a₀ a) (kFindResult.amp a₀ b)
    | sub_mul₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.mul a a₁) (kFindResult.mul b a₁)
    | sub_mul₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.mul a₀ a) (kFindResult.mul a₀ b)
    | sub_sum₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.sum a a₁) (kFindResult.sum b a₁)
    | sub_sum₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.sum a₀ a) (kFindResult.sum a₀ b)
    | sub_ltlt₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ltlt a a₁) (kFindResult.ltlt b a₁)
    | sub_ltlt₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ltlt a₀ a) (kFindResult.ltlt a₀ b)
    | sub_gtgt₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.gtgt a a₁) (kFindResult.gtgt b a₁)
    | sub_gtgt₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.gtgt a₀ a) (kFindResult.gtgt a₀ b)
    | sub_pow₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.pow a a₁) (kFindResult.pow b a₁)
    | sub_pow₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.pow a₀ a) (kFindResult.pow a₀ b)
    | sub_quo₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.quo a a₁) (kFindResult.quo b a₁)
    | sub_quo₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.quo a₀ a) (kFindResult.quo a₀ b)
    | sub_rem₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.rem a a₁) (kFindResult.rem b a₁)
    | sub_rem₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.rem a₀ a) (kFindResult.rem a₀ b)
    | sub_xor₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.xor a a₁) (kFindResult.xor b a₁)
    | sub_xor₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.xor a₀ a) (kFindResult.xor a₀ b)
    | sub_bar₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.bar a a₁) (kFindResult.bar b a₁)
    | sub_bar₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.bar a₀ a) (kFindResult.bar a₀ b)
    | sub_ascii {a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.ascii a) (kFindResult.ascii b)
    | sub_find₀ {a₁ a₂ a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.find a a₁ a₂) (kFindResult.find b a₁ a₂)
    | sub_find₁ {a₀ a₂ a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.find a₀ a a₂) (kFindResult.find a₀ b a₂)
    | sub_find₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.find a₀ a₁ a) (kFindResult.find a₀ a₁ b)
    | sub_gcd₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.gcd a a₁) (kFindResult.gcd b a₁)
    | sub_gcd₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.gcd a₀ a) (kFindResult.gcd a₀ b)
    | sub_lcm₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.lcm a a₁) (kFindResult.lcm b a₁)
    | sub_lcm₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.lcm a₀ a) (kFindResult.lcm a₀ b)
    | sub_length {a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.length a) (kFindResult.length b)
    | sub_max₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.max a a₁) (kFindResult.max b a₁)
    | sub_max₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.max a₀ a) (kFindResult.max a₀ b)
    | sub_min₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.min a a₁) (kFindResult.min b a₁)
    | sub_min₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.min a₀ a) (kFindResult.min a₀ b)
    | sub_modExp₀ {a₁ a₂ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.modExp a a₁ a₂) (kFindResult.modExp b a₁ a₂)
    | sub_modExp₁ {a₀ a₂ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.modExp a₀ a a₂) (kFindResult.modExp a₀ b a₂)
    | sub_modExp₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.modExp a₀ a₁ a) (kFindResult.modExp a₀ a₁ b)
    | sub_rfind₀ {a₁ a₂ a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.rfind a a₁ a₂) (kFindResult.rfind b a₁ a₂)
    | sub_rfind₁ {a₀ a₂ a b} : kString.rw_one a b →
    kFindResult.rw_one (kFindResult.rfind a₀ a a₂) (kFindResult.rfind a₀ b a₂)
    | sub_rfind₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.rfind a₀ a₁ a) (kFindResult.rfind a₀ a₁ b)
    | sub_s {a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.s a) (kFindResult.s b)
    | sub_sd₀ {a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.sd a a₁) (kFindResult.sd b a₁)
    | sub_sd₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.sd a₀ a) (kFindResult.sd a₀ b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kAction.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a a₁ a₂) (kFindResult.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a₀ a a₂) (kFindResult.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a₀ a₁ a) (kFindResult.ifthenelsefi a₀ a₁ b)

  inductive kHenceLest.rw_one: kHenceLest → kHenceLest → Prop
    | eqe_left {a b c : kHenceLest} : a =E b → kHenceLest.rw_one b c → kHenceLest.rw_one a c
    | eqe_right {a b c : kHenceLest} : kHenceLest.rw_one a b → b =E c → kHenceLest.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_HENCE {a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | sub_HENCELEST₀ {a₁ a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCELEST a a₁) (kHenceLest.HENCELEST b a₁)
    | sub_HENCELEST₁ {a₀ a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCELEST a₀ a) (kHenceLest.HENCELEST a₀ b)
    | sub_LEST {a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LEST a) (kHenceLest.LEST b)
    | sub_LESTHENCE₀ {a₁ a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LESTHENCE a a₁) (kHenceLest.LESTHENCE b a₁)
    | sub_LESTHENCE₁ {a₀ a b} : kAction.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LESTHENCE a₀ a) (kHenceLest.LESTHENCE a₀ b)

  inductive k«Set{Rule}».rw_one: k«Set{Rule}» → k«Set{Rule}» → Prop
    | eqe_left {a b c : k«Set{Rule}»} : a =E b → k«Set{Rule}».rw_one b c → k«Set{Rule}».rw_one a c
    | eqe_right {a b c : k«Set{Rule}»} : k«Set{Rule}».rw_one a b → b =E c → k«Set{Rule}».rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«$diff»₀ {a₁ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$diff» a a₁ a₂) (k«Set{Rule}».«$diff» b a₁ a₂)
    | sub_«$diff»₁ {a₀ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$diff» a₀ a a₂) (k«Set{Rule}».«$diff» a₀ b a₂)
    | sub_«$diff»₂ {a₀ a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$diff» a₀ a₁ a) (k«Set{Rule}».«$diff» a₀ a₁ b)
    | sub_«$intersect»₀ {a₁ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$intersect» a a₁ a₂) (k«Set{Rule}».«$intersect» b a₁ a₂)
    | sub_«$intersect»₁ {a₀ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$intersect» a₀ a a₂) (k«Set{Rule}».«$intersect» a₀ b a₂)
    | sub_«$intersect»₂ {a₀ a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«$intersect» a₀ a₁ a) (k«Set{Rule}».«$intersect» a₀ a₁ b)
    | sub_delete₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».delete a a₁) (k«Set{Rule}».delete b a₁)
    | sub_delete₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».delete a₀ a) (k«Set{Rule}».delete a₀ b)
    | sub_getRulesWithNames₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».getRulesWithNames a a₁) (k«Set{Rule}».getRulesWithNames b a₁)
    | sub_getRulesWithNames₁ {a₀ a b} : kAction.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».getRulesWithNames a₀ a) (k«Set{Rule}».getRulesWithNames a₀ b)
    | sub_insert₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».insert a a₁) (k«Set{Rule}».insert b a₁)
    | sub_insert₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».insert a₀ a) (k«Set{Rule}».insert a₀ b)
    | sub_intersection₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».intersection a a₁) (k«Set{Rule}».intersection b a₁)
    | sub_intersection₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».intersection a₀ a) (k«Set{Rule}».intersection a₀ b)
    | sub_union₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».union a a₁) (k«Set{Rule}».union b a₁)
    | sub_union₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».union a₀ a) (k«Set{Rule}».union a₀ b)
    | sub_RULE₀₀ {a₁ a b} : kAction.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₀ a a₁) (k«Set{Rule}».RULE₀ b a₁)
    | sub_RULE₀₁ {a₀ a b} : kActorDeonticActionDeadline.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₀ a₀ a) (k«Set{Rule}».RULE₀ a₀ b)
    | sub_RULE₁₀ {a₁ a₂ a b} : kAction.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₁ a a₁ a₂) (k«Set{Rule}».RULE₁ b a₁ a₂)
    | sub_RULE₁₁ {a₀ a₂ a b} : kActorDeonticActionDeadline.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₁ a₀ a a₂) (k«Set{Rule}».RULE₁ a₀ b a₂)
    | sub_RULE₁₂ {a₀ a₁ a b} : kHenceLest.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₁ a₀ a₁ a) (k«Set{Rule}».RULE₁ a₀ a₁ b)
    | sub_bslash₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».bslash a a₁) (k«Set{Rule}».bslash b a₁)
    | sub_bslash₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».bslash a₀ a) (k«Set{Rule}».bslash a₀ b)
    | sub_«`,»₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«`,» a a₁) (k«Set{Rule}».«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».«`,» a₀ a) (k«Set{Rule}».«`,» a₀ b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kAction.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a a₁ a₂) (k«Set{Rule}».ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a₀ a a₂) (k«Set{Rule}».ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a₀ a₁ a) (k«Set{Rule}».ifthenelsefi a₀ a₁ b)

  inductive kAction.rw_star: kAction → kAction → Prop
    | step {a b} : kAction.rw_one a b → kAction.rw_star a b
    | refl {a b : kAction} : a =E b → kAction.rw_star a b
    | trans {a b c} : kAction.rw_star a b → kAction.rw_star b c → kAction.rw_star a c

  inductive kConfiguration.rw_star: kConfiguration → kConfiguration → Prop
    | step {a b} : kConfiguration.rw_one a b → kConfiguration.rw_star a b
    | refl {a b : kConfiguration} : a =E b → kConfiguration.rw_star a b
    | trans {a b c} : kConfiguration.rw_star a b → kConfiguration.rw_star b c → kConfiguration.rw_star a c

  inductive kActiveRule.rw_star: kActiveRule → kActiveRule → Prop
    | step {a b} : kActiveRule.rw_one a b → kActiveRule.rw_star a b
    | refl {a b : kActiveRule} : a =E b → kActiveRule.rw_star a b
    | trans {a b c} : kActiveRule.rw_star a b → kActiveRule.rw_star b c → kActiveRule.rw_star a c

  inductive kCid.rw_star: kCid → kCid → Prop
    | step {a b} : kCid.rw_one a b → kCid.rw_star a b
    | refl {a b : kCid} : a =E b → kCid.rw_star a b
    | trans {a b c} : kCid.rw_star a b → kCid.rw_star b c → kCid.rw_star a c

  inductive kActorDeonticActionDeadline.rw_star: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | step {a b} : kActorDeonticActionDeadline.rw_one a b → kActorDeonticActionDeadline.rw_star a b
    | refl {a b : kActorDeonticActionDeadline} : a =E b → kActorDeonticActionDeadline.rw_star a b
    | trans {a b c} : kActorDeonticActionDeadline.rw_star a b → kActorDeonticActionDeadline.rw_star b c → kActorDeonticActionDeadline.rw_star a c

  inductive kActorState.rw_star: kActorState → kActorState → Prop
    | step {a b} : kActorState.rw_one a b → kActorState.rw_star a b
    | refl {a b : kActorState} : a =E b → kActorState.rw_star a b
    | trans {a b c} : kActorState.rw_star a b → kActorState.rw_star b c → kActorState.rw_star a c

  inductive kAttributeSet.rw_star: kAttributeSet → kAttributeSet → Prop
    | step {a b} : kAttributeSet.rw_one a b → kAttributeSet.rw_star a b
    | refl {a b : kAttributeSet} : a =E b → kAttributeSet.rw_star a b
    | trans {a b c} : kAttributeSet.rw_star a b → kAttributeSet.rw_star b c → kAttributeSet.rw_star a c

  inductive kString.rw_star: kString → kString → Prop
    | step {a b} : kString.rw_one a b → kString.rw_star a b
    | refl {a b : kString} : a =E b → kString.rw_star a b
    | trans {a b c} : kString.rw_star a b → kString.rw_star b c → kString.rw_star a c

  inductive kContractState.rw_star: kContractState → kContractState → Prop
    | step {a b} : kContractState.rw_one a b → kContractState.rw_star a b
    | refl {a b : kContractState} : a =E b → kContractState.rw_star a b
    | trans {a b c} : kContractState.rw_star a b → kContractState.rw_star b c → kContractState.rw_star a c

  inductive kContractStatus.rw_star: kContractStatus → kContractStatus → Prop
    | step {a b} : kContractStatus.rw_one a b → kContractStatus.rw_star a b
    | refl {a b : kContractStatus} : a =E b → kContractStatus.rw_star a b
    | trans {a b c} : kContractStatus.rw_star a b → kContractStatus.rw_star b c → kContractStatus.rw_star a c

  inductive kDate.rw_star: kDate → kDate → Prop
    | step {a b} : kDate.rw_one a b → kDate.rw_star a b
    | refl {a b : kDate} : a =E b → kDate.rw_star a b
    | trans {a b c} : kDate.rw_star a b → kDate.rw_star b c → kDate.rw_star a c

  inductive kDeadline.rw_star: kDeadline → kDeadline → Prop
    | step {a b} : kDeadline.rw_one a b → kDeadline.rw_star a b
    | refl {a b : kDeadline} : a =E b → kDeadline.rw_star a b
    | trans {a b c} : kDeadline.rw_star a b → kDeadline.rw_star b c → kDeadline.rw_star a c

  inductive kDeontic.rw_star: kDeontic → kDeontic → Prop
    | step {a b} : kDeontic.rw_one a b → kDeontic.rw_star a b
    | refl {a b : kDeontic} : a =E b → kDeontic.rw_star a b
    | trans {a b c} : kDeontic.rw_star a b → kDeontic.rw_star b c → kDeontic.rw_star a c

  inductive kDuration.rw_star: kDuration → kDuration → Prop
    | step {a b} : kDuration.rw_one a b → kDuration.rw_star a b
    | refl {a b : kDuration} : a =E b → kDuration.rw_star a b
    | trans {a b c} : kDuration.rw_star a b → kDuration.rw_star b c → kDuration.rw_star a c

  inductive kFindResult.rw_star: kFindResult → kFindResult → Prop
    | step {a b} : kFindResult.rw_one a b → kFindResult.rw_star a b
    | refl {a b : kFindResult} : a =E b → kFindResult.rw_star a b
    | trans {a b c} : kFindResult.rw_star a b → kFindResult.rw_star b c → kFindResult.rw_star a c

  inductive kHenceLest.rw_star: kHenceLest → kHenceLest → Prop
    | step {a b} : kHenceLest.rw_one a b → kHenceLest.rw_star a b
    | refl {a b : kHenceLest} : a =E b → kHenceLest.rw_star a b
    | trans {a b c} : kHenceLest.rw_star a b → kHenceLest.rw_star b c → kHenceLest.rw_star a c

  inductive k«Set{Rule}».rw_star: k«Set{Rule}» → k«Set{Rule}» → Prop
    | step {a b} : k«Set{Rule}».rw_one a b → k«Set{Rule}».rw_star a b
    | refl {a b : k«Set{Rule}»} : a =E b → k«Set{Rule}».rw_star a b
    | trans {a b c} : k«Set{Rule}».rw_star a b → k«Set{Rule}».rw_star b c → k«Set{Rule}».rw_star a c

end
infix:40 " =>1 " => kAction.rw_one
infix:40 " =>1 " => kConfiguration.rw_one
infix:40 " =>1 " => kActiveRule.rw_one
infix:40 " =>1 " => kCid.rw_one
infix:40 " =>1 " => kActorDeonticActionDeadline.rw_one
infix:40 " =>1 " => kActorState.rw_one
infix:40 " =>1 " => kAttributeSet.rw_one
infix:40 " =>1 " => kString.rw_one
infix:40 " =>1 " => kContractState.rw_one
infix:40 " =>1 " => kContractStatus.rw_one
infix:40 " =>1 " => kDate.rw_one
infix:40 " =>1 " => kDeadline.rw_one
infix:40 " =>1 " => kDeontic.rw_one
infix:40 " =>1 " => kDuration.rw_one
infix:40 " =>1 " => kFindResult.rw_one
infix:40 " =>1 " => kHenceLest.rw_one
infix:40 " =>1 " => k«Set{Rule}».rw_one

infix:40 " =>* " => kAction.rw_star
infix:40 " =>* " => kConfiguration.rw_star
infix:40 " =>* " => kActiveRule.rw_star
infix:40 " =>* " => kCid.rw_star
infix:40 " =>* " => kActorDeonticActionDeadline.rw_star
infix:40 " =>* " => kActorState.rw_star
infix:40 " =>* " => kAttributeSet.rw_star
infix:40 " =>* " => kString.rw_star
infix:40 " =>* " => kContractState.rw_star
infix:40 " =>* " => kContractStatus.rw_star
infix:40 " =>* " => kDate.rw_star
infix:40 " =>* " => kDeadline.rw_star
infix:40 " =>* " => kDeontic.rw_star
infix:40 " =>* " => kDuration.rw_star
infix:40 " =>* " => kFindResult.rw_star
infix:40 " =>* " => kHenceLest.rw_star
infix:40 " =>* " => k«Set{Rule}».rw_star

-- Lemmas and aliases

/-- Congruence lemma for generic relations -/
theorem generic_congr {α : Type} {rl ru : α → α → Prop}
  (cleft : ∀ {x y z}, rl x y → ru y z → ru x z)
  (cright : ∀ {x y z}, ru x y → rl y z → ru x z)
  (asymm : ∀ {x y}, rl x y → rl y x)
  {a₀ a₁ b₀ b₁ : α} : rl a₀ b₀ → rl a₁ b₁ → (ru a₀ a₁) = (ru b₀ b₁) :=
by
  intros h₀ h₁
  apply propext
  apply Iff.intro
  intro h
  exact cright (cleft (asymm h₀) h) h₁
  intro h
  exact cright (cleft h₀ h) (asymm h₁)


namespace kAction
  -- Sort membership lemmas
  theorem subsort_qid_action {t : kAction} : t ⊳ MSort.Qid →
    t ⊳ MSort.Action := by apply has_sort.subsort; simp [subsort]
  theorem subsort_names_«set{qid}» {t : kAction} : t ⊳ MSort.Names →
    t ⊳ MSort.«Set{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_«neset{qid}»_«set{qid}» {t : kAction} : t ⊳ MSort.«NeSet{Qid}» →
    t ⊳ MSort.«Set{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_oid_id {t : kAction} : t ⊳ MSort.Oid →
    t ⊳ MSort.Id := by apply has_sort.subsort; simp [subsort]
  theorem subsort_bool_situation {t : kAction} : t ⊳ MSort.Bool →
    t ⊳ MSort.Situation := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_situation {t : kAction} : t ⊳ MSort.Qid →
    t ⊳ MSort.Situation := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_names {t : kAction} : t ⊳ MSort.Qid →
    t ⊳ MSort.Names := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_«neset{qid}» {t : kAction} : t ⊳ MSort.Qid →
    t ⊳ MSort.«NeSet{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_oid {t : kAction} : t ⊳ MSort.Qid →
    t ⊳ MSort.Oid := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kAction) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kAction} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kAction} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kAction} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def and_comm := @eqa.and_comm
  def and_assoc := @eqa.and_assoc
  def or_comm := @eqa.or_comm
  def or_assoc := @eqa.or_assoc
  def xor_comm := @eqa.xor_comm
  def xor_assoc := @eqa.xor_assoc
  def AND_comm := @eqa.AND_comm
  def AND_assoc := @eqa.AND_assoc
  def «`,»_comm := @eqa.«`,»_comm
  def «`,»_assoc := @eqa.«`,»_assoc
  def true_decl₀ := @has_sort.true_decl₀
  def true_decl₁ := @has_sort.true_decl₁
  def false_decl₀ := @has_sort.false_decl₀
  def false_decl₁ := @has_sort.false_decl₁
  def and_decl₀ := @has_sort.and_decl₀
  def and_decl₁ := @has_sort.and_decl₁
  def or_decl₀ := @has_sort.or_decl₀
  def or_decl₁ := @has_sort.or_decl₁
  def xor_decl₀ := @has_sort.xor_decl₀
  def xor_decl₁ := @has_sort.xor_decl₁
  def not_decl₀ := @has_sort.not_decl₀
  def not_decl₁ := @has_sort.not_decl₁
  def implies_decl₀ := @has_sort.implies_decl₀
  def implies_decl₁ := @has_sort.implies_decl₁
  def «$diff»_decl := @has_sort.«$diff»_decl
  def «$intersect»_decl := @has_sort.«$intersect»_decl
  def NOTHING_decl := @has_sort.NOTHING_decl
  def containsActor_decl := @has_sort.containsActor_decl
  def containsRuleWithEvent_decl := @has_sort.containsRuleWithEvent_decl
  def «in»₀_decl := @has_sort.«in»₀_decl
  def «in»₁_decl := @has_sort.«in»₁_decl
  def «in»₂_decl := @has_sort.«in»₂_decl
  def psubset₀_decl := @has_sort.psubset₀_decl
  def psubset₁_decl := @has_sort.psubset₁_decl
  def psubset₂_decl := @has_sort.psubset₂_decl
  def subset₀_decl := @has_sort.subset₀_decl
  def subset₁_decl := @has_sort.subset₁_decl
  def subset₂_decl := @has_sort.subset₂_decl
  def delete_decl := @has_sort.delete_decl
  def insert_decl := @has_sort.insert_decl
  def intersection_decl := @has_sort.intersection_decl
  def union_decl₀ := @has_sort.union_decl₀
  def union_decl₁ := @has_sort.union_decl₁
  def union_decl₂ := @has_sort.union_decl₂
  def ltQidsgt_decl := @has_sort.ltQidsgt_decl
  def DO_decl := @has_sort.DO_decl
  def lteq₀_decl := @has_sort.lteq₀_decl
  def lteq₁_decl := @has_sort.lteq₁_decl
  def lt₀_decl := @has_sort.lt₀_decl
  def lt₁_decl := @has_sort.lt₁_decl
  def gteq₀_decl := @has_sort.gteq₀_decl
  def gteq₁_decl := @has_sort.gteq₁_decl
  def gt₀_decl := @has_sort.gt₀_decl
  def gt₁_decl := @has_sort.gt₁_decl
  def AND_decl := @has_sort.AND_decl
  def bslash_decl := @has_sort.bslash_decl
  def «`,»_decl₀ := @has_sort.«`,»_decl₀
  def «`,»_decl₁ := @has_sort.«`,»_decl₁
  def «`,»_decl₂ := @has_sort.«`,»_decl₂
  def andsubthen_decl := @has_sort.andsubthen_decl
  def divides_decl := @has_sort.divides_decl
  def orsubelse_decl := @has_sort.orsubelse_decl
  def empty_decl := @has_sort.empty_decl
  def ifthenelsefi_decl₁ := @has_sort.ifthenelsefi_decl₁
  def ifthenelsefi_decl₂ := @has_sort.ifthenelsefi_decl₂
  def ifthenelsefi_decl₃ := @has_sort.ifthenelsefi_decl₃
  def ifthenelsefi_decl₄ := @has_sort.ifthenelsefi_decl₄
  def ifthenelsefi_decl₅ := @has_sort.ifthenelsefi_decl₅
  def ifthenelsefi_decl₆ := @has_sort.ifthenelsefi_decl₆
  def ifthenelsefi_decl₇ := @has_sort.ifthenelsefi_decl₇
  def ifthenelsefi_decl₈ := @has_sort.ifthenelsefi_decl₈
  def ifthenelsefi_decl₉ := @has_sort.ifthenelsefi_decl₉
  def eqslasheq₀_decl := @has_sort.eqslasheq₀_decl
  def eqslasheq₁_decl := @has_sort.eqslasheq₁_decl
  def eqslasheq₂_decl := @has_sort.eqslasheq₂_decl
  def eqeq₀_decl := @has_sort.eqeq₀_decl
  def eqeq₁_decl := @has_sort.eqeq₁_decl
  def eqeq₂_decl := @has_sort.eqeq₂_decl
  def eqa_and := @eqa.eqa_and
  def eqe_and := @eqe.eqe_and
  def eqa_or := @eqa.eqa_or
  def eqe_or := @eqe.eqe_or
  def eqa_xor := @eqa.eqa_xor
  def eqe_xor := @eqe.eqe_xor
  def eqa_not := @eqa.eqa_not
  def eqe_not := @eqe.eqe_not
  def eqa_implies := @eqa.eqa_implies
  def eqe_implies := @eqe.eqe_implies
  def eqa_«$diff» := @eqa.eqa_«$diff»
  def eqe_«$diff» := @eqe.eqe_«$diff»
  def eqa_«$intersect» := @eqa.eqa_«$intersect»
  def eqe_«$intersect» := @eqe.eqe_«$intersect»
  def eqa_containsActor := @eqa.eqa_containsActor
  def eqe_containsActor := @eqe.eqe_containsActor
  def eqa_containsRuleWithEvent := @eqa.eqa_containsRuleWithEvent
  def eqe_containsRuleWithEvent := @eqe.eqe_containsRuleWithEvent
  def eqa_«in»₀ := @eqa.eqa_«in»₀
  def eqe_«in»₀ := @eqe.eqe_«in»₀
  def eqa_«in»₁ := @eqa.eqa_«in»₁
  def eqe_«in»₁ := @eqe.eqe_«in»₁
  def eqa_«in»₂ := @eqa.eqa_«in»₂
  def eqe_«in»₂ := @eqe.eqe_«in»₂
  def eqa_psubset₀ := @eqa.eqa_psubset₀
  def eqe_psubset₀ := @eqe.eqe_psubset₀
  def eqa_psubset₁ := @eqa.eqa_psubset₁
  def eqe_psubset₁ := @eqe.eqe_psubset₁
  def eqa_psubset₂ := @eqa.eqa_psubset₂
  def eqe_psubset₂ := @eqe.eqe_psubset₂
  def eqa_subset₀ := @eqa.eqa_subset₀
  def eqe_subset₀ := @eqe.eqe_subset₀
  def eqa_subset₁ := @eqa.eqa_subset₁
  def eqe_subset₁ := @eqe.eqe_subset₁
  def eqa_subset₂ := @eqa.eqa_subset₂
  def eqe_subset₂ := @eqe.eqe_subset₂
  def eqa_delete := @eqa.eqa_delete
  def eqe_delete := @eqe.eqe_delete
  def eqa_insert := @eqa.eqa_insert
  def eqe_insert := @eqe.eqe_insert
  def eqa_intersection := @eqa.eqa_intersection
  def eqe_intersection := @eqe.eqe_intersection
  def eqa_union := @eqa.eqa_union
  def eqe_union := @eqe.eqe_union
  def eqa_DO := @eqa.eqa_DO
  def eqe_DO := @eqe.eqe_DO
  def eqa_lteq₀ := @eqa.eqa_lteq₀
  def eqe_lteq₀ := @eqe.eqe_lteq₀
  def eqa_lteq₁ := @eqa.eqa_lteq₁
  def eqe_lteq₁ := @eqe.eqe_lteq₁
  def eqa_lt₀ := @eqa.eqa_lt₀
  def eqe_lt₀ := @eqe.eqe_lt₀
  def eqa_lt₁ := @eqa.eqa_lt₁
  def eqe_lt₁ := @eqe.eqe_lt₁
  def eqa_gteq₀ := @eqa.eqa_gteq₀
  def eqe_gteq₀ := @eqe.eqe_gteq₀
  def eqa_gteq₁ := @eqa.eqa_gteq₁
  def eqe_gteq₁ := @eqe.eqe_gteq₁
  def eqa_gt₀ := @eqa.eqa_gt₀
  def eqe_gt₀ := @eqe.eqe_gt₀
  def eqa_gt₁ := @eqa.eqa_gt₁
  def eqe_gt₁ := @eqe.eqe_gt₁
  def eqa_AND := @eqa.eqa_AND
  def eqe_AND := @eqe.eqe_AND
  def eqa_bslash := @eqa.eqa_bslash
  def eqe_bslash := @eqe.eqe_bslash
  def eqa_«`,» := @eqa.eqa_«`,»
  def eqe_«`,» := @eqe.eqe_«`,»
  def eqa_andsubthen := @eqa.eqa_andsubthen
  def eqe_andsubthen := @eqe.eqe_andsubthen
  def eqa_divides := @eqa.eqa_divides
  def eqe_divides := @eqe.eqe_divides
  def eqa_orsubelse := @eqa.eqa_orsubelse
  def eqe_orsubelse := @eqe.eqe_orsubelse
  def eqa_qid := @eqa.eqa_qid
  def eqe_qid := @eqe.eqe_qid
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eqa_eqslasheq₀ := @eqa.eqa_eqslasheq₀
  def eqe_eqslasheq₀ := @eqe.eqe_eqslasheq₀
  def eqa_eqslasheq₁ := @eqa.eqa_eqslasheq₁
  def eqe_eqslasheq₁ := @eqe.eqe_eqslasheq₁
  def eqa_eqslasheq₂ := @eqa.eqa_eqslasheq₂
  def eqe_eqslasheq₂ := @eqe.eqe_eqslasheq₂
  def eqa_eqeq₀ := @eqa.eqa_eqeq₀
  def eqe_eqeq₀ := @eqe.eqe_eqeq₀
  def eqa_eqeq₁ := @eqa.eqa_eqeq₁
  def eqe_eqeq₁ := @eqe.eqe_eqeq₁
  def eqa_eqeq₂ := @eqa.eqa_eqeq₂
  def eqe_eqeq₂ := @eqe.eqe_eqeq₂
  def eq_NOTHING := @eqe.eq_NOTHING
  def eq_«$diff»₀ := @eqe.eq_«$diff»₀
  def eq_«$diff»₁ := @eqe.eq_«$diff»₁
  def eq_«$intersect»₀ := @eqe.eq_«$intersect»₀
  def eq_«$intersect»₁ := @eqe.eq_«$intersect»₁
  def eq_DO := @eqe.eq_DO
  def eq_AND := @eqe.eq_AND
  def eq_bslash₀ := @eqe.eq_bslash₀
  def eq_bslash₁ := @eqe.eq_bslash₁
  def eq_«`,» := @eqe.eq_«`,»
  def eq_andsubthen₀ := @eqe.eq_andsubthen₀
  def eq_andsubthen₁ := @eqe.eq_andsubthen₁
  def eq_and₀ := @eqe.eq_and₀
  def eq_and₁ := @eqe.eq_and₁
  def eq_and₂ := @eqe.eq_and₂
  def eq_and₃ := @eqe.eq_and₃
  def eq_containsActor₀ := @eqe.eq_containsActor₀
  def eq_containsRuleWithEvent₀ := @eqe.eq_containsRuleWithEvent₀
  def eq_implies₀ := @eqe.eq_implies₀
  def eq_«in»₀₀ := @eqe.eq_«in»₀₀
  def eq_«in»₁₀ := @eqe.eq_«in»₁₀
  def eq_«in»₂₀ := @eqe.eq_«in»₂₀
  def eq_orsubelse₀ := @eqe.eq_orsubelse₀
  def eq_orsubelse₁ := @eqe.eq_orsubelse₁
  def eq_or₀ := @eqe.eq_or₀
  def eq_psubset₀ := @eqe.eq_psubset₀
  def eq_psubset₁ := @eqe.eq_psubset₁
  def eq_psubset₂ := @eqe.eq_psubset₂
  def eq_subset₀₀ := @eqe.eq_subset₀₀
  def eq_subset₁₀ := @eqe.eq_subset₁₀
  def eq_subset₂₀ := @eqe.eq_subset₂₀
  def eq_subset₀₁ := @eqe.eq_subset₀₁
  def eq_subset₁₁ := @eqe.eq_subset₁₁
  def eq_subset₂₁ := @eqe.eq_subset₂₁
  def eq_xor₀ := @eqe.eq_xor₀
  def eq_xor₁ := @eqe.eq_xor₁
  def eq_delete₀ := @eqe.eq_delete₀
  def eq_insert := @eqe.eq_insert
  def eq_intersection₀ := @eqe.eq_intersection₀
  def eq_intersection₁ := @eqe.eq_intersection₁
  def eq_not₀ := @eqe.eq_not₀
  def eq_union := @eqe.eq_union
  def eq_containsActor₁ := @eqe.eq_containsActor₁
  def eq_containsRuleWithEvent₁ := @eqe.eq_containsRuleWithEvent₁
  def eq_«in»₀₁ := @eqe.eq_«in»₀₁
  def eq_«in»₁₁ := @eqe.eq_«in»₁₁
  def eq_«in»₂₁ := @eqe.eq_«in»₂₁
  def eq_delete₁ := @eqe.eq_delete₁
  def eq_and₄ := @eqe.eq_and₄
  def eq_and₅ := @eqe.eq_and₅
  def eq_and₆ := @eqe.eq_and₆
  def eq_xor₂ := @eqe.eq_xor₂
  def eq_xor₃ := @eqe.eq_xor₃
  def eq_and₇ := @eqe.eq_and₇
  def eq_not₁ := @eqe.eq_not₁
  def eq_or₁ := @eqe.eq_or₁
  def eq_implies₁ := @eqe.eq_implies₁
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef
  def eq_eqslasheq₀ := @eqe.eq_eqslasheq₀
  def eq_eqslasheq₁ := @eqe.eq_eqslasheq₁
  def eq_eqslasheq₂ := @eqe.eq_eqslasheq₂
  def eq_eqeq₀ := @eqe.eq_eqeq₀
  def eq_eqeq₁ := @eqe.eq_eqeq₁
  def eq_eqeq₂ := @eqe.eq_eqeq₂

  attribute [simp] has_sort.true_decl₀ has_sort.true_decl₁ has_sort.false_decl₀ has_sort.false_decl₁ has_sort.and_decl₀ has_sort.and_decl₁ has_sort.or_decl₀ has_sort.or_decl₁ has_sort.xor_decl₀ has_sort.xor_decl₁ has_sort.not_decl₀ has_sort.not_decl₁ has_sort.implies_decl₀ has_sort.implies_decl₁ has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.NOTHING_decl has_sort.containsActor_decl has_sort.containsRuleWithEvent_decl has_sort.«in»₀_decl has_sort.«in»₁_decl has_sort.«in»₂_decl has_sort.psubset₀_decl has_sort.psubset₁_decl has_sort.psubset₂_decl has_sort.subset₀_decl has_sort.subset₁_decl has_sort.subset₂_decl has_sort.delete_decl has_sort.insert_decl has_sort.intersection_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.ltQidsgt_decl has_sort.DO_decl has_sort.lteq₀_decl has_sort.lteq₁_decl has_sort.lt₀_decl has_sort.lt₁_decl has_sort.gteq₀_decl has_sort.gteq₁_decl has_sort.gt₀_decl has_sort.gt₁_decl has_sort.AND_decl has_sort.bslash_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.andsubthen_decl has_sort.divides_decl has_sort.orsubelse_decl has_sort.empty_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ has_sort.ifthenelsefi_decl₄ has_sort.ifthenelsefi_decl₅ has_sort.ifthenelsefi_decl₆ has_sort.ifthenelsefi_decl₇ has_sort.ifthenelsefi_decl₈ has_sort.ifthenelsefi_decl₉ has_sort.eqslasheq₀_decl has_sort.eqslasheq₁_decl has_sort.eqslasheq₂_decl has_sort.eqeq₀_decl has_sort.eqeq₁_decl has_sort.eqeq₂_decl eqe.eq_NOTHING eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_DO eqe.eq_AND eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_andsubthen₀ eqe.eq_andsubthen₁ eqe.eq_and₀ eqe.eq_and₁ eqe.eq_and₂ eqe.eq_and₃ eqe.eq_containsActor₀ eqe.eq_containsRuleWithEvent₀ eqe.eq_implies₀ eqe.eq_«in»₀₀ eqe.eq_«in»₁₀ eqe.eq_«in»₂₀ eqe.eq_orsubelse₀ eqe.eq_orsubelse₁ eqe.eq_or₀ eqe.eq_psubset₀ eqe.eq_psubset₁ eqe.eq_psubset₂ eqe.eq_subset₀₀ eqe.eq_subset₁₀ eqe.eq_subset₂₀ eqe.eq_subset₀₁ eqe.eq_subset₁₁ eqe.eq_subset₂₁ eqe.eq_xor₀ eqe.eq_xor₁ eqe.eq_delete₀ eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_not₀ eqe.eq_union eqe.eq_containsActor₁ eqe.eq_containsRuleWithEvent₁ eqe.eq_«in»₀₁ eqe.eq_«in»₁₁ eqe.eq_«in»₂₁ eqe.eq_delete₁ eqe.eq_and₄ eqe.eq_and₅ eqe.eq_and₆ eqe.eq_xor₂ eqe.eq_xor₃ eqe.eq_and₇ eqe.eq_not₁ eqe.eq_or₁ eqe.eq_implies₁ eqe.eq_itet eqe.eq_itef eqe.eq_eqslasheq₀ eqe.eq_eqslasheq₁ eqe.eq_eqslasheq₂ eqe.eq_eqeq₀ eqe.eq_eqeq₁ eqe.eq_eqeq₂ subsort_qid_action subsort_names_«set{qid}» subsort_«neset{qid}»_«set{qid}» subsort_oid_id subsort_bool_situation subsort_qid_situation subsort_qid_names subsort_qid_«neset{qid}» subsort_qid_oid
end kAction

namespace kConfiguration
  -- Sort membership lemmas
  theorem subsort_msg_configuration {t : kConfiguration} : t ⊳ MSort.Msg →
    t ⊳ MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_object_configuration {t : kConfiguration} : t ⊳ MSort.Object →
    t ⊳ MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_portal_configuration {t : kConfiguration} : t ⊳ MSort.Portal →
    t ⊳ MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_«neset{actionevent}»_«set{actionevent}» {t : kConfiguration} : t ⊳ MSort.«NeSet{ActionEvent}» →
    t ⊳ MSort.«Set{ActionEvent}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_message_msg {t : kConfiguration} : t ⊳ MSort.Message →
    t ⊳ MSort.Msg := by apply has_sort.subsort; simp [subsort]
  theorem subsort_actionevent_«neset{actionevent}» {t : kConfiguration} : t ⊳ MSort.ActionEvent →
    t ⊳ MSort.«NeSet{ActionEvent}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_event_message {t : kConfiguration} : t ⊳ MSort.Event →
    t ⊳ MSort.Message := by apply has_sort.subsort; simp [subsort]
  theorem subsort_actionevent_event {t : kConfiguration} : t ⊳ MSort.ActionEvent →
    t ⊳ MSort.Event := by apply has_sort.subsort; simp [subsort]
  theorem subsort_tickevent_event {t : kConfiguration} : t ⊳ MSort.TickEvent →
    t ⊳ MSort.Event := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kConfiguration) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kConfiguration} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kConfiguration} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kConfiguration} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def join_comm := @eqa.join_comm
  def join_assoc := @eqa.join_assoc
  def «`,»_comm := @eqa.«`,»_comm
  def «`,»_assoc := @eqa.«`,»_assoc
  def «$diff»_decl := @has_sort.«$diff»_decl
  def «$intersect»_decl := @has_sort.«$intersect»_decl
  def delete_decl := @has_sort.delete_decl
  def getAction_decl := @has_sort.getAction_decl
  def getAllActions_decl := @has_sort.getAllActions_decl
  def initAux_decl := @has_sort.initAux_decl
  def init_decl := @has_sort.init_decl
  def insert_decl := @has_sort.insert_decl
  def intersection_decl := @has_sort.intersection_decl
  def pretty_decl := @has_sort.pretty_decl
  def union_decl₀ := @has_sort.union_decl₀
  def union_decl₁ := @has_sort.union_decl₁
  def union_decl₂ := @has_sort.union_decl₂
  def ltgt_decl := @has_sort.ltgt_decl
  def ltcolonbargt_decl := @has_sort.ltcolonbargt_decl
  def «ltcolonbar`gt»_decl := @has_sort.«ltcolonbar`gt»_decl
  def bslash_decl := @has_sort.bslash_decl
  def join_decl := @has_sort.join_decl
  def «`,»_decl₀ := @has_sort.«`,»_decl₀
  def «`,»_decl₁ := @has_sort.«`,»_decl₁
  def «`,»_decl₂ := @has_sort.«`,»_decl₂
  def did_decl := @has_sort.did_decl
  def do_decl := @has_sort.do_decl
  def does_decl := @has_sort.does_decl
  def empty_decl := @has_sort.empty_decl
  def none_decl := @has_sort.none_decl
  def tau_decl := @has_sort.tau_decl
  def tick_decl := @has_sort.tick_decl
  def ifthenelsefi_decl₁ := @has_sort.ifthenelsefi_decl₁
  def ifthenelsefi_decl₂ := @has_sort.ifthenelsefi_decl₂
  def ifthenelsefi_decl₃ := @has_sort.ifthenelsefi_decl₃
  def ifthenelsefi_decl₄ := @has_sort.ifthenelsefi_decl₄
  def ifthenelsefi_decl₅ := @has_sort.ifthenelsefi_decl₅
  def ifthenelsefi_decl₆ := @has_sort.ifthenelsefi_decl₆
  def ifthenelsefi_decl₇ := @has_sort.ifthenelsefi_decl₇
  def ifthenelsefi_decl₈ := @has_sort.ifthenelsefi_decl₈
  def ifthenelsefi_decl₉ := @has_sort.ifthenelsefi_decl₉
  def ifthenelsefi_decl₁₀ := @has_sort.ifthenelsefi_decl₁₀
  def eqa_«$diff» := @eqa.eqa_«$diff»
  def eqe_«$diff» := @eqe.eqe_«$diff»
  def eqa_«$intersect» := @eqa.eqa_«$intersect»
  def eqe_«$intersect» := @eqe.eqe_«$intersect»
  def eqa_delete := @eqa.eqa_delete
  def eqe_delete := @eqe.eqe_delete
  def eqa_getAction := @eqa.eqa_getAction
  def eqe_getAction := @eqe.eqe_getAction
  def eqa_getAllActions := @eqa.eqa_getAllActions
  def eqe_getAllActions := @eqe.eqe_getAllActions
  def eqa_initAux := @eqa.eqa_initAux
  def eqe_initAux := @eqe.eqe_initAux
  def eqa_init := @eqa.eqa_init
  def eqe_init := @eqe.eqe_init
  def eqa_insert := @eqa.eqa_insert
  def eqe_insert := @eqe.eqe_insert
  def eqa_intersection := @eqa.eqa_intersection
  def eqe_intersection := @eqe.eqe_intersection
  def eqa_pretty := @eqa.eqa_pretty
  def eqe_pretty := @eqe.eqe_pretty
  def eqa_union := @eqa.eqa_union
  def eqe_union := @eqe.eqe_union
  def eqa_ltcolonbargt := @eqa.eqa_ltcolonbargt
  def eqe_ltcolonbargt := @eqe.eqe_ltcolonbargt
  def eqa_«ltcolonbar`gt» := @eqa.eqa_«ltcolonbar`gt»
  def eqe_«ltcolonbar`gt» := @eqe.eqe_«ltcolonbar`gt»
  def eqa_bslash := @eqa.eqa_bslash
  def eqe_bslash := @eqe.eqe_bslash
  def eqa_join := @eqa.eqa_join
  def eqe_join := @eqe.eqe_join
  def eqa_«`,» := @eqa.eqa_«`,»
  def eqe_«`,» := @eqe.eqe_«`,»
  def eqa_did := @eqa.eqa_did
  def eqe_did := @eqe.eqe_did
  def eqa_do := @eqa.eqa_do
  def eqe_do := @eqe.eqe_do
  def eqa_does := @eqa.eqa_does
  def eqe_does := @eqe.eqe_does
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eq_«$diff»₀ := @eqe.eq_«$diff»₀
  def eq_«$diff»₁ := @eqe.eq_«$diff»₁
  def eq_«$intersect»₀ := @eqe.eq_«$intersect»₀
  def eq_«$intersect»₁ := @eqe.eq_«$intersect»₁
  def eq_bslash₀ := @eqe.eq_bslash₀
  def eq_bslash₁ := @eqe.eq_bslash₁
  def eq_«`,» := @eqe.eq_«`,»
  def eq_did := @eqe.eq_did
  def eq_do := @eqe.eq_do
  def eq_delete₀ := @eqe.eq_delete₀
  def eq_getAction := @eqe.eq_getAction
  def eq_getAllActions₀ := @eqe.eq_getAllActions₀
  def eq_getAllActions₁ := @eqe.eq_getAllActions₁
  def eq_initAux₀ := @eqe.eq_initAux₀
  def eq_initAux₁ := @eqe.eq_initAux₁
  def eq_init := @eqe.eq_init
  def eq_insert := @eqe.eq_insert
  def eq_intersection₀ := @eqe.eq_intersection₀
  def eq_intersection₁ := @eqe.eq_intersection₁
  def eq_pretty := @eqe.eq_pretty
  def eq_union := @eqe.eq_union
  def eq_delete₁ := @eqe.eq_delete₁
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef

  attribute [simp] has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.delete_decl has_sort.getAction_decl has_sort.getAllActions_decl has_sort.initAux_decl has_sort.init_decl has_sort.insert_decl has_sort.intersection_decl has_sort.pretty_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.ltgt_decl has_sort.ltcolonbargt_decl has_sort.«ltcolonbar`gt»_decl has_sort.bslash_decl has_sort.join_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.did_decl has_sort.do_decl has_sort.does_decl has_sort.empty_decl has_sort.none_decl has_sort.tau_decl has_sort.tick_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ has_sort.ifthenelsefi_decl₄ has_sort.ifthenelsefi_decl₅ has_sort.ifthenelsefi_decl₆ has_sort.ifthenelsefi_decl₇ has_sort.ifthenelsefi_decl₈ has_sort.ifthenelsefi_decl₉ has_sort.ifthenelsefi_decl₁₀ eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_did eqe.eq_do eqe.eq_delete₀ eqe.eq_getAction eqe.eq_getAllActions₀ eqe.eq_getAllActions₁ eqe.eq_initAux₀ eqe.eq_initAux₁ eqe.eq_init eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_pretty eqe.eq_union eqe.eq_delete₁ eqe.eq_itet eqe.eq_itef subsort_msg_configuration subsort_object_configuration subsort_portal_configuration subsort_«neset{actionevent}»_«set{actionevent}» subsort_message_msg subsort_actionevent_«neset{actionevent}» subsort_event_message subsort_actionevent_event subsort_tickevent_event
end kConfiguration

namespace kActiveRule
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kActiveRule) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActiveRule} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActiveRule} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActiveRule} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kActiveRule

namespace kCid
  -- Sort membership lemmas
  theorem subsort_actor_cid {t : kCid} : t ⊳ MSort.Actor →
    t ⊳ MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_coordinator_cid {t : kCid} : t ⊳ MSort.Coordinator →
    t ⊳ MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_precoordinator_cid {t : kCid} : t ⊳ MSort.PreCoordinator →
    t ⊳ MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_coordinator_precoordinator {t : kCid} : t ⊳ MSort.Coordinator →
    t ⊳ MSort.PreCoordinator := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kCid) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kCid} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kCid} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kCid} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def Actor_decl := @has_sort.Actor_decl
  def Coordinator_decl := @has_sort.Coordinator_decl
  def PreCoordinator_decl := @has_sort.PreCoordinator_decl
  def getClass_decl := @has_sort.getClass_decl
  def eqa_getClass := @eqa.eqa_getClass
  def eqe_getClass := @eqe.eqe_getClass
  def eq_getClass := @eqe.eq_getClass

  attribute [simp] has_sort.Actor_decl has_sort.Coordinator_decl has_sort.PreCoordinator_decl has_sort.getClass_decl eqe.eq_getClass subsort_actor_cid subsort_coordinator_cid subsort_precoordinator_cid subsort_coordinator_precoordinator
end kCid

namespace kActorDeonticActionDeadline
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kActorDeonticActionDeadline) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActorDeonticActionDeadline} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActorDeonticActionDeadline} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActorDeonticActionDeadline} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def PARTY₀_decl := @has_sort.PARTY₀_decl
  def PARTY₁_decl := @has_sort.PARTY₁_decl
  def PARTY₂_decl := @has_sort.PARTY₂_decl
  def PARTY₃_decl := @has_sort.PARTY₃_decl
  def eqa_PARTY₀ := @eqa.eqa_PARTY₀
  def eqe_PARTY₀ := @eqe.eqe_PARTY₀
  def eqa_PARTY₁ := @eqa.eqa_PARTY₁
  def eqe_PARTY₁ := @eqe.eqe_PARTY₁
  def eqa_PARTY₂ := @eqa.eqa_PARTY₂
  def eqe_PARTY₂ := @eqe.eqe_PARTY₂
  def eqa_PARTY₃ := @eqa.eqa_PARTY₃
  def eqe_PARTY₃ := @eqe.eqe_PARTY₃
  def eq_PARTY₀ := @eqe.eq_PARTY₀
  def eq_PARTY₂ := @eqe.eq_PARTY₂
  def eq_PARTY₃ := @eqe.eq_PARTY₃

  attribute [simp] has_sort.PARTY₀_decl has_sort.PARTY₁_decl has_sort.PARTY₂_decl has_sort.PARTY₃_decl eqe.eq_PARTY₀ eqe.eq_PARTY₂ eqe.eq_PARTY₃
end kActorDeonticActionDeadline

namespace kActorState
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kActorState) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActorState} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActorState} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActorState} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kActorState

namespace kAttributeSet
  -- Sort membership lemmas
  theorem subsort_attribute_attributeset {t : kAttributeSet} : t ⊳ MSort.Attribute →
    t ⊳ MSort.AttributeSet := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kAttributeSet) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kAttributeSet} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kAttributeSet} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kAttributeSet} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def «`,»_comm := @eqa.«`,»_comm
  def «`,»_assoc := @eqa.«`,»_assoc
  def «`,»_decl := @has_sort.«`,»_decl
  def «contractState`colon»_decl := @has_sort.«contractState`colon»_decl
  def none_decl := @has_sort.none_decl
  def «rules`colon»_decl := @has_sort.«rules`colon»_decl
  def «time`colon»_decl := @has_sort.«time`colon»_decl
  def eqa_«`,» := @eqa.eqa_«`,»
  def eqe_«`,» := @eqe.eqe_«`,»
  def eqa_«contractState`colon» := @eqa.eqa_«contractState`colon»
  def eqe_«contractState`colon» := @eqe.eqe_«contractState`colon»
  def eqa_«rules`colon» := @eqa.eqa_«rules`colon»
  def eqe_«rules`colon» := @eqe.eqe_«rules`colon»
  def eqa_«time`colon» := @eqa.eqa_«time`colon»
  def eqe_«time`colon» := @eqe.eqe_«time`colon»

  attribute [simp] has_sort.«`,»_decl has_sort.«contractState`colon»_decl has_sort.none_decl has_sort.«rules`colon»_decl has_sort.«time`colon»_decl subsort_attribute_attributeset
end kAttributeSet

namespace kString
  -- Sort membership lemmas
  theorem subsort_char_string {t : kString} : t ⊳ MSort.Char →
    t ⊳ MSort.String := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kString) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kString} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kString} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kString} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def ltStringsgt_decl₀ := @has_sort.ltStringsgt_decl₀
  def ltStringsgt_decl₁ := @has_sort.ltStringsgt_decl₁
  def sum_decl := @has_sort.sum_decl
  def lowerCase_decl := @has_sort.lowerCase_decl
  def string_decl := @has_sort.string_decl
  def substr_decl := @has_sort.substr_decl
  def upperCase_decl := @has_sort.upperCase_decl
  def eqa_sum := @eqa.eqa_sum
  def eqe_sum := @eqe.eqe_sum
  def eqa_char := @eqa.eqa_char
  def eqe_char := @eqe.eqe_char
  def eqa_lowerCase := @eqa.eqa_lowerCase
  def eqe_lowerCase := @eqe.eqe_lowerCase
  def eqa_string := @eqa.eqa_string
  def eqe_string := @eqe.eqe_string
  def eqa_substr := @eqa.eqa_substr
  def eqe_substr := @eqe.eqe_substr
  def eqa_upperCase := @eqa.eqa_upperCase
  def eqe_upperCase := @eqe.eqe_upperCase

  attribute [simp] has_sort.ltStringsgt_decl₀ has_sort.ltStringsgt_decl₁ has_sort.sum_decl has_sort.lowerCase_decl has_sort.string_decl has_sort.substr_decl has_sort.upperCase_decl subsort_char_string
end kString

namespace kContractState
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kContractState) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kContractState} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kContractState} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kContractState} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def pow_comm := @eqa.pow_comm
  def pow_assoc := @eqa.pow_assoc
  def deltaAction_decl := @has_sort.deltaAction_decl
  def deltaTick_decl := @has_sort.deltaTick_decl
  def Active_decl := @has_sort.Active_decl
  def Breached_decl := @has_sort.Breached_decl
  def Fulfilled_decl := @has_sort.Fulfilled_decl
  def pow_decl := @has_sort.pow_decl
  def ifthenelsefi_decl₁ := @has_sort.ifthenelsefi_decl₁
  def eqa_deltaAction := @eqa.eqa_deltaAction
  def eqe_deltaAction := @eqe.eqe_deltaAction
  def eqa_deltaTick := @eqa.eqa_deltaTick
  def eqe_deltaTick := @eqe.eqe_deltaTick
  def eqa_Active := @eqa.eqa_Active
  def eqe_Active := @eqe.eqe_Active
  def eqa_Breached := @eqa.eqa_Breached
  def eqe_Breached := @eqe.eqe_Breached
  def eqa_pow := @eqa.eqa_pow
  def eqe_pow := @eqe.eqe_pow
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eq_Active := @eqe.eq_Active
  def eq_pow₀ := @eqe.eq_pow₀
  def eq_pow₁ := @eqe.eq_pow₁
  def eq_pow₂ := @eqe.eq_pow₂
  def eq_deltaAction₀ := @eqe.eq_deltaAction₀
  def eq_deltaAction₁ := @eqe.eq_deltaAction₁
  def eq_deltaAction₂ := @eqe.eq_deltaAction₂
  def eq_deltaTick₀ := @eqe.eq_deltaTick₀
  def eq_deltaTick₁ := @eqe.eq_deltaTick₁
  def eq_deltaTick₂ := @eqe.eq_deltaTick₂
  def eq_deltaTick₃ := @eqe.eq_deltaTick₃
  def eq_deltaAction₃ := @eqe.eq_deltaAction₃
  def eq_deltaTick₄ := @eqe.eq_deltaTick₄
  def eq_deltaAction₄ := @eqe.eq_deltaAction₄
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef

  attribute [simp] has_sort.deltaAction_decl has_sort.deltaTick_decl has_sort.Active_decl has_sort.Breached_decl has_sort.Fulfilled_decl has_sort.pow_decl has_sort.ifthenelsefi_decl₁ eqe.eq_Active eqe.eq_pow₀ eqe.eq_pow₁ eqe.eq_pow₂ eqe.eq_deltaAction₀ eqe.eq_deltaAction₁ eqe.eq_deltaAction₂ eqe.eq_deltaTick₀ eqe.eq_deltaTick₁ eqe.eq_deltaTick₂ eqe.eq_deltaTick₃ eqe.eq_deltaAction₃ eqe.eq_deltaTick₄ eqe.eq_deltaAction₄ eqe.eq_itet eqe.eq_itef
end kContractState

namespace kContractStatus
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kContractStatus) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kContractStatus} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kContractStatus} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kContractStatus} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def configToStatus_decl := @has_sort.configToStatus_decl
  def contractStateToStatus_decl := @has_sort.contractStateToStatus_decl
  def Active_decl := @has_sort.Active_decl
  def Breached_decl := @has_sort.Breached_decl
  def Fulfilled_decl := @has_sort.Fulfilled_decl
  def eqa_configToStatus := @eqa.eqa_configToStatus
  def eqe_configToStatus := @eqe.eqe_configToStatus
  def eqa_contractStateToStatus := @eqa.eqa_contractStateToStatus
  def eqe_contractStateToStatus := @eqe.eqe_contractStateToStatus
  def eq_configToStatus := @eqe.eq_configToStatus
  def eq_contractStateToStatus₀ := @eqe.eq_contractStateToStatus₀
  def eq_contractStateToStatus₁ := @eqe.eq_contractStateToStatus₁
  def eq_contractStateToStatus₂ := @eqe.eq_contractStateToStatus₂

  attribute [simp] has_sort.configToStatus_decl has_sort.contractStateToStatus_decl has_sort.Active_decl has_sort.Breached_decl has_sort.Fulfilled_decl eqe.eq_configToStatus eqe.eq_contractStateToStatus₀ eqe.eq_contractStateToStatus₁ eqe.eq_contractStateToStatus₂
end kContractStatus

namespace kDate
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kDate) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDate} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDate} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDate} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kDate

namespace kDeadline
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kDeadline) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDeadline} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDeadline} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDeadline} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def BY_decl := @has_sort.BY_decl
  def WITHIN_decl := @has_sort.WITHIN_decl
  def eqa_BY := @eqa.eqa_BY
  def eqe_BY := @eqe.eqe_BY
  def eqa_WITHIN := @eqa.eqa_WITHIN
  def eqe_WITHIN := @eqe.eqe_WITHIN

  attribute [simp] has_sort.BY_decl has_sort.WITHIN_decl
end kDeadline

namespace kDeontic
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kDeontic) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDeontic} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDeontic} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDeontic} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def MAY_decl := @has_sort.MAY_decl
  def MUST_decl := @has_sort.MUST_decl
  def SHANT_decl := @has_sort.SHANT_decl

  attribute [simp] has_sort.MAY_decl has_sort.MUST_decl has_sort.SHANT_decl
end kDeontic

namespace kDuration
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kDuration) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDuration} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDuration} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDuration} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def DAY_decl := @has_sort.DAY_decl
  def MONTH_decl := @has_sort.MONTH_decl
  def WEEK_decl := @has_sort.WEEK_decl
  def YEAR_decl := @has_sort.YEAR_decl
  def eqa_DAY := @eqa.eqa_DAY
  def eqe_DAY := @eqe.eqe_DAY
  def eqa_MONTH := @eqa.eqa_MONTH
  def eqe_MONTH := @eqe.eqe_MONTH
  def eqa_WEEK := @eqa.eqa_WEEK
  def eqe_WEEK := @eqe.eqe_WEEK
  def eqa_YEAR := @eqa.eqa_YEAR
  def eqe_YEAR := @eqe.eqe_YEAR

  attribute [simp] has_sort.DAY_decl has_sort.MONTH_decl has_sort.WEEK_decl has_sort.YEAR_decl
end kDuration

namespace kFindResult
  -- Sort membership lemmas
  theorem subsort_nat_findresult {t : kFindResult} : t ⊳ MSort.Nat →
    t ⊳ MSort.FindResult := by apply has_sort.subsort; simp [subsort]
  theorem subsort_nznat_nat {t : kFindResult} : t ⊳ MSort.NzNat →
    t ⊳ MSort.Nat := by apply has_sort.subsort; simp [subsort]
  theorem subsort_zero_nat {t : kFindResult} : t ⊳ MSort.Zero →
    t ⊳ MSort.Nat := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kFindResult) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kFindResult} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kFindResult} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kFindResult} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def amp_comm := @eqa.amp_comm
  def amp_assoc := @eqa.amp_assoc
  def mul_comm := @eqa.mul_comm
  def mul_assoc := @eqa.mul_assoc
  def sum_comm := @eqa.sum_comm
  def sum_assoc := @eqa.sum_assoc
  def xor_comm := @eqa.xor_comm
  def xor_assoc := @eqa.xor_assoc
  def bar_comm := @eqa.bar_comm
  def bar_assoc := @eqa.bar_assoc
  def gcd_comm := @eqa.gcd_comm
  def gcd_assoc := @eqa.gcd_assoc
  def lcm_comm := @eqa.lcm_comm
  def lcm_assoc := @eqa.lcm_assoc
  def max_comm := @eqa.max_comm
  def max_assoc := @eqa.max_assoc
  def min_comm := @eqa.min_comm
  def min_assoc := @eqa.min_assoc
  def sd_comm := @eqa.sd_comm
  def «$card»₀_decl := @has_sort.«$card»₀_decl
  def «$card»₁_decl := @has_sort.«$card»₁_decl
  def «$card»₂_decl := @has_sort.«$card»₂_decl
  def barbar₀_decl₀ := @has_sort.barbar₀_decl₀
  def barbar₀_decl₁ := @has_sort.barbar₀_decl₁
  def barbar₁_decl₀ := @has_sort.barbar₁_decl₀
  def barbar₁_decl₁ := @has_sort.barbar₁_decl₁
  def barbar₂_decl₀ := @has_sort.barbar₂_decl₀
  def barbar₂_decl₁ := @has_sort.barbar₂_decl₁
  def zero_decl := @has_sort.zero_decl
  def amp_decl := @has_sort.amp_decl
  def mul_decl₀ := @has_sort.mul_decl₀
  def mul_decl₁ := @has_sort.mul_decl₁
  def sum_decl₀ := @has_sort.sum_decl₀
  def sum_decl₁ := @has_sort.sum_decl₁
  def sum_decl₂ := @has_sort.sum_decl₂
  def ltlt_decl := @has_sort.ltlt_decl
  def gtgt_decl := @has_sort.gtgt_decl
  def pow_decl₀ := @has_sort.pow_decl₀
  def pow_decl₁ := @has_sort.pow_decl₁
  def quo_decl := @has_sort.quo_decl
  def rem_decl := @has_sort.rem_decl
  def xor_decl := @has_sort.xor_decl
  def bar_decl₀ := @has_sort.bar_decl₀
  def bar_decl₁ := @has_sort.bar_decl₁
  def bar_decl₂ := @has_sort.bar_decl₂
  def ascii_decl := @has_sort.ascii_decl
  def find_decl := @has_sort.find_decl
  def gcd_decl₀ := @has_sort.gcd_decl₀
  def gcd_decl₁ := @has_sort.gcd_decl₁
  def gcd_decl₂ := @has_sort.gcd_decl₂
  def lcm_decl₀ := @has_sort.lcm_decl₀
  def lcm_decl₁ := @has_sort.lcm_decl₁
  def length_decl := @has_sort.length_decl
  def max_decl₀ := @has_sort.max_decl₀
  def max_decl₁ := @has_sort.max_decl₁
  def max_decl₂ := @has_sort.max_decl₂
  def min_decl₀ := @has_sort.min_decl₀
  def min_decl₁ := @has_sort.min_decl₁
  def notFound_decl := @has_sort.notFound_decl
  def rfind_decl := @has_sort.rfind_decl
  def s_decl := @has_sort.s_decl
  def sd_decl := @has_sort.sd_decl
  def ifthenelsefi_decl₁ := @has_sort.ifthenelsefi_decl₁
  def ifthenelsefi_decl₂ := @has_sort.ifthenelsefi_decl₂
  def ifthenelsefi_decl₃ := @has_sort.ifthenelsefi_decl₃
  def ifthenelsefi_decl₄ := @has_sort.ifthenelsefi_decl₄
  def eqa_«$card»₀ := @eqa.eqa_«$card»₀
  def eqe_«$card»₀ := @eqe.eqe_«$card»₀
  def eqa_«$card»₁ := @eqa.eqa_«$card»₁
  def eqe_«$card»₁ := @eqe.eqe_«$card»₁
  def eqa_«$card»₂ := @eqa.eqa_«$card»₂
  def eqe_«$card»₂ := @eqe.eqe_«$card»₂
  def eqa_barbar₀ := @eqa.eqa_barbar₀
  def eqe_barbar₀ := @eqe.eqe_barbar₀
  def eqa_barbar₁ := @eqa.eqa_barbar₁
  def eqe_barbar₁ := @eqe.eqe_barbar₁
  def eqa_barbar₂ := @eqa.eqa_barbar₂
  def eqe_barbar₂ := @eqe.eqe_barbar₂
  def eqa_amp := @eqa.eqa_amp
  def eqe_amp := @eqe.eqe_amp
  def eqa_mul := @eqa.eqa_mul
  def eqe_mul := @eqe.eqe_mul
  def eqa_sum := @eqa.eqa_sum
  def eqe_sum := @eqe.eqe_sum
  def eqa_ltlt := @eqa.eqa_ltlt
  def eqe_ltlt := @eqe.eqe_ltlt
  def eqa_gtgt := @eqa.eqa_gtgt
  def eqe_gtgt := @eqe.eqe_gtgt
  def eqa_pow := @eqa.eqa_pow
  def eqe_pow := @eqe.eqe_pow
  def eqa_quo := @eqa.eqa_quo
  def eqe_quo := @eqe.eqe_quo
  def eqa_rem := @eqa.eqa_rem
  def eqe_rem := @eqe.eqe_rem
  def eqa_xor := @eqa.eqa_xor
  def eqe_xor := @eqe.eqe_xor
  def eqa_bar := @eqa.eqa_bar
  def eqe_bar := @eqe.eqe_bar
  def eqa_ascii := @eqa.eqa_ascii
  def eqe_ascii := @eqe.eqe_ascii
  def eqa_find := @eqa.eqa_find
  def eqe_find := @eqe.eqe_find
  def eqa_gcd := @eqa.eqa_gcd
  def eqe_gcd := @eqe.eqe_gcd
  def eqa_lcm := @eqa.eqa_lcm
  def eqe_lcm := @eqe.eqe_lcm
  def eqa_length := @eqa.eqa_length
  def eqe_length := @eqe.eqe_length
  def eqa_max := @eqa.eqa_max
  def eqe_max := @eqe.eqe_max
  def eqa_min := @eqa.eqa_min
  def eqe_min := @eqe.eqe_min
  def eqa_modExp := @eqa.eqa_modExp
  def eqe_modExp := @eqe.eqe_modExp
  def eqa_rfind := @eqa.eqa_rfind
  def eqe_rfind := @eqe.eqe_rfind
  def eqa_s := @eqa.eqa_s
  def eqe_s := @eqe.eqe_s
  def eqa_sd := @eqa.eqa_sd
  def eqe_sd := @eqe.eqe_sd
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eq_«$card»₀₀ := @eqe.eq_«$card»₀₀
  def eq_«$card»₁₀ := @eqe.eq_«$card»₁₀
  def eq_«$card»₂₀ := @eqe.eq_«$card»₂₀
  def eq_«$card»₀₁ := @eqe.eq_«$card»₀₁
  def eq_«$card»₁₁ := @eqe.eq_«$card»₁₁
  def eq_«$card»₂₁ := @eqe.eq_«$card»₂₁
  def eq_barbar₀ := @eqe.eq_barbar₀
  def eq_barbar₁ := @eqe.eq_barbar₁
  def eq_barbar₂ := @eqe.eq_barbar₂
  def eq_«$card»₀₂ := @eqe.eq_«$card»₀₂
  def eq_«$card»₁₂ := @eqe.eq_«$card»₁₂
  def eq_«$card»₂₂ := @eqe.eq_«$card»₂₂
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef

  attribute [simp] has_sort.«$card»₀_decl has_sort.«$card»₁_decl has_sort.«$card»₂_decl has_sort.barbar₀_decl₀ has_sort.barbar₀_decl₁ has_sort.barbar₁_decl₀ has_sort.barbar₁_decl₁ has_sort.barbar₂_decl₀ has_sort.barbar₂_decl₁ has_sort.zero_decl has_sort.amp_decl has_sort.mul_decl₀ has_sort.mul_decl₁ has_sort.sum_decl₀ has_sort.sum_decl₁ has_sort.sum_decl₂ has_sort.ltlt_decl has_sort.gtgt_decl has_sort.pow_decl₀ has_sort.pow_decl₁ has_sort.quo_decl has_sort.rem_decl has_sort.xor_decl has_sort.bar_decl₀ has_sort.bar_decl₁ has_sort.bar_decl₂ has_sort.ascii_decl has_sort.find_decl has_sort.gcd_decl₀ has_sort.gcd_decl₁ has_sort.gcd_decl₂ has_sort.lcm_decl₀ has_sort.lcm_decl₁ has_sort.length_decl has_sort.max_decl₀ has_sort.max_decl₁ has_sort.max_decl₂ has_sort.min_decl₀ has_sort.min_decl₁ has_sort.notFound_decl has_sort.rfind_decl has_sort.s_decl has_sort.sd_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ has_sort.ifthenelsefi_decl₄ eqe.eq_«$card»₀₀ eqe.eq_«$card»₁₀ eqe.eq_«$card»₂₀ eqe.eq_«$card»₀₁ eqe.eq_«$card»₁₁ eqe.eq_«$card»₂₁ eqe.eq_barbar₀ eqe.eq_barbar₁ eqe.eq_barbar₂ eqe.eq_«$card»₀₂ eqe.eq_«$card»₁₂ eqe.eq_«$card»₂₂ eqe.eq_itet eqe.eq_itef subsort_nat_findresult subsort_nznat_nat subsort_zero_nat
end kFindResult

namespace kHenceLest
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kHenceLest) : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kHenceLest} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kHenceLest} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kHenceLest} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def HENCE_decl := @has_sort.HENCE_decl
  def HENCELEST_decl := @has_sort.HENCELEST_decl
  def LEST_decl := @has_sort.LEST_decl
  def LESTHENCE_decl := @has_sort.LESTHENCE_decl
  def eqa_HENCE := @eqa.eqa_HENCE
  def eqe_HENCE := @eqe.eqe_HENCE
  def eqa_HENCELEST := @eqa.eqa_HENCELEST
  def eqe_HENCELEST := @eqe.eqe_HENCELEST
  def eqa_LEST := @eqa.eqa_LEST
  def eqe_LEST := @eqe.eqe_LEST
  def eqa_LESTHENCE := @eqa.eqa_LESTHENCE
  def eqe_LESTHENCE := @eqe.eqe_LESTHENCE
  def eq_HENCE := @eqe.eq_HENCE
  def eq_LEST := @eqe.eq_LEST
  def eq_LESTHENCE := @eqe.eq_LESTHENCE

  attribute [simp] has_sort.HENCE_decl has_sort.HENCELEST_decl has_sort.LEST_decl has_sort.LESTHENCE_decl eqe.eq_HENCE eqe.eq_LEST eqe.eq_LESTHENCE
end kHenceLest

namespace k«Set{Rule}»
  -- Sort membership lemmas
  theorem subsort_«neset{rule}»_«set{rule}» {t : k«Set{Rule}»} : t ⊳ MSort.«NeSet{Rule}» →
    t ⊳ MSort.«Set{Rule}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_rule_«neset{rule}» {t : k«Set{Rule}»} : t ⊳ MSort.Rule →
    t ⊳ MSort.«NeSet{Rule}» := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : k«Set{Rule}») : a =E a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : k«Set{Rule}»} : a =A b → c =A d → (a =A c) = (b =A d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : k«Set{Rule}»} : a =E b → c =E d → (a =E c) = (b =E d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : k«Set{Rule}»} : a =A b → c =A d → (a =E c) = (b =E d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def «`,»_comm := @eqa.«`,»_comm
  def «`,»_assoc := @eqa.«`,»_assoc
  def «$diff»_decl := @has_sort.«$diff»_decl
  def «$intersect»_decl := @has_sort.«$intersect»_decl
  def delete_decl := @has_sort.delete_decl
  def getRulesWithNames_decl := @has_sort.getRulesWithNames_decl
  def insert_decl := @has_sort.insert_decl
  def intersection_decl := @has_sort.intersection_decl
  def union_decl₀ := @has_sort.union_decl₀
  def union_decl₁ := @has_sort.union_decl₁
  def union_decl₂ := @has_sort.union_decl₂
  def RULE₀_decl := @has_sort.RULE₀_decl
  def RULE₁_decl := @has_sort.RULE₁_decl
  def bslash_decl := @has_sort.bslash_decl
  def «`,»_decl₀ := @has_sort.«`,»_decl₀
  def «`,»_decl₁ := @has_sort.«`,»_decl₁
  def «`,»_decl₂ := @has_sort.«`,»_decl₂
  def empty_decl := @has_sort.empty_decl
  def ifthenelsefi_decl₁ := @has_sort.ifthenelsefi_decl₁
  def ifthenelsefi_decl₂ := @has_sort.ifthenelsefi_decl₂
  def ifthenelsefi_decl₃ := @has_sort.ifthenelsefi_decl₃
  def eqa_«$diff» := @eqa.eqa_«$diff»
  def eqe_«$diff» := @eqe.eqe_«$diff»
  def eqa_«$intersect» := @eqa.eqa_«$intersect»
  def eqe_«$intersect» := @eqe.eqe_«$intersect»
  def eqa_delete := @eqa.eqa_delete
  def eqe_delete := @eqe.eqe_delete
  def eqa_getRulesWithNames := @eqa.eqa_getRulesWithNames
  def eqe_getRulesWithNames := @eqe.eqe_getRulesWithNames
  def eqa_insert := @eqa.eqa_insert
  def eqe_insert := @eqe.eqe_insert
  def eqa_intersection := @eqa.eqa_intersection
  def eqe_intersection := @eqe.eqe_intersection
  def eqa_union := @eqa.eqa_union
  def eqe_union := @eqe.eqe_union
  def eqa_RULE₀ := @eqa.eqa_RULE₀
  def eqe_RULE₀ := @eqe.eqe_RULE₀
  def eqa_RULE₁ := @eqa.eqa_RULE₁
  def eqe_RULE₁ := @eqe.eqe_RULE₁
  def eqa_bslash := @eqa.eqa_bslash
  def eqe_bslash := @eqe.eqe_bslash
  def eqa_«`,» := @eqa.eqa_«`,»
  def eqe_«`,» := @eqe.eqe_«`,»
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eq_«$diff»₀ := @eqe.eq_«$diff»₀
  def eq_«$diff»₁ := @eqe.eq_«$diff»₁
  def eq_«$intersect»₀ := @eqe.eq_«$intersect»₀
  def eq_«$intersect»₁ := @eqe.eq_«$intersect»₁
  def eq_RULE₀ := @eqe.eq_RULE₀
  def eq_bslash₀ := @eqe.eq_bslash₀
  def eq_bslash₁ := @eqe.eq_bslash₁
  def eq_«`,» := @eqe.eq_«`,»
  def eq_delete₀ := @eqe.eq_delete₀
  def eq_getRulesWithNames₀ := @eqe.eq_getRulesWithNames₀
  def eq_getRulesWithNames₁ := @eqe.eq_getRulesWithNames₁
  def eq_insert := @eqe.eq_insert
  def eq_intersection₀ := @eqe.eq_intersection₀
  def eq_intersection₁ := @eqe.eq_intersection₁
  def eq_union := @eqe.eq_union
  def eq_delete₁ := @eqe.eq_delete₁
  def eq_getRulesWithNames₂ := @eqe.eq_getRulesWithNames₂
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef

  attribute [simp] has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.delete_decl has_sort.getRulesWithNames_decl has_sort.insert_decl has_sort.intersection_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.RULE₀_decl has_sort.RULE₁_decl has_sort.bslash_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.empty_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_RULE₀ eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_delete₀ eqe.eq_getRulesWithNames₀ eqe.eq_getRulesWithNames₁ eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_union eqe.eq_delete₁ eqe.eq_getRulesWithNames₂ eqe.eq_itet eqe.eq_itef subsort_«neset{rule}»_«set{rule}» subsort_rule_«neset{rule}»
end k«Set{Rule}»

-- Lemmas for the rewriting relation

namespace kAction
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kAction} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kAction} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kAction} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kAction} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kAction

namespace kConfiguration
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kConfiguration} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kConfiguration} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kConfiguration} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kConfiguration} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases for rewrite rules
  def rl_tick := @rw_one.rl_tick
  def rl_action := @rw_one.rl_action
end kConfiguration

namespace kActiveRule
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActiveRule} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActiveRule} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActiveRule} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActiveRule} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActiveRule

namespace kCid
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kCid} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kCid} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kCid} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kCid} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kCid

namespace kActorDeonticActionDeadline
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActorDeonticActionDeadline} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActorDeonticActionDeadline} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActorDeonticActionDeadline} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActorDeonticActionDeadline} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActorDeonticActionDeadline

namespace kActorState
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActorState} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActorState} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActorState} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActorState} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActorState

namespace kAttributeSet
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kAttributeSet} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kAttributeSet} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kAttributeSet} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kAttributeSet} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kAttributeSet

namespace kString
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kString} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kString} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kString} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kString} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kString

namespace kContractState
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kContractState} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kContractState} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kContractState} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kContractState} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kContractState

namespace kContractStatus
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kContractStatus} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kContractStatus} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kContractStatus} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kContractStatus} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kContractStatus

namespace kDate
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDate} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDate} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDate} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDate} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDate

namespace kDeadline
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDeadline} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDeadline} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDeadline} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDeadline} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDeadline

namespace kDeontic
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDeontic} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDeontic} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDeontic} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDeontic} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDeontic

namespace kDuration
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDuration} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDuration} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDuration} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDuration} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDuration

namespace kFindResult
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kFindResult} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kFindResult} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kFindResult} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kFindResult} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kFindResult

namespace kHenceLest
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kHenceLest} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kHenceLest} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kHenceLest} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kHenceLest} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kHenceLest

namespace k«Set{Rule}»
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : k«Set{Rule}»} : a =E b → c =E d → (a =>1 c) = (b =>1 d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : k«Set{Rule}»} : a =A b → c =A d → (a =>1 c) = (b =>1 d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : k«Set{Rule}»} : a =E b → c =E d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : k«Set{Rule}»} : a =A b → c =A d → (a =>* c) = (b =>* d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end k«Set{Rule}»

-- String conversion

def kDeontic.repr : kDeontic → String
  | kDeontic.MAY => "MAY"
  | kDeontic.MUST => "MUST"
  | kDeontic.SHANT => "SHANT"

mutual

  def kAction.repr : kAction → String
    | kAction.true => "true"
    | kAction.false => "false"
    | (kAction.and a₀ a₁) => "_and_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.or a₀ a₁) => "_or_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.xor a₀ a₁) => "_xor_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.not a) => "not_(" ++ (a.repr) ++ ")"
    | (kAction.implies a₀ a₁) => "_implies_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kAction.«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | kAction.NOTHING => "NOTHING"
    | (kAction.containsActor a₀ a₁) => "_containsActor_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.containsRuleWithEvent a₀ a₁) => "_containsRuleWithEvent_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.«in»₀ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.«in»₁ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.«in»₂ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.psubset₀ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.psubset₁ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.psubset₂ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.subset₀ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.subset₁ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.subset₂ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kAction.ltQidsgt => "<Qids>"
    | (kAction.DO a) => "DO_(" ++ (a.repr) ++ ")"
    | (kAction.lteq₀ a₀ a₁) => "_<=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.lteq₁ a₀ a₁) => "_<=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.lt₀ a₀ a₁) => "_<_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.lt₁ a₀ a₁) => "_<_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.gteq₀ a₀ a₁) => "_>=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.gteq₁ a₀ a₁) => "_>=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.gt₀ a₀ a₁) => "_>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.gt₁ a₀ a₁) => "_>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.AND a₀ a₁) => "_AND_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.andsubthen a₀ a₁) => "_and-then_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.divides a₀ a₁) => "_divides_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.orsubelse a₀ a₁) => "_or-else_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kAction.empty => "empty"
    | (kAction.qid a) => "qid(" ++ (a.repr) ++ ")"
    | (kAction.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kAction.eqslasheq₀ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.eqslasheq₁ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.eqslasheq₂ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.eqeq₀ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.eqeq₁ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAction.eqeq₂ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"

  def kActorDeonticActionDeadline.repr : kActorDeonticActionDeadline → String
    | (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) => "PARTY____(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ", " ++ (a₃.repr) ++ ")"
    | (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) => "PARTY____(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ", " ++ (a₃.repr) ++ ")"
    | (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) => "PARTY____(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ", " ++ (a₃.repr) ++ ")"
    | (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) => "_PARTY___(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ", " ++ (a₃.repr) ++ ")"

  def kAttributeSet.repr : kAttributeSet → String
    | (kAttributeSet.«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kAttributeSet.«contractState`colon» a) => "contractState`:_(" ++ (a.repr) ++ ")"
    | kAttributeSet.none => "none"
    | (kAttributeSet.«rules`colon» a) => "rules`:_(" ++ (a.repr) ++ ")"
    | (kAttributeSet.«time`colon» a) => "time`:_(" ++ (a.repr) ++ ")"

  def kCid.repr : kCid → String
    | kCid.Actor => "Actor"
    | kCid.Coordinator => "Coordinator"
    | kCid.PreCoordinator => "PreCoordinator"
    | (kCid.getClass a) => "getClass(" ++ (a.repr) ++ ")"

  def kConfiguration.repr : kConfiguration → String
    | (kConfiguration.«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kConfiguration.«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kConfiguration.delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.getAction a) => "getAction_(" ++ (a.repr) ++ ")"
    | (kConfiguration.getAllActions a) => "getAllActions_(" ++ (a.repr) ++ ")"
    | (kConfiguration.initAux a₀ a₁) => "initAux__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.init a) => "init_(" ++ (a.repr) ++ ")"
    | (kConfiguration.insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.pretty a) => "pretty_(" ++ (a.repr) ++ ")"
    | (kConfiguration.union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kConfiguration.ltgt => "<>"
    | (kConfiguration.ltcolonbargt a₀ a₁ a₂) => "<_:_|_>(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kConfiguration.«ltcolonbar`gt» a₀ a₁) => "<_:_|`>(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.join a₀ a₁) => "__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.did a₀ a₁) => "_did_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.do a₀ a₁) => "_do_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kConfiguration.does a₀ a₁) => "_does_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kConfiguration.empty => "empty"
    | kConfiguration.none => "none"
    | kConfiguration.tau => "tau"
    | kConfiguration.tick => "tick"
    | (kConfiguration.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"

  def kContractState.repr : kContractState → String
    | (kContractState.deltaAction a₀ a₁ a₂) => "deltaAction___(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kContractState.deltaTick a₀ a₁) => "deltaTick__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kContractState.Active a) => "Active_(" ++ (a.repr) ++ ")"
    | (kContractState.Breached a) => "Breached_(" ++ (a.repr) ++ ")"
    | kContractState.Fulfilled => "Fulfilled"
    | (kContractState.pow a₀ a₁) => "_^_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kContractState.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"

  def kContractStatus.repr : kContractStatus → String
    | (kContractStatus.configToStatus a) => "configToStatus_(" ++ (a.repr) ++ ")"
    | (kContractStatus.contractStateToStatus a) => "contractStateToStatus_(" ++ (a.repr) ++ ")"
    | kContractStatus.Active => "Active"
    | kContractStatus.Breached => "Breached"
    | kContractStatus.Fulfilled => "Fulfilled"

  def kDeadline.repr : kDeadline → String
    | (kDeadline.BY a) => "BY_(" ++ (a.repr) ++ ")"
    | (kDeadline.WITHIN a) => "WITHIN_(" ++ (a.repr) ++ ")"

  def kDuration.repr : kDuration → String
    | (kDuration.DAY a) => "_DAY(" ++ (a.repr) ++ ")"
    | (kDuration.MONTH a) => "_MONTH(" ++ (a.repr) ++ ")"
    | (kDuration.WEEK a) => "_WEEK(" ++ (a.repr) ++ ")"
    | (kDuration.YEAR a) => "_YEAR(" ++ (a.repr) ++ ")"

  def kFindResult.repr : kFindResult → String
    | (kFindResult.«$card»₀ a₀ a₁) => "$card(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.«$card»₁ a₀ a₁) => "$card(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.«$card»₂ a₀ a₁) => "$card(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.barbar₀ a) => "|_|(" ++ (a.repr) ++ ")"
    | (kFindResult.barbar₁ a) => "|_|(" ++ (a.repr) ++ ")"
    | (kFindResult.barbar₂ a) => "|_|(" ++ (a.repr) ++ ")"
    | kFindResult.zero => "0"
    | (kFindResult.amp a₀ a₁) => "_&_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.mul a₀ a₁) => "_*_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.sum a₀ a₁) => "_+_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.ltlt a₀ a₁) => "_<<_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.gtgt a₀ a₁) => "_>>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.pow a₀ a₁) => "_^_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.quo a₀ a₁) => "_quo_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.rem a₀ a₁) => "_rem_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.xor a₀ a₁) => "_xor_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.bar a₀ a₁) => "_|_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.ascii a) => "ascii(" ++ (a.repr) ++ ")"
    | (kFindResult.find a₀ a₁ a₂) => "find(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kFindResult.gcd a₀ a₁) => "gcd(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.lcm a₀ a₁) => "lcm(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.length a) => "length(" ++ (a.repr) ++ ")"
    | (kFindResult.max a₀ a₁) => "max(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.min a₀ a₁) => "min(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.modExp a₀ a₁ a₂) => "modExp(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | kFindResult.notFound => "notFound"
    | (kFindResult.rfind a₀ a₁ a₂) => "rfind(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kFindResult.s a) => "s_(" ++ (a.repr) ++ ")"
    | (kFindResult.sd a₀ a₁) => "sd(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kFindResult.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"

  def kHenceLest.repr : kHenceLest → String
    | (kHenceLest.HENCE a) => "HENCE_(" ++ (a.repr) ++ ")"
    | (kHenceLest.HENCELEST a₀ a₁) => "HENCE_LEST_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kHenceLest.LEST a) => "LEST_(" ++ (a.repr) ++ ")"
    | (kHenceLest.LESTHENCE a₀ a₁) => "LEST_HENCE_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"

  def kString.repr : kString → String
    | kString.ltStringsgt => "<Strings>"
    | (kString.sum a₀ a₁) => "_+_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kString.char a) => "char(" ++ (a.repr) ++ ")"
    | (kString.lowerCase a) => "lowerCase(" ++ (a.repr) ++ ")"
    | (kString.string a) => "string(" ++ (a.repr) ++ ")"
    | (kString.substr a₀ a₁ a₂) => "substr(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kString.upperCase a) => "upperCase(" ++ (a.repr) ++ ")"

  def k«Set{Rule}».repr : k«Set{Rule}» → String
    | (k«Set{Rule}».«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».getRulesWithNames a₀ a₁) => "getRulesWithNames__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».RULE₀ a₀ a₁) => "RULE__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».RULE₁ a₀ a₁ a₂) => "RULE___(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | k«Set{Rule}».empty => "empty"
    | (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
end

instance : Repr kAction := ⟨ λ x _ => Std.Format.text (kAction.repr x) ⟩
instance : Repr kFindResult := ⟨ λ x _ => Std.Format.text (kFindResult.repr x) ⟩
instance : Repr kConfiguration := ⟨ λ x _ => Std.Format.text (kConfiguration.repr x) ⟩
instance : Repr k«Set{Rule}» := ⟨ λ x _ => Std.Format.text (k«Set{Rule}».repr x) ⟩
instance : Repr kCid := ⟨ λ x _ => Std.Format.text (kCid.repr x) ⟩
instance : Repr kContractStatus := ⟨ λ x _ => Std.Format.text (kContractStatus.repr x) ⟩
instance : Repr kContractState := ⟨ λ x _ => Std.Format.text (kContractState.repr x) ⟩
instance : Repr kString := ⟨ λ x _ => Std.Format.text (kString.repr x) ⟩
instance : Repr kDeadline := ⟨ λ x _ => Std.Format.text (kDeadline.repr x) ⟩
instance : Repr kHenceLest := ⟨ λ x _ => Std.Format.text (kHenceLest.repr x) ⟩
instance : Repr kDeontic := ⟨ λ x _ => Std.Format.text (kDeontic.repr x) ⟩
instance : Repr kActorDeonticActionDeadline := ⟨ λ x _ => Std.Format.text (kActorDeonticActionDeadline.repr x) ⟩
instance : Repr kDuration := ⟨ λ x _ => Std.Format.text (kDuration.repr x) ⟩
instance : Repr kAttributeSet := ⟨ λ x _ => Std.Format.text (kAttributeSet.repr x) ⟩

end Maude
