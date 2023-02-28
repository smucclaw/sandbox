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
  | EventTrace
  | FindResult
  | Formula
  | HenceLest
  | Id
  | Message
  | ModelCheckResult
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
  | Prop
  | Qid
  | Rule
  | RuleName
  | «Set{ActionEvent}»
  | «Set{Qid}»
  | «Set{Rule}»
  | Situation
  | State
  | String
  | TickEvent
  | Transition
  | TransitionList
  | Zero
  | strategylbrakinternalrbrack

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
  | (MSort.Event, MSort.EventTrace) => true
  | (MSort.Nat, MSort.FindResult) => true
  | (MSort.Prop, MSort.Formula) => true
  | (MSort.Oid, MSort.Id) => true
  | (MSort.Event, MSort.Message) => true
  | (MSort.Bool, MSort.ModelCheckResult) => true
  | (MSort.Message, MSort.Msg) => true
  | (MSort.Qid, MSort.Names) => true
  | (MSort.NzNat, MSort.Nat) => true
  | (MSort.Zero, MSort.Nat) => true
  | (MSort.ActionEvent, MSort.«NeSet{ActionEvent}») => true
  | (MSort.Qid, MSort.«NeSet{Qid}») => true
  | (MSort.Rule, MSort.«NeSet{Rule}») => true
  | (MSort.Qid, MSort.Oid) => true
  | (MSort.Coordinator, MSort.PreCoordinator) => true
  | (MSort.ActionEvent, MSort.Prop) => true
  | (MSort.Qid, MSort.RuleName) => true
  | (MSort.«NeSet{ActionEvent}», MSort.«Set{ActionEvent}») => true
  | (MSort.Names, MSort.«Set{Qid}») => true
  | (MSort.«NeSet{Qid}», MSort.«Set{Qid}») => true
  | (MSort.«NeSet{Rule}», MSort.«Set{Rule}») => true
  | (MSort.Bool, MSort.Situation) => true
  | (MSort.Qid, MSort.Situation) => true
  | (MSort.Configuration, MSort.State) => true
  | (MSort.Char, MSort.String) => true
  | (MSort.Transition, MSort.TransitionList) => true
  | (_, _) => false

-- Kinds and their operators
opaques kActiveRule kActorState kDate kstrategylbrakinternalrbrack : Type

inductive kDeontic
  | MAY
  | MUST
  | SHANT

