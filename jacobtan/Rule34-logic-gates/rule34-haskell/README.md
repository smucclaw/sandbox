# rule34-haskell: Logic gates in Haskell

![first draft](First%20Draft%20_%20Screenshot%202021-04-09%20194608.png)

# Module Architecture for MyRule / AnyAll / SVG-Builder etc

We want to modularize the Rule34 codebase enough to publish the generic infrastructure pieces on Hackage.

## smucclaw-myrule

MyRule is a library that helps construct MyRule records without awareness of any application-specific code. So it doesn't know anything about rule34, or pdpa, or that sort of thing; that's up to the application consumer to do. It provides some syntactic sugar like mkLabel and mkLI.

	data MyRule = MyRule { rlabel    :: Label
						 , defeasors :: [Defeasor ParaNum]
						 , party     :: Party
						 , deontic   :: Deontic
						 , condition :: ConditionTree Predicate
						 }
				  deriving (Eq, Show, Read)

In Github, this code lives in `smucclaw/dsl/lib/haskell/myrule`

## smucclaw-anyall

AnyAll is a library that constructs AnyAll objects. These objects know how to "enlist" into semicolon/comma-separated lists, with the appropriate "and" / "or" penultimate connectors.

The capability for that started life in SandboxBuilder but should move into the AnyAll library.

The code that knows how to convert an AnyAll into an SVG and PNG currently lives in `smucclaw/dsl/lib/haskell/anyall`

After refactoring, this will become another hackage library, perhaps conservativelly named under `smucclaw` rather than hackage toplevel.

## connecting anyall to myrule

I'm not sure how to connect these things. The above design may be over-modular: maybe we end up with only one hackage library called `anyall`, and then `myrule` lives inside that.

Or, maybe MyRule ships with code that knows how to convert a MyRule object to an AnyAll object, and that's just the way it is.

Because there are plenty of libraries on Hackage that include code to instantiate common datatypes into their typeclasses. So we follow that idiom.

## rule34

Rule34 is a "consumer" application that imports MyRule and AnyAll. It provides "application-specific business logic" like 

	instance NLG PredicateTerm where
	  toEnglish "detractsFrom" = "detracts from"
	  toEnglish "isIncompatibleWith" = "is incompatible with"
	  toEnglish "derogatesFrom" = "derogates from"

and

	rule34_1 :: MyRule
	rule34_1 =
	  MyRule { rlabel = mkLabel (Just "34.1", Nothing, PSheader)
			 , defeasors = []
			 , party = lp
			 , deontic = MustNot
			 , condition = Node (MkCondition
								  (mkLabel (Just "34.1", Just "Toplevel 34.1", PShidden))
								  (Just "a legal practitioner must not accept any executive appointment associated with")
								  Any Nothing)
						   [ Node (MkCondition
								   (mkLabel (Just "34.1.a", Just "IncompatibleDignity", PSheader))
								   (Just "any business which") Or (Just "the dignity of the legal profession") )
							 [mkLI "detractsFrom"
							 ,mkLI "isIncompatibleWith"
							 ,mkLI "derogatesFrom"
							 ]


This code will live in `smucclaw/dsl/caseStudies/LPAPCR34` under the stack project already created there. Don't worry about the science-fictional L4 code present in the README.org ... we will merge those strands of activity eventually.

### rule34-svg

Usage:

	┌─[mengwong@rosegold] - [~/src/smucclaw/sandbox/jacobtan/Rule34-logic-gates/rule34-haskell] - [2021-09-01 03:13:56]
	└─[0] <git:(anyall-refactor c122d97✈) > stack run rule34-svg > rule34_1.svg 2> rule34_1_err.svg

## pdpa

PDPA is another "consumer" application that imports MyRule and AnyAll. Its application-specific business logic is produced by an interpretor toolchain that starts out with magic like

This code will live in `smucclaw/dsl/caseStudies/PDPA`.







