# Alloy Tutorial
### Introduction
This is a beginner's tutorial to understanding and modelling simple specifications with Alloy. No prior knowledge of logic programming or Alloy is required.

### Formal verification and model checking
Formal verification is the process of checking whether a system satisfies a given set of specifications.

Model checking is a computer-assisted method for the analysis of dynamical systems that can be modeled by state-transition systems. *(Handbook of Model Checking 2018)*

These concepts are best illustrated with a simple theoretical example:

 - We are (programmatically) drafting a contract (i.e. a **program**) for the sale of cabbages from Taiwan to Singapore, which stipulates that only the sale of cabbages from the counties of Hsinchu and Yilan are permitted.
 - We write **specifications**, or requirements, to check whether the contract is valid. Specifically, a specification that checks that the cabbages are either from Hsinchu or Yilan.
 - Unfortunately, when drafting the contract, someone had a mix-up and wrote Kaohsiung instead of Yilan.
 - Fortunately, we tell the computer to run the model checker before the contract is executed. 
 - The computer checks the contract against the specifications, and gives us a **counterexample** - in this case, a scenario where the contract is invalid because a cabbage from Kaohsiung (a non-permitted county) is being sold.

## What is Alloy?
Alloy is a lightweight, declarative specification language for modeling software systems. Specifications written in Alloy can be checked using the Alloy Analyzer. 

## Resources
 - Software Abstractions by Daniel Jackson
	 - [SMU library copy](https://search.library.smu.edu.sg/discovery/fulldisplay?docid=alma99167229902601&context=L&vid=65SMU_INST:SMU_NUI&lang=en&search_scope=Alma&adaptor=Local%20Search%20Engine&tab=BooksVideos&query=any,contains,software%20abstractions&offset=0) (Note: This is the older version. Contact Joey for the latest physical copy :)
 - Official Alloy website
	 - [Tutorial slides](https://alloytools.org/tutorials/day-course/)
	 - [Online tutorial](https://alloytools.org/tutorials/online/) 
 - [Documentation](https://alloy.readthedocs.io/en/latest/index.html) 
 - [Slides by Black Mesa Technologies](https://blackmesatech.com/2013/07/alloy/slides/)
- [Michael Sitko's Guide to Alloy](https://msitko.pl/blog/2020/05/24/guide-to-alloy.html)
- [Chelsea Troy on Structural Verification](https://chelseatroy.com/2020/10/06/structural-verification-catching-data-model-clusterfumbles-before-they-happen/)

Recommended learning path for beginners:
1. Start with Sitko and Troy's videos
2. Go through the slides and exercises by Black Mesa Technologies
3. Software Abstractions

## Installation
Download the latest version of Alloy [here](https://alloytools.org/download.html).

## Exercises

 - Software Abstractions 
 - https://blackmesatech.com/2013/07/alloy/slides/exercises.xhtml

## Logic, numbers, sets, functions, relations, etc.

 - https://www.math.uci.edu/~mzeman/M13-19F/math-13-notes.pdf  (thanks Jacob!)