mutual

  inductive kActorDeonticActionDeadline
    | PARTY₀ : kModelCheckResult → kDeadline → kDeontic → kModelCheckResult → kActorDeonticActionDeadline
    | PARTY₁ : kModelCheckResult → kDeontic → kModelCheckResult → kDeadline → kActorDeonticActionDeadline
    | PARTY₂ : kModelCheckResult → kDeontic → kDeadline → kModelCheckResult → kActorDeonticActionDeadline
    | PARTY₃ : kDeadline → kModelCheckResult → kDeontic → kModelCheckResult → kActorDeonticActionDeadline

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
    | getClass : kEventTrace → kCid

  inductive kContractState
    | deltaAction : k«Set{Rule}» → kEventTrace → kContractState → kContractState
    | deltaTick : k«Set{Rule}» → kContractState → kContractState
    | Active : k«Set{Rule}» → kContractState
    | Breached : kModelCheckResult → kContractState
    | Fulfilled
    | pow : kContractState → kContractState → kContractState
    | ifthenelsefi : kModelCheckResult → kContractState → kContractState → kContractState

  inductive kContractStatus
    | configToStatus : kEventTrace → kContractStatus
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

  inductive kEventTrace
    | «$diff» : kEventTrace → kEventTrace → kEventTrace → kEventTrace
    | «$intersect» : kEventTrace → kEventTrace → kEventTrace → kEventTrace
    | allowedToDo : kModelCheckResult → kModelCheckResult → kEventTrace
    | mayDo : kModelCheckResult → kModelCheckResult → kEventTrace
    | mustDo : kModelCheckResult → kModelCheckResult → kEventTrace
    | prohibitedFromDoing : kModelCheckResult → kModelCheckResult → kEventTrace
    | delete : kEventTrace → kEventTrace → kEventTrace
    | getAction : kEventTrace → kEventTrace
    | getAllActions : k«Set{Rule}» → kEventTrace
    | initAux : k«Set{Rule}» → kEventTrace → kEventTrace
    | init : k«Set{Rule}» → kEventTrace
    | initialConfig
    | insert : kEventTrace → kEventTrace → kEventTrace
    | intersection : kEventTrace → kEventTrace → kEventTrace
    | pretty : kEventTrace → kEventTrace
    | union : kEventTrace → kEventTrace → kEventTrace
    | ltgt₀
    | ltgt₁ : kEventTrace → kEventTrace
    | ltcolonbargt : kModelCheckResult → kCid → kAttributeSet → kEventTrace
    | «ltcolonbar`gt» : kModelCheckResult → kCid → kEventTrace
    | False
    | O : kEventTrace → kEventTrace
    | True
    | sumsum : kEventTrace → kEventTrace → kEventTrace
    | subgt : kEventTrace → kEventTrace → kEventTrace
    | slashbslash : kEventTrace → kEventTrace → kEventTrace
    | ltsubgt : kEventTrace → kEventTrace → kEventTrace
    | lteqgt : kEventTrace → kEventTrace → kEventTrace
    | eqgt : kEventTrace → kEventTrace → kEventTrace
    | R : kEventTrace → kEventTrace → kEventTrace
    | U : kEventTrace → kEventTrace → kEventTrace
    | W : kEventTrace → kEventTrace → kEventTrace
    | bslashslash : kEventTrace → kEventTrace → kEventTrace
    | bslash : kEventTrace → kEventTrace → kEventTrace
    | join : kEventTrace → kEventTrace → kEventTrace
    | «`,» : kEventTrace → kEventTrace → kEventTrace
    | did : kModelCheckResult → kModelCheckResult → kEventTrace
    | do : kModelCheckResult → kModelCheckResult → kEventTrace
    | does : kModelCheckResult → kModelCheckResult → kEventTrace
    | barsubgt : kEventTrace → kEventTrace → kEventTrace
    | «`lbrak`rbrack» : kEventTrace → kEventTrace
    | empty
    | emptyEventTrace
    | none
    | tau
    | tick
    | «~» : kEventTrace → kEventTrace
    | ifthenelsefi : kModelCheckResult → kEventTrace → kEventTrace → kEventTrace

  inductive kFindResult
    | «$card»₀ : kEventTrace → kFindResult → kFindResult
    | «$card»₁ : kModelCheckResult → kFindResult → kFindResult
    | «$card»₂ : k«Set{Rule}» → kFindResult → kFindResult
    | barbar₀ : kEventTrace → kFindResult
    | barbar₁ : kModelCheckResult → kFindResult
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
    | ifthenelsefi : kModelCheckResult → kFindResult → kFindResult → kFindResult

  inductive kHenceLest
    | HENCE : kModelCheckResult → kHenceLest
    | HENCELEST : kModelCheckResult → kModelCheckResult → kHenceLest
    | LEST : kModelCheckResult → kHenceLest
    | LESTHENCE : kModelCheckResult → kModelCheckResult → kHenceLest

  inductive kModelCheckResult
    | true
    | false
    | and : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | or : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | xor : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | not : kModelCheckResult → kModelCheckResult
    | implies : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | «$diff» : kModelCheckResult → kModelCheckResult → kModelCheckResult → kModelCheckResult
    | «$intersect» : kModelCheckResult → kModelCheckResult → kModelCheckResult → kModelCheckResult
    | NOTHING
    | containsActor : kEventTrace → kModelCheckResult → kModelCheckResult
    | containsRuleWithEvent : k«Set{Rule}» → kEventTrace → kModelCheckResult
    | «in»₀ : kEventTrace → kEventTrace → kModelCheckResult
    | «in»₁ : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | «in»₂ : k«Set{Rule}» → k«Set{Rule}» → kModelCheckResult
    | psubset₀ : kEventTrace → kEventTrace → kModelCheckResult
    | psubset₁ : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | psubset₂ : k«Set{Rule}» → k«Set{Rule}» → kModelCheckResult
    | subset₀ : kEventTrace → kEventTrace → kModelCheckResult
    | subset₁ : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | subset₂ : k«Set{Rule}» → k«Set{Rule}» → kModelCheckResult
    | deadlock
    | delete : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | insert : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | intersection : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | union : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | unlabeled
    | ltQidsgt
    | DO : kModelCheckResult → kModelCheckResult
    | lteq₀ : kFindResult → kFindResult → kModelCheckResult
    | lteq₁ : kString → kString → kModelCheckResult
    | lt₀ : kFindResult → kFindResult → kModelCheckResult
    | lt₁ : kString → kString → kModelCheckResult
    | gteq₀ : kFindResult → kFindResult → kModelCheckResult
    | gteq₁ : kString → kString → kModelCheckResult
    | gt₀ : kFindResult → kFindResult → kModelCheckResult
    | gt₁ : kString → kString → kModelCheckResult
    | AND : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | bslash : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | «`,» : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | andsubthen : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | divides : kFindResult → kFindResult → kModelCheckResult
    | orsubelse : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | bareq : kEventTrace → kEventTrace → kModelCheckResult
    | counterexample : kTransitionList → kTransitionList → kModelCheckResult
    | empty
    | modelCheck : kEventTrace → kEventTrace → kModelCheckResult
    | qid : kString → kModelCheckResult
    | ifthenelsefi : kModelCheckResult → kModelCheckResult → kModelCheckResult → kModelCheckResult
    | eqslasheq₀ : kEventTrace → kEventTrace → kModelCheckResult
    | eqslasheq₁ : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | eqslasheq₂ : k«Set{Rule}» → k«Set{Rule}» → kModelCheckResult
    | eqeq₀ : kModelCheckResult → kModelCheckResult → kModelCheckResult
    | eqeq₁ : kDeontic → kDeontic → kModelCheckResult
    | eqeq₂ : kContractStatus → kContractStatus → kModelCheckResult

  inductive kString
    | ltStringsgt
    | sum : kString → kString → kString
    | char : kFindResult → kString
    | lowerCase : kString → kString
    | string : kModelCheckResult → kString
    | substr : kString → kFindResult → kFindResult → kString
    | upperCase : kString → kString

  inductive kTransitionList
    | join : kTransitionList → kTransitionList → kTransitionList
    | «`{`,`}» : kEventTrace → kModelCheckResult → kTransitionList
    | nil

  inductive k«Set{Rule}»
    | «$diff» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | «$intersect» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | delete : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | getRulesWithNames : k«Set{Rule}» → kModelCheckResult → k«Set{Rule}»
    | insert : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | intersection : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | rules
    | union : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | RULE₀ : kModelCheckResult → kActorDeonticActionDeadline → k«Set{Rule}»
    | RULE₁ : kModelCheckResult → kActorDeonticActionDeadline → kHenceLest → k«Set{Rule}»
    | bslash : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | «`,» : k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
    | empty
    | ifthenelsefi : kModelCheckResult → k«Set{Rule}» → k«Set{Rule}» → k«Set{Rule}»
end

-- Kind assignment
def kind : MSort → Type
  | MSort.Bool => kModelCheckResult
  | MSort.Action => kModelCheckResult
  | MSort.ActionEvent => kEventTrace
  | MSort.ActiveRule => kActiveRule
  | MSort.Actor => kCid
  | MSort.ActorDeonticActionDeadline => kActorDeonticActionDeadline
  | MSort.ActorState => kActorState
  | MSort.Attribute => kAttributeSet
  | MSort.AttributeSet => kAttributeSet
  | MSort.Char => kString
  | MSort.Cid => kCid
  | MSort.Configuration => kEventTrace
  | MSort.ContractState => kContractState
  | MSort.ContractStatus => kContractStatus
  | MSort.Coordinator => kCid
  | MSort.Date => kDate
  | MSort.Deadline => kDeadline
  | MSort.Deontic => kDeontic
  | MSort.Duration => kDuration
  | MSort.Event => kEventTrace
  | MSort.EventTrace => kEventTrace
  | MSort.FindResult => kFindResult
  | MSort.Formula => kEventTrace
  | MSort.HenceLest => kHenceLest
  | MSort.Id => kModelCheckResult
  | MSort.Message => kEventTrace
  | MSort.ModelCheckResult => kModelCheckResult
  | MSort.Msg => kEventTrace
  | MSort.Names => kModelCheckResult
  | MSort.Nat => kFindResult
  | MSort.«NeSet{ActionEvent}» => kEventTrace
  | MSort.«NeSet{Qid}» => kModelCheckResult
  | MSort.«NeSet{Rule}» => k«Set{Rule}»
  | MSort.NzNat => kFindResult
  | MSort.Object => kEventTrace
  | MSort.Oid => kModelCheckResult
  | MSort.Portal => kEventTrace
  | MSort.PreCoordinator => kCid
  | MSort.Prop => kEventTrace
  | MSort.Qid => kModelCheckResult
  | MSort.Rule => k«Set{Rule}»
  | MSort.RuleName => kModelCheckResult
  | MSort.«Set{ActionEvent}» => kEventTrace
  | MSort.«Set{Qid}» => kModelCheckResult
  | MSort.«Set{Rule}» => k«Set{Rule}»
  | MSort.Situation => kModelCheckResult
  | MSort.State => kEventTrace
  | MSort.String => kString
  | MSort.TickEvent => kEventTrace
  | MSort.Transition => kTransitionList
  | MSort.TransitionList => kTransitionList
  | MSort.Zero => kFindResult
  | MSort.strategylbrakinternalrbrack => kstrategylbrakinternalrbrack

-- Predicates recognizing constructor terms
mutual

  def kModelCheckResult.ctor_only : kModelCheckResult → Prop
    | kModelCheckResult.true => true
    | kModelCheckResult.false => true
    | (kModelCheckResult.DO a) => a.ctor_only
    | (kModelCheckResult.«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kModelCheckResult.counterexample a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kModelCheckResult.empty => true
    | _ => false

  def kEventTrace.ctor_only : kEventTrace → Prop
    | kEventTrace.ltgt₀ => true
    | (kEventTrace.ltcolonbargt a₀ a₁ a₂) => a₀.ctor_only ∧ a₁.ctor_only ∧ a₂.ctor_only
    | kEventTrace.False => true
    | (kEventTrace.O a) => a.ctor_only
    | kEventTrace.True => true
    | (kEventTrace.sumsum a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.slashbslash a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.R a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.U a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.bslashslash a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.join a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kEventTrace.«`,» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kEventTrace.empty => true
    | kEventTrace.emptyEventTrace => true
    | kEventTrace.none => true
    | kEventTrace.tau => true
    | kEventTrace.tick => true
    | (kEventTrace.«~» a) => a.ctor_only
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

  def kTransitionList.ctor_only : kTransitionList → Prop
    | (kTransitionList.join a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | (kTransitionList.«`{`,`}» a₀ a₁) => a₀.ctor_only ∧ a₁.ctor_only
    | kTransitionList.nil => true

  def kstrategylbrakinternalrbrack.ctor_only : kstrategylbrakinternalrbrack → Prop
    | _ => true
end

-- Equality modulo axioms
mutual

  inductive kModelCheckResult.eqa: kModelCheckResult → kModelCheckResult → Prop
    | refl {a} : kModelCheckResult.eqa a a
    | symm {a b} : kModelCheckResult.eqa a b → kModelCheckResult.eqa b a
    | trans {a b c} : kModelCheckResult.eqa a b → kModelCheckResult.eqa b c → kModelCheckResult.eqa a c
    -- Congruence axioms for each operator
    | eqa_and {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.and a₀ a₁) (kModelCheckResult.and b₀ b₁)
    | eqa_or {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.or a₀ a₁) (kModelCheckResult.or b₀ b₁)
    | eqa_xor {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.xor a₀ a₁) (kModelCheckResult.xor b₀ b₁)
    | eqa_not {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kModelCheckResult.eqa (kModelCheckResult.not a) (kModelCheckResult.not b)
    | eqa_implies {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.implies a₀ a₁) (kModelCheckResult.implies b₀ b₁)
    | eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa a₂ b₂ → kModelCheckResult.eqa (kModelCheckResult.«$diff» a₀ a₁ a₂) (kModelCheckResult.«$diff» b₀ b₁ b₂)
    | eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa a₂ b₂ → kModelCheckResult.eqa (kModelCheckResult.«$intersect» a₀ a₁ a₂) (kModelCheckResult.«$intersect» b₀ b₁ b₂)
    | eqa_containsActor {a₀ b₀ : kEventTrace} {a₁ b₁ : kModelCheckResult} : kEventTrace.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.containsActor a₀ a₁) (kModelCheckResult.containsActor b₀ b₁)
    | eqa_containsRuleWithEvent {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} : k«Set{Rule}».eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.containsRuleWithEvent a₀ a₁) (kModelCheckResult.containsRuleWithEvent b₀ b₁)
    | eqa_«in»₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.«in»₀ a₀ a₁) (kModelCheckResult.«in»₀ b₀ b₁)
    | eqa_«in»₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.«in»₁ a₀ a₁) (kModelCheckResult.«in»₁ b₀ b₁)
    | eqa_«in»₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.«in»₂ a₀ a₁) (kModelCheckResult.«in»₂ b₀ b₁)
    | eqa_psubset₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.psubset₀ a₀ a₁) (kModelCheckResult.psubset₀ b₀ b₁)
    | eqa_psubset₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.psubset₁ a₀ a₁) (kModelCheckResult.psubset₁ b₀ b₁)
    | eqa_psubset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.psubset₂ a₀ a₁) (kModelCheckResult.psubset₂ b₀ b₁)
    | eqa_subset₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.subset₀ a₀ a₁) (kModelCheckResult.subset₀ b₀ b₁)
    | eqa_subset₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.subset₁ a₀ a₁) (kModelCheckResult.subset₁ b₀ b₁)
    | eqa_subset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.subset₂ a₀ a₁) (kModelCheckResult.subset₂ b₀ b₁)
    | eqa_delete {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.delete a₀ a₁) (kModelCheckResult.delete b₀ b₁)
    | eqa_insert {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.insert a₀ a₁) (kModelCheckResult.insert b₀ b₁)
    | eqa_intersection {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.intersection a₀ a₁) (kModelCheckResult.intersection b₀ b₁)
    | eqa_union {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.union a₀ a₁) (kModelCheckResult.union b₀ b₁)
    | eqa_DO {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kModelCheckResult.eqa (kModelCheckResult.DO a) (kModelCheckResult.DO b)
    | eqa_lteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.lteq₀ a₀ a₁) (kModelCheckResult.lteq₀ b₀ b₁)
    | eqa_lteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.lteq₁ a₀ a₁) (kModelCheckResult.lteq₁ b₀ b₁)
    | eqa_lt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.lt₀ a₀ a₁) (kModelCheckResult.lt₀ b₀ b₁)
    | eqa_lt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.lt₁ a₀ a₁) (kModelCheckResult.lt₁ b₀ b₁)
    | eqa_gteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.gteq₀ a₀ a₁) (kModelCheckResult.gteq₀ b₀ b₁)
    | eqa_gteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.gteq₁ a₀ a₁) (kModelCheckResult.gteq₁ b₀ b₁)
    | eqa_gt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.gt₀ a₀ a₁) (kModelCheckResult.gt₀ b₀ b₁)
    | eqa_gt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqa a₀ b₀ → kString.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.gt₁ a₀ a₁) (kModelCheckResult.gt₁ b₀ b₁)
    | eqa_AND {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.AND a₀ a₁) (kModelCheckResult.AND b₀ b₁)
    | eqa_bslash {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.bslash a₀ a₁) (kModelCheckResult.bslash b₀ b₁)
    | eqa_«`,» {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.«`,» a₀ a₁) (kModelCheckResult.«`,» b₀ b₁)
    | eqa_andsubthen {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.andsubthen a₀ a₁) (kModelCheckResult.andsubthen b₀ b₁)
    | eqa_divides {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.divides a₀ a₁) (kModelCheckResult.divides b₀ b₁)
    | eqa_orsubelse {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.orsubelse a₀ a₁) (kModelCheckResult.orsubelse b₀ b₁)
    | eqa_bareq {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.bareq a₀ a₁) (kModelCheckResult.bareq b₀ b₁)
    | eqa_counterexample {a₀ b₀ a₁ b₁ : kTransitionList} : kTransitionList.eqa a₀ b₀ → kTransitionList.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.counterexample a₀ a₁) (kModelCheckResult.counterexample b₀ b₁)
    | eqa_modelCheck {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.modelCheck a₀ a₁) (kModelCheckResult.modelCheck b₀ b₁)
    | eqa_qid {a b : kString} : kString.eqa a b → kModelCheckResult.eqa (kModelCheckResult.qid a) (kModelCheckResult.qid b)
    | eqa_ifthenelsefi {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa a₂ b₂ → kModelCheckResult.eqa (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) (kModelCheckResult.ifthenelsefi b₀ b₁ b₂)
    | eqa_eqslasheq₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqslasheq₀ a₀ a₁) (kModelCheckResult.eqslasheq₀ b₀ b₁)
    | eqa_eqslasheq₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqslasheq₁ a₀ a₁) (kModelCheckResult.eqslasheq₁ b₀ b₁)
    | eqa_eqslasheq₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqslasheq₂ a₀ a₁) (kModelCheckResult.eqslasheq₂ b₀ b₁)
    | eqa_eqeq₀ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqeq₀ a₀ a₁) (kModelCheckResult.eqeq₀ b₀ b₁)
    | eqa_eqeq₁ {a₀ b₀ a₁ b₁ : kDeontic} : kDeontic.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqeq₁ a₀ a₁) (kModelCheckResult.eqeq₁ b₀ b₁)
    | eqa_eqeq₂ {a₀ b₀ a₁ b₁ : kContractStatus} : kContractStatus.eqa a₀ b₀ → kContractStatus.eqa a₁ b₁ → kModelCheckResult.eqa (kModelCheckResult.eqeq₂ a₀ a₁) (kModelCheckResult.eqeq₂ b₀ b₁)
    -- Structural axioms
    | and_comm {a b} : kModelCheckResult.eqa (kModelCheckResult.and a b) (kModelCheckResult.and b a)
    | and_assoc {a b c} : kModelCheckResult.eqa (kModelCheckResult.and a (kModelCheckResult.and b c)) (kModelCheckResult.and (kModelCheckResult.and a b) c)
    | or_comm {a b} : kModelCheckResult.eqa (kModelCheckResult.or a b) (kModelCheckResult.or b a)
    | or_assoc {a b c} : kModelCheckResult.eqa (kModelCheckResult.or a (kModelCheckResult.or b c)) (kModelCheckResult.or (kModelCheckResult.or a b) c)
    | xor_comm {a b} : kModelCheckResult.eqa (kModelCheckResult.xor a b) (kModelCheckResult.xor b a)
    | xor_assoc {a b c} : kModelCheckResult.eqa (kModelCheckResult.xor a (kModelCheckResult.xor b c)) (kModelCheckResult.xor (kModelCheckResult.xor a b) c)
    | AND_comm {a b} : kModelCheckResult.eqa (kModelCheckResult.AND a b) (kModelCheckResult.AND b a)
    | AND_assoc {a b c} : kModelCheckResult.eqa (kModelCheckResult.AND a (kModelCheckResult.AND b c)) (kModelCheckResult.AND (kModelCheckResult.AND a b) c)
    | AND_left_id {a} : kModelCheckResult.eqa (kModelCheckResult.AND kModelCheckResult.empty a) a
    | AND_right_id {a} : kModelCheckResult.eqa (kModelCheckResult.AND a kModelCheckResult.empty) a
    | «`,»_comm {a b} : kModelCheckResult.eqa (kModelCheckResult.«`,» a b) (kModelCheckResult.«`,» b a)
    | «`,»_assoc {a b c} : kModelCheckResult.eqa (kModelCheckResult.«`,» a (kModelCheckResult.«`,» b c)) (kModelCheckResult.«`,» (kModelCheckResult.«`,» a b) c)
    | «`,»_left_id {a} : kModelCheckResult.eqa (kModelCheckResult.«`,» kModelCheckResult.empty a) a
    | «`,»_right_id {a} : kModelCheckResult.eqa (kModelCheckResult.«`,» a kModelCheckResult.empty) a

  inductive kEventTrace.eqa: kEventTrace → kEventTrace → Prop
    | refl {a} : kEventTrace.eqa a a
    | symm {a b} : kEventTrace.eqa a b → kEventTrace.eqa b a
    | trans {a b c} : kEventTrace.eqa a b → kEventTrace.eqa b c → kEventTrace.eqa a c
    -- Congruence axioms for each operator
    | eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa a₂ b₂ → kEventTrace.eqa (kEventTrace.«$diff» a₀ a₁ a₂) (kEventTrace.«$diff» b₀ b₁ b₂)
    | eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa a₂ b₂ → kEventTrace.eqa (kEventTrace.«$intersect» a₀ a₁ a₂) (kEventTrace.«$intersect» b₀ b₁ b₂)
    | eqa_allowedToDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.allowedToDo a₀ a₁) (kEventTrace.allowedToDo b₀ b₁)
    | eqa_mayDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.mayDo a₀ a₁) (kEventTrace.mayDo b₀ b₁)
    | eqa_mustDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.mustDo a₀ a₁) (kEventTrace.mustDo b₀ b₁)
    | eqa_prohibitedFromDoing {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.prohibitedFromDoing a₀ a₁) (kEventTrace.prohibitedFromDoing b₀ b₁)
    | eqa_delete {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.delete a₀ a₁) (kEventTrace.delete b₀ b₁)
    | eqa_getAction {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.getAction a) (kEventTrace.getAction b)
    | eqa_getAllActions {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kEventTrace.eqa (kEventTrace.getAllActions a) (kEventTrace.getAllActions b)
    | eqa_initAux {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} : k«Set{Rule}».eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.initAux a₀ a₁) (kEventTrace.initAux b₀ b₁)
    | eqa_init {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kEventTrace.eqa (kEventTrace.init a) (kEventTrace.init b)
    | eqa_insert {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.insert a₀ a₁) (kEventTrace.insert b₀ b₁)
    | eqa_intersection {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.intersection a₀ a₁) (kEventTrace.intersection b₀ b₁)
    | eqa_pretty {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.pretty a) (kEventTrace.pretty b)
    | eqa_union {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.union a₀ a₁) (kEventTrace.union b₀ b₁)
    | eqa_ltgt₁ {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.ltgt₁ a) (kEventTrace.ltgt₁ b)
    | eqa_ltcolonbargt {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kCid} {a₂ b₂ : kAttributeSet} : kModelCheckResult.eqa a₀ b₀ → kCid.eqa a₁ b₁ → kAttributeSet.eqa a₂ b₂ → kEventTrace.eqa (kEventTrace.ltcolonbargt a₀ a₁ a₂) (kEventTrace.ltcolonbargt b₀ b₁ b₂)
    | eqa_«ltcolonbar`gt» {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kCid} : kModelCheckResult.eqa a₀ b₀ → kCid.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.«ltcolonbar`gt» a₀ a₁) (kEventTrace.«ltcolonbar`gt» b₀ b₁)
    | eqa_O {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.O a) (kEventTrace.O b)
    | eqa_sumsum {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.sumsum a₀ a₁) (kEventTrace.sumsum b₀ b₁)
    | eqa_subgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.subgt a₀ a₁) (kEventTrace.subgt b₀ b₁)
    | eqa_slashbslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.slashbslash a₀ a₁) (kEventTrace.slashbslash b₀ b₁)
    | eqa_ltsubgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.ltsubgt a₀ a₁) (kEventTrace.ltsubgt b₀ b₁)
    | eqa_lteqgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.lteqgt a₀ a₁) (kEventTrace.lteqgt b₀ b₁)
    | eqa_eqgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.eqgt a₀ a₁) (kEventTrace.eqgt b₀ b₁)
    | eqa_R {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.R a₀ a₁) (kEventTrace.R b₀ b₁)
    | eqa_U {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.U a₀ a₁) (kEventTrace.U b₀ b₁)
    | eqa_W {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.W a₀ a₁) (kEventTrace.W b₀ b₁)
    | eqa_bslashslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.bslashslash a₀ a₁) (kEventTrace.bslashslash b₀ b₁)
    | eqa_bslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.bslash a₀ a₁) (kEventTrace.bslash b₀ b₁)
    | eqa_join {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.join a₀ a₁) (kEventTrace.join b₀ b₁)
    | eqa_«`,» {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.«`,» a₀ a₁) (kEventTrace.«`,» b₀ b₁)
    | eqa_did {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.did a₀ a₁) (kEventTrace.did b₀ b₁)
    | eqa_do {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.do a₀ a₁) (kEventTrace.do b₀ b₁)
    | eqa_does {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.does a₀ a₁) (kEventTrace.does b₀ b₁)
    | eqa_barsubgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa (kEventTrace.barsubgt a₀ a₁) (kEventTrace.barsubgt b₀ b₁)
    | eqa_«`lbrak`rbrack» {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.«`lbrak`rbrack» a) (kEventTrace.«`lbrak`rbrack» b)
    | eqa_«~» {a b : kEventTrace} : kEventTrace.eqa a b → kEventTrace.eqa (kEventTrace.«~» a) (kEventTrace.«~» b)
    | eqa_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kEventTrace} : kModelCheckResult.eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kEventTrace.eqa a₂ b₂ → kEventTrace.eqa (kEventTrace.ifthenelsefi a₀ a₁ a₂) (kEventTrace.ifthenelsefi b₀ b₁ b₂)
    -- Structural axioms
    | sumsum_assoc {a b c} : kEventTrace.eqa (kEventTrace.sumsum a (kEventTrace.sumsum b c)) (kEventTrace.sumsum (kEventTrace.sumsum a b) c)
    | sumsum_left_id {a} : kEventTrace.eqa (kEventTrace.sumsum kEventTrace.emptyEventTrace a) a
    | sumsum_right_id {a} : kEventTrace.eqa (kEventTrace.sumsum a kEventTrace.emptyEventTrace) a
    | slashbslash_comm {a b} : kEventTrace.eqa (kEventTrace.slashbslash a b) (kEventTrace.slashbslash b a)
    | bslashslash_comm {a b} : kEventTrace.eqa (kEventTrace.bslashslash a b) (kEventTrace.bslashslash b a)
    | join_comm {a b} : kEventTrace.eqa (kEventTrace.join a b) (kEventTrace.join b a)
    | join_assoc {a b c} : kEventTrace.eqa (kEventTrace.join a (kEventTrace.join b c)) (kEventTrace.join (kEventTrace.join a b) c)
    | join_left_id {a} : kEventTrace.eqa (kEventTrace.join kEventTrace.none a) a
    | join_right_id {a} : kEventTrace.eqa (kEventTrace.join a kEventTrace.none) a
    | «`,»_comm {a b} : kEventTrace.eqa (kEventTrace.«`,» a b) (kEventTrace.«`,» b a)
    | «`,»_assoc {a b c} : kEventTrace.eqa (kEventTrace.«`,» a (kEventTrace.«`,» b c)) (kEventTrace.«`,» (kEventTrace.«`,» a b) c)
    | «`,»_left_id {a} : kEventTrace.eqa (kEventTrace.«`,» kEventTrace.empty a) a
    | «`,»_right_id {a} : kEventTrace.eqa (kEventTrace.«`,» a kEventTrace.empty) a

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
    | eqa_getClass {a b : kEventTrace} : kEventTrace.eqa a b → kCid.eqa (kCid.getClass a) (kCid.getClass b)

  inductive kActorDeonticActionDeadline.eqa: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | refl {a} : kActorDeonticActionDeadline.eqa a a
    | symm {a b} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b a
    | trans {a b c} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqa b c → kActorDeonticActionDeadline.eqa a c
    -- Congruence axioms for each operator
    | eqa_PARTY₀ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeadline} {a₂ b₂ : kDeontic} {a₃ b₃ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kDeadline.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kModelCheckResult.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b₀ b₁ b₂ b₃)
    | eqa_PARTY₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeontic} {a₂ b₂ : kModelCheckResult} {a₃ b₃ : kDeadline} : kModelCheckResult.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kModelCheckResult.eqa a₂ b₂ → kDeadline.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b₀ b₁ b₂ b₃)
    | eqa_PARTY₂ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeontic} {a₂ b₂ : kDeadline} {a₃ b₃ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kDeontic.eqa a₁ b₁ → kDeadline.eqa a₂ b₂ → kModelCheckResult.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b₀ b₁ b₂ b₃)
    | eqa_PARTY₃ {a₀ b₀ : kDeadline} {a₁ b₁ : kModelCheckResult} {a₂ b₂ : kDeontic} {a₃ b₃ : kModelCheckResult} : kDeadline.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kDeontic.eqa a₂ b₂ → kModelCheckResult.eqa a₃ b₃ → kActorDeonticActionDeadline.eqa (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b₀ b₁ b₂ b₃)

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
    | eqa_string {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kString.eqa (kString.string a) (kString.string b)
    | eqa_substr {a₀ b₀ : kString} {a₁ b₁ a₂ b₂ : kFindResult} : kString.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kString.eqa (kString.substr a₀ a₁ a₂) (kString.substr b₀ b₁ b₂)
    | eqa_upperCase {a b : kString} : kString.eqa a b → kString.eqa (kString.upperCase a) (kString.upperCase b)

  inductive kContractState.eqa: kContractState → kContractState → Prop
    | refl {a} : kContractState.eqa a a
    | symm {a b} : kContractState.eqa a b → kContractState.eqa b a
    | trans {a b c} : kContractState.eqa a b → kContractState.eqa b c → kContractState.eqa a c
    -- Congruence axioms for each operator
    | eqa_deltaAction {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} {a₂ b₂ : kContractState} : k«Set{Rule}».eqa a₀ b₀ → kEventTrace.eqa a₁ b₁ → kContractState.eqa a₂ b₂ → kContractState.eqa (kContractState.deltaAction a₀ a₁ a₂) (kContractState.deltaAction b₀ b₁ b₂)
    | eqa_deltaTick {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kContractState} : k«Set{Rule}».eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa (kContractState.deltaTick a₀ a₁) (kContractState.deltaTick b₀ b₁)
    | eqa_Active {a b : k«Set{Rule}»} : k«Set{Rule}».eqa a b → kContractState.eqa (kContractState.Active a) (kContractState.Active b)
    | eqa_Breached {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kContractState.eqa (kContractState.Breached a) (kContractState.Breached b)
    | eqa_pow {a₀ b₀ a₁ b₁ : kContractState} : kContractState.eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa (kContractState.pow a₀ a₁) (kContractState.pow b₀ b₁)
    | eqa_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kContractState} : kModelCheckResult.eqa a₀ b₀ → kContractState.eqa a₁ b₁ → kContractState.eqa a₂ b₂ → kContractState.eqa (kContractState.ifthenelsefi a₀ a₁ a₂) (kContractState.ifthenelsefi b₀ b₁ b₂)
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
    | eqa_configToStatus {a b : kEventTrace} : kEventTrace.eqa a b → kContractStatus.eqa (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
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
    | eqa_«$card»₀ {a₀ b₀ : kEventTrace} {a₁ b₁ : kFindResult} : kEventTrace.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₀ a₀ a₁) (kFindResult.«$card»₀ b₀ b₁)
    | eqa_«$card»₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kFindResult} : kModelCheckResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₁ a₀ a₁) (kFindResult.«$card»₁ b₀ b₁)
    | eqa_«$card»₂ {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kFindResult} : k«Set{Rule}».eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa (kFindResult.«$card»₂ a₀ a₁) (kFindResult.«$card»₂ b₀ b₁)
    | eqa_barbar₀ {a b : kEventTrace} : kEventTrace.eqa a b → kFindResult.eqa (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
    | eqa_barbar₁ {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kFindResult.eqa (kFindResult.barbar₁ a) (kFindResult.barbar₁ b)
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
    | eqa_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kFindResult} : kModelCheckResult.eqa a₀ b₀ → kFindResult.eqa a₁ b₁ → kFindResult.eqa a₂ b₂ → kFindResult.eqa (kFindResult.ifthenelsefi a₀ a₁ a₂) (kFindResult.ifthenelsefi b₀ b₁ b₂)
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
    | eqa_HENCE {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kHenceLest.eqa (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | eqa_HENCELEST {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.HENCELEST a₀ a₁) (kHenceLest.HENCELEST b₀ b₁)
    | eqa_LEST {a b : kModelCheckResult} : kModelCheckResult.eqa a b → kHenceLest.eqa (kHenceLest.LEST a) (kHenceLest.LEST b)
    | eqa_LESTHENCE {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kHenceLest.eqa (kHenceLest.LESTHENCE a₀ a₁) (kHenceLest.LESTHENCE b₀ b₁)

  inductive k«Set{Rule}».eqa: k«Set{Rule}» → k«Set{Rule}» → Prop
    | refl {a} : k«Set{Rule}».eqa a a
    | symm {a b} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqa b a
    | trans {a b c} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqa b c → k«Set{Rule}».eqa a c
    -- Congruence axioms for each operator
    | eqa_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».«$diff» a₀ a₁ a₂) (k«Set{Rule}».«$diff» b₀ b₁ b₂)
    | eqa_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».«$intersect» a₀ a₁ a₂) (k«Set{Rule}».«$intersect» b₀ b₁ b₂)
    | eqa_delete {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».delete a₀ a₁) (k«Set{Rule}».delete b₀ b₁)
    | eqa_getRulesWithNames {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kModelCheckResult} : k«Set{Rule}».eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».getRulesWithNames a₀ a₁) (k«Set{Rule}».getRulesWithNames b₀ b₁)
    | eqa_insert {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».insert a₀ a₁) (k«Set{Rule}».insert b₀ b₁)
    | eqa_intersection {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».intersection a₀ a₁) (k«Set{Rule}».intersection b₀ b₁)
    | eqa_union {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».union a₀ a₁) (k«Set{Rule}».union b₀ b₁)
    | eqa_RULE₀ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kActorDeonticActionDeadline} : kModelCheckResult.eqa a₀ b₀ → kActorDeonticActionDeadline.eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».RULE₀ a₀ a₁) (k«Set{Rule}».RULE₀ b₀ b₁)
    | eqa_RULE₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kActorDeonticActionDeadline} {a₂ b₂ : kHenceLest} : kModelCheckResult.eqa a₀ b₀ → kActorDeonticActionDeadline.eqa a₁ b₁ → kHenceLest.eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».RULE₁ a₀ a₁ a₂) (k«Set{Rule}».RULE₁ b₀ b₁ b₂)
    | eqa_bslash {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».bslash a₀ a₁) (k«Set{Rule}».bslash b₀ b₁)
    | eqa_«`,» {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa (k«Set{Rule}».«`,» a₀ a₁) (k«Set{Rule}».«`,» b₀ b₁)
    | eqa_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : k«Set{Rule}»} : kModelCheckResult.eqa a₀ b₀ → k«Set{Rule}».eqa a₁ b₁ → k«Set{Rule}».eqa a₂ b₂ → k«Set{Rule}».eqa (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) (k«Set{Rule}».ifthenelsefi b₀ b₁ b₂)
    -- Structural axioms
    | «`,»_comm {a b} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a b) (k«Set{Rule}».«`,» b a)
    | «`,»_assoc {a b c} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a (k«Set{Rule}».«`,» b c)) (k«Set{Rule}».«`,» (k«Set{Rule}».«`,» a b) c)
    | «`,»_left_id {a} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» k«Set{Rule}».empty a) a
    | «`,»_right_id {a} : k«Set{Rule}».eqa (k«Set{Rule}».«`,» a k«Set{Rule}».empty) a

  inductive kTransitionList.eqa: kTransitionList → kTransitionList → Prop
    | refl {a} : kTransitionList.eqa a a
    | symm {a b} : kTransitionList.eqa a b → kTransitionList.eqa b a
    | trans {a b c} : kTransitionList.eqa a b → kTransitionList.eqa b c → kTransitionList.eqa a c
    -- Congruence axioms for each operator
    | eqa_join {a₀ b₀ a₁ b₁ : kTransitionList} : kTransitionList.eqa a₀ b₀ → kTransitionList.eqa a₁ b₁ → kTransitionList.eqa (kTransitionList.join a₀ a₁) (kTransitionList.join b₀ b₁)
    | eqa_«`{`,`}» {a₀ b₀ : kEventTrace} {a₁ b₁ : kModelCheckResult} : kEventTrace.eqa a₀ b₀ → kModelCheckResult.eqa a₁ b₁ → kTransitionList.eqa (kTransitionList.«`{`,`}» a₀ a₁) (kTransitionList.«`{`,`}» b₀ b₁)
    -- Structural axioms
    | join_assoc {a b c} : kTransitionList.eqa (kTransitionList.join a (kTransitionList.join b c)) (kTransitionList.join (kTransitionList.join a b) c)
    | join_left_id {a} : kTransitionList.eqa (kTransitionList.join kTransitionList.nil a) a
    | join_right_id {a} : kTransitionList.eqa (kTransitionList.join a kTransitionList.nil) a

  inductive kstrategylbrakinternalrbrack.eqa: kstrategylbrakinternalrbrack → kstrategylbrakinternalrbrack → Prop
    | refl {a} : kstrategylbrakinternalrbrack.eqa a a
    | symm {a b} : kstrategylbrakinternalrbrack.eqa a b → kstrategylbrakinternalrbrack.eqa b a
    | trans {a b c} : kstrategylbrakinternalrbrack.eqa a b → kstrategylbrakinternalrbrack.eqa b c → kstrategylbrakinternalrbrack.eqa a c
    -- Congruence axioms for each operator
end

-- Sort membership and equality modulo equations

mutual
  inductive kModelCheckResult.has_sort: kModelCheckResult → MSort → Prop
    | subsort {t a b} : subsort a b → kModelCheckResult.has_sort t a → kModelCheckResult.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | true_decl₀ : kModelCheckResult.has_sort kModelCheckResult.true MSort.Bool
    | true_decl₁ : kModelCheckResult.has_sort kModelCheckResult.true MSort.Bool
    | false_decl₀ : kModelCheckResult.has_sort kModelCheckResult.false MSort.Bool
    | false_decl₁ : kModelCheckResult.has_sort kModelCheckResult.false MSort.Bool
    | and_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.and a₀ a₁) MSort.Bool
    | and_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.and a₀ a₁) MSort.Bool
    | or_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.or a₀ a₁) MSort.Bool
    | or_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.or a₀ a₁) MSort.Bool
    | xor_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.xor a₀ a₁) MSort.Bool
    | xor_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.xor a₀ a₁) MSort.Bool
    | not_decl₀ {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.not a) MSort.Bool
    | not_decl₁ {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.not a) MSort.Bool
    | implies_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.implies a₀ a₁) MSort.Bool
    | implies_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.implies a₀ a₁) MSort.Bool
    | «$diff»_decl {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₂ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«$diff» a₀ a₁ a₂) MSort.«Set{Qid}»
    | «$intersect»_decl {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₂ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«$intersect» a₀ a₁ a₂) MSort.«Set{Qid}»
    | NOTHING_decl : kModelCheckResult.has_sort kModelCheckResult.NOTHING MSort.Names
    | containsActor_decl {a₀ : kEventTrace} {a₁ : kModelCheckResult} : kEventTrace.has_sort a₀ MSort.Configuration → kModelCheckResult.has_sort a₁ MSort.Qid → kModelCheckResult.has_sort (kModelCheckResult.containsActor a₀ a₁) MSort.Bool
    | containsRuleWithEvent_decl {a₀ : k«Set{Rule}»} {a₁ : kEventTrace} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kEventTrace.has_sort a₁ MSort.ActionEvent → kModelCheckResult.has_sort (kModelCheckResult.containsRuleWithEvent a₀ a₁) MSort.Bool
    | «in»₀_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.ActionEvent → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kModelCheckResult.has_sort (kModelCheckResult.«in»₀ a₀ a₁) MSort.Bool
    | «in»₁_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«in»₁ a₀ a₁) MSort.Bool
    | «in»₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kModelCheckResult.has_sort (kModelCheckResult.«in»₂ a₀ a₁) MSort.Bool
    | psubset₀_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kModelCheckResult.has_sort (kModelCheckResult.psubset₀ a₀ a₁) MSort.Bool
    | psubset₁_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.psubset₁ a₀ a₁) MSort.Bool
    | psubset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kModelCheckResult.has_sort (kModelCheckResult.psubset₂ a₀ a₁) MSort.Bool
    | subset₀_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kModelCheckResult.has_sort (kModelCheckResult.subset₀ a₀ a₁) MSort.Bool
    | subset₁_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.subset₁ a₀ a₁) MSort.Bool
    | subset₂_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → kModelCheckResult.has_sort (kModelCheckResult.subset₂ a₀ a₁) MSort.Bool
    | deadlock_decl : kModelCheckResult.has_sort kModelCheckResult.deadlock MSort.RuleName
    | delete_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.delete a₀ a₁) MSort.«Set{Qid}»
    | insert_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.insert a₀ a₁) MSort.«Set{Qid}»
    | intersection_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.intersection a₀ a₁) MSort.«Set{Qid}»
    | union_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.union a₀ a₁) MSort.«NeSet{Qid}»
    | union_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.union a₀ a₁) MSort.«NeSet{Qid}»
    | union_decl₂ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.union a₀ a₁) MSort.«Set{Qid}»
    | unlabeled_decl : kModelCheckResult.has_sort kModelCheckResult.unlabeled MSort.RuleName
    | ltQidsgt_decl : kModelCheckResult.has_sort kModelCheckResult.ltQidsgt MSort.Qid
    | DO_decl {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.Qid → kModelCheckResult.has_sort (kModelCheckResult.DO a) MSort.Action
    | lteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kModelCheckResult.has_sort (kModelCheckResult.lteq₀ a₀ a₁) MSort.Bool
    | lteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kModelCheckResult.has_sort (kModelCheckResult.lteq₁ a₀ a₁) MSort.Bool
    | lt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kModelCheckResult.has_sort (kModelCheckResult.lt₀ a₀ a₁) MSort.Bool
    | lt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kModelCheckResult.has_sort (kModelCheckResult.lt₁ a₀ a₁) MSort.Bool
    | gteq₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kModelCheckResult.has_sort (kModelCheckResult.gteq₀ a₀ a₁) MSort.Bool
    | gteq₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kModelCheckResult.has_sort (kModelCheckResult.gteq₁ a₀ a₁) MSort.Bool
    | gt₀_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kModelCheckResult.has_sort (kModelCheckResult.gt₀ a₀ a₁) MSort.Bool
    | gt₁_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kModelCheckResult.has_sort (kModelCheckResult.gt₁ a₀ a₁) MSort.Bool
    | AND_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Names → kModelCheckResult.has_sort a₁ MSort.Names → kModelCheckResult.has_sort (kModelCheckResult.AND a₀ a₁) MSort.Names
    | bslash_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.bslash a₀ a₁) MSort.«Set{Qid}»
    | «`,»_decl₀ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«`,» a₀ a₁) MSort.«NeSet{Qid}»
    | «`,»_decl₁ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«`,» a₀ a₁) MSort.«Set{Qid}»
    | «`,»_decl₂ {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.«`,» a₀ a₁) MSort.«NeSet{Qid}»
    | andsubthen_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.andsubthen a₀ a₁) MSort.Bool
    | divides_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kModelCheckResult.has_sort (kModelCheckResult.divides a₀ a₁) MSort.Bool
    | orsubelse_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.orsubelse a₀ a₁) MSort.Bool
    | bareq_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.State → kEventTrace.has_sort a₁ MSort.Prop → kModelCheckResult.has_sort (kModelCheckResult.bareq a₀ a₁) MSort.Bool
    | counterexample_decl {a₀ a₁ : kTransitionList} : kTransitionList.has_sort a₀ MSort.TransitionList → kTransitionList.has_sort a₁ MSort.TransitionList → kModelCheckResult.has_sort (kModelCheckResult.counterexample a₀ a₁) MSort.ModelCheckResult
    | empty_decl : kModelCheckResult.has_sort kModelCheckResult.empty MSort.«Set{Qid}»
    | ifthenelsefi_decl₁ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.ModelCheckResult → kModelCheckResult.has_sort a₂ MSort.ModelCheckResult → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.ModelCheckResult
    | ifthenelsefi_decl₂ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Action → kModelCheckResult.has_sort a₂ MSort.Action → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Action
    | ifthenelsefi_decl₃ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₂ MSort.«Set{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.«Set{Qid}»
    | ifthenelsefi_decl₄ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Id → kModelCheckResult.has_sort a₂ MSort.Id → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Id
    | ifthenelsefi_decl₅ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.RuleName → kModelCheckResult.has_sort a₂ MSort.RuleName → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.RuleName
    | ifthenelsefi_decl₆ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Situation → kModelCheckResult.has_sort a₂ MSort.Situation → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Situation
    | ifthenelsefi_decl₇ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Names → kModelCheckResult.has_sort a₂ MSort.Names → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Names
    | ifthenelsefi_decl₈ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort a₂ MSort.«NeSet{Qid}» → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{Qid}»
    | ifthenelsefi_decl₉ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Oid → kModelCheckResult.has_sort a₂ MSort.Oid → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Oid
    | ifthenelsefi_decl₁₀ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Bool → kModelCheckResult.has_sort a₂ MSort.Bool → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Bool
    | ifthenelsefi_decl₁₁ {a₀ a₁ a₂ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kModelCheckResult.has_sort a₁ MSort.Qid → kModelCheckResult.has_sort a₂ MSort.Qid → kModelCheckResult.has_sort (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) MSort.Qid
    | eqslasheq₀_decl {a₀ a₁ : kEventTrace} : kModelCheckResult.has_sort (kModelCheckResult.eqslasheq₀ a₀ a₁) MSort.Bool
    | eqslasheq₁_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort (kModelCheckResult.eqslasheq₁ a₀ a₁) MSort.Bool
    | eqslasheq₂_decl {a₀ a₁ : k«Set{Rule}»} : kModelCheckResult.has_sort (kModelCheckResult.eqslasheq₂ a₀ a₁) MSort.Bool
    | eqeq₀_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort (kModelCheckResult.eqeq₀ a₀ a₁) MSort.Bool
    | eqeq₁_decl {a₀ a₁ : kDeontic} : kModelCheckResult.has_sort (kModelCheckResult.eqeq₁ a₀ a₁) MSort.Bool
    | eqeq₂_decl {a₀ a₁ : kContractStatus} : kModelCheckResult.has_sort (kModelCheckResult.eqeq₂ a₀ a₁) MSort.Bool

  inductive kEventTrace.has_sort: kEventTrace → MSort → Prop
    | subsort {t a b} : subsort a b → kEventTrace.has_sort t a → kEventTrace.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | «$diff»_decl {a₀ a₁ a₂ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₂ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.«$diff» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    | «$intersect»_decl {a₀ a₁ a₂ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₂ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.«$intersect» a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    | allowedToDo_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.Qid → kEventTrace.has_sort (kEventTrace.allowedToDo a₀ a₁) MSort.Prop
    | mayDo_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.Qid → kEventTrace.has_sort (kEventTrace.mayDo a₀ a₁) MSort.Prop
    | mustDo_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.Qid → kEventTrace.has_sort (kEventTrace.mustDo a₀ a₁) MSort.Prop
    | prohibitedFromDoing_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kModelCheckResult.has_sort a₁ MSort.Qid → kEventTrace.has_sort (kEventTrace.prohibitedFromDoing a₀ a₁) MSort.Prop
    | delete_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.ActionEvent → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.delete a₀ a₁) MSort.«Set{ActionEvent}»
    | getAction_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Configuration → kEventTrace.has_sort (kEventTrace.getAction a) MSort.ActionEvent
    | getAllActions_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kEventTrace.has_sort (kEventTrace.getAllActions a) MSort.«Set{ActionEvent}»
    | initAux_decl {a₀ : k«Set{Rule}»} {a₁ : kEventTrace} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kEventTrace.has_sort a₁ MSort.Configuration → kEventTrace.has_sort (kEventTrace.initAux a₀ a₁) MSort.Configuration
    | init_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kEventTrace.has_sort (kEventTrace.init a) MSort.Configuration
    | initialConfig_decl : kEventTrace.has_sort kEventTrace.initialConfig MSort.Configuration
    | insert_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.ActionEvent → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.insert a₀ a₁) MSort.«Set{ActionEvent}»
    | intersection_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.intersection a₀ a₁) MSort.«Set{ActionEvent}»
    | pretty_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Configuration → kEventTrace.has_sort (kEventTrace.pretty a) MSort.Configuration
    | union_decl₀ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.union a₀ a₁) MSort.«NeSet{ActionEvent}»
    | union_decl₁ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort (kEventTrace.union a₀ a₁) MSort.«NeSet{ActionEvent}»
    | union_decl₂ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.union a₀ a₁) MSort.«Set{ActionEvent}»
    | ltgt₀_decl : kEventTrace.has_sort kEventTrace.ltgt₀ MSort.Portal
    | ltgt₁_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Formula → kEventTrace.has_sort (kEventTrace.ltgt₁ a) MSort.Formula
    | ltcolonbargt_decl {a₀ : kModelCheckResult} {a₁ : kCid} {a₂ : kAttributeSet} : kModelCheckResult.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kAttributeSet.has_sort a₂ MSort.AttributeSet → kEventTrace.has_sort (kEventTrace.ltcolonbargt a₀ a₁ a₂) MSort.Object
    | «ltcolonbar`gt»_decl {a₀ : kModelCheckResult} {a₁ : kCid} : kModelCheckResult.has_sort a₀ MSort.Oid → kCid.has_sort a₁ MSort.Cid → kEventTrace.has_sort (kEventTrace.«ltcolonbar`gt» a₀ a₁) MSort.Object
    | False_decl : kEventTrace.has_sort kEventTrace.False MSort.Formula
    | O_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Formula → kEventTrace.has_sort (kEventTrace.O a) MSort.Formula
    | True_decl : kEventTrace.has_sort kEventTrace.True MSort.Formula
    | sumsum_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.EventTrace → kEventTrace.has_sort a₁ MSort.EventTrace → kEventTrace.has_sort (kEventTrace.sumsum a₀ a₁) MSort.EventTrace
    | subgt_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.subgt a₀ a₁) MSort.Formula
    | slashbslash_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.slashbslash a₀ a₁) MSort.Formula
    | ltsubgt_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.ltsubgt a₀ a₁) MSort.Formula
    | lteqgt_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.lteqgt a₀ a₁) MSort.Formula
    | eqgt_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.eqgt a₀ a₁) MSort.Formula
    | R_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.R a₀ a₁) MSort.Formula
    | U_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.U a₀ a₁) MSort.Formula
    | W_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.W a₀ a₁) MSort.Formula
    | bslashslash_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.bslashslash a₀ a₁) MSort.Formula
    | bslash_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.bslash a₀ a₁) MSort.«Set{ActionEvent}»
    | join_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Configuration → kEventTrace.has_sort a₁ MSort.Configuration → kEventTrace.has_sort (kEventTrace.join a₀ a₁) MSort.Configuration
    | «`,»_decl₀ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
    | «`,»_decl₁ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.«`,» a₀ a₁) MSort.«Set{ActionEvent}»
    | «`,»_decl₂ {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₁ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort (kEventTrace.«`,» a₀ a₁) MSort.«NeSet{ActionEvent}»
    | did_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Id → kModelCheckResult.has_sort a₁ MSort.Id → kEventTrace.has_sort (kEventTrace.did a₀ a₁) MSort.ActionEvent
    | do_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Id → kModelCheckResult.has_sort a₁ MSort.Id → kEventTrace.has_sort (kEventTrace.do a₀ a₁) MSort.ActionEvent
    | does_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Id → kModelCheckResult.has_sort a₁ MSort.Id → kEventTrace.has_sort (kEventTrace.does a₀ a₁) MSort.ActionEvent
    | barsubgt_decl {a₀ a₁ : kEventTrace} : kEventTrace.has_sort a₀ MSort.Formula → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort (kEventTrace.barsubgt a₀ a₁) MSort.Formula
    | «`lbrak`rbrack»_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Formula → kEventTrace.has_sort (kEventTrace.«`lbrak`rbrack» a) MSort.Formula
    | empty_decl : kEventTrace.has_sort kEventTrace.empty MSort.«Set{ActionEvent}»
    | emptyEventTrace_decl : kEventTrace.has_sort kEventTrace.emptyEventTrace MSort.EventTrace
    | none_decl : kEventTrace.has_sort kEventTrace.none MSort.Configuration
    | tau_decl : kEventTrace.has_sort kEventTrace.tau MSort.ActionEvent
    | tick_decl : kEventTrace.has_sort kEventTrace.tick MSort.TickEvent
    | «~»_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Formula → kEventTrace.has_sort (kEventTrace.«~» a) MSort.Formula
    | ifthenelsefi_decl₁ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.EventTrace → kEventTrace.has_sort a₂ MSort.EventTrace → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.EventTrace
    | ifthenelsefi_decl₂ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.State → kEventTrace.has_sort a₂ MSort.State → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.State
    | ifthenelsefi_decl₃ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.«Set{ActionEvent}» → kEventTrace.has_sort a₂ MSort.«Set{ActionEvent}» → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.«Set{ActionEvent}»
    | ifthenelsefi_decl₄ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Formula → kEventTrace.has_sort a₂ MSort.Formula → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Formula
    | ifthenelsefi_decl₅ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Configuration → kEventTrace.has_sort a₂ MSort.Configuration → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Configuration
    | ifthenelsefi_decl₆ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort a₂ MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{ActionEvent}»
    | ifthenelsefi_decl₇ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Prop → kEventTrace.has_sort a₂ MSort.Prop → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Prop
    | ifthenelsefi_decl₈ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Msg → kEventTrace.has_sort a₂ MSort.Msg → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Msg
    | ifthenelsefi_decl₉ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Object → kEventTrace.has_sort a₂ MSort.Object → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Object
    | ifthenelsefi_decl₁₀ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Portal → kEventTrace.has_sort a₂ MSort.Portal → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Portal
    | ifthenelsefi_decl₁₁ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Message → kEventTrace.has_sort a₂ MSort.Message → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Message
    | ifthenelsefi_decl₁₂ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.Event → kEventTrace.has_sort a₂ MSort.Event → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.Event
    | ifthenelsefi_decl₁₃ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.ActionEvent → kEventTrace.has_sort a₂ MSort.ActionEvent → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.ActionEvent
    | ifthenelsefi_decl₁₄ {a₀ : kModelCheckResult} {a₁ a₂ : kEventTrace} : kModelCheckResult.has_sort a₀ MSort.Bool → kEventTrace.has_sort a₁ MSort.TickEvent → kEventTrace.has_sort a₂ MSort.TickEvent → kEventTrace.has_sort (kEventTrace.ifthenelsefi a₀ a₁ a₂) MSort.TickEvent

  inductive kActiveRule.has_sort: kActiveRule → MSort → Prop
    | subsort {t a b} : subsort a b → kActiveRule.has_sort t a → kActiveRule.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kCid.has_sort: kCid → MSort → Prop
    | subsort {t a b} : subsort a b → kCid.has_sort t a → kCid.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | Actor_decl : kCid.has_sort kCid.Actor MSort.Actor
    | Coordinator_decl : kCid.has_sort kCid.Coordinator MSort.Coordinator
    | PreCoordinator_decl : kCid.has_sort kCid.PreCoordinator MSort.PreCoordinator
    | getClass_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Object → kCid.has_sort (kCid.getClass a) MSort.Cid

  inductive kActorDeonticActionDeadline.has_sort: kActorDeonticActionDeadline → MSort → Prop
    | subsort {t a b} : subsort a b → kActorDeonticActionDeadline.has_sort t a → kActorDeonticActionDeadline.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | PARTY₀_decl {a₀ : kModelCheckResult} {a₁ : kDeadline} {a₂ : kDeontic} {a₃ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kDeadline.has_sort a₁ MSort.Deadline → kDeontic.has_sort a₂ MSort.Deontic → kModelCheckResult.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    | PARTY₁_decl {a₀ : kModelCheckResult} {a₁ : kDeontic} {a₂ : kModelCheckResult} {a₃ : kDeadline} : kModelCheckResult.has_sort a₀ MSort.Qid → kDeontic.has_sort a₁ MSort.Deontic → kModelCheckResult.has_sort a₂ MSort.Action → kDeadline.has_sort a₃ MSort.Deadline → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    | PARTY₂_decl {a₀ : kModelCheckResult} {a₁ : kDeontic} {a₂ : kDeadline} {a₃ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.Qid → kDeontic.has_sort a₁ MSort.Deontic → kDeadline.has_sort a₂ MSort.Deadline → kModelCheckResult.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline
    | PARTY₃_decl {a₀ : kDeadline} {a₁ : kModelCheckResult} {a₂ : kDeontic} {a₃ : kModelCheckResult} : kDeadline.has_sort a₀ MSort.Deadline → kModelCheckResult.has_sort a₁ MSort.Qid → kDeontic.has_sort a₂ MSort.Deontic → kModelCheckResult.has_sort a₃ MSort.Action → kActorDeonticActionDeadline.has_sort (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) MSort.ActorDeonticActionDeadline

  inductive kActorState.has_sort: kActorState → MSort → Prop
    | subsort {t a b} : subsort a b → kActorState.has_sort t a → kActorState.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kAttributeSet.has_sort: kAttributeSet → MSort → Prop
    | subsort {t a b} : subsort a b → kAttributeSet.has_sort t a → kAttributeSet.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | «`,»_decl {a₀ a₁ : kAttributeSet} : kAttributeSet.has_sort a₀ MSort.AttributeSet → kAttributeSet.has_sort a₁ MSort.AttributeSet → kAttributeSet.has_sort (kAttributeSet.«`,» a₀ a₁) MSort.AttributeSet
    | «contractState`colon»_decl {a : kContractState} : kContractState.has_sort a MSort.ContractState → kAttributeSet.has_sort (kAttributeSet.«contractState`colon» a) MSort.Attribute
    | none_decl : kAttributeSet.has_sort kAttributeSet.none MSort.AttributeSet
    | «rules`colon»_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kAttributeSet.has_sort (kAttributeSet.«rules`colon» a) MSort.Attribute
    | «time`colon»_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kAttributeSet.has_sort (kAttributeSet.«time`colon» a) MSort.Attribute

  inductive kString.has_sort: kString → MSort → Prop
    | subsort {t a b} : subsort a b → kString.has_sort t a → kString.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | ltStringsgt_decl₀ : kString.has_sort kString.ltStringsgt MSort.Char
    | ltStringsgt_decl₁ : kString.has_sort kString.ltStringsgt MSort.String
    | sum_decl {a₀ a₁ : kString} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kString.has_sort (kString.sum a₀ a₁) MSort.String
    | lowerCase_decl {a : kString} : kString.has_sort a MSort.String → kString.has_sort (kString.lowerCase a) MSort.String
    | string_decl {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.Qid → kString.has_sort (kString.string a) MSort.String
    | substr_decl {a₀ : kString} {a₁ a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort a₂ MSort.Nat → kString.has_sort (kString.substr a₀ a₁ a₂) MSort.String
    | upperCase_decl {a : kString} : kString.has_sort a MSort.String → kString.has_sort (kString.upperCase a) MSort.String

  inductive kContractState.has_sort: kContractState → MSort → Prop
    | subsort {t a b} : subsort a b → kContractState.has_sort t a → kContractState.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | deltaAction_decl {a₀ : k«Set{Rule}»} {a₁ : kEventTrace} {a₂ : kContractState} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kEventTrace.has_sort a₁ MSort.ActionEvent → kContractState.has_sort a₂ MSort.ContractState → kContractState.has_sort (kContractState.deltaAction a₀ a₁ a₂) MSort.ContractState
    | deltaTick_decl {a₀ : k«Set{Rule}»} {a₁ : kContractState} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort (kContractState.deltaTick a₀ a₁) MSort.ContractState
    | Active_decl {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kContractState.has_sort (kContractState.Active a) MSort.ContractState
    | Breached_decl {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.«Set{Qid}» → kContractState.has_sort (kContractState.Breached a) MSort.ContractState
    | Fulfilled_decl : kContractState.has_sort kContractState.Fulfilled MSort.ContractState
    | pow_decl {a₀ a₁ : kContractState} : kContractState.has_sort a₀ MSort.ContractState → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort (kContractState.pow a₀ a₁) MSort.ContractState
    | ifthenelsefi_decl₁ {a₀ : kModelCheckResult} {a₁ a₂ : kContractState} : kModelCheckResult.has_sort a₀ MSort.Bool → kContractState.has_sort a₁ MSort.ContractState → kContractState.has_sort a₂ MSort.ContractState → kContractState.has_sort (kContractState.ifthenelsefi a₀ a₁ a₂) MSort.ContractState

  inductive kContractStatus.has_sort: kContractStatus → MSort → Prop
    | subsort {t a b} : subsort a b → kContractStatus.has_sort t a → kContractStatus.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | configToStatus_decl {a : kEventTrace} : kEventTrace.has_sort a MSort.Configuration → kContractStatus.has_sort (kContractStatus.configToStatus a) MSort.ContractStatus
    | contractStateToStatus_decl {a : kContractState} : kContractState.has_sort a MSort.ContractState → kContractStatus.has_sort (kContractStatus.contractStateToStatus a) MSort.ContractStatus
    | Active_decl : kContractStatus.has_sort kContractStatus.Active MSort.ContractStatus
    | Breached_decl : kContractStatus.has_sort kContractStatus.Breached MSort.ContractStatus
    | Fulfilled_decl : kContractStatus.has_sort kContractStatus.Fulfilled MSort.ContractStatus

  inductive kDate.has_sort: kDate → MSort → Prop
    | subsort {t a b} : subsort a b → kDate.has_sort t a → kDate.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kDeadline.has_sort: kDeadline → MSort → Prop
    | subsort {t a b} : subsort a b → kDeadline.has_sort t a → kDeadline.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | BY_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDeadline.has_sort (kDeadline.BY a) MSort.Deadline
    | WITHIN_decl {a : kDuration} : kDuration.has_sort a MSort.Duration → kDeadline.has_sort (kDeadline.WITHIN a) MSort.Deadline

  inductive kDeontic.has_sort: kDeontic → MSort → Prop
    | subsort {t a b} : subsort a b → kDeontic.has_sort t a → kDeontic.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | MAY_decl : kDeontic.has_sort kDeontic.MAY MSort.Deontic
    | MUST_decl : kDeontic.has_sort kDeontic.MUST MSort.Deontic
    | SHANT_decl : kDeontic.has_sort kDeontic.SHANT MSort.Deontic

  inductive kDuration.has_sort: kDuration → MSort → Prop
    | subsort {t a b} : subsort a b → kDuration.has_sort t a → kDuration.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | DAY_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.DAY a) MSort.Duration
    | MONTH_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.MONTH a) MSort.Duration
    | WEEK_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.WEEK a) MSort.Duration
    | YEAR_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kDuration.has_sort (kDuration.YEAR a) MSort.Duration

  inductive kFindResult.has_sort: kFindResult → MSort → Prop
    | subsort {t a b} : subsort a b → kFindResult.has_sort t a → kFindResult.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | «$card»₀_decl {a₀ : kEventTrace} {a₁ : kFindResult} : kEventTrace.has_sort a₀ MSort.«Set{ActionEvent}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₀ a₀ a₁) MSort.Nat
    | «$card»₁_decl {a₀ : kModelCheckResult} {a₁ : kFindResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₁ a₀ a₁) MSort.Nat
    | «$card»₂_decl {a₀ : k«Set{Rule}»} {a₁ : kFindResult} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.«$card»₂ a₀ a₁) MSort.Nat
    | barbar₀_decl₀ {a : kEventTrace} : kEventTrace.has_sort a MSort.«NeSet{ActionEvent}» → kFindResult.has_sort (kFindResult.barbar₀ a) MSort.NzNat
    | barbar₀_decl₁ {a : kEventTrace} : kEventTrace.has_sort a MSort.«Set{ActionEvent}» → kFindResult.has_sort (kFindResult.barbar₀ a) MSort.Nat
    | barbar₁_decl₀ {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.«NeSet{Qid}» → kFindResult.has_sort (kFindResult.barbar₁ a) MSort.NzNat
    | barbar₁_decl₁ {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.«Set{Qid}» → kFindResult.has_sort (kFindResult.barbar₁ a) MSort.Nat
    | barbar₂_decl₀ {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«NeSet{Rule}» → kFindResult.has_sort (kFindResult.barbar₂ a) MSort.NzNat
    | barbar₂_decl₁ {a : k«Set{Rule}»} : k«Set{Rule}».has_sort a MSort.«Set{Rule}» → kFindResult.has_sort (kFindResult.barbar₂ a) MSort.Nat
    | zero_decl : kFindResult.has_sort kFindResult.zero MSort.Zero
    | amp_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.amp a₀ a₁) MSort.Nat
    | mul_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.mul a₀ a₁) MSort.Nat
    | mul_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.mul a₀ a₁) MSort.NzNat
    | sum_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.Nat
    | sum_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.NzNat
    | sum_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.sum a₀ a₁) MSort.NzNat
    | ltlt_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.ltlt a₀ a₁) MSort.Nat
    | gtgt_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gtgt a₀ a₁) MSort.Nat
    | pow_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.pow a₀ a₁) MSort.Nat
    | pow_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.pow a₀ a₁) MSort.NzNat
    | quo_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.quo a₀ a₁) MSort.Nat
    | rem_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.rem a₀ a₁) MSort.Nat
    | xor_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.xor a₀ a₁) MSort.Nat
    | bar_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.Nat
    | bar_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.NzNat
    | bar_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.bar a₀ a₁) MSort.NzNat
    | ascii_decl {a : kString} : kString.has_sort a MSort.Char → kFindResult.has_sort (kFindResult.ascii a) MSort.Nat
    | find_decl {a₀ a₁ : kString} {a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.find a₀ a₁ a₂) MSort.FindResult
    | gcd_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.Nat
    | gcd_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.NzNat
    | gcd_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.gcd a₀ a₁) MSort.NzNat
    | lcm_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.lcm a₀ a₁) MSort.Nat
    | lcm_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.lcm a₀ a₁) MSort.NzNat
    | length_decl {a : kString} : kString.has_sort a MSort.String → kFindResult.has_sort (kFindResult.length a) MSort.Nat
    | max_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.Nat
    | max_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.NzNat
    | max_decl₂ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.max a₀ a₁) MSort.NzNat
    | min_decl₀ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.min a₀ a₁) MSort.Nat
    | min_decl₁ {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.NzNat → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort (kFindResult.min a₀ a₁) MSort.NzNat
    | notFound_decl : kFindResult.has_sort kFindResult.notFound MSort.FindResult
    | rfind_decl {a₀ a₁ : kString} {a₂ : kFindResult} : kString.has_sort a₀ MSort.String → kString.has_sort a₁ MSort.String → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.rfind a₀ a₁ a₂) MSort.FindResult
    | s_decl {a : kFindResult} : kFindResult.has_sort a MSort.Nat → kFindResult.has_sort (kFindResult.s a) MSort.NzNat
    | sd_decl {a₀ a₁ : kFindResult} : kFindResult.has_sort a₀ MSort.Nat → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort (kFindResult.sd a₀ a₁) MSort.Nat
    | ifthenelsefi_decl₁ {a₀ : kModelCheckResult} {a₁ a₂ : kFindResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.FindResult → kFindResult.has_sort a₂ MSort.FindResult → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.FindResult
    | ifthenelsefi_decl₂ {a₀ : kModelCheckResult} {a₁ a₂ : kFindResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.Nat → kFindResult.has_sort a₂ MSort.Nat → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.Nat
    | ifthenelsefi_decl₃ {a₀ : kModelCheckResult} {a₁ a₂ : kFindResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.NzNat → kFindResult.has_sort a₂ MSort.NzNat → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.NzNat
    | ifthenelsefi_decl₄ {a₀ : kModelCheckResult} {a₁ a₂ : kFindResult} : kModelCheckResult.has_sort a₀ MSort.Bool → kFindResult.has_sort a₁ MSort.Zero → kFindResult.has_sort a₂ MSort.Zero → kFindResult.has_sort (kFindResult.ifthenelsefi a₀ a₁ a₂) MSort.Zero

  inductive kHenceLest.has_sort: kHenceLest → MSort → Prop
    | subsort {t a b} : subsort a b → kHenceLest.has_sort t a → kHenceLest.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | HENCE_decl {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.HENCE a) MSort.HenceLest
    | HENCELEST_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.HENCELEST a₀ a₁) MSort.HenceLest
    | LEST_decl {a : kModelCheckResult} : kModelCheckResult.has_sort a MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.LEST a) MSort.HenceLest
    | LESTHENCE_decl {a₀ a₁ : kModelCheckResult} : kModelCheckResult.has_sort a₀ MSort.«Set{Qid}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → kHenceLest.has_sort (kHenceLest.LESTHENCE a₀ a₁) MSort.HenceLest

  inductive k«Set{Rule}».has_sort: k«Set{Rule}» → MSort → Prop
    | subsort {t a b} : subsort a b → k«Set{Rule}».has_sort t a → k«Set{Rule}».has_sort t b
    -- Implicit membership axioms (operator declarations)
    | «$diff»_decl {a₀ a₁ a₂ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«$diff» a₀ a₁ a₂) MSort.«Set{Rule}»
    | «$intersect»_decl {a₀ a₁ a₂ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«$intersect» a₀ a₁ a₂) MSort.«Set{Rule}»
    | delete_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».delete a₀ a₁) MSort.«Set{Rule}»
    | getRulesWithNames_decl {a₀ : k«Set{Rule}»} {a₁ : kModelCheckResult} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → kModelCheckResult.has_sort a₁ MSort.«Set{Qid}» → k«Set{Rule}».has_sort (k«Set{Rule}».getRulesWithNames a₀ a₁) MSort.«Set{Rule}»
    | insert_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.Rule → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».insert a₀ a₁) MSort.«Set{Rule}»
    | intersection_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».intersection a₀ a₁) MSort.«Set{Rule}»
    | rules_decl : k«Set{Rule}».has_sort k«Set{Rule}».rules MSort.«Set{Rule}»
    | union_decl₀ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«NeSet{Rule}»
    | union_decl₁ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«NeSet{Rule}»
    | union_decl₂ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».union a₀ a₁) MSort.«Set{Rule}»
    | RULE₀_decl {a₀ : kModelCheckResult} {a₁ : kActorDeonticActionDeadline} : kModelCheckResult.has_sort a₀ MSort.Qid → kActorDeonticActionDeadline.has_sort a₁ MSort.ActorDeonticActionDeadline → k«Set{Rule}».has_sort (k«Set{Rule}».RULE₀ a₀ a₁) MSort.Rule
    | RULE₁_decl {a₀ : kModelCheckResult} {a₁ : kActorDeonticActionDeadline} {a₂ : kHenceLest} : kModelCheckResult.has_sort a₀ MSort.Qid → kActorDeonticActionDeadline.has_sort a₁ MSort.ActorDeonticActionDeadline → kHenceLest.has_sort a₂ MSort.HenceLest → k«Set{Rule}».has_sort (k«Set{Rule}».RULE₁ a₀ a₁ a₂) MSort.Rule
    | bslash_decl {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».bslash a₀ a₁) MSort.«Set{Rule}»
    | «`,»_decl₀ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«NeSet{Rule}»
    | «`,»_decl₁ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«Set{Rule}»
    | «`,»_decl₂ {a₀ a₁ : k«Set{Rule}»} : k«Set{Rule}».has_sort a₀ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».«`,» a₀ a₁) MSort.«NeSet{Rule}»
    | empty_decl : k«Set{Rule}».has_sort k«Set{Rule}».empty MSort.«Set{Rule}»
    | ifthenelsefi_decl₁ {a₀ : kModelCheckResult} {a₁ a₂ : k«Set{Rule}»} : kModelCheckResult.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.«Set{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«Set{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.«Set{Rule}»
    | ifthenelsefi_decl₂ {a₀ : kModelCheckResult} {a₁ a₂ : k«Set{Rule}»} : kModelCheckResult.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort a₂ MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.«NeSet{Rule}»
    | ifthenelsefi_decl₃ {a₀ : kModelCheckResult} {a₁ a₂ : k«Set{Rule}»} : kModelCheckResult.has_sort a₀ MSort.Bool → k«Set{Rule}».has_sort a₁ MSort.Rule → k«Set{Rule}».has_sort a₂ MSort.Rule → k«Set{Rule}».has_sort (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) MSort.Rule

  inductive kTransitionList.has_sort: kTransitionList → MSort → Prop
    | subsort {t a b} : subsort a b → kTransitionList.has_sort t a → kTransitionList.has_sort t b
    -- Implicit membership axioms (operator declarations)
    | join_decl {a₀ a₁ : kTransitionList} : kTransitionList.has_sort a₀ MSort.TransitionList → kTransitionList.has_sort a₁ MSort.TransitionList → kTransitionList.has_sort (kTransitionList.join a₀ a₁) MSort.TransitionList
    | «`{`,`}»_decl {a₀ : kEventTrace} {a₁ : kModelCheckResult} : kEventTrace.has_sort a₀ MSort.State → kModelCheckResult.has_sort a₁ MSort.RuleName → kTransitionList.has_sort (kTransitionList.«`{`,`}» a₀ a₁) MSort.Transition
    | nil_decl : kTransitionList.has_sort kTransitionList.nil MSort.TransitionList

  inductive kstrategylbrakinternalrbrack.has_sort: kstrategylbrakinternalrbrack → MSort → Prop
    | subsort {t a b} : subsort a b → kstrategylbrakinternalrbrack.has_sort t a → kstrategylbrakinternalrbrack.has_sort t b
    -- Implicit membership axioms (operator declarations)

  inductive kModelCheckResult.eqe: kModelCheckResult → kModelCheckResult → Prop
    | from_eqa {a b} : kModelCheckResult.eqa a b → kModelCheckResult.eqe a b
    | symm {a b} : kModelCheckResult.eqe a b → kModelCheckResult.eqe b a
    | trans {a b c} : kModelCheckResult.eqe a b → kModelCheckResult.eqe b c → kModelCheckResult.eqe a c
    -- Congruence axioms for each operator
    | eqe_and {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.and a₀ a₁) (kModelCheckResult.and b₀ b₁)
    | eqe_or {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.or a₀ a₁) (kModelCheckResult.or b₀ b₁)
    | eqe_xor {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.xor a₀ a₁) (kModelCheckResult.xor b₀ b₁)
    | eqe_not {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kModelCheckResult.eqe (kModelCheckResult.not a) (kModelCheckResult.not b)
    | eqe_implies {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.implies a₀ a₁) (kModelCheckResult.implies b₀ b₁)
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe a₂ b₂ → kModelCheckResult.eqe (kModelCheckResult.«$diff» a₀ a₁ a₂) (kModelCheckResult.«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe a₂ b₂ → kModelCheckResult.eqe (kModelCheckResult.«$intersect» a₀ a₁ a₂) (kModelCheckResult.«$intersect» b₀ b₁ b₂)
    | eqe_containsActor {a₀ b₀ : kEventTrace} {a₁ b₁ : kModelCheckResult} : kEventTrace.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.containsActor a₀ a₁) (kModelCheckResult.containsActor b₀ b₁)
    | eqe_containsRuleWithEvent {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} : k«Set{Rule}».eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.containsRuleWithEvent a₀ a₁) (kModelCheckResult.containsRuleWithEvent b₀ b₁)
    | eqe_«in»₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.«in»₀ a₀ a₁) (kModelCheckResult.«in»₀ b₀ b₁)
    | eqe_«in»₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.«in»₁ a₀ a₁) (kModelCheckResult.«in»₁ b₀ b₁)
    | eqe_«in»₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.«in»₂ a₀ a₁) (kModelCheckResult.«in»₂ b₀ b₁)
    | eqe_psubset₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.psubset₀ a₀ a₁) (kModelCheckResult.psubset₀ b₀ b₁)
    | eqe_psubset₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.psubset₁ a₀ a₁) (kModelCheckResult.psubset₁ b₀ b₁)
    | eqe_psubset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.psubset₂ a₀ a₁) (kModelCheckResult.psubset₂ b₀ b₁)
    | eqe_subset₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.subset₀ a₀ a₁) (kModelCheckResult.subset₀ b₀ b₁)
    | eqe_subset₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.subset₁ a₀ a₁) (kModelCheckResult.subset₁ b₀ b₁)
    | eqe_subset₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.subset₂ a₀ a₁) (kModelCheckResult.subset₂ b₀ b₁)
    | eqe_delete {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.delete a₀ a₁) (kModelCheckResult.delete b₀ b₁)
    | eqe_insert {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.insert a₀ a₁) (kModelCheckResult.insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.intersection a₀ a₁) (kModelCheckResult.intersection b₀ b₁)
    | eqe_union {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.union a₀ a₁) (kModelCheckResult.union b₀ b₁)
    | eqe_DO {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kModelCheckResult.eqe (kModelCheckResult.DO a) (kModelCheckResult.DO b)
    | eqe_lteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.lteq₀ a₀ a₁) (kModelCheckResult.lteq₀ b₀ b₁)
    | eqe_lteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.lteq₁ a₀ a₁) (kModelCheckResult.lteq₁ b₀ b₁)
    | eqe_lt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.lt₀ a₀ a₁) (kModelCheckResult.lt₀ b₀ b₁)
    | eqe_lt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.lt₁ a₀ a₁) (kModelCheckResult.lt₁ b₀ b₁)
    | eqe_gteq₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.gteq₀ a₀ a₁) (kModelCheckResult.gteq₀ b₀ b₁)
    | eqe_gteq₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.gteq₁ a₀ a₁) (kModelCheckResult.gteq₁ b₀ b₁)
    | eqe_gt₀ {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.gt₀ a₀ a₁) (kModelCheckResult.gt₀ b₀ b₁)
    | eqe_gt₁ {a₀ b₀ a₁ b₁ : kString} : kString.eqe a₀ b₀ → kString.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.gt₁ a₀ a₁) (kModelCheckResult.gt₁ b₀ b₁)
    | eqe_AND {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.AND a₀ a₁) (kModelCheckResult.AND b₀ b₁)
    | eqe_bslash {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.bslash a₀ a₁) (kModelCheckResult.bslash b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.«`,» a₀ a₁) (kModelCheckResult.«`,» b₀ b₁)
    | eqe_andsubthen {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.andsubthen a₀ a₁) (kModelCheckResult.andsubthen b₀ b₁)
    | eqe_divides {a₀ b₀ a₁ b₁ : kFindResult} : kFindResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.divides a₀ a₁) (kModelCheckResult.divides b₀ b₁)
    | eqe_orsubelse {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.orsubelse a₀ a₁) (kModelCheckResult.orsubelse b₀ b₁)
    | eqe_bareq {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.bareq a₀ a₁) (kModelCheckResult.bareq b₀ b₁)
    | eqe_counterexample {a₀ b₀ a₁ b₁ : kTransitionList} : kTransitionList.eqe a₀ b₀ → kTransitionList.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.counterexample a₀ a₁) (kModelCheckResult.counterexample b₀ b₁)
    | eqe_modelCheck {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.modelCheck a₀ a₁) (kModelCheckResult.modelCheck b₀ b₁)
    | eqe_qid {a b : kString} : kString.eqe a b → kModelCheckResult.eqe (kModelCheckResult.qid a) (kModelCheckResult.qid b)
    | eqe_ifthenelsefi {a₀ b₀ a₁ b₁ a₂ b₂ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe a₂ b₂ → kModelCheckResult.eqe (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) (kModelCheckResult.ifthenelsefi b₀ b₁ b₂)
    | eqe_eqslasheq₀ {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₀ a₀ a₁) (kModelCheckResult.eqslasheq₀ b₀ b₁)
    | eqe_eqslasheq₁ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₁ a₀ a₁) (kModelCheckResult.eqslasheq₁ b₀ b₁)
    | eqe_eqslasheq₂ {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₂ a₀ a₁) (kModelCheckResult.eqslasheq₂ b₀ b₁)
    | eqe_eqeq₀ {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqeq₀ a₀ a₁) (kModelCheckResult.eqeq₀ b₀ b₁)
    | eqe_eqeq₁ {a₀ b₀ a₁ b₁ : kDeontic} : kDeontic.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqeq₁ a₀ a₁) (kModelCheckResult.eqeq₁ b₀ b₁)
    | eqe_eqeq₂ {a₀ b₀ a₁ b₁ : kContractStatus} : kContractStatus.eqe a₀ b₀ → kContractStatus.eqe a₁ b₁ → kModelCheckResult.eqe (kModelCheckResult.eqeq₂ a₀ a₁) (kModelCheckResult.eqeq₂ b₀ b₁)
    -- Equations
    | eq_NOTHING : kModelCheckResult.eqe kModelCheckResult.NOTHING kModelCheckResult.empty
    | eq_«$diff»₀ {s' a} : kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.has_sort a MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«$diff» kModelCheckResult.empty s' a) a
    | eq_«$diff»₁ {s e s' a} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.has_sort a MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«$diff» (kModelCheckResult.«`,» s e) s' a) (kModelCheckResult.«$diff» s s' (kModelCheckResult.ifthenelsefi (kModelCheckResult.«in»₁ e s') a (kModelCheckResult.«`,» a e)))
    | eq_«$intersect»₀ {s' a} : kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.has_sort a MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«$intersect» kModelCheckResult.empty s' a) a
    | eq_«$intersect»₁ {s e s' a} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.has_sort a MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«$intersect» (kModelCheckResult.«`,» s e) s' a) (kModelCheckResult.«$intersect» s s' (kModelCheckResult.ifthenelsefi (kModelCheckResult.«in»₁ e s') (kModelCheckResult.«`,» a e) a))
    | eq_DO {actionname} : kModelCheckResult.has_sort actionname MSort.Qid → kModelCheckResult.eqe (kModelCheckResult.DO actionname) actionname
    | eq_AND {names names'} : kModelCheckResult.has_sort names MSort.Names → kModelCheckResult.has_sort names' MSort.Names → kModelCheckResult.eqe (kModelCheckResult.AND names names') (kModelCheckResult.«`,» names names')
    | eq_bslash₀ {s n} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort n MSort.«NeSet{Qid}» → kModelCheckResult.eqe (kModelCheckResult.bslash s n) (kModelCheckResult.«$diff» s n kModelCheckResult.empty)
    | eq_bslash₁ {s} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.bslash s kModelCheckResult.empty) s
    | eq_«`,» {n} : kModelCheckResult.has_sort n MSort.«NeSet{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«`,» n n) n
    | eq_andsubthen₀ {b} : kModelCheckResult.eqe (kModelCheckResult.andsubthen kModelCheckResult.false b) kModelCheckResult.false
    | eq_andsubthen₁ {b} : kModelCheckResult.eqe (kModelCheckResult.andsubthen kModelCheckResult.true b) b
    | eq_and₀ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and a a) a
    | eq_and₁ {a b c} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.has_sort c MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and a (kModelCheckResult.xor b c)) (kModelCheckResult.xor (kModelCheckResult.and a b) (kModelCheckResult.and a c))
    | eq_and₂ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and kModelCheckResult.false a) kModelCheckResult.false
    | eq_and₃ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and kModelCheckResult.true a) a
    | eq_containsActor₀ {config actorname v#0 v#1} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort actorname MSort.Qid → kCid.has_sort v#0 MSort.Actor → kAttributeSet.has_sort v#1 MSort.AttributeSet → kModelCheckResult.eqe (kModelCheckResult.containsActor (kEventTrace.join config (kEventTrace.ltcolonbargt actorname v#0 v#1)) actorname) kModelCheckResult.true
    | eq_containsRuleWithEvent₀ {activerules rulename actorname deontic actionname time hence lest} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.containsRuleWithEvent (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))) (kEventTrace.does actorname actionname)) kModelCheckResult.true
    | eq_implies₀ {a b} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.implies a b) (kModelCheckResult.not (kModelCheckResult.xor a (kModelCheckResult.and a b)))
    | eq_«in»₀₀ {e s} : kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kModelCheckResult.eqe (kModelCheckResult.«in»₀ e (kEventTrace.«`,» s e)) kModelCheckResult.true
    | eq_«in»₁₀ {e s} : kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«in»₁ e (kModelCheckResult.«`,» s e)) kModelCheckResult.true
    | eq_«in»₂₀ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kModelCheckResult.eqe (kModelCheckResult.«in»₂ e (k«Set{Rule}».«`,» s e)) kModelCheckResult.true
    | eq_orsubelse₀ {b} : kModelCheckResult.eqe (kModelCheckResult.orsubelse kModelCheckResult.false b) b
    | eq_orsubelse₁ {b} : kModelCheckResult.eqe (kModelCheckResult.orsubelse kModelCheckResult.true b) kModelCheckResult.true
    | eq_or₀ {a b} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.or a b) (kModelCheckResult.xor (kModelCheckResult.and a b) (kModelCheckResult.xor a b))
    | eq_psubset₀ {s s'} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kModelCheckResult.eqe (kModelCheckResult.psubset₀ s s') (kModelCheckResult.andsubthen (kModelCheckResult.eqslasheq₀ s s') (kModelCheckResult.subset₀ s s'))
    | eq_psubset₁ {s s'} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.psubset₁ s s') (kModelCheckResult.andsubthen (kModelCheckResult.eqslasheq₁ s s') (kModelCheckResult.subset₁ s s'))
    | eq_psubset₂ {s s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kModelCheckResult.eqe (kModelCheckResult.psubset₂ s s') (kModelCheckResult.andsubthen (kModelCheckResult.eqslasheq₂ s s') (kModelCheckResult.subset₂ s s'))
    | eq_subset₀₀ {s'} : kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kModelCheckResult.eqe (kModelCheckResult.subset₀ kEventTrace.empty s') kModelCheckResult.true
    | eq_subset₁₀ {s'} : kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.subset₁ kModelCheckResult.empty s') kModelCheckResult.true
    | eq_subset₂₀ {s'} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kModelCheckResult.eqe (kModelCheckResult.subset₂ k«Set{Rule}».empty s') kModelCheckResult.true
    | eq_subset₀₁ {s e s'} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kModelCheckResult.eqe (kModelCheckResult.subset₀ (kEventTrace.«`,» s e) s') (kModelCheckResult.andsubthen (kModelCheckResult.«in»₀ e s') (kModelCheckResult.subset₀ s s'))
    | eq_subset₁₁ {s e s'} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.subset₁ (kModelCheckResult.«`,» s e) s') (kModelCheckResult.andsubthen (kModelCheckResult.«in»₁ e s') (kModelCheckResult.subset₁ s s'))
    | eq_subset₂₁ {s e s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → kModelCheckResult.eqe (kModelCheckResult.subset₂ (k«Set{Rule}».«`,» s e) s') (kModelCheckResult.andsubthen (kModelCheckResult.«in»₂ e s') (kModelCheckResult.subset₂ s s'))
    | eq_xor₀ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.xor a a) kModelCheckResult.false
    | eq_xor₁ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.xor kModelCheckResult.false a) a
    | eq_bareq₀ {config actorname actionname} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kModelCheckResult.eqe (kModelCheckResult.bareq config (kEventTrace.allowedToDo actorname actionname)) (kModelCheckResult.or (kModelCheckResult.bareq config (kEventTrace.mayDo actorname actionname)) (kModelCheckResult.bareq config (kEventTrace.mustDo actorname actionname)))
    | eq_bareq₁ {config coordinator v#0 v#3 activerules rulename actorname actionname time hence lest v#1 v#2} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort coordinator MSort.Qid → kCid.has_sort v#0 MSort.Coordinator → kAttributeSet.has_sort v#3 MSort.AttributeSet → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → k«Set{Rule}».has_sort v#1 MSort.«Set{Rule}» → kFindResult.has_sort v#2 MSort.Nat → kModelCheckResult.eqe (kModelCheckResult.bareq (kEventTrace.join config (kEventTrace.ltcolonbargt coordinator v#0 (kAttributeSet.«`,» v#3 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.MAY actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#1) (kAttributeSet.«time`colon» v#2)))))) (kEventTrace.mayDo actorname actionname)) kModelCheckResult.true
    | eq_bareq₂ {config coordinator v#4 v#7 activerules rulename actorname actionname time hence lest v#5 v#6} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort coordinator MSort.Qid → kCid.has_sort v#4 MSort.Coordinator → kAttributeSet.has_sort v#7 MSort.AttributeSet → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → k«Set{Rule}».has_sort v#5 MSort.«Set{Rule}» → kFindResult.has_sort v#6 MSort.Nat → kModelCheckResult.eqe (kModelCheckResult.bareq (kEventTrace.join config (kEventTrace.ltcolonbargt coordinator v#4 (kAttributeSet.«`,» v#7 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.MUST actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#5) (kAttributeSet.«time`colon» v#6)))))) (kEventTrace.mustDo actorname actionname)) kModelCheckResult.true
    | eq_bareq₃ {config coordinator v#8 v#11 activerules rulename actorname actionname time hence lest v#9 v#10} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort coordinator MSort.Qid → kCid.has_sort v#8 MSort.Coordinator → kAttributeSet.has_sort v#11 MSort.AttributeSet → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → k«Set{Rule}».has_sort v#9 MSort.«Set{Rule}» → kFindResult.has_sort v#10 MSort.Nat → kModelCheckResult.eqe (kModelCheckResult.bareq (kEventTrace.join config (kEventTrace.ltcolonbargt coordinator v#8 (kAttributeSet.«`,» v#11 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.SHANT actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#9) (kAttributeSet.«time`colon» v#10)))))) (kEventTrace.prohibitedFromDoing actorname actionname)) kModelCheckResult.true
    | eq_bareq₄ {config actorname actionname} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kModelCheckResult.eqe (kModelCheckResult.bareq (kEventTrace.join config (kEventTrace.does actorname actionname)) (kEventTrace.does actorname actionname)) kModelCheckResult.true
    | eq_delete₀ {e s} : kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.delete e (kModelCheckResult.«`,» s e)) (kModelCheckResult.delete e s)
    | eq_insert {e s} : kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.insert e s) (kModelCheckResult.«`,» s e)
    | eq_intersection₀ {s n} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort n MSort.«NeSet{Qid}» → kModelCheckResult.eqe (kModelCheckResult.intersection s n) (kModelCheckResult.«$intersect» s n kModelCheckResult.empty)
    | eq_intersection₁ {s} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.intersection s kModelCheckResult.empty) kModelCheckResult.empty
    | eq_not₀ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.not a) (kModelCheckResult.xor kModelCheckResult.true a)
    | eq_union {s s'} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort s' MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.union s s') (kModelCheckResult.«`,» s s')
    | eq_containsActor₁ {config actorname} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.eqe (kModelCheckResult.containsActor config actorname) kModelCheckResult.false
    | eq_containsRuleWithEvent₁ {activerules actionevent} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kEventTrace.has_sort actionevent MSort.ActionEvent → kModelCheckResult.eqe (kModelCheckResult.containsRuleWithEvent activerules actionevent) kModelCheckResult.false
    | eq_«in»₀₁ {e s} : kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kModelCheckResult.eqe (kModelCheckResult.«in»₀ e s) kModelCheckResult.false
    | eq_«in»₁₁ {e s} : kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.«in»₁ e s) kModelCheckResult.false
    | eq_«in»₂₁ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kModelCheckResult.eqe (kModelCheckResult.«in»₂ e s) kModelCheckResult.false
    | eq_delete₁ {e s} : kModelCheckResult.has_sort e MSort.Qid → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.delete e s) s
    | eq_and₄ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and kModelCheckResult.true a) a
    | eq_and₅ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and kModelCheckResult.false a) kModelCheckResult.false
    | eq_and₆ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and a a) a
    | eq_xor₂ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.xor kModelCheckResult.false a) a
    | eq_xor₃ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.xor a a) kModelCheckResult.false
    | eq_and₇ {a b c} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.has_sort c MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.and a (kModelCheckResult.xor b c)) (kModelCheckResult.xor (kModelCheckResult.and a b) (kModelCheckResult.and a c))
    | eq_not₁ {a} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.not a) (kModelCheckResult.xor kModelCheckResult.true a)
    | eq_or₁ {a b} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.or a b) (kModelCheckResult.xor (kModelCheckResult.and a b) (kModelCheckResult.xor a b))
    | eq_implies₁ {a b} : kModelCheckResult.has_sort a MSort.Bool → kModelCheckResult.has_sort b MSort.Bool → kModelCheckResult.eqe (kModelCheckResult.implies a b) (kModelCheckResult.not (kModelCheckResult.xor a (kModelCheckResult.and a b)))
    | eq_itet {l r} : kModelCheckResult.eqe (kModelCheckResult.ifthenelsefi kModelCheckResult.true l r) l
    | eq_itef {l r} : kModelCheckResult.eqe (kModelCheckResult.ifthenelsefi kModelCheckResult.false l r) r
    | eq_eqslasheq₀ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₀ l r) kModelCheckResult.false
    | eq_eqslasheq₁ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₁ l r) kModelCheckResult.false
    | eq_eqslasheq₂ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqslasheq₂ l r) kModelCheckResult.false
    | eq_eqeq₀ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqeq₀ l r) kModelCheckResult.true
    | eq_eqeq₁ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqeq₁ l r) kModelCheckResult.true
    | eq_eqeq₂ {l r} : kModelCheckResult.eqe l r → kModelCheckResult.eqe (kModelCheckResult.eqeq₂ l r) kModelCheckResult.true

  inductive kEventTrace.eqe: kEventTrace → kEventTrace → Prop
    | from_eqa {a b} : kEventTrace.eqa a b → kEventTrace.eqe a b
    | symm {a b} : kEventTrace.eqe a b → kEventTrace.eqe b a
    | trans {a b c} : kEventTrace.eqe a b → kEventTrace.eqe b c → kEventTrace.eqe a c
    -- Congruence axioms for each operator
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe a₂ b₂ → kEventTrace.eqe (kEventTrace.«$diff» a₀ a₁ a₂) (kEventTrace.«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe a₂ b₂ → kEventTrace.eqe (kEventTrace.«$intersect» a₀ a₁ a₂) (kEventTrace.«$intersect» b₀ b₁ b₂)
    | eqe_allowedToDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.allowedToDo a₀ a₁) (kEventTrace.allowedToDo b₀ b₁)
    | eqe_mayDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.mayDo a₀ a₁) (kEventTrace.mayDo b₀ b₁)
    | eqe_mustDo {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.mustDo a₀ a₁) (kEventTrace.mustDo b₀ b₁)
    | eqe_prohibitedFromDoing {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.prohibitedFromDoing a₀ a₁) (kEventTrace.prohibitedFromDoing b₀ b₁)
    | eqe_delete {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.delete a₀ a₁) (kEventTrace.delete b₀ b₁)
    | eqe_getAction {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.getAction a) (kEventTrace.getAction b)
    | eqe_getAllActions {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kEventTrace.eqe (kEventTrace.getAllActions a) (kEventTrace.getAllActions b)
    | eqe_initAux {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} : k«Set{Rule}».eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.initAux a₀ a₁) (kEventTrace.initAux b₀ b₁)
    | eqe_init {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kEventTrace.eqe (kEventTrace.init a) (kEventTrace.init b)
    | eqe_insert {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.insert a₀ a₁) (kEventTrace.insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.intersection a₀ a₁) (kEventTrace.intersection b₀ b₁)
    | eqe_pretty {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.pretty a) (kEventTrace.pretty b)
    | eqe_union {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.union a₀ a₁) (kEventTrace.union b₀ b₁)
    | eqe_ltgt₁ {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.ltgt₁ a) (kEventTrace.ltgt₁ b)
    | eqe_ltcolonbargt {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kCid} {a₂ b₂ : kAttributeSet} : kModelCheckResult.eqe a₀ b₀ → kCid.eqe a₁ b₁ → kAttributeSet.eqe a₂ b₂ → kEventTrace.eqe (kEventTrace.ltcolonbargt a₀ a₁ a₂) (kEventTrace.ltcolonbargt b₀ b₁ b₂)
    | eqe_«ltcolonbar`gt» {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kCid} : kModelCheckResult.eqe a₀ b₀ → kCid.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.«ltcolonbar`gt» a₀ a₁) (kEventTrace.«ltcolonbar`gt» b₀ b₁)
    | eqe_O {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.O a) (kEventTrace.O b)
    | eqe_sumsum {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.sumsum a₀ a₁) (kEventTrace.sumsum b₀ b₁)
    | eqe_subgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.subgt a₀ a₁) (kEventTrace.subgt b₀ b₁)
    | eqe_slashbslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.slashbslash a₀ a₁) (kEventTrace.slashbslash b₀ b₁)
    | eqe_ltsubgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.ltsubgt a₀ a₁) (kEventTrace.ltsubgt b₀ b₁)
    | eqe_lteqgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.lteqgt a₀ a₁) (kEventTrace.lteqgt b₀ b₁)
    | eqe_eqgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.eqgt a₀ a₁) (kEventTrace.eqgt b₀ b₁)
    | eqe_R {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.R a₀ a₁) (kEventTrace.R b₀ b₁)
    | eqe_U {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.U a₀ a₁) (kEventTrace.U b₀ b₁)
    | eqe_W {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.W a₀ a₁) (kEventTrace.W b₀ b₁)
    | eqe_bslashslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.bslashslash a₀ a₁) (kEventTrace.bslashslash b₀ b₁)
    | eqe_bslash {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.bslash a₀ a₁) (kEventTrace.bslash b₀ b₁)
    | eqe_join {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.join a₀ a₁) (kEventTrace.join b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.«`,» a₀ a₁) (kEventTrace.«`,» b₀ b₁)
    | eqe_did {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.did a₀ a₁) (kEventTrace.did b₀ b₁)
    | eqe_do {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.do a₀ a₁) (kEventTrace.do b₀ b₁)
    | eqe_does {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.does a₀ a₁) (kEventTrace.does b₀ b₁)
    | eqe_barsubgt {a₀ b₀ a₁ b₁ : kEventTrace} : kEventTrace.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe (kEventTrace.barsubgt a₀ a₁) (kEventTrace.barsubgt b₀ b₁)
    | eqe_«`lbrak`rbrack» {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.«`lbrak`rbrack» a) (kEventTrace.«`lbrak`rbrack» b)
    | eqe_«~» {a b : kEventTrace} : kEventTrace.eqe a b → kEventTrace.eqe (kEventTrace.«~» a) (kEventTrace.«~» b)
    | eqe_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kEventTrace} : kModelCheckResult.eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kEventTrace.eqe a₂ b₂ → kEventTrace.eqe (kEventTrace.ifthenelsefi a₀ a₁ a₂) (kEventTrace.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    | eq_initialConfig : kEventTrace.eqe kEventTrace.initialConfig (kEventTrace.init k«Set{Rule}».rules)
    | eq_«$diff»₀ {s' a} : kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kEventTrace.has_sort a MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.«$diff» kEventTrace.empty s' a) a
    | eq_«$diff»₁ {s e s' a} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kEventTrace.has_sort a MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.«$diff» (kEventTrace.«`,» s e) s' a) (kEventTrace.«$diff» s s' (kEventTrace.ifthenelsefi (kModelCheckResult.«in»₀ e s') a (kEventTrace.«`,» a e)))
    | eq_«$intersect»₀ {s' a} : kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kEventTrace.has_sort a MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.«$intersect» kEventTrace.empty s' a) a
    | eq_«$intersect»₁ {s e s' a} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kEventTrace.has_sort a MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.«$intersect» (kEventTrace.«`,» s e) s' a) (kEventTrace.«$intersect» s s' (kEventTrace.ifthenelsefi (kModelCheckResult.«in»₀ e s') (kEventTrace.«`,» a e) a))
    | eq_ltgt₁ {f} : kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.ltgt₁ f) (kEventTrace.U kEventTrace.True f)
    | eq_subgt {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.subgt f g) (kEventTrace.bslashslash g (kEventTrace.«~» f))
    | eq_ltsubgt {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.ltsubgt f g) (kEventTrace.slashbslash (kEventTrace.subgt g f) (kEventTrace.subgt f g))
    | eq_lteqgt {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.lteqgt f g) (kEventTrace.«`lbrak`rbrack» (kEventTrace.ltsubgt f g))
    | eq_eqgt {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.eqgt f g) (kEventTrace.«`lbrak`rbrack» (kEventTrace.subgt f g))
    | eq_W {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.W f g) (kEventTrace.bslashslash (kEventTrace.«`lbrak`rbrack» f) (kEventTrace.U f g))
    | eq_bslash₀ {s n} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort n MSort.«NeSet{ActionEvent}» → kEventTrace.eqe (kEventTrace.bslash s n) (kEventTrace.«$diff» s n kEventTrace.empty)
    | eq_bslash₁ {s} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.bslash s kEventTrace.empty) s
    | eq_«`,» {n} : kEventTrace.has_sort n MSort.«NeSet{ActionEvent}» → kEventTrace.eqe (kEventTrace.«`,» n n) n
    | eq_did {actorname actionname} : kModelCheckResult.has_sort actorname MSort.Id → kModelCheckResult.has_sort actionname MSort.Id → kEventTrace.eqe (kEventTrace.did actorname actionname) (kEventTrace.does actorname actionname)
    | eq_do {actorname actionname} : kModelCheckResult.has_sort actorname MSort.Id → kModelCheckResult.has_sort actionname MSort.Id → kEventTrace.eqe (kEventTrace.do actorname actionname) (kEventTrace.did actorname actionname)
    | eq_barsubgt {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.barsubgt f g) (kEventTrace.«`lbrak`rbrack» (kEventTrace.subgt f (kEventTrace.ltgt₁ g)))
    | eq_«`lbrak`rbrack» {f} : kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.«`lbrak`rbrack» f) (kEventTrace.R kEventTrace.False f)
    | eq_delete₀ {e s} : kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.delete e (kEventTrace.«`,» s e)) (kEventTrace.delete e s)
    | eq_getAction {config actorname actionname} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kEventTrace.eqe (kEventTrace.getAction (kEventTrace.join config (kEventTrace.does actorname actionname))) (kEventTrace.does actorname actionname)
    | eq_getAllActions₀ : kEventTrace.eqe (kEventTrace.getAllActions k«Set{Rule}».empty) kEventTrace.empty
    | eq_getAllActions₁ {rules rulename actorname deontic actionname deadline hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kEventTrace.eqe (kEventTrace.getAllActions (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest)))) (kEventTrace.«`,» (kEventTrace.getAllActions rules) (kEventTrace.does actorname actionname))
    | eq_initAux₀ {config} : kEventTrace.has_sort config MSort.Configuration → kEventTrace.eqe (kEventTrace.initAux k«Set{Rule}».empty config) (kEventTrace.join kEventTrace.tau config)
    | eq_initAux₁ {rules rulename actorname deontic actionname deadline hence lest config} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kEventTrace.has_sort config MSort.Configuration → kEventTrace.eqe (kEventTrace.initAux (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest))) config) (kEventTrace.initAux rules (kEventTrace.join config (kEventTrace.ifthenelsefi (kModelCheckResult.containsActor config actorname) kEventTrace.none (kEventTrace.ltcolonbargt actorname kCid.Actor kAttributeSet.none))))
    | eq_init {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kEventTrace.eqe (kEventTrace.init rules) (kEventTrace.initAux rules (kEventTrace.ltcolonbargt kModelCheckResult.ltQidsgt kCid.Coordinator (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».getRulesWithNames rules kModelCheckResult.ltQidsgt))) (kAttributeSet.«time`colon» kFindResult.zero)))))
    | eq_insert {e s} : kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.insert e s) (kEventTrace.«`,» s e)
    | eq_intersection₀ {s n} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort n MSort.«NeSet{ActionEvent}» → kEventTrace.eqe (kEventTrace.intersection s n) (kEventTrace.«$intersect» s n kEventTrace.empty)
    | eq_intersection₁ {s} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.intersection s kEventTrace.empty) kEventTrace.empty
    | eq_pretty {config event coordinator v#6 v#9 contractstate v#7 v#8} : kEventTrace.has_sort config MSort.Configuration → kEventTrace.has_sort event MSort.Event → kModelCheckResult.has_sort coordinator MSort.Qid → kCid.has_sort v#6 MSort.Coordinator → kAttributeSet.has_sort v#9 MSort.AttributeSet → kContractState.has_sort contractstate MSort.ContractState → k«Set{Rule}».has_sort v#7 MSort.«Set{Rule}» → kFindResult.has_sort v#8 MSort.Nat → kEventTrace.eqe (kEventTrace.pretty (kEventTrace.join config (kEventTrace.join event (kEventTrace.ltcolonbargt coordinator v#6 (kAttributeSet.«`,» v#9 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#7) (kAttributeSet.«time`colon» v#8)))))))) (kEventTrace.join config (kEventTrace.ltcolonbargt coordinator kCid.PreCoordinator (kAttributeSet.«contractState`colon» contractstate)))
    | eq_union {s s'} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort s' MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.union s s') (kEventTrace.«`,» s s')
    | eq_«~»₀ : kEventTrace.eqe (kEventTrace.«~» kEventTrace.False) kEventTrace.True
    | eq_«~»₁ : kEventTrace.eqe (kEventTrace.«~» kEventTrace.True) kEventTrace.False
    | eq_«~»₂ {f} : kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.O f)) (kEventTrace.O (kEventTrace.«~» f))
    | eq_«~»₃ {g f} : kEventTrace.has_sort g MSort.Formula → kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.slashbslash g f)) (kEventTrace.bslashslash (kEventTrace.«~» g) (kEventTrace.«~» f))
    | eq_«~»₄ {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.R f g)) (kEventTrace.U (kEventTrace.«~» f) (kEventTrace.«~» g))
    | eq_«~»₅ {f g} : kEventTrace.has_sort f MSort.Formula → kEventTrace.has_sort g MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.U f g)) (kEventTrace.R (kEventTrace.«~» f) (kEventTrace.«~» g))
    | eq_«~»₆ {g f} : kEventTrace.has_sort g MSort.Formula → kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.bslashslash g f)) (kEventTrace.slashbslash (kEventTrace.«~» g) (kEventTrace.«~» f))
    | eq_«~»₇ {f} : kEventTrace.has_sort f MSort.Formula → kEventTrace.eqe (kEventTrace.«~» (kEventTrace.«~» f)) f
    | eq_delete₁ {e s} : kEventTrace.has_sort e MSort.ActionEvent → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.eqe (kEventTrace.delete e s) s
    | eq_itet {l r} : kEventTrace.eqe (kEventTrace.ifthenelsefi kModelCheckResult.true l r) l
    | eq_itef {l r} : kEventTrace.eqe (kEventTrace.ifthenelsefi kModelCheckResult.false l r) r

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
    | eqe_getClass {a b : kEventTrace} : kEventTrace.eqe a b → kCid.eqe (kCid.getClass a) (kCid.getClass b)
    -- Equations
    | eq_getClass {o c a} : kModelCheckResult.has_sort o MSort.Oid → kCid.has_sort c MSort.Cid → kAttributeSet.has_sort a MSort.AttributeSet → kCid.eqe (kCid.getClass (kEventTrace.ltcolonbargt o c a)) c

  inductive kActorDeonticActionDeadline.eqe: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | from_eqa {a b} : kActorDeonticActionDeadline.eqa a b → kActorDeonticActionDeadline.eqe a b
    | symm {a b} : kActorDeonticActionDeadline.eqe a b → kActorDeonticActionDeadline.eqe b a
    | trans {a b c} : kActorDeonticActionDeadline.eqe a b → kActorDeonticActionDeadline.eqe b c → kActorDeonticActionDeadline.eqe a c
    -- Congruence axioms for each operator
    | eqe_PARTY₀ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeadline} {a₂ b₂ : kDeontic} {a₃ b₃ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kDeadline.eqe a₁ b₁ → kDeontic.eqe a₂ b₂ → kModelCheckResult.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b₀ b₁ b₂ b₃)
    | eqe_PARTY₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeontic} {a₂ b₂ : kModelCheckResult} {a₃ b₃ : kDeadline} : kModelCheckResult.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kModelCheckResult.eqe a₂ b₂ → kDeadline.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b₀ b₁ b₂ b₃)
    | eqe_PARTY₂ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kDeontic} {a₂ b₂ : kDeadline} {a₃ b₃ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kDeontic.eqe a₁ b₁ → kDeadline.eqe a₂ b₂ → kModelCheckResult.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b₀ b₁ b₂ b₃)
    | eqe_PARTY₃ {a₀ b₀ : kDeadline} {a₁ b₁ : kModelCheckResult} {a₂ b₂ : kDeontic} {a₃ b₃ : kModelCheckResult} : kDeadline.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kDeontic.eqe a₂ b₂ → kModelCheckResult.eqe a₃ b₃ → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b₀ b₁ b₂ b₃)
    -- Equations
    | eq_PARTY₀ {actorname deadline deontic actionname} : kModelCheckResult.has_sort actorname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₀ actorname deadline deontic actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)
    | eq_PARTY₂ {actorname deontic deadline actionname} : kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kDeadline.has_sort deadline MSort.Deadline → kModelCheckResult.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₂ actorname deontic deadline actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)
    | eq_PARTY₃ {deadline actorname deontic actionname} : kDeadline.has_sort deadline MSort.Deadline → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kActorDeonticActionDeadline.eqe (kActorDeonticActionDeadline.PARTY₃ deadline actorname deontic actionname) (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)

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
    | eqe_string {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kString.eqe (kString.string a) (kString.string b)
    | eqe_substr {a₀ b₀ : kString} {a₁ b₁ a₂ b₂ : kFindResult} : kString.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kString.eqe (kString.substr a₀ a₁ a₂) (kString.substr b₀ b₁ b₂)
    | eqe_upperCase {a b : kString} : kString.eqe a b → kString.eqe (kString.upperCase a) (kString.upperCase b)

  inductive kContractState.eqe: kContractState → kContractState → Prop
    | from_eqa {a b} : kContractState.eqa a b → kContractState.eqe a b
    | symm {a b} : kContractState.eqe a b → kContractState.eqe b a
    | trans {a b c} : kContractState.eqe a b → kContractState.eqe b c → kContractState.eqe a c
    -- Congruence axioms for each operator
    | eqe_deltaAction {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kEventTrace} {a₂ b₂ : kContractState} : k«Set{Rule}».eqe a₀ b₀ → kEventTrace.eqe a₁ b₁ → kContractState.eqe a₂ b₂ → kContractState.eqe (kContractState.deltaAction a₀ a₁ a₂) (kContractState.deltaAction b₀ b₁ b₂)
    | eqe_deltaTick {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kContractState} : k«Set{Rule}».eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe (kContractState.deltaTick a₀ a₁) (kContractState.deltaTick b₀ b₁)
    | eqe_Active {a b : k«Set{Rule}»} : k«Set{Rule}».eqe a b → kContractState.eqe (kContractState.Active a) (kContractState.Active b)
    | eqe_Breached {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kContractState.eqe (kContractState.Breached a) (kContractState.Breached b)
    | eqe_pow {a₀ b₀ a₁ b₁ : kContractState} : kContractState.eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe (kContractState.pow a₀ a₁) (kContractState.pow b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kContractState} : kModelCheckResult.eqe a₀ b₀ → kContractState.eqe a₁ b₁ → kContractState.eqe a₂ b₂ → kContractState.eqe (kContractState.ifthenelsefi a₀ a₁ a₂) (kContractState.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    | eq_Active : kContractState.eqe (kContractState.Active k«Set{Rule}».empty) kContractState.Fulfilled
    | eq_pow₀ {activerules activerules'} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules' MSort.«Set{Rule}» → kContractState.eqe (kContractState.pow (kContractState.Active activerules) (kContractState.Active activerules')) (kContractState.Active (k«Set{Rule}».«`,» activerules activerules'))
    | eq_pow₁ {activerules actornames} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort actornames MSort.«Set{Qid}» → kContractState.eqe (kContractState.pow (kContractState.Active activerules) (kContractState.Breached actornames)) (kContractState.Breached actornames)
    | eq_pow₂ {actornames actornames'} : kModelCheckResult.has_sort actornames MSort.«Set{Qid}» → kModelCheckResult.has_sort actornames' MSort.«Set{Qid}» → kContractState.eqe (kContractState.pow (kContractState.Breached actornames) (kContractState.Breached actornames')) (kContractState.Breached (kModelCheckResult.«`,» actornames actornames'))
    | eq_deltaAction₀ {rules actionevent} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kEventTrace.has_sort actionevent MSort.ActionEvent → kContractState.eqe (kContractState.deltaAction rules actionevent kContractState.Fulfilled) kContractState.Fulfilled
    | eq_deltaAction₁ {rules actionevent actornames} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kEventTrace.has_sort actionevent MSort.ActionEvent → kModelCheckResult.has_sort actornames MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaAction rules actionevent (kContractState.Breached actornames)) (kContractState.Breached actornames)
    | eq_deltaAction₂ {rules actorname actionname activerules rulename time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaAction rules (kEventTrace.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.SHANT actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.deltaAction rules (kEventTrace.does actorname actionname) (kContractState.Active activerules)) (kContractState.ifthenelsefi (kModelCheckResult.eqeq₀ lest kModelCheckResult.empty) (kContractState.Breached actorname) (kContractState.Active (k«Set{Rule}».getRulesWithNames rules lest))))
    | eq_deltaTick₀ {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kContractState.eqe (kContractState.deltaTick rules kContractState.Fulfilled) kContractState.Fulfilled
    | eq_deltaTick₁ {rules activerules rulename actorname actionname hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname kDeontic.SHANT actionname (kDeadline.WITHIN (kDuration.DAY kFindResult.zero))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».getRulesWithNames rules hence)) (kContractState.deltaTick rules (kContractState.Active activerules)))
    | eq_deltaTick₂ {rules activerules rulename actorname deontic actionname time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY (kFindResult.s time)))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))) (kContractState.deltaTick rules (kContractState.Active activerules)))
    | eq_deltaTick₃ {rules actorname} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort actorname MSort.Qid → kContractState.eqe (kContractState.deltaTick rules (kContractState.Breached actorname)) (kContractState.Breached actorname)
    | eq_deltaAction₃ {rules actorname actionname activerules rulename deontic time hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort actorname MSort.Qid → kModelCheckResult.has_sort actionname MSort.Qid → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kFindResult.has_sort time MSort.Nat → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.or (kModelCheckResult.eqeq₁ deontic kDeontic.MAY) (kModelCheckResult.eqeq₁ deontic kDeontic.MUST)) kModelCheckResult.true → kContractState.eqe (kContractState.deltaAction rules (kEventTrace.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.Active (k«Set{Rule}».getRulesWithNames rules hence)) (kContractState.deltaAction rules (kEventTrace.does actorname actionname) (kContractState.Active activerules)))
    | eq_deltaTick₄ {rules activerules rulename actorname deontic actionname hence lest} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kModelCheckResult.eqe (kModelCheckResult.or (kModelCheckResult.eqeq₁ deontic kDeontic.MAY) (kModelCheckResult.eqeq₁ deontic kDeontic.MUST)) kModelCheckResult.true → kContractState.eqe (kContractState.deltaTick rules (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY kFindResult.zero))) (kHenceLest.HENCELEST hence lest))))) (kContractState.pow (kContractState.deltaTick rules (kContractState.Active activerules)) (kContractState.ifthenelsefi (kModelCheckResult.or (kModelCheckResult.eqslasheq₁ lest kModelCheckResult.empty) (kModelCheckResult.eqeq₁ deontic kDeontic.MAY)) (kContractState.Active (k«Set{Rule}».getRulesWithNames rules lest)) (kContractState.Breached actorname)))
    | eq_deltaAction₄ {rules actionevent activerules activerule} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kEventTrace.has_sort actionevent MSort.ActionEvent → k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerule MSort.Rule → kContractState.eqe (kContractState.deltaAction rules actionevent (kContractState.Active (k«Set{Rule}».«`,» activerules activerule))) (kContractState.pow (kContractState.Active activerule) (kContractState.deltaAction rules actionevent (kContractState.Active activerules)))
    | eq_itet {l r} : kContractState.eqe (kContractState.ifthenelsefi kModelCheckResult.true l r) l
    | eq_itef {l r} : kContractState.eqe (kContractState.ifthenelsefi kModelCheckResult.false l r) r

  inductive kContractStatus.eqe: kContractStatus → kContractStatus → Prop
    | from_eqa {a b} : kContractStatus.eqa a b → kContractStatus.eqe a b
    | symm {a b} : kContractStatus.eqe a b → kContractStatus.eqe b a
    | trans {a b c} : kContractStatus.eqe a b → kContractStatus.eqe b c → kContractStatus.eqe a c
    -- Congruence axioms for each operator
    | eqe_configToStatus {a b : kEventTrace} : kEventTrace.eqe a b → kContractStatus.eqe (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
    | eqe_contractStateToStatus {a b : kContractState} : kContractState.eqe a b → kContractStatus.eqe (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)
    -- Equations
    | eq_configToStatus {config coordinator v#2 v#5 contractstate v#3 v#4} : kEventTrace.has_sort config MSort.Configuration → kModelCheckResult.has_sort coordinator MSort.Qid → kCid.has_sort v#2 MSort.Coordinator → kAttributeSet.has_sort v#5 MSort.AttributeSet → kContractState.has_sort contractstate MSort.ContractState → k«Set{Rule}».has_sort v#3 MSort.«Set{Rule}» → kFindResult.has_sort v#4 MSort.Nat → kContractStatus.eqe (kContractStatus.configToStatus (kEventTrace.join config (kEventTrace.ltcolonbargt coordinator v#2 (kAttributeSet.«`,» v#5 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» v#3) (kAttributeSet.«time`colon» v#4))))))) (kContractStatus.contractStateToStatus contractstate)
    | eq_contractStateToStatus₀ : kContractStatus.eqe (kContractStatus.contractStateToStatus kContractState.Fulfilled) kContractStatus.Fulfilled
    | eq_contractStateToStatus₁ {activerules activerule} : k«Set{Rule}».has_sort activerules MSort.«Set{Rule}» → k«Set{Rule}».has_sort activerule MSort.Rule → kContractStatus.eqe (kContractStatus.contractStateToStatus (kContractState.Active (k«Set{Rule}».«`,» activerules activerule))) kContractStatus.Active
    | eq_contractStateToStatus₂ {actornames} : kModelCheckResult.has_sort actornames MSort.«Set{Qid}» → kContractStatus.eqe (kContractStatus.contractStateToStatus (kContractState.Breached actornames)) kContractStatus.Breached

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
    | eqe_«$card»₀ {a₀ b₀ : kEventTrace} {a₁ b₁ : kFindResult} : kEventTrace.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₀ a₀ a₁) (kFindResult.«$card»₀ b₀ b₁)
    | eqe_«$card»₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kFindResult} : kModelCheckResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₁ a₀ a₁) (kFindResult.«$card»₁ b₀ b₁)
    | eqe_«$card»₂ {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kFindResult} : k«Set{Rule}».eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe (kFindResult.«$card»₂ a₀ a₁) (kFindResult.«$card»₂ b₀ b₁)
    | eqe_barbar₀ {a b : kEventTrace} : kEventTrace.eqe a b → kFindResult.eqe (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
    | eqe_barbar₁ {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kFindResult.eqe (kFindResult.barbar₁ a) (kFindResult.barbar₁ b)
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
    | eqe_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : kFindResult} : kModelCheckResult.eqe a₀ b₀ → kFindResult.eqe a₁ b₁ → kFindResult.eqe a₂ b₂ → kFindResult.eqe (kFindResult.ifthenelsefi a₀ a₁ a₂) (kFindResult.ifthenelsefi b₀ b₁ b₂)
    -- Equations
    | eq_«$card»₀₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ kEventTrace.empty c) c
    | eq_«$card»₁₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ kModelCheckResult.empty c) c
    | eq_«$card»₂₀ {c} : kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ k«Set{Rule}».empty c) c
    | eq_«$card»₀₁ {n s c} : kEventTrace.has_sort n MSort.«NeSet{ActionEvent}» → kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ (kEventTrace.«`,» n (kEventTrace.«`,» n s)) c) (kFindResult.«$card»₀ (kEventTrace.«`,» n s) c)
    | eq_«$card»₁₁ {n s c} : kModelCheckResult.has_sort n MSort.«NeSet{Qid}» → kModelCheckResult.has_sort s MSort.«Set{Qid}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ (kModelCheckResult.«`,» n (kModelCheckResult.«`,» n s)) c) (kFindResult.«$card»₁ (kModelCheckResult.«`,» n s) c)
    | eq_«$card»₂₁ {n s c} : k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ (k«Set{Rule}».«`,» n (k«Set{Rule}».«`,» n s)) c) (kFindResult.«$card»₂ (k«Set{Rule}».«`,» n s) c)
    | eq_barbar₀ {s} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kFindResult.eqe (kFindResult.barbar₀ s) (kFindResult.«$card»₀ s kFindResult.zero)
    | eq_barbar₁ {s} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kFindResult.eqe (kFindResult.barbar₁ s) (kFindResult.«$card»₁ s kFindResult.zero)
    | eq_barbar₂ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → kFindResult.eqe (kFindResult.barbar₂ s) (kFindResult.«$card»₂ s kFindResult.zero)
    | eq_«$card»₀₂ {s e c} : kEventTrace.has_sort s MSort.«Set{ActionEvent}» → kEventTrace.has_sort e MSort.ActionEvent → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₀ (kEventTrace.«`,» s e) c) (kFindResult.«$card»₀ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    | eq_«$card»₁₂ {s e c} : kModelCheckResult.has_sort s MSort.«Set{Qid}» → kModelCheckResult.has_sort e MSort.Qid → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₁ (kModelCheckResult.«`,» s e) c) (kFindResult.«$card»₁ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    | eq_«$card»₂₂ {s e c} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → kFindResult.has_sort c MSort.Nat → kFindResult.eqe (kFindResult.«$card»₂ (k«Set{Rule}».«`,» s e) c) (kFindResult.«$card»₂ s (kFindResult.sum c (kFindResult.s kFindResult.zero)))
    | eq_itet {l r} : kFindResult.eqe (kFindResult.ifthenelsefi kModelCheckResult.true l r) l
    | eq_itef {l r} : kFindResult.eqe (kFindResult.ifthenelsefi kModelCheckResult.false l r) r

  inductive kHenceLest.eqe: kHenceLest → kHenceLest → Prop
    | from_eqa {a b} : kHenceLest.eqa a b → kHenceLest.eqe a b
    | symm {a b} : kHenceLest.eqe a b → kHenceLest.eqe b a
    | trans {a b c} : kHenceLest.eqe a b → kHenceLest.eqe b c → kHenceLest.eqe a c
    -- Congruence axioms for each operator
    | eqe_HENCE {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kHenceLest.eqe (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | eqe_HENCELEST {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kHenceLest.eqe (kHenceLest.HENCELEST a₀ a₁) (kHenceLest.HENCELEST b₀ b₁)
    | eqe_LEST {a b : kModelCheckResult} : kModelCheckResult.eqe a b → kHenceLest.eqe (kHenceLest.LEST a) (kHenceLest.LEST b)
    | eqe_LESTHENCE {a₀ b₀ a₁ b₁ : kModelCheckResult} : kModelCheckResult.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kHenceLest.eqe (kHenceLest.LESTHENCE a₀ a₁) (kHenceLest.LESTHENCE b₀ b₁)
    -- Equations
    | eq_HENCE {hence} : kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.HENCE hence) (kHenceLest.HENCELEST hence kModelCheckResult.NOTHING)
    | eq_LEST {lest} : kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.LEST lest) (kHenceLest.HENCELEST kModelCheckResult.NOTHING lest)
    | eq_LESTHENCE {lest hence} : kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kHenceLest.eqe (kHenceLest.LESTHENCE lest hence) (kHenceLest.HENCELEST hence lest)

  inductive k«Set{Rule}».eqe: k«Set{Rule}» → k«Set{Rule}» → Prop
    | from_eqa {a b} : k«Set{Rule}».eqa a b → k«Set{Rule}».eqe a b
    | symm {a b} : k«Set{Rule}».eqe a b → k«Set{Rule}».eqe b a
    | trans {a b c} : k«Set{Rule}».eqe a b → k«Set{Rule}».eqe b c → k«Set{Rule}».eqe a c
    -- Congruence axioms for each operator
    | eqe_«$diff» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» a₀ a₁ a₂) (k«Set{Rule}».«$diff» b₀ b₁ b₂)
    | eqe_«$intersect» {a₀ b₀ a₁ b₁ a₂ b₂ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» a₀ a₁ a₂) (k«Set{Rule}».«$intersect» b₀ b₁ b₂)
    | eqe_delete {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».delete a₀ a₁) (k«Set{Rule}».delete b₀ b₁)
    | eqe_getRulesWithNames {a₀ b₀ : k«Set{Rule}»} {a₁ b₁ : kModelCheckResult} : k«Set{Rule}».eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames a₀ a₁) (k«Set{Rule}».getRulesWithNames b₀ b₁)
    | eqe_insert {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».insert a₀ a₁) (k«Set{Rule}».insert b₀ b₁)
    | eqe_intersection {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».intersection a₀ a₁) (k«Set{Rule}».intersection b₀ b₁)
    | eqe_union {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».union a₀ a₁) (k«Set{Rule}».union b₀ b₁)
    | eqe_RULE₀ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kActorDeonticActionDeadline} : kModelCheckResult.eqe a₀ b₀ → kActorDeonticActionDeadline.eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».RULE₀ a₀ a₁) (k«Set{Rule}».RULE₀ b₀ b₁)
    | eqe_RULE₁ {a₀ b₀ : kModelCheckResult} {a₁ b₁ : kActorDeonticActionDeadline} {a₂ b₂ : kHenceLest} : kModelCheckResult.eqe a₀ b₀ → kActorDeonticActionDeadline.eqe a₁ b₁ → kHenceLest.eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».RULE₁ a₀ a₁ a₂) (k«Set{Rule}».RULE₁ b₀ b₁ b₂)
    | eqe_bslash {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».bslash a₀ a₁) (k«Set{Rule}».bslash b₀ b₁)
    | eqe_«`,» {a₀ b₀ a₁ b₁ : k«Set{Rule}»} : k«Set{Rule}».eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe (k«Set{Rule}».«`,» a₀ a₁) (k«Set{Rule}».«`,» b₀ b₁)
    | eqe_ifthenelsefi {a₀ b₀ : kModelCheckResult} {a₁ b₁ a₂ b₂ : k«Set{Rule}»} : kModelCheckResult.eqe a₀ b₀ → k«Set{Rule}».eqe a₁ b₁ → k«Set{Rule}».eqe a₂ b₂ → k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) (k«Set{Rule}».ifthenelsefi b₀ b₁ b₂)
    -- Equations
    | eq_rules : k«Set{Rule}».eqe k«Set{Rule}».rules (k«Set{Rule}».«`,» (k«Set{Rule}».«`,» (k«Set{Rule}».RULE₀ kModelCheckResult.ltQidsgt (kActorDeonticActionDeadline.PARTY₂ kModelCheckResult.ltQidsgt kDeontic.SHANT (kDeadline.WITHIN (kDuration.DAY (kFindResult.s kFindResult.zero))) kModelCheckResult.ltQidsgt)) (k«Set{Rule}».«`,» (k«Set{Rule}».«`,» (k«Set{Rule}».RULE₀ kModelCheckResult.ltQidsgt (kActorDeonticActionDeadline.PARTY₂ kModelCheckResult.ltQidsgt kDeontic.MUST (kDeadline.WITHIN (kDuration.DAY (kFindResult.s kFindResult.zero))) (kModelCheckResult.DO kModelCheckResult.ltQidsgt))) (k«Set{Rule}».RULE₁ kModelCheckResult.ltQidsgt (kActorDeonticActionDeadline.PARTY₃ (kDeadline.WITHIN (kDuration.DAY (kFindResult.s kFindResult.zero))) kModelCheckResult.ltQidsgt kDeontic.MUST kModelCheckResult.ltQidsgt) (kHenceLest.LEST kModelCheckResult.ltQidsgt))) (k«Set{Rule}».RULE₁ kModelCheckResult.ltQidsgt (kActorDeonticActionDeadline.PARTY₁ kModelCheckResult.ltQidsgt kDeontic.MUST (kModelCheckResult.DO kModelCheckResult.ltQidsgt) (kDeadline.WITHIN (kDuration.DAY (kFindResult.s kFindResult.zero)))) (kHenceLest.HENCE kModelCheckResult.ltQidsgt)))) (k«Set{Rule}».RULE₁ kModelCheckResult.ltQidsgt (kActorDeonticActionDeadline.PARTY₃ (kDeadline.WITHIN (kDuration.DAY (kFindResult.s kFindResult.zero))) kModelCheckResult.ltQidsgt kDeontic.SHANT (kModelCheckResult.DO kModelCheckResult.ltQidsgt)) (kHenceLest.LESTHENCE kModelCheckResult.ltQidsgt (kModelCheckResult.AND kModelCheckResult.ltQidsgt kModelCheckResult.ltQidsgt))))
    | eq_«$diff»₀ {s' a} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» k«Set{Rule}».empty s' a) a
    | eq_«$diff»₁ {s e s' a} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$diff» (k«Set{Rule}».«`,» s e) s' a) (k«Set{Rule}».«$diff» s s' (k«Set{Rule}».ifthenelsefi (kModelCheckResult.«in»₂ e s') a (k«Set{Rule}».«`,» a e)))
    | eq_«$intersect»₀ {s' a} : k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» k«Set{Rule}».empty s' a) a
    | eq_«$intersect»₁ {s e s' a} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».has_sort a MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«$intersect» (k«Set{Rule}».«`,» s e) s' a) (k«Set{Rule}».«$intersect» s s' (k«Set{Rule}».ifthenelsefi (kModelCheckResult.«in»₂ e s') (k«Set{Rule}».«`,» a e) a))
    | eq_RULE₀ {rulename actorname deontic actionname deadline} : kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → k«Set{Rule}».eqe (k«Set{Rule}».RULE₀ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline)) (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST kModelCheckResult.NOTHING kModelCheckResult.NOTHING))
    | eq_bslash₀ {s n} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».bslash s n) (k«Set{Rule}».«$diff» s n k«Set{Rule}».empty)
    | eq_bslash₁ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».bslash s k«Set{Rule}».empty) s
    | eq_«`,» {n} : k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».«`,» n n) n
    | eq_delete₀ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».delete e (k«Set{Rule}».«`,» s e)) (k«Set{Rule}».delete e s)
    | eq_getRulesWithNames₀ {rules} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames rules kModelCheckResult.empty) k«Set{Rule}».empty
    | eq_getRulesWithNames₁ {rules rulename actorname deontic actionname deadline hence lest rulenames} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulename MSort.Qid → kModelCheckResult.has_sort actorname MSort.Qid → kDeontic.has_sort deontic MSort.Deontic → kModelCheckResult.has_sort actionname MSort.Qid → kDeadline.has_sort deadline MSort.Deadline → kModelCheckResult.has_sort hence MSort.«Set{Qid}» → kModelCheckResult.has_sort lest MSort.«Set{Qid}» → kModelCheckResult.has_sort rulenames MSort.«Set{Qid}» → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames (k«Set{Rule}».«`,» rules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest))) (kModelCheckResult.«`,» rulenames rulename)) (k«Set{Rule}».«`,» (k«Set{Rule}».getRulesWithNames rules rulenames) (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname deadline) (kHenceLest.HENCELEST hence lest)))
    | eq_insert {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».insert e s) (k«Set{Rule}».«`,» s e)
    | eq_intersection₀ {s n} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort n MSort.«NeSet{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».intersection s n) (k«Set{Rule}».«$intersect» s n k«Set{Rule}».empty)
    | eq_intersection₁ {s} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».intersection s k«Set{Rule}».empty) k«Set{Rule}».empty
    | eq_union {s s'} : k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».has_sort s' MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».union s s') (k«Set{Rule}».«`,» s s')
    | eq_delete₁ {e s} : k«Set{Rule}».has_sort e MSort.Rule → k«Set{Rule}».has_sort s MSort.«Set{Rule}» → k«Set{Rule}».eqe (k«Set{Rule}».delete e s) s
    | eq_getRulesWithNames₂ {rules rulenames rulename} : k«Set{Rule}».has_sort rules MSort.«Set{Rule}» → kModelCheckResult.has_sort rulenames MSort.«Set{Qid}» → kModelCheckResult.has_sort rulename MSort.Qid → k«Set{Rule}».eqe (k«Set{Rule}».getRulesWithNames rules (kModelCheckResult.«`,» rulenames rulename)) (k«Set{Rule}».getRulesWithNames rules rulenames)
    | eq_itet {l r} : k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi kModelCheckResult.true l r) l
    | eq_itef {l r} : k«Set{Rule}».eqe (k«Set{Rule}».ifthenelsefi kModelCheckResult.false l r) r

  inductive kTransitionList.eqe: kTransitionList → kTransitionList → Prop
    | from_eqa {a b} : kTransitionList.eqa a b → kTransitionList.eqe a b
    | symm {a b} : kTransitionList.eqe a b → kTransitionList.eqe b a
    | trans {a b c} : kTransitionList.eqe a b → kTransitionList.eqe b c → kTransitionList.eqe a c
    -- Congruence axioms for each operator
    | eqe_join {a₀ b₀ a₁ b₁ : kTransitionList} : kTransitionList.eqe a₀ b₀ → kTransitionList.eqe a₁ b₁ → kTransitionList.eqe (kTransitionList.join a₀ a₁) (kTransitionList.join b₀ b₁)
    | eqe_«`{`,`}» {a₀ b₀ : kEventTrace} {a₁ b₁ : kModelCheckResult} : kEventTrace.eqe a₀ b₀ → kModelCheckResult.eqe a₁ b₁ → kTransitionList.eqe (kTransitionList.«`{`,`}» a₀ a₁) (kTransitionList.«`{`,`}» b₀ b₁)

  inductive kstrategylbrakinternalrbrack.eqe: kstrategylbrakinternalrbrack → kstrategylbrakinternalrbrack → Prop
    | from_eqa {a b} : kstrategylbrakinternalrbrack.eqa a b → kstrategylbrakinternalrbrack.eqe a b
    | symm {a b} : kstrategylbrakinternalrbrack.eqe a b → kstrategylbrakinternalrbrack.eqe b a
    | trans {a b c} : kstrategylbrakinternalrbrack.eqe a b → kstrategylbrakinternalrbrack.eqe b c → kstrategylbrakinternalrbrack.eqe a c
    -- Congruence axioms for each operator

end
-- Rewriting relations

mutual
  inductive kModelCheckResult.rw_one: kModelCheckResult → kModelCheckResult → Prop
    | eqe_left {a b c : kModelCheckResult} : a.eqe b → kModelCheckResult.rw_one b c → kModelCheckResult.rw_one a c
    | eqe_right {a b c : kModelCheckResult} : kModelCheckResult.rw_one a b → b.eqe c → kModelCheckResult.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_and₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.and a a₁) (kModelCheckResult.and b a₁)
    | sub_and₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.and a₀ a) (kModelCheckResult.and a₀ b)
    | sub_or₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.or a a₁) (kModelCheckResult.or b a₁)
    | sub_or₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.or a₀ a) (kModelCheckResult.or a₀ b)
    | sub_xor₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.xor a a₁) (kModelCheckResult.xor b a₁)
    | sub_xor₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.xor a₀ a) (kModelCheckResult.xor a₀ b)
    | sub_not {a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.not a) (kModelCheckResult.not b)
    | sub_implies₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.implies a a₁) (kModelCheckResult.implies b a₁)
    | sub_implies₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.implies a₀ a) (kModelCheckResult.implies a₀ b)
    | sub_«$diff»₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$diff» a a₁ a₂) (kModelCheckResult.«$diff» b a₁ a₂)
    | sub_«$diff»₁ {a₀ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$diff» a₀ a a₂) (kModelCheckResult.«$diff» a₀ b a₂)
    | sub_«$diff»₂ {a₀ a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$diff» a₀ a₁ a) (kModelCheckResult.«$diff» a₀ a₁ b)
    | sub_«$intersect»₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$intersect» a a₁ a₂) (kModelCheckResult.«$intersect» b a₁ a₂)
    | sub_«$intersect»₁ {a₀ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$intersect» a₀ a a₂) (kModelCheckResult.«$intersect» a₀ b a₂)
    | sub_«$intersect»₂ {a₀ a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«$intersect» a₀ a₁ a) (kModelCheckResult.«$intersect» a₀ a₁ b)
    | sub_containsActor₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.containsActor a a₁) (kModelCheckResult.containsActor b a₁)
    | sub_containsActor₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.containsActor a₀ a) (kModelCheckResult.containsActor a₀ b)
    | sub_containsRuleWithEvent₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.containsRuleWithEvent a a₁) (kModelCheckResult.containsRuleWithEvent b a₁)
    | sub_containsRuleWithEvent₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.containsRuleWithEvent a₀ a) (kModelCheckResult.containsRuleWithEvent a₀ b)
    | sub_«in»₀₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₀ a a₁) (kModelCheckResult.«in»₀ b a₁)
    | sub_«in»₀₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₀ a₀ a) (kModelCheckResult.«in»₀ a₀ b)
    | sub_«in»₁₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₁ a a₁) (kModelCheckResult.«in»₁ b a₁)
    | sub_«in»₁₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₁ a₀ a) (kModelCheckResult.«in»₁ a₀ b)
    | sub_«in»₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₂ a a₁) (kModelCheckResult.«in»₂ b a₁)
    | sub_«in»₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«in»₂ a₀ a) (kModelCheckResult.«in»₂ a₀ b)
    | sub_psubset₀₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₀ a a₁) (kModelCheckResult.psubset₀ b a₁)
    | sub_psubset₀₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₀ a₀ a) (kModelCheckResult.psubset₀ a₀ b)
    | sub_psubset₁₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₁ a a₁) (kModelCheckResult.psubset₁ b a₁)
    | sub_psubset₁₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₁ a₀ a) (kModelCheckResult.psubset₁ a₀ b)
    | sub_psubset₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₂ a a₁) (kModelCheckResult.psubset₂ b a₁)
    | sub_psubset₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.psubset₂ a₀ a) (kModelCheckResult.psubset₂ a₀ b)
    | sub_subset₀₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₀ a a₁) (kModelCheckResult.subset₀ b a₁)
    | sub_subset₀₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₀ a₀ a) (kModelCheckResult.subset₀ a₀ b)
    | sub_subset₁₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₁ a a₁) (kModelCheckResult.subset₁ b a₁)
    | sub_subset₁₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₁ a₀ a) (kModelCheckResult.subset₁ a₀ b)
    | sub_subset₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₂ a a₁) (kModelCheckResult.subset₂ b a₁)
    | sub_subset₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.subset₂ a₀ a) (kModelCheckResult.subset₂ a₀ b)
    | sub_delete₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.delete a a₁) (kModelCheckResult.delete b a₁)
    | sub_delete₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.delete a₀ a) (kModelCheckResult.delete a₀ b)
    | sub_insert₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.insert a a₁) (kModelCheckResult.insert b a₁)
    | sub_insert₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.insert a₀ a) (kModelCheckResult.insert a₀ b)
    | sub_intersection₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.intersection a a₁) (kModelCheckResult.intersection b a₁)
    | sub_intersection₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.intersection a₀ a) (kModelCheckResult.intersection a₀ b)
    | sub_union₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.union a a₁) (kModelCheckResult.union b a₁)
    | sub_union₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.union a₀ a) (kModelCheckResult.union a₀ b)
    | sub_DO {a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.DO a) (kModelCheckResult.DO b)
    | sub_lteq₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lteq₀ a a₁) (kModelCheckResult.lteq₀ b a₁)
    | sub_lteq₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lteq₀ a₀ a) (kModelCheckResult.lteq₀ a₀ b)
    | sub_lteq₁₀ {a₁ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lteq₁ a a₁) (kModelCheckResult.lteq₁ b a₁)
    | sub_lteq₁₁ {a₀ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lteq₁ a₀ a) (kModelCheckResult.lteq₁ a₀ b)
    | sub_lt₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lt₀ a a₁) (kModelCheckResult.lt₀ b a₁)
    | sub_lt₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lt₀ a₀ a) (kModelCheckResult.lt₀ a₀ b)
    | sub_lt₁₀ {a₁ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lt₁ a a₁) (kModelCheckResult.lt₁ b a₁)
    | sub_lt₁₁ {a₀ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.lt₁ a₀ a) (kModelCheckResult.lt₁ a₀ b)
    | sub_gteq₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gteq₀ a a₁) (kModelCheckResult.gteq₀ b a₁)
    | sub_gteq₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gteq₀ a₀ a) (kModelCheckResult.gteq₀ a₀ b)
    | sub_gteq₁₀ {a₁ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gteq₁ a a₁) (kModelCheckResult.gteq₁ b a₁)
    | sub_gteq₁₁ {a₀ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gteq₁ a₀ a) (kModelCheckResult.gteq₁ a₀ b)
    | sub_gt₀₀ {a₁ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gt₀ a a₁) (kModelCheckResult.gt₀ b a₁)
    | sub_gt₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gt₀ a₀ a) (kModelCheckResult.gt₀ a₀ b)
    | sub_gt₁₀ {a₁ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gt₁ a a₁) (kModelCheckResult.gt₁ b a₁)
    | sub_gt₁₁ {a₀ a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.gt₁ a₀ a) (kModelCheckResult.gt₁ a₀ b)
    | sub_AND₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.AND a a₁) (kModelCheckResult.AND b a₁)
    | sub_AND₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.AND a₀ a) (kModelCheckResult.AND a₀ b)
    | sub_bslash₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.bslash a a₁) (kModelCheckResult.bslash b a₁)
    | sub_bslash₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.bslash a₀ a) (kModelCheckResult.bslash a₀ b)
    | sub_«`,»₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«`,» a a₁) (kModelCheckResult.«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.«`,» a₀ a) (kModelCheckResult.«`,» a₀ b)
    | sub_andsubthen₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.andsubthen a a₁) (kModelCheckResult.andsubthen b a₁)
    | sub_andsubthen₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.andsubthen a₀ a) (kModelCheckResult.andsubthen a₀ b)
    | sub_divides₀ {a₁ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.divides a a₁) (kModelCheckResult.divides b a₁)
    | sub_divides₁ {a₀ a b} : kFindResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.divides a₀ a) (kModelCheckResult.divides a₀ b)
    | sub_orsubelse₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.orsubelse a a₁) (kModelCheckResult.orsubelse b a₁)
    | sub_orsubelse₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.orsubelse a₀ a) (kModelCheckResult.orsubelse a₀ b)
    | sub_counterexample₀ {a₁ a b} : kTransitionList.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.counterexample a a₁) (kModelCheckResult.counterexample b a₁)
    | sub_counterexample₁ {a₀ a b} : kTransitionList.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.counterexample a₀ a) (kModelCheckResult.counterexample a₀ b)
    | sub_modelCheck₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.modelCheck a a₁) (kModelCheckResult.modelCheck b a₁)
    | sub_modelCheck₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.modelCheck a₀ a) (kModelCheckResult.modelCheck a₀ b)
    | sub_qid {a b} : kString.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.qid a) (kModelCheckResult.qid b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.ifthenelsefi a a₁ a₂) (kModelCheckResult.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.ifthenelsefi a₀ a a₂) (kModelCheckResult.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.ifthenelsefi a₀ a₁ a) (kModelCheckResult.ifthenelsefi a₀ a₁ b)
    | sub_eqslasheq₀₀ {a₁ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₀ a a₁) (kModelCheckResult.eqslasheq₀ b a₁)
    | sub_eqslasheq₀₁ {a₀ a b} : kEventTrace.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₀ a₀ a) (kModelCheckResult.eqslasheq₀ a₀ b)
    | sub_eqslasheq₁₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₁ a a₁) (kModelCheckResult.eqslasheq₁ b a₁)
    | sub_eqslasheq₁₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₁ a₀ a) (kModelCheckResult.eqslasheq₁ a₀ b)
    | sub_eqslasheq₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₂ a a₁) (kModelCheckResult.eqslasheq₂ b a₁)
    | sub_eqslasheq₂₁ {a₀ a b} : k«Set{Rule}».rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqslasheq₂ a₀ a) (kModelCheckResult.eqslasheq₂ a₀ b)
    | sub_eqeq₀₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₀ a a₁) (kModelCheckResult.eqeq₀ b a₁)
    | sub_eqeq₀₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₀ a₀ a) (kModelCheckResult.eqeq₀ a₀ b)
    | sub_eqeq₁₀ {a₁ a b} : kDeontic.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₁ a a₁) (kModelCheckResult.eqeq₁ b a₁)
    | sub_eqeq₁₁ {a₀ a b} : kDeontic.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₁ a₀ a) (kModelCheckResult.eqeq₁ a₀ b)
    | sub_eqeq₂₀ {a₁ a b} : kContractStatus.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₂ a a₁) (kModelCheckResult.eqeq₂ b a₁)
    | sub_eqeq₂₁ {a₀ a b} : kContractStatus.rw_one a b →
    kModelCheckResult.rw_one (kModelCheckResult.eqeq₂ a₀ a) (kModelCheckResult.eqeq₂ a₀ b)

  inductive kEventTrace.rw_one: kEventTrace → kEventTrace → Prop
    | eqe_left {a b c : kEventTrace} : a.eqe b → kEventTrace.rw_one b c → kEventTrace.rw_one a c
    | eqe_right {a b c : kEventTrace} : kEventTrace.rw_one a b → b.eqe c → kEventTrace.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«$diff»₀ {a₁ a₂ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$diff» a a₁ a₂) (kEventTrace.«$diff» b a₁ a₂)
    | sub_«$diff»₁ {a₀ a₂ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$diff» a₀ a a₂) (kEventTrace.«$diff» a₀ b a₂)
    | sub_«$diff»₂ {a₀ a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$diff» a₀ a₁ a) (kEventTrace.«$diff» a₀ a₁ b)
    | sub_«$intersect»₀ {a₁ a₂ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$intersect» a a₁ a₂) (kEventTrace.«$intersect» b a₁ a₂)
    | sub_«$intersect»₁ {a₀ a₂ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$intersect» a₀ a a₂) (kEventTrace.«$intersect» a₀ b a₂)
    | sub_«$intersect»₂ {a₀ a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«$intersect» a₀ a₁ a) (kEventTrace.«$intersect» a₀ a₁ b)
    | sub_allowedToDo₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.allowedToDo a a₁) (kEventTrace.allowedToDo b a₁)
    | sub_allowedToDo₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.allowedToDo a₀ a) (kEventTrace.allowedToDo a₀ b)
    | sub_mayDo₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.mayDo a a₁) (kEventTrace.mayDo b a₁)
    | sub_mayDo₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.mayDo a₀ a) (kEventTrace.mayDo a₀ b)
    | sub_mustDo₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.mustDo a a₁) (kEventTrace.mustDo b a₁)
    | sub_mustDo₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.mustDo a₀ a) (kEventTrace.mustDo a₀ b)
    | sub_prohibitedFromDoing₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.prohibitedFromDoing a a₁) (kEventTrace.prohibitedFromDoing b a₁)
    | sub_prohibitedFromDoing₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.prohibitedFromDoing a₀ a) (kEventTrace.prohibitedFromDoing a₀ b)
    | sub_delete₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.delete a a₁) (kEventTrace.delete b a₁)
    | sub_delete₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.delete a₀ a) (kEventTrace.delete a₀ b)
    | sub_getAction {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.getAction a) (kEventTrace.getAction b)
    | sub_getAllActions {a b} : k«Set{Rule}».rw_one a b →
    kEventTrace.rw_one (kEventTrace.getAllActions a) (kEventTrace.getAllActions b)
    | sub_initAux₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kEventTrace.rw_one (kEventTrace.initAux a a₁) (kEventTrace.initAux b a₁)
    | sub_initAux₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.initAux a₀ a) (kEventTrace.initAux a₀ b)
    | sub_init {a b} : k«Set{Rule}».rw_one a b →
    kEventTrace.rw_one (kEventTrace.init a) (kEventTrace.init b)
    | sub_insert₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.insert a a₁) (kEventTrace.insert b a₁)
    | sub_insert₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.insert a₀ a) (kEventTrace.insert a₀ b)
    | sub_intersection₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.intersection a a₁) (kEventTrace.intersection b a₁)
    | sub_intersection₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.intersection a₀ a) (kEventTrace.intersection a₀ b)
    | sub_pretty {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.pretty a) (kEventTrace.pretty b)
    | sub_union₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.union a a₁) (kEventTrace.union b a₁)
    | sub_union₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.union a₀ a) (kEventTrace.union a₀ b)
    | sub_ltgt₁ {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltgt₁ a) (kEventTrace.ltgt₁ b)
    | sub_ltcolonbargt₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltcolonbargt a a₁ a₂) (kEventTrace.ltcolonbargt b a₁ a₂)
    | sub_ltcolonbargt₁ {a₀ a₂ a b} : kCid.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltcolonbargt a₀ a a₂) (kEventTrace.ltcolonbargt a₀ b a₂)
    | sub_ltcolonbargt₂ {a₀ a₁ a b} : kAttributeSet.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltcolonbargt a₀ a₁ a) (kEventTrace.ltcolonbargt a₀ a₁ b)
    | sub_«ltcolonbar`gt»₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«ltcolonbar`gt» a a₁) (kEventTrace.«ltcolonbar`gt» b a₁)
    | sub_«ltcolonbar`gt»₁ {a₀ a b} : kCid.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«ltcolonbar`gt» a₀ a) (kEventTrace.«ltcolonbar`gt» a₀ b)
    | sub_O {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.O a) (kEventTrace.O b)
    | sub_sumsum₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.sumsum a a₁) (kEventTrace.sumsum b a₁)
    | sub_sumsum₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.sumsum a₀ a) (kEventTrace.sumsum a₀ b)
    | sub_subgt₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.subgt a a₁) (kEventTrace.subgt b a₁)
    | sub_subgt₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.subgt a₀ a) (kEventTrace.subgt a₀ b)
    | sub_slashbslash₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.slashbslash a a₁) (kEventTrace.slashbslash b a₁)
    | sub_slashbslash₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.slashbslash a₀ a) (kEventTrace.slashbslash a₀ b)
    | sub_ltsubgt₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltsubgt a a₁) (kEventTrace.ltsubgt b a₁)
    | sub_ltsubgt₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ltsubgt a₀ a) (kEventTrace.ltsubgt a₀ b)
    | sub_lteqgt₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.lteqgt a a₁) (kEventTrace.lteqgt b a₁)
    | sub_lteqgt₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.lteqgt a₀ a) (kEventTrace.lteqgt a₀ b)
    | sub_eqgt₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.eqgt a a₁) (kEventTrace.eqgt b a₁)
    | sub_eqgt₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.eqgt a₀ a) (kEventTrace.eqgt a₀ b)
    | sub_R₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.R a a₁) (kEventTrace.R b a₁)
    | sub_R₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.R a₀ a) (kEventTrace.R a₀ b)
    | sub_U₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.U a a₁) (kEventTrace.U b a₁)
    | sub_U₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.U a₀ a) (kEventTrace.U a₀ b)
    | sub_W₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.W a a₁) (kEventTrace.W b a₁)
    | sub_W₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.W a₀ a) (kEventTrace.W a₀ b)
    | sub_bslashslash₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.bslashslash a a₁) (kEventTrace.bslashslash b a₁)
    | sub_bslashslash₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.bslashslash a₀ a) (kEventTrace.bslashslash a₀ b)
    | sub_bslash₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.bslash a a₁) (kEventTrace.bslash b a₁)
    | sub_bslash₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.bslash a₀ a) (kEventTrace.bslash a₀ b)
    | sub_join₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.join a a₁) (kEventTrace.join b a₁)
    | sub_join₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.join a₀ a) (kEventTrace.join a₀ b)
    | sub_«`,»₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«`,» a a₁) (kEventTrace.«`,» b a₁)
    | sub_«`,»₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«`,» a₀ a) (kEventTrace.«`,» a₀ b)
    | sub_did₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.did a a₁) (kEventTrace.did b a₁)
    | sub_did₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.did a₀ a) (kEventTrace.did a₀ b)
    | sub_do₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.do a a₁) (kEventTrace.do b a₁)
    | sub_do₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.do a₀ a) (kEventTrace.do a₀ b)
    | sub_does₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.does a a₁) (kEventTrace.does b a₁)
    | sub_does₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.does a₀ a) (kEventTrace.does a₀ b)
    | sub_barsubgt₀ {a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.barsubgt a a₁) (kEventTrace.barsubgt b a₁)
    | sub_barsubgt₁ {a₀ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.barsubgt a₀ a) (kEventTrace.barsubgt a₀ b)
    | sub_«`lbrak`rbrack» {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«`lbrak`rbrack» a) (kEventTrace.«`lbrak`rbrack» b)
    | sub_«~» {a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.«~» a) (kEventTrace.«~» b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ifthenelsefi a a₁ a₂) (kEventTrace.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ifthenelsefi a₀ a a₂) (kEventTrace.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kEventTrace.rw_one a b →
    kEventTrace.rw_one (kEventTrace.ifthenelsefi a₀ a₁ a) (kEventTrace.ifthenelsefi a₀ a₁ b)
    -- Rewrite rules
    | rl_tick {coordinator : kModelCheckResult} {v#0 : kCid} {v#1 : kAttributeSet} {contractstate : kContractState} {rules : k«Set{Rule}»} {time : kFindResult} : coordinator.has_sort MSort.Qid → v#0.has_sort MSort.Coordinator → v#1.has_sort MSort.AttributeSet → contractstate.has_sort MSort.ContractState → rules.has_sort MSort.«Set{Rule}» → time.has_sort MSort.Nat → kEventTrace.rw_one (kEventTrace.ltcolonbargt coordinator v#0 (kAttributeSet.«`,» v#1 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» contractstate) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«time`colon» time))))) (kEventTrace.ltcolonbargt coordinator v#0 (kAttributeSet.«`,» (kAttributeSet.«time`colon» (kFindResult.ifthenelsefi (kModelCheckResult.eqeq₂ (kContractStatus.contractStateToStatus contractstate) kContractStatus.Active) (kFindResult.s time) time)) (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.deltaTick rules contractstate)) (kAttributeSet.«`,» v#1 (kAttributeSet.«rules`colon» rules)))))
    | rl_action {event : kEventTrace} {actorname : kModelCheckResult} {v#2 : kCid} {v#3 : kAttributeSet} {coordinator : kModelCheckResult} {v#4 : kCid} {v#6 : kAttributeSet} {activerules : k«Set{Rule}»} {rulename : kModelCheckResult} {deontic : kDeontic} {actionname : kModelCheckResult} {time : kFindResult} {hence lest : kModelCheckResult} {rules : k«Set{Rule}»} {v#5 : kFindResult} : event.has_sort MSort.Event → actorname.has_sort MSort.Qid → v#2.has_sort MSort.Actor → v#3.has_sort MSort.AttributeSet → coordinator.has_sort MSort.Qid → v#4.has_sort MSort.Coordinator → v#6.has_sort MSort.AttributeSet → activerules.has_sort MSort.«Set{Rule}» → rulename.has_sort MSort.Qid → deontic.has_sort MSort.Deontic → actionname.has_sort MSort.Qid → time.has_sort MSort.Nat → hence.has_sort MSort.«Set{Qid}» → lest.has_sort MSort.«Set{Qid}» → rules.has_sort MSort.«Set{Rule}» → v#5.has_sort MSort.Nat → kEventTrace.rw_one (kEventTrace.join event (kEventTrace.join (kEventTrace.ltcolonbargt actorname v#2 v#3) (kEventTrace.ltcolonbargt coordinator v#4 (kAttributeSet.«`,» v#6 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«time`colon» v#5))))))) (kEventTrace.join (kEventTrace.join (kEventTrace.does actorname actionname) (kEventTrace.ltcolonbargt coordinator v#4 (kAttributeSet.«`,» (kAttributeSet.«contractState`colon» (kContractState.deltaAction rules (kEventTrace.does actorname actionname) (kContractState.Active (k«Set{Rule}».«`,» activerules (k«Set{Rule}».RULE₁ rulename (kActorDeonticActionDeadline.PARTY₁ actorname deontic actionname (kDeadline.WITHIN (kDuration.DAY time))) (kHenceLest.HENCELEST hence lest)))))) (kAttributeSet.«`,» (kAttributeSet.«rules`colon» rules) (kAttributeSet.«`,» v#6 (kAttributeSet.«time`colon» v#5)))))) (kEventTrace.ltcolonbargt actorname v#2 v#3))

  inductive kActiveRule.rw_one: kActiveRule → kActiveRule → Prop
    | eqe_left {a b c : kActiveRule} : a.eqe b → kActiveRule.rw_one b c → kActiveRule.rw_one a c
    | eqe_right {a b c : kActiveRule} : kActiveRule.rw_one a b → b.eqe c → kActiveRule.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kCid.rw_one: kCid → kCid → Prop
    | eqe_left {a b c : kCid} : a.eqe b → kCid.rw_one b c → kCid.rw_one a c
    | eqe_right {a b c : kCid} : kCid.rw_one a b → b.eqe c → kCid.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_getClass {a b} : kEventTrace.rw_one a b →
    kCid.rw_one (kCid.getClass a) (kCid.getClass b)

  inductive kActorDeonticActionDeadline.rw_one: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | eqe_left {a b c : kActorDeonticActionDeadline} : a.eqe b → kActorDeonticActionDeadline.rw_one b c → kActorDeonticActionDeadline.rw_one a c
    | eqe_right {a b c : kActorDeonticActionDeadline} : kActorDeonticActionDeadline.rw_one a b → b.eqe c → kActorDeonticActionDeadline.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_PARTY₀₀ {a₁ a₂ a₃ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ b a₁ a₂ a₃)
    | sub_PARTY₀₁ {a₀ a₂ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₀ a₀ b a₂ a₃)
    | sub_PARTY₀₂ {a₀ a₁ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ b a₃)
    | sub_PARTY₀₃ {a₀ a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₀ a₀ a₁ a₂ b)
    | sub_PARTY₁₀ {a₁ a₂ a₃ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ b a₁ a₂ a₃)
    | sub_PARTY₁₁ {a₀ a₂ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₁ a₀ b a₂ a₃)
    | sub_PARTY₁₂ {a₀ a₁ a₃ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ b a₃)
    | sub_PARTY₁₃ {a₀ a₁ a₂ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₁ a₀ a₁ a₂ b)
    | sub_PARTY₂₀ {a₁ a₂ a₃ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ b a₁ a₂ a₃)
    | sub_PARTY₂₁ {a₀ a₂ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₂ a₀ b a₂ a₃)
    | sub_PARTY₂₂ {a₀ a₁ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ b a₃)
    | sub_PARTY₂₃ {a₀ a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₂ a₀ a₁ a₂ b)
    | sub_PARTY₃₀ {a₁ a₂ a₃ a b} : kDeadline.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a a₁ a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ b a₁ a₂ a₃)
    | sub_PARTY₃₁ {a₀ a₂ a₃ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a a₂ a₃) (kActorDeonticActionDeadline.PARTY₃ a₀ b a₂ a₃)
    | sub_PARTY₃₂ {a₀ a₁ a₃ a b} : kDeontic.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a a₃) (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ b a₃)
    | sub_PARTY₃₃ {a₀ a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kActorDeonticActionDeadline.rw_one (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ a) (kActorDeonticActionDeadline.PARTY₃ a₀ a₁ a₂ b)

  inductive kActorState.rw_one: kActorState → kActorState → Prop
    | eqe_left {a b c : kActorState} : a.eqe b → kActorState.rw_one b c → kActorState.rw_one a c
    | eqe_right {a b c : kActorState} : kActorState.rw_one a b → b.eqe c → kActorState.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kAttributeSet.rw_one: kAttributeSet → kAttributeSet → Prop
    | eqe_left {a b c : kAttributeSet} : a.eqe b → kAttributeSet.rw_one b c → kAttributeSet.rw_one a c
    | eqe_right {a b c : kAttributeSet} : kAttributeSet.rw_one a b → b.eqe c → kAttributeSet.rw_one a c
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
    | eqe_left {a b c : kString} : a.eqe b → kString.rw_one b c → kString.rw_one a c
    | eqe_right {a b c : kString} : kString.rw_one a b → b.eqe c → kString.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_sum₀ {a₁ a b} : kString.rw_one a b →
    kString.rw_one (kString.sum a a₁) (kString.sum b a₁)
    | sub_sum₁ {a₀ a b} : kString.rw_one a b →
    kString.rw_one (kString.sum a₀ a) (kString.sum a₀ b)
    | sub_char {a b} : kFindResult.rw_one a b →
    kString.rw_one (kString.char a) (kString.char b)
    | sub_lowerCase {a b} : kString.rw_one a b →
    kString.rw_one (kString.lowerCase a) (kString.lowerCase b)
    | sub_string {a b} : kModelCheckResult.rw_one a b →
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
    | eqe_left {a b c : kContractState} : a.eqe b → kContractState.rw_one b c → kContractState.rw_one a c
    | eqe_right {a b c : kContractState} : kContractState.rw_one a b → b.eqe c → kContractState.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_deltaAction₀ {a₁ a₂ a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a a₁ a₂) (kContractState.deltaAction b a₁ a₂)
    | sub_deltaAction₁ {a₀ a₂ a b} : kEventTrace.rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a₀ a a₂) (kContractState.deltaAction a₀ b a₂)
    | sub_deltaAction₂ {a₀ a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.deltaAction a₀ a₁ a) (kContractState.deltaAction a₀ a₁ b)
    | sub_deltaTick₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.deltaTick a a₁) (kContractState.deltaTick b a₁)
    | sub_deltaTick₁ {a₀ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.deltaTick a₀ a) (kContractState.deltaTick a₀ b)
    | sub_Active {a b} : k«Set{Rule}».rw_one a b →
    kContractState.rw_one (kContractState.Active a) (kContractState.Active b)
    | sub_Breached {a b} : kModelCheckResult.rw_one a b →
    kContractState.rw_one (kContractState.Breached a) (kContractState.Breached b)
    | sub_pow₀ {a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.pow a a₁) (kContractState.pow b a₁)
    | sub_pow₁ {a₀ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.pow a₀ a) (kContractState.pow a₀ b)
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a a₁ a₂) (kContractState.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a₀ a a₂) (kContractState.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kContractState.rw_one a b →
    kContractState.rw_one (kContractState.ifthenelsefi a₀ a₁ a) (kContractState.ifthenelsefi a₀ a₁ b)

  inductive kContractStatus.rw_one: kContractStatus → kContractStatus → Prop
    | eqe_left {a b c : kContractStatus} : a.eqe b → kContractStatus.rw_one b c → kContractStatus.rw_one a c
    | eqe_right {a b c : kContractStatus} : kContractStatus.rw_one a b → b.eqe c → kContractStatus.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_configToStatus {a b} : kEventTrace.rw_one a b →
    kContractStatus.rw_one (kContractStatus.configToStatus a) (kContractStatus.configToStatus b)
    | sub_contractStateToStatus {a b} : kContractState.rw_one a b →
    kContractStatus.rw_one (kContractStatus.contractStateToStatus a) (kContractStatus.contractStateToStatus b)

  inductive kDate.rw_one: kDate → kDate → Prop
    | eqe_left {a b c : kDate} : a.eqe b → kDate.rw_one b c → kDate.rw_one a c
    | eqe_right {a b c : kDate} : kDate.rw_one a b → b.eqe c → kDate.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kDeadline.rw_one: kDeadline → kDeadline → Prop
    | eqe_left {a b c : kDeadline} : a.eqe b → kDeadline.rw_one b c → kDeadline.rw_one a c
    | eqe_right {a b c : kDeadline} : kDeadline.rw_one a b → b.eqe c → kDeadline.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_BY {a b} : kFindResult.rw_one a b →
    kDeadline.rw_one (kDeadline.BY a) (kDeadline.BY b)
    | sub_WITHIN {a b} : kDuration.rw_one a b →
    kDeadline.rw_one (kDeadline.WITHIN a) (kDeadline.WITHIN b)

  inductive kDeontic.rw_one: kDeontic → kDeontic → Prop
    | eqe_left {a b c : kDeontic} : a.eqe b → kDeontic.rw_one b c → kDeontic.rw_one a c
    | eqe_right {a b c : kDeontic} : kDeontic.rw_one a b → b.eqe c → kDeontic.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kDuration.rw_one: kDuration → kDuration → Prop
    | eqe_left {a b c : kDuration} : a.eqe b → kDuration.rw_one b c → kDuration.rw_one a c
    | eqe_right {a b c : kDuration} : kDuration.rw_one a b → b.eqe c → kDuration.rw_one a c
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
    | eqe_left {a b c : kFindResult} : a.eqe b → kFindResult.rw_one b c → kFindResult.rw_one a c
    | eqe_right {a b c : kFindResult} : kFindResult.rw_one a b → b.eqe c → kFindResult.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_«$card»₀₀ {a₁ a b} : kEventTrace.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₀ a a₁) (kFindResult.«$card»₀ b a₁)
    | sub_«$card»₀₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₀ a₀ a) (kFindResult.«$card»₀ a₀ b)
    | sub_«$card»₁₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₁ a a₁) (kFindResult.«$card»₁ b a₁)
    | sub_«$card»₁₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₁ a₀ a) (kFindResult.«$card»₁ a₀ b)
    | sub_«$card»₂₀ {a₁ a b} : k«Set{Rule}».rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₂ a a₁) (kFindResult.«$card»₂ b a₁)
    | sub_«$card»₂₁ {a₀ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.«$card»₂ a₀ a) (kFindResult.«$card»₂ a₀ b)
    | sub_barbar₀ {a b} : kEventTrace.rw_one a b →
    kFindResult.rw_one (kFindResult.barbar₀ a) (kFindResult.barbar₀ b)
    | sub_barbar₁ {a b} : kModelCheckResult.rw_one a b →
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
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a a₁ a₂) (kFindResult.ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a₀ a a₂) (kFindResult.ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : kFindResult.rw_one a b →
    kFindResult.rw_one (kFindResult.ifthenelsefi a₀ a₁ a) (kFindResult.ifthenelsefi a₀ a₁ b)

  inductive kHenceLest.rw_one: kHenceLest → kHenceLest → Prop
    | eqe_left {a b c : kHenceLest} : a.eqe b → kHenceLest.rw_one b c → kHenceLest.rw_one a c
    | eqe_right {a b c : kHenceLest} : kHenceLest.rw_one a b → b.eqe c → kHenceLest.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_HENCE {a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCE a) (kHenceLest.HENCE b)
    | sub_HENCELEST₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCELEST a a₁) (kHenceLest.HENCELEST b a₁)
    | sub_HENCELEST₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.HENCELEST a₀ a) (kHenceLest.HENCELEST a₀ b)
    | sub_LEST {a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LEST a) (kHenceLest.LEST b)
    | sub_LESTHENCE₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LESTHENCE a a₁) (kHenceLest.LESTHENCE b a₁)
    | sub_LESTHENCE₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kHenceLest.rw_one (kHenceLest.LESTHENCE a₀ a) (kHenceLest.LESTHENCE a₀ b)

  inductive k«Set{Rule}».rw_one: k«Set{Rule}» → k«Set{Rule}» → Prop
    | eqe_left {a b c : k«Set{Rule}»} : a.eqe b → k«Set{Rule}».rw_one b c → k«Set{Rule}».rw_one a c
    | eqe_right {a b c : k«Set{Rule}»} : k«Set{Rule}».rw_one a b → b.eqe c → k«Set{Rule}».rw_one a c
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
    | sub_getRulesWithNames₁ {a₀ a b} : kModelCheckResult.rw_one a b →
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
    | sub_RULE₀₀ {a₁ a b} : kModelCheckResult.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₀ a a₁) (k«Set{Rule}».RULE₀ b a₁)
    | sub_RULE₀₁ {a₀ a b} : kActorDeonticActionDeadline.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».RULE₀ a₀ a) (k«Set{Rule}».RULE₀ a₀ b)
    | sub_RULE₁₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
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
    | sub_ifthenelsefi₀ {a₁ a₂ a b} : kModelCheckResult.rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a a₁ a₂) (k«Set{Rule}».ifthenelsefi b a₁ a₂)
    | sub_ifthenelsefi₁ {a₀ a₂ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a₀ a a₂) (k«Set{Rule}».ifthenelsefi a₀ b a₂)
    | sub_ifthenelsefi₂ {a₀ a₁ a b} : k«Set{Rule}».rw_one a b →
    k«Set{Rule}».rw_one (k«Set{Rule}».ifthenelsefi a₀ a₁ a) (k«Set{Rule}».ifthenelsefi a₀ a₁ b)

  inductive kTransitionList.rw_one: kTransitionList → kTransitionList → Prop
    | eqe_left {a b c : kTransitionList} : a.eqe b → kTransitionList.rw_one b c → kTransitionList.rw_one a c
    | eqe_right {a b c : kTransitionList} : kTransitionList.rw_one a b → b.eqe c → kTransitionList.rw_one a c
    -- Axioms for rewriting inside subterms
    | sub_join₀ {a₁ a b} : kTransitionList.rw_one a b →
    kTransitionList.rw_one (kTransitionList.join a a₁) (kTransitionList.join b a₁)
    | sub_join₁ {a₀ a b} : kTransitionList.rw_one a b →
    kTransitionList.rw_one (kTransitionList.join a₀ a) (kTransitionList.join a₀ b)
    | sub_«`{`,`}»₀ {a₁ a b} : kEventTrace.rw_one a b →
    kTransitionList.rw_one (kTransitionList.«`{`,`}» a a₁) (kTransitionList.«`{`,`}» b a₁)
    | sub_«`{`,`}»₁ {a₀ a b} : kModelCheckResult.rw_one a b →
    kTransitionList.rw_one (kTransitionList.«`{`,`}» a₀ a) (kTransitionList.«`{`,`}» a₀ b)

  inductive kstrategylbrakinternalrbrack.rw_one: kstrategylbrakinternalrbrack → kstrategylbrakinternalrbrack → Prop
    | eqe_left {a b c : kstrategylbrakinternalrbrack} : a.eqe b → kstrategylbrakinternalrbrack.rw_one b c → kstrategylbrakinternalrbrack.rw_one a c
    | eqe_right {a b c : kstrategylbrakinternalrbrack} : kstrategylbrakinternalrbrack.rw_one a b → b.eqe c → kstrategylbrakinternalrbrack.rw_one a c
    -- Axioms for rewriting inside subterms

  inductive kModelCheckResult.rw_star: kModelCheckResult → kModelCheckResult → Prop
    | step {a b} : kModelCheckResult.rw_one a b → kModelCheckResult.rw_star a b
    | refl {a b : kModelCheckResult} : a.eqe b → kModelCheckResult.rw_star a b
    | trans {a b c} : kModelCheckResult.rw_star a b → kModelCheckResult.rw_star b c → kModelCheckResult.rw_star a c

  inductive kEventTrace.rw_star: kEventTrace → kEventTrace → Prop
    | step {a b} : kEventTrace.rw_one a b → kEventTrace.rw_star a b
    | refl {a b : kEventTrace} : a.eqe b → kEventTrace.rw_star a b
    | trans {a b c} : kEventTrace.rw_star a b → kEventTrace.rw_star b c → kEventTrace.rw_star a c

  inductive kActiveRule.rw_star: kActiveRule → kActiveRule → Prop
    | step {a b} : kActiveRule.rw_one a b → kActiveRule.rw_star a b
    | refl {a b : kActiveRule} : a.eqe b → kActiveRule.rw_star a b
    | trans {a b c} : kActiveRule.rw_star a b → kActiveRule.rw_star b c → kActiveRule.rw_star a c

  inductive kCid.rw_star: kCid → kCid → Prop
    | step {a b} : kCid.rw_one a b → kCid.rw_star a b
    | refl {a b : kCid} : a.eqe b → kCid.rw_star a b
    | trans {a b c} : kCid.rw_star a b → kCid.rw_star b c → kCid.rw_star a c

  inductive kActorDeonticActionDeadline.rw_star: kActorDeonticActionDeadline → kActorDeonticActionDeadline → Prop
    | step {a b} : kActorDeonticActionDeadline.rw_one a b → kActorDeonticActionDeadline.rw_star a b
    | refl {a b : kActorDeonticActionDeadline} : a.eqe b → kActorDeonticActionDeadline.rw_star a b
    | trans {a b c} : kActorDeonticActionDeadline.rw_star a b → kActorDeonticActionDeadline.rw_star b c → kActorDeonticActionDeadline.rw_star a c

  inductive kActorState.rw_star: kActorState → kActorState → Prop
    | step {a b} : kActorState.rw_one a b → kActorState.rw_star a b
    | refl {a b : kActorState} : a.eqe b → kActorState.rw_star a b
    | trans {a b c} : kActorState.rw_star a b → kActorState.rw_star b c → kActorState.rw_star a c

  inductive kAttributeSet.rw_star: kAttributeSet → kAttributeSet → Prop
    | step {a b} : kAttributeSet.rw_one a b → kAttributeSet.rw_star a b
    | refl {a b : kAttributeSet} : a.eqe b → kAttributeSet.rw_star a b
    | trans {a b c} : kAttributeSet.rw_star a b → kAttributeSet.rw_star b c → kAttributeSet.rw_star a c

  inductive kString.rw_star: kString → kString → Prop
    | step {a b} : kString.rw_one a b → kString.rw_star a b
    | refl {a b : kString} : a.eqe b → kString.rw_star a b
    | trans {a b c} : kString.rw_star a b → kString.rw_star b c → kString.rw_star a c

  inductive kContractState.rw_star: kContractState → kContractState → Prop
    | step {a b} : kContractState.rw_one a b → kContractState.rw_star a b
    | refl {a b : kContractState} : a.eqe b → kContractState.rw_star a b
    | trans {a b c} : kContractState.rw_star a b → kContractState.rw_star b c → kContractState.rw_star a c

  inductive kContractStatus.rw_star: kContractStatus → kContractStatus → Prop
    | step {a b} : kContractStatus.rw_one a b → kContractStatus.rw_star a b
    | refl {a b : kContractStatus} : a.eqe b → kContractStatus.rw_star a b
    | trans {a b c} : kContractStatus.rw_star a b → kContractStatus.rw_star b c → kContractStatus.rw_star a c

  inductive kDate.rw_star: kDate → kDate → Prop
    | step {a b} : kDate.rw_one a b → kDate.rw_star a b
    | refl {a b : kDate} : a.eqe b → kDate.rw_star a b
    | trans {a b c} : kDate.rw_star a b → kDate.rw_star b c → kDate.rw_star a c

  inductive kDeadline.rw_star: kDeadline → kDeadline → Prop
    | step {a b} : kDeadline.rw_one a b → kDeadline.rw_star a b
    | refl {a b : kDeadline} : a.eqe b → kDeadline.rw_star a b
    | trans {a b c} : kDeadline.rw_star a b → kDeadline.rw_star b c → kDeadline.rw_star a c

  inductive kDeontic.rw_star: kDeontic → kDeontic → Prop
    | step {a b} : kDeontic.rw_one a b → kDeontic.rw_star a b
    | refl {a b : kDeontic} : a.eqe b → kDeontic.rw_star a b
    | trans {a b c} : kDeontic.rw_star a b → kDeontic.rw_star b c → kDeontic.rw_star a c

  inductive kDuration.rw_star: kDuration → kDuration → Prop
    | step {a b} : kDuration.rw_one a b → kDuration.rw_star a b
    | refl {a b : kDuration} : a.eqe b → kDuration.rw_star a b
    | trans {a b c} : kDuration.rw_star a b → kDuration.rw_star b c → kDuration.rw_star a c

  inductive kFindResult.rw_star: kFindResult → kFindResult → Prop
    | step {a b} : kFindResult.rw_one a b → kFindResult.rw_star a b
    | refl {a b : kFindResult} : a.eqe b → kFindResult.rw_star a b
    | trans {a b c} : kFindResult.rw_star a b → kFindResult.rw_star b c → kFindResult.rw_star a c

  inductive kHenceLest.rw_star: kHenceLest → kHenceLest → Prop
    | step {a b} : kHenceLest.rw_one a b → kHenceLest.rw_star a b
    | refl {a b : kHenceLest} : a.eqe b → kHenceLest.rw_star a b
    | trans {a b c} : kHenceLest.rw_star a b → kHenceLest.rw_star b c → kHenceLest.rw_star a c

  inductive k«Set{Rule}».rw_star: k«Set{Rule}» → k«Set{Rule}» → Prop
    | step {a b} : k«Set{Rule}».rw_one a b → k«Set{Rule}».rw_star a b
    | refl {a b : k«Set{Rule}»} : a.eqe b → k«Set{Rule}».rw_star a b
    | trans {a b c} : k«Set{Rule}».rw_star a b → k«Set{Rule}».rw_star b c → k«Set{Rule}».rw_star a c

  inductive kTransitionList.rw_star: kTransitionList → kTransitionList → Prop
    | step {a b} : kTransitionList.rw_one a b → kTransitionList.rw_star a b
    | refl {a b : kTransitionList} : a.eqe b → kTransitionList.rw_star a b
    | trans {a b c} : kTransitionList.rw_star a b → kTransitionList.rw_star b c → kTransitionList.rw_star a c

  inductive kstrategylbrakinternalrbrack.rw_star: kstrategylbrakinternalrbrack → kstrategylbrakinternalrbrack → Prop
    | step {a b} : kstrategylbrakinternalrbrack.rw_one a b → kstrategylbrakinternalrbrack.rw_star a b
    | refl {a b : kstrategylbrakinternalrbrack} : a.eqe b → kstrategylbrakinternalrbrack.rw_star a b
    | trans {a b c} : kstrategylbrakinternalrbrack.rw_star a b → kstrategylbrakinternalrbrack.rw_star b c → kstrategylbrakinternalrbrack.rw_star a c

end
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


namespace kModelCheckResult
  -- Sort membership lemmas
  theorem subsort_bool_modelcheckresult {t : kModelCheckResult} : t.has_sort MSort.Bool →
    t.has_sort MSort.ModelCheckResult := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_action {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.Action := by apply has_sort.subsort; simp [subsort]
  theorem subsort_names_«set{qid}» {t : kModelCheckResult} : t.has_sort MSort.Names →
    t.has_sort MSort.«Set{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_«neset{qid}»_«set{qid}» {t : kModelCheckResult} : t.has_sort MSort.«NeSet{Qid}» →
    t.has_sort MSort.«Set{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_oid_id {t : kModelCheckResult} : t.has_sort MSort.Oid →
    t.has_sort MSort.Id := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_rulename {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.RuleName := by apply has_sort.subsort; simp [subsort]
  theorem subsort_bool_situation {t : kModelCheckResult} : t.has_sort MSort.Bool →
    t.has_sort MSort.Situation := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_situation {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.Situation := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_names {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.Names := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_«neset{qid}» {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.«NeSet{Qid}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_qid_oid {t : kModelCheckResult} : t.has_sort MSort.Qid →
    t.has_sort MSort.Oid := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kModelCheckResult) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kModelCheckResult} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kModelCheckResult} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kModelCheckResult} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  def deadlock_decl := @has_sort.deadlock_decl
  def delete_decl := @has_sort.delete_decl
  def insert_decl := @has_sort.insert_decl
  def intersection_decl := @has_sort.intersection_decl
  def union_decl₀ := @has_sort.union_decl₀
  def union_decl₁ := @has_sort.union_decl₁
  def union_decl₂ := @has_sort.union_decl₂
  def unlabeled_decl := @has_sort.unlabeled_decl
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
  def bareq_decl := @has_sort.bareq_decl
  def counterexample_decl := @has_sort.counterexample_decl
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
  def ifthenelsefi_decl₁₀ := @has_sort.ifthenelsefi_decl₁₀
  def ifthenelsefi_decl₁₁ := @has_sort.ifthenelsefi_decl₁₁
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
  def eqa_bareq := @eqa.eqa_bareq
  def eqe_bareq := @eqe.eqe_bareq
  def eqa_counterexample := @eqa.eqa_counterexample
  def eqe_counterexample := @eqe.eqe_counterexample
  def eqa_modelCheck := @eqa.eqa_modelCheck
  def eqe_modelCheck := @eqe.eqe_modelCheck
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
  def eq_bareq₀ := @eqe.eq_bareq₀
  def eq_bareq₁ := @eqe.eq_bareq₁
  def eq_bareq₂ := @eqe.eq_bareq₂
  def eq_bareq₃ := @eqe.eq_bareq₃
  def eq_bareq₄ := @eqe.eq_bareq₄
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

  attribute [simp] has_sort.true_decl₀ has_sort.true_decl₁ has_sort.false_decl₀ has_sort.false_decl₁ has_sort.and_decl₀ has_sort.and_decl₁ has_sort.or_decl₀ has_sort.or_decl₁ has_sort.xor_decl₀ has_sort.xor_decl₁ has_sort.not_decl₀ has_sort.not_decl₁ has_sort.implies_decl₀ has_sort.implies_decl₁ has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.NOTHING_decl has_sort.containsActor_decl has_sort.containsRuleWithEvent_decl has_sort.«in»₀_decl has_sort.«in»₁_decl has_sort.«in»₂_decl has_sort.psubset₀_decl has_sort.psubset₁_decl has_sort.psubset₂_decl has_sort.subset₀_decl has_sort.subset₁_decl has_sort.subset₂_decl has_sort.deadlock_decl has_sort.delete_decl has_sort.insert_decl has_sort.intersection_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.unlabeled_decl has_sort.ltQidsgt_decl has_sort.DO_decl has_sort.lteq₀_decl has_sort.lteq₁_decl has_sort.lt₀_decl has_sort.lt₁_decl has_sort.gteq₀_decl has_sort.gteq₁_decl has_sort.gt₀_decl has_sort.gt₁_decl has_sort.AND_decl has_sort.bslash_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.andsubthen_decl has_sort.divides_decl has_sort.orsubelse_decl has_sort.bareq_decl has_sort.counterexample_decl has_sort.empty_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ has_sort.ifthenelsefi_decl₄ has_sort.ifthenelsefi_decl₅ has_sort.ifthenelsefi_decl₆ has_sort.ifthenelsefi_decl₇ has_sort.ifthenelsefi_decl₈ has_sort.ifthenelsefi_decl₉ has_sort.ifthenelsefi_decl₁₀ has_sort.ifthenelsefi_decl₁₁ has_sort.eqslasheq₀_decl has_sort.eqslasheq₁_decl has_sort.eqslasheq₂_decl has_sort.eqeq₀_decl has_sort.eqeq₁_decl has_sort.eqeq₂_decl eqe.eq_NOTHING eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_DO eqe.eq_AND eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_andsubthen₀ eqe.eq_andsubthen₁ eqe.eq_and₀ eqe.eq_and₁ eqe.eq_and₂ eqe.eq_and₃ eqe.eq_containsActor₀ eqe.eq_containsRuleWithEvent₀ eqe.eq_implies₀ eqe.eq_«in»₀₀ eqe.eq_«in»₁₀ eqe.eq_«in»₂₀ eqe.eq_orsubelse₀ eqe.eq_orsubelse₁ eqe.eq_or₀ eqe.eq_psubset₀ eqe.eq_psubset₁ eqe.eq_psubset₂ eqe.eq_subset₀₀ eqe.eq_subset₁₀ eqe.eq_subset₂₀ eqe.eq_subset₀₁ eqe.eq_subset₁₁ eqe.eq_subset₂₁ eqe.eq_xor₀ eqe.eq_xor₁ eqe.eq_bareq₀ eqe.eq_bareq₁ eqe.eq_bareq₂ eqe.eq_bareq₃ eqe.eq_bareq₄ eqe.eq_delete₀ eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_not₀ eqe.eq_union eqe.eq_containsActor₁ eqe.eq_containsRuleWithEvent₁ eqe.eq_«in»₀₁ eqe.eq_«in»₁₁ eqe.eq_«in»₂₁ eqe.eq_delete₁ eqe.eq_and₄ eqe.eq_and₅ eqe.eq_and₆ eqe.eq_xor₂ eqe.eq_xor₃ eqe.eq_and₇ eqe.eq_not₁ eqe.eq_or₁ eqe.eq_implies₁ eqe.eq_itet eqe.eq_itef eqe.eq_eqslasheq₀ eqe.eq_eqslasheq₁ eqe.eq_eqslasheq₂ eqe.eq_eqeq₀ eqe.eq_eqeq₁ eqe.eq_eqeq₂ subsort_bool_modelcheckresult subsort_qid_action subsort_names_«set{qid}» subsort_«neset{qid}»_«set{qid}» subsort_oid_id subsort_qid_rulename subsort_bool_situation subsort_qid_situation subsort_qid_names subsort_qid_«neset{qid}» subsort_qid_oid
end kModelCheckResult

namespace kEventTrace
  -- Sort membership lemmas
  theorem subsort_event_eventtrace {t : kEventTrace} : t.has_sort MSort.Event →
    t.has_sort MSort.EventTrace := by apply has_sort.subsort; simp [subsort]
  theorem subsort_configuration_state {t : kEventTrace} : t.has_sort MSort.Configuration →
    t.has_sort MSort.State := by apply has_sort.subsort; simp [subsort]
  theorem subsort_«neset{actionevent}»_«set{actionevent}» {t : kEventTrace} : t.has_sort MSort.«NeSet{ActionEvent}» →
    t.has_sort MSort.«Set{ActionEvent}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_prop_formula {t : kEventTrace} : t.has_sort MSort.Prop →
    t.has_sort MSort.Formula := by apply has_sort.subsort; simp [subsort]
  theorem subsort_msg_configuration {t : kEventTrace} : t.has_sort MSort.Msg →
    t.has_sort MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_object_configuration {t : kEventTrace} : t.has_sort MSort.Object →
    t.has_sort MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_portal_configuration {t : kEventTrace} : t.has_sort MSort.Portal →
    t.has_sort MSort.Configuration := by apply has_sort.subsort; simp [subsort]
  theorem subsort_actionevent_«neset{actionevent}» {t : kEventTrace} : t.has_sort MSort.ActionEvent →
    t.has_sort MSort.«NeSet{ActionEvent}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_actionevent_prop {t : kEventTrace} : t.has_sort MSort.ActionEvent →
    t.has_sort MSort.Prop := by apply has_sort.subsort; simp [subsort]
  theorem subsort_message_msg {t : kEventTrace} : t.has_sort MSort.Message →
    t.has_sort MSort.Msg := by apply has_sort.subsort; simp [subsort]
  theorem subsort_event_message {t : kEventTrace} : t.has_sort MSort.Event →
    t.has_sort MSort.Message := by apply has_sort.subsort; simp [subsort]
  theorem subsort_actionevent_event {t : kEventTrace} : t.has_sort MSort.ActionEvent →
    t.has_sort MSort.Event := by apply has_sort.subsort; simp [subsort]
  theorem subsort_tickevent_event {t : kEventTrace} : t.has_sort MSort.TickEvent →
    t.has_sort MSort.Event := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kEventTrace) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kEventTrace} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kEventTrace} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kEventTrace} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def sumsum_assoc := @eqa.sumsum_assoc
  def slashbslash_comm := @eqa.slashbslash_comm
  def bslashslash_comm := @eqa.bslashslash_comm
  def join_comm := @eqa.join_comm
  def join_assoc := @eqa.join_assoc
  def «`,»_comm := @eqa.«`,»_comm
  def «`,»_assoc := @eqa.«`,»_assoc
  def «$diff»_decl := @has_sort.«$diff»_decl
  def «$intersect»_decl := @has_sort.«$intersect»_decl
  def allowedToDo_decl := @has_sort.allowedToDo_decl
  def mayDo_decl := @has_sort.mayDo_decl
  def mustDo_decl := @has_sort.mustDo_decl
  def prohibitedFromDoing_decl := @has_sort.prohibitedFromDoing_decl
  def delete_decl := @has_sort.delete_decl
  def getAction_decl := @has_sort.getAction_decl
  def getAllActions_decl := @has_sort.getAllActions_decl
  def initAux_decl := @has_sort.initAux_decl
  def init_decl := @has_sort.init_decl
  def initialConfig_decl := @has_sort.initialConfig_decl
  def insert_decl := @has_sort.insert_decl
  def intersection_decl := @has_sort.intersection_decl
  def pretty_decl := @has_sort.pretty_decl
  def union_decl₀ := @has_sort.union_decl₀
  def union_decl₁ := @has_sort.union_decl₁
  def union_decl₂ := @has_sort.union_decl₂
  def ltgt₀_decl := @has_sort.ltgt₀_decl
  def ltgt₁_decl := @has_sort.ltgt₁_decl
  def ltcolonbargt_decl := @has_sort.ltcolonbargt_decl
  def «ltcolonbar`gt»_decl := @has_sort.«ltcolonbar`gt»_decl
  def False_decl := @has_sort.False_decl
  def O_decl := @has_sort.O_decl
  def True_decl := @has_sort.True_decl
  def sumsum_decl := @has_sort.sumsum_decl
  def subgt_decl := @has_sort.subgt_decl
  def slashbslash_decl := @has_sort.slashbslash_decl
  def ltsubgt_decl := @has_sort.ltsubgt_decl
  def lteqgt_decl := @has_sort.lteqgt_decl
  def eqgt_decl := @has_sort.eqgt_decl
  def R_decl := @has_sort.R_decl
  def U_decl := @has_sort.U_decl
  def W_decl := @has_sort.W_decl
  def bslashslash_decl := @has_sort.bslashslash_decl
  def bslash_decl := @has_sort.bslash_decl
  def join_decl := @has_sort.join_decl
  def «`,»_decl₀ := @has_sort.«`,»_decl₀
  def «`,»_decl₁ := @has_sort.«`,»_decl₁
  def «`,»_decl₂ := @has_sort.«`,»_decl₂
  def did_decl := @has_sort.did_decl
  def do_decl := @has_sort.do_decl
  def does_decl := @has_sort.does_decl
  def barsubgt_decl := @has_sort.barsubgt_decl
  def «`lbrak`rbrack»_decl := @has_sort.«`lbrak`rbrack»_decl
  def empty_decl := @has_sort.empty_decl
  def emptyEventTrace_decl := @has_sort.emptyEventTrace_decl
  def none_decl := @has_sort.none_decl
  def tau_decl := @has_sort.tau_decl
  def tick_decl := @has_sort.tick_decl
  def «~»_decl := @has_sort.«~»_decl
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
  def ifthenelsefi_decl₁₁ := @has_sort.ifthenelsefi_decl₁₁
  def ifthenelsefi_decl₁₂ := @has_sort.ifthenelsefi_decl₁₂
  def ifthenelsefi_decl₁₃ := @has_sort.ifthenelsefi_decl₁₃
  def ifthenelsefi_decl₁₄ := @has_sort.ifthenelsefi_decl₁₄
  def eqa_«$diff» := @eqa.eqa_«$diff»
  def eqe_«$diff» := @eqe.eqe_«$diff»
  def eqa_«$intersect» := @eqa.eqa_«$intersect»
  def eqe_«$intersect» := @eqe.eqe_«$intersect»
  def eqa_allowedToDo := @eqa.eqa_allowedToDo
  def eqe_allowedToDo := @eqe.eqe_allowedToDo
  def eqa_mayDo := @eqa.eqa_mayDo
  def eqe_mayDo := @eqe.eqe_mayDo
  def eqa_mustDo := @eqa.eqa_mustDo
  def eqe_mustDo := @eqe.eqe_mustDo
  def eqa_prohibitedFromDoing := @eqa.eqa_prohibitedFromDoing
  def eqe_prohibitedFromDoing := @eqe.eqe_prohibitedFromDoing
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
  def eqa_ltgt₁ := @eqa.eqa_ltgt₁
  def eqe_ltgt₁ := @eqe.eqe_ltgt₁
  def eqa_ltcolonbargt := @eqa.eqa_ltcolonbargt
  def eqe_ltcolonbargt := @eqe.eqe_ltcolonbargt
  def eqa_«ltcolonbar`gt» := @eqa.eqa_«ltcolonbar`gt»
  def eqe_«ltcolonbar`gt» := @eqe.eqe_«ltcolonbar`gt»
  def eqa_O := @eqa.eqa_O
  def eqe_O := @eqe.eqe_O
  def eqa_sumsum := @eqa.eqa_sumsum
  def eqe_sumsum := @eqe.eqe_sumsum
  def eqa_subgt := @eqa.eqa_subgt
  def eqe_subgt := @eqe.eqe_subgt
  def eqa_slashbslash := @eqa.eqa_slashbslash
  def eqe_slashbslash := @eqe.eqe_slashbslash
  def eqa_ltsubgt := @eqa.eqa_ltsubgt
  def eqe_ltsubgt := @eqe.eqe_ltsubgt
  def eqa_lteqgt := @eqa.eqa_lteqgt
  def eqe_lteqgt := @eqe.eqe_lteqgt
  def eqa_eqgt := @eqa.eqa_eqgt
  def eqe_eqgt := @eqe.eqe_eqgt
  def eqa_R := @eqa.eqa_R
  def eqe_R := @eqe.eqe_R
  def eqa_U := @eqa.eqa_U
  def eqe_U := @eqe.eqe_U
  def eqa_W := @eqa.eqa_W
  def eqe_W := @eqe.eqe_W
  def eqa_bslashslash := @eqa.eqa_bslashslash
  def eqe_bslashslash := @eqe.eqe_bslashslash
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
  def eqa_barsubgt := @eqa.eqa_barsubgt
  def eqe_barsubgt := @eqe.eqe_barsubgt
  def eqa_«`lbrak`rbrack» := @eqa.eqa_«`lbrak`rbrack»
  def eqe_«`lbrak`rbrack» := @eqe.eqe_«`lbrak`rbrack»
  def eqa_«~» := @eqa.eqa_«~»
  def eqe_«~» := @eqe.eqe_«~»
  def eqa_ifthenelsefi := @eqa.eqa_ifthenelsefi
  def eqe_ifthenelsefi := @eqe.eqe_ifthenelsefi
  def eq_initialConfig := @eqe.eq_initialConfig
  def eq_«$diff»₀ := @eqe.eq_«$diff»₀
  def eq_«$diff»₁ := @eqe.eq_«$diff»₁
  def eq_«$intersect»₀ := @eqe.eq_«$intersect»₀
  def eq_«$intersect»₁ := @eqe.eq_«$intersect»₁
  def eq_ltgt₁ := @eqe.eq_ltgt₁
  def eq_subgt := @eqe.eq_subgt
  def eq_ltsubgt := @eqe.eq_ltsubgt
  def eq_lteqgt := @eqe.eq_lteqgt
  def eq_eqgt := @eqe.eq_eqgt
  def eq_W := @eqe.eq_W
  def eq_bslash₀ := @eqe.eq_bslash₀
  def eq_bslash₁ := @eqe.eq_bslash₁
  def eq_«`,» := @eqe.eq_«`,»
  def eq_did := @eqe.eq_did
  def eq_do := @eqe.eq_do
  def eq_barsubgt := @eqe.eq_barsubgt
  def eq_«`lbrak`rbrack» := @eqe.eq_«`lbrak`rbrack»
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
  def eq_«~»₀ := @eqe.eq_«~»₀
  def eq_«~»₁ := @eqe.eq_«~»₁
  def eq_«~»₂ := @eqe.eq_«~»₂
  def eq_«~»₃ := @eqe.eq_«~»₃
  def eq_«~»₄ := @eqe.eq_«~»₄
  def eq_«~»₅ := @eqe.eq_«~»₅
  def eq_«~»₆ := @eqe.eq_«~»₆
  def eq_«~»₇ := @eqe.eq_«~»₇
  def eq_delete₁ := @eqe.eq_delete₁
  def eq_itet := @eqe.eq_itet
  def eq_itef := @eqe.eq_itef

  attribute [simp] has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.allowedToDo_decl has_sort.mayDo_decl has_sort.mustDo_decl has_sort.prohibitedFromDoing_decl has_sort.delete_decl has_sort.getAction_decl has_sort.getAllActions_decl has_sort.initAux_decl has_sort.init_decl has_sort.initialConfig_decl has_sort.insert_decl has_sort.intersection_decl has_sort.pretty_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.ltgt₀_decl has_sort.ltgt₁_decl has_sort.ltcolonbargt_decl has_sort.«ltcolonbar`gt»_decl has_sort.False_decl has_sort.O_decl has_sort.True_decl has_sort.sumsum_decl has_sort.subgt_decl has_sort.slashbslash_decl has_sort.ltsubgt_decl has_sort.lteqgt_decl has_sort.eqgt_decl has_sort.R_decl has_sort.U_decl has_sort.W_decl has_sort.bslashslash_decl has_sort.bslash_decl has_sort.join_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.did_decl has_sort.do_decl has_sort.does_decl has_sort.barsubgt_decl has_sort.«`lbrak`rbrack»_decl has_sort.empty_decl has_sort.emptyEventTrace_decl has_sort.none_decl has_sort.tau_decl has_sort.tick_decl has_sort.«~»_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ has_sort.ifthenelsefi_decl₄ has_sort.ifthenelsefi_decl₅ has_sort.ifthenelsefi_decl₆ has_sort.ifthenelsefi_decl₇ has_sort.ifthenelsefi_decl₈ has_sort.ifthenelsefi_decl₉ has_sort.ifthenelsefi_decl₁₀ has_sort.ifthenelsefi_decl₁₁ has_sort.ifthenelsefi_decl₁₂ has_sort.ifthenelsefi_decl₁₃ has_sort.ifthenelsefi_decl₁₄ eqe.eq_initialConfig eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_ltgt₁ eqe.eq_subgt eqe.eq_ltsubgt eqe.eq_lteqgt eqe.eq_eqgt eqe.eq_W eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_did eqe.eq_do eqe.eq_barsubgt eqe.eq_«`lbrak`rbrack» eqe.eq_delete₀ eqe.eq_getAction eqe.eq_getAllActions₀ eqe.eq_getAllActions₁ eqe.eq_initAux₀ eqe.eq_initAux₁ eqe.eq_init eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_pretty eqe.eq_union eqe.eq_«~»₀ eqe.eq_«~»₁ eqe.eq_«~»₂ eqe.eq_«~»₃ eqe.eq_«~»₄ eqe.eq_«~»₅ eqe.eq_«~»₆ eqe.eq_«~»₇ eqe.eq_delete₁ eqe.eq_itet eqe.eq_itef subsort_event_eventtrace subsort_configuration_state subsort_«neset{actionevent}»_«set{actionevent}» subsort_prop_formula subsort_msg_configuration subsort_object_configuration subsort_portal_configuration subsort_actionevent_«neset{actionevent}» subsort_actionevent_prop subsort_message_msg subsort_event_message subsort_actionevent_event subsort_tickevent_event
end kEventTrace

namespace kActiveRule
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kActiveRule) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActiveRule} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActiveRule} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActiveRule} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kActiveRule

namespace kCid
  -- Sort membership lemmas
  theorem subsort_actor_cid {t : kCid} : t.has_sort MSort.Actor →
    t.has_sort MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_coordinator_cid {t : kCid} : t.has_sort MSort.Coordinator →
    t.has_sort MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_precoordinator_cid {t : kCid} : t.has_sort MSort.PreCoordinator →
    t.has_sort MSort.Cid := by apply has_sort.subsort; simp [subsort]
  theorem subsort_coordinator_precoordinator {t : kCid} : t.has_sort MSort.Coordinator →
    t.has_sort MSort.PreCoordinator := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kCid) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kCid} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kCid} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kCid} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kActorDeonticActionDeadline) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActorDeonticActionDeadline} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActorDeonticActionDeadline} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActorDeonticActionDeadline} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kActorState) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kActorState} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kActorState} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kActorState} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kActorState

namespace kAttributeSet
  -- Sort membership lemmas
  theorem subsort_attribute_attributeset {t : kAttributeSet} : t.has_sort MSort.Attribute →
    t.has_sort MSort.AttributeSet := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kAttributeSet) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kAttributeSet} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kAttributeSet} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kAttributeSet} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem subsort_char_string {t : kString} : t.has_sort MSort.Char →
    t.has_sort MSort.String := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kString) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kString} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kString} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kString} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kContractState) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kContractState} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kContractState} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kContractState} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kContractStatus) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kContractStatus} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kContractStatus} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kContractStatus} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kDate) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDate} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDate} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDate} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kDate

namespace kDeadline
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kDeadline) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDeadline} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDeadline} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDeadline} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kDeontic) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDeontic} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDeontic} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDeontic} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kDuration) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kDuration} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kDuration} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kDuration} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem subsort_nat_findresult {t : kFindResult} : t.has_sort MSort.Nat →
    t.has_sort MSort.FindResult := by apply has_sort.subsort; simp [subsort]
  theorem subsort_nznat_nat {t : kFindResult} : t.has_sort MSort.NzNat →
    t.has_sort MSort.Nat := by apply has_sort.subsort; simp [subsort]
  theorem subsort_zero_nat {t : kFindResult} : t.has_sort MSort.Zero →
    t.has_sort MSort.Nat := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kFindResult) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kFindResult} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kFindResult} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kFindResult} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem eqe_refl (a : kHenceLest) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kHenceLest} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kHenceLest} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kHenceLest} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  theorem subsort_«neset{rule}»_«set{rule}» {t : k«Set{Rule}»} : t.has_sort MSort.«NeSet{Rule}» →
    t.has_sort MSort.«Set{Rule}» := by apply has_sort.subsort; simp [subsort]
  theorem subsort_rule_«neset{rule}» {t : k«Set{Rule}»} : t.has_sort MSort.Rule →
    t.has_sort MSort.«NeSet{Rule}» := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : k«Set{Rule}») : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : k«Set{Rule}»} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : k«Set{Rule}»} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : k«Set{Rule}»} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
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
  def rules_decl := @has_sort.rules_decl
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
  def eq_rules := @eqe.eq_rules
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

  attribute [simp] has_sort.«$diff»_decl has_sort.«$intersect»_decl has_sort.delete_decl has_sort.getRulesWithNames_decl has_sort.insert_decl has_sort.intersection_decl has_sort.rules_decl has_sort.union_decl₀ has_sort.union_decl₁ has_sort.union_decl₂ has_sort.RULE₀_decl has_sort.RULE₁_decl has_sort.bslash_decl has_sort.«`,»_decl₀ has_sort.«`,»_decl₁ has_sort.«`,»_decl₂ has_sort.empty_decl has_sort.ifthenelsefi_decl₁ has_sort.ifthenelsefi_decl₂ has_sort.ifthenelsefi_decl₃ eqe.eq_rules eqe.eq_«$diff»₀ eqe.eq_«$diff»₁ eqe.eq_«$intersect»₀ eqe.eq_«$intersect»₁ eqe.eq_RULE₀ eqe.eq_bslash₀ eqe.eq_bslash₁ eqe.eq_«`,» eqe.eq_delete₀ eqe.eq_getRulesWithNames₀ eqe.eq_getRulesWithNames₁ eqe.eq_insert eqe.eq_intersection₀ eqe.eq_intersection₁ eqe.eq_union eqe.eq_delete₁ eqe.eq_getRulesWithNames₂ eqe.eq_itet eqe.eq_itef subsort_«neset{rule}»_«set{rule}» subsort_rule_«neset{rule}»
end k«Set{Rule}»

namespace kTransitionList
  -- Sort membership lemmas
  theorem subsort_transition_transitionlist {t : kTransitionList} : t.has_sort MSort.Transition →
    t.has_sort MSort.TransitionList := by apply has_sort.subsort; simp [subsort]

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kTransitionList) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kTransitionList} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kTransitionList} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kTransitionList} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases
  def join_assoc := @eqa.join_assoc
  def join_decl := @has_sort.join_decl
  def «`{`,`}»_decl := @has_sort.«`{`,`}»_decl
  def nil_decl := @has_sort.nil_decl
  def eqa_join := @eqa.eqa_join
  def eqe_join := @eqe.eqe_join
  def eqa_«`{`,`}» := @eqa.eqa_«`{`,`}»
  def eqe_«`{`,`}» := @eqe.eqe_«`{`,`}»

  attribute [simp] has_sort.join_decl has_sort.«`{`,`}»_decl has_sort.nil_decl subsort_transition_transitionlist
end kTransitionList

namespace kstrategylbrakinternalrbrack
  -- Sort membership lemmas

  -- Reflexivity and congruence lemmas
  theorem eqe_refl (a : kstrategylbrakinternalrbrack) : a.eqe a := eqe.from_eqa eqa.refl
  theorem eqa_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqa b → c.eqa d → (a.eqa c) = (b.eqa d)
    := generic_congr @eqa.trans @eqa.trans @eqa.symm
  theorem eqe_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqe b → c.eqe d → (a.eqe c) = (b.eqe d)
    := generic_congr @eqe.trans @eqe.trans @eqe.symm
  theorem eqa_eqe_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqa b → c.eqa d → (a.eqe c) = (b.eqe d)
    := generic_congr (λ {x y z} => (@eqe.trans x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@eqe.trans x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases

end kstrategylbrakinternalrbrack

-- Lemmas for the rewriting relation

namespace kModelCheckResult
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kModelCheckResult} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kModelCheckResult} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kModelCheckResult} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kModelCheckResult} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kModelCheckResult

namespace kEventTrace
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kEventTrace} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kEventTrace} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kEventTrace} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kEventTrace} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm

  -- Aliases for rewrite rules
  def rl_tick := @rw_one.rl_tick
  def rl_action := @rw_one.rl_action
end kEventTrace

namespace kActiveRule
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActiveRule} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActiveRule} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActiveRule} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActiveRule} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActiveRule

namespace kCid
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kCid} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kCid} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kCid} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kCid} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kCid

namespace kActorDeonticActionDeadline
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActorDeonticActionDeadline} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActorDeonticActionDeadline} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActorDeonticActionDeadline} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActorDeonticActionDeadline} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActorDeonticActionDeadline

namespace kActorState
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kActorState} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kActorState} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kActorState} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kActorState} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kActorState

namespace kAttributeSet
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kAttributeSet} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kAttributeSet} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kAttributeSet} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kAttributeSet} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kAttributeSet

namespace kString
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kString} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kString} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kString} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kString} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kString

namespace kContractState
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kContractState} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kContractState} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kContractState} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kContractState} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kContractState

namespace kContractStatus
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kContractStatus} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kContractStatus} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kContractStatus} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kContractStatus} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kContractStatus

namespace kDate
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDate} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDate} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDate} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDate} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDate

namespace kDeadline
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDeadline} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDeadline} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDeadline} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDeadline} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDeadline

namespace kDeontic
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDeontic} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDeontic} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDeontic} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDeontic} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDeontic

namespace kDuration
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kDuration} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kDuration} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kDuration} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kDuration} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kDuration

namespace kFindResult
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kFindResult} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kFindResult} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kFindResult} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kFindResult} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kFindResult

namespace kHenceLest
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kHenceLest} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kHenceLest} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kHenceLest} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kHenceLest} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kHenceLest

namespace k«Set{Rule}»
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : k«Set{Rule}»} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : k«Set{Rule}»} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : k«Set{Rule}»} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : k«Set{Rule}»} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end k«Set{Rule}»

namespace kTransitionList
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kTransitionList} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kTransitionList} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kTransitionList} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kTransitionList} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kTransitionList

namespace kstrategylbrakinternalrbrack
  -- Congruence lemmas
  theorem eqe_rw_one_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqe b → c.eqe d → (a.rw_one c) = (b.rw_one d)
    := generic_congr @rw_one.eqe_left @rw_one.eqe_right @eqe.symm
  theorem eqa_rw_one_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqa b → c.eqa d → (a.rw_one c) = (b.rw_one d)
    := generic_congr (λ {x y z} => (@rw_one.eqe_left x y z) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_one.eqe_right x y z h) ∘ (@eqe.from_eqa y z)) @eqa.symm
  theorem eqe_rw_star_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqe b → c.eqe d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z)) @eqe.symm
  theorem eqa_rw_star_congr {a b c d : kstrategylbrakinternalrbrack} : a.eqa b → c.eqa d → (a.rw_star c) = (b.rw_star d)
    := generic_congr (λ {x y z} => (@rw_star.trans x y z) ∘ (@rw_star.refl x y) ∘ (@eqe.from_eqa x y))
      (λ {x y z h} => (@rw_star.trans x y z h) ∘ (@rw_star.refl y z) ∘ (@eqe.from_eqa y z)) @eqa.symm
end kstrategylbrakinternalrbrack

-- String conversion

def kDeontic.repr : kDeontic → String
  | kDeontic.MAY => "MAY"
  | kDeontic.MUST => "MUST"
  | kDeontic.SHANT => "SHANT"

mutual

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

  def kEventTrace.repr : kEventTrace → String
    | (kEventTrace.«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kEventTrace.«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kEventTrace.allowedToDo a₀ a₁) => "_allowedToDo_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.mayDo a₀ a₁) => "_mayDo_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.mustDo a₀ a₁) => "_mustDo_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.prohibitedFromDoing a₀ a₁) => "_prohibitedFromDoing_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.getAction a) => "getAction_(" ++ (a.repr) ++ ")"
    | (kEventTrace.getAllActions a) => "getAllActions_(" ++ (a.repr) ++ ")"
    | (kEventTrace.initAux a₀ a₁) => "initAux__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.init a) => "init_(" ++ (a.repr) ++ ")"
    | kEventTrace.initialConfig => "initialConfig"
    | (kEventTrace.insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.pretty a) => "pretty_(" ++ (a.repr) ++ ")"
    | (kEventTrace.union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kEventTrace.ltgt₀ => "<>"
    | (kEventTrace.ltgt₁ a) => "<>_(" ++ (a.repr) ++ ")"
    | (kEventTrace.ltcolonbargt a₀ a₁ a₂) => "<_:_|_>(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kEventTrace.«ltcolonbar`gt» a₀ a₁) => "<_:_|`>(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kEventTrace.False => "False"
    | (kEventTrace.O a) => "O_(" ++ (a.repr) ++ ")"
    | kEventTrace.True => "True"
    | (kEventTrace.sumsum a₀ a₁) => "_++_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.subgt a₀ a₁) => "_->_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.slashbslash a₀ a₁) => "_/\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.ltsubgt a₀ a₁) => "_<->_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.lteqgt a₀ a₁) => "_<=>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.eqgt a₀ a₁) => "_=>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.R a₀ a₁) => "_R_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.U a₀ a₁) => "_U_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.W a₀ a₁) => "_W_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.bslashslash a₀ a₁) => "_\/_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.join a₀ a₁) => "__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.did a₀ a₁) => "_did_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.do a₀ a₁) => "_do_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.does a₀ a₁) => "_does_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.barsubgt a₀ a₁) => "_|->_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kEventTrace.«`lbrak`rbrack» a) => "`[`]_(" ++ (a.repr) ++ ")"
    | kEventTrace.empty => "empty"
    | kEventTrace.emptyEventTrace => "emptyEventTrace"
    | kEventTrace.none => "none"
    | kEventTrace.tau => "tau"
    | kEventTrace.tick => "tick"
    | (kEventTrace.«~» a) => "~_(" ++ (a.repr) ++ ")"
    | (kEventTrace.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"

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

  def kModelCheckResult.repr : kModelCheckResult → String
    | kModelCheckResult.true => "true"
    | kModelCheckResult.false => "false"
    | (kModelCheckResult.and a₀ a₁) => "_and_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.or a₀ a₁) => "_or_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.xor a₀ a₁) => "_xor_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.not a) => "not_(" ++ (a.repr) ++ ")"
    | (kModelCheckResult.implies a₀ a₁) => "_implies_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kModelCheckResult.«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | kModelCheckResult.NOTHING => "NOTHING"
    | (kModelCheckResult.containsActor a₀ a₁) => "_containsActor_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.containsRuleWithEvent a₀ a₁) => "_containsRuleWithEvent_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.«in»₀ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.«in»₁ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.«in»₂ a₀ a₁) => "_in_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.psubset₀ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.psubset₁ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.psubset₂ a₀ a₁) => "_psubset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.subset₀ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.subset₁ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.subset₂ a₀ a₁) => "_subset_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kModelCheckResult.deadlock => "deadlock"
    | (kModelCheckResult.delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kModelCheckResult.unlabeled => "unlabeled"
    | kModelCheckResult.ltQidsgt => "<Qids>"
    | (kModelCheckResult.DO a) => "DO_(" ++ (a.repr) ++ ")"
    | (kModelCheckResult.lteq₀ a₀ a₁) => "_<=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.lteq₁ a₀ a₁) => "_<=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.lt₀ a₀ a₁) => "_<_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.lt₁ a₀ a₁) => "_<_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.gteq₀ a₀ a₁) => "_>=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.gteq₁ a₀ a₁) => "_>=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.gt₀ a₀ a₁) => "_>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.gt₁ a₀ a₁) => "_>_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.AND a₀ a₁) => "_AND_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.andsubthen a₀ a₁) => "_and-then_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.divides a₀ a₁) => "_divides_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.orsubelse a₀ a₁) => "_or-else_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.bareq a₀ a₁) => "_|=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.counterexample a₀ a₁) => "counterexample(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kModelCheckResult.empty => "empty"
    | (kModelCheckResult.modelCheck a₀ a₁) => "modelCheck(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.qid a) => "qid(" ++ (a.repr) ++ ")"
    | (kModelCheckResult.ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kModelCheckResult.eqslasheq₀ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.eqslasheq₁ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.eqslasheq₂ a₀ a₁) => "_=/=_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.eqeq₀ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.eqeq₁ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kModelCheckResult.eqeq₂ a₀ a₁) => "_==_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"

  def kString.repr : kString → String
    | kString.ltStringsgt => "<Strings>"
    | (kString.sum a₀ a₁) => "_+_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kString.char a) => "char(" ++ (a.repr) ++ ")"
    | (kString.lowerCase a) => "lowerCase(" ++ (a.repr) ++ ")"
    | (kString.string a) => "string(" ++ (a.repr) ++ ")"
    | (kString.substr a₀ a₁ a₂) => "substr(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (kString.upperCase a) => "upperCase(" ++ (a.repr) ++ ")"

  def kTransitionList.repr : kTransitionList → String
    | (kTransitionList.join a₀ a₁) => "__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (kTransitionList.«`{`,`}» a₀ a₁) => "`{_`,_`}(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | kTransitionList.nil => "nil"

  def k«Set{Rule}».repr : k«Set{Rule}» → String
    | (k«Set{Rule}».«$diff» a₀ a₁ a₂) => "$diff(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».«$intersect» a₀ a₁ a₂) => "$intersect(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».delete a₀ a₁) => "delete(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».getRulesWithNames a₀ a₁) => "getRulesWithNames__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».insert a₀ a₁) => "insert(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».intersection a₀ a₁) => "intersection(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | k«Set{Rule}».rules => "rules"
    | (k«Set{Rule}».union a₀ a₁) => "union(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».RULE₀ a₀ a₁) => "RULE__(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».RULE₁ a₀ a₁ a₂) => "RULE___(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
    | (k«Set{Rule}».bslash a₀ a₁) => "_\_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | (k«Set{Rule}».«`,» a₀ a₁) => "_`,_(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ")"
    | k«Set{Rule}».empty => "empty"
    | (k«Set{Rule}».ifthenelsefi a₀ a₁ a₂) => "if_then_else_fi(" ++ (a₀.repr) ++ ", " ++ (a₁.repr) ++ ", " ++ (a₂.repr) ++ ")"
end

def kstrategylbrakinternalrbrack.repr : kstrategylbrakinternalrbrack → String
  | _ => "<empty>"

instance : Repr kModelCheckResult := ⟨ λ x _ => Std.Format.text (kModelCheckResult.repr x) ⟩
instance : Repr kFindResult := ⟨ λ x _ => Std.Format.text (kFindResult.repr x) ⟩
instance : Repr kEventTrace := ⟨ λ x _ => Std.Format.text (kEventTrace.repr x) ⟩
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
instance : Repr kTransitionList := ⟨ λ x _ => Std.Format.text (kTransitionList.repr x) ⟩
instance : Repr kAttributeSet := ⟨ λ x _ => Std.Format.text (kAttributeSet.repr x) ⟩

end Maude
