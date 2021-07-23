# Gilded Rose Kata Solution (Using DMNMD)

### How to run the tests
```bash
$ python -m tests.tests
```
The test cases listed out in tests/test_inputs.gr are taken from the texttests repository by Emily Bache.
They were then modified.



### Quality Change logic
| F  | Legendary | Conjured | Aged Brie | Backstage Pass | Sell In | Quality | Delta Sell In (out) | Delta Quality (out) | # Category Name                        |
|----|-----------|----------|-----------|----------------|---------|---------|---------------------|---------------------|----------------------------------------|
| 1  | True      | False    | False     | False          | -       | -       | sellIn -1           | quality +0          | Legendary Items                        |
| 2  | False     | -        | -         | -              | -       | >50     | sellIn -1           | quality +0          | Quality = 50                           |
| 3  | False     | True     | False     | False          | <= 0    | -       | sellIn -1           | max(0 quality -4)   | Conjured (Expired)                     |
| 4  | False     | True     | False     | False          | > 0     | -       | sellIn -1           | max(0 quality -2)   | Conjured (Fresh)                       |
| 5  | False     | -        | True      | False          | -       | -       | sellIn -1           | max(0 quality +1)   | Aged Brie                              |
| 6  | False     | False    | False     | True           | [6..10] | -       | sellIn -1           | max(0 quality +2)   | Backstage Pass (<= 10 days to concert) |
| 7  | False     | False    | False     | True           | [1..5]  | -       | sellIn -1           | max(0 quality +3)   | Backstage Pass (<= 5 days to concert)  |
| 8  | False     | False    | False     | True           | <0      | -       | sellIn -1           | 0                   | Backstage Pass (Expired)               |
| 9  | False     | False    | False     | True           | -       | -       | sellIn -1           | max(0 quality +1)   | Backstage Pass (Fresh)                 |
| 10 | False     | False    | False     | False          | > 0     | -       | sellIn -1           | max(0 quality -1)   | "Normal" (Fresh)                       |
| 11 | False     | False    | False     | False          | <= 0    | -       | sellIn -1           | max(0 quality -2)   | "Normal" (Expired)                     |



### Requirements Conflicts

- Which quality comes first for camembert?
  	- Case 1: Camembert continues to increase in quality (until it 50) even after sellIn date reaches 0 (argument: cheese doesn't spoil)
  	  	- Case 2: Camembert decreases in quality after sellIn date reaches 0 (argument: consistency)
  	   - Decision : go with case 1, requirements do not describe what to do
  	
- Legendary Conjured Items?
  - Case 1: Legendary so no change in quality
  - Case 2: Spectral so decrease in quality (but by how much?)
  - Decision: go with case 1, more restrictive (Lex specialis). Legendary items are a more restrictive case than conjured items

# A Contribution

[Hillel Wayne analyzes the underspecification present in the Gilded Rose](https://www.hillelwayne.com/post/requirements/), and presents a decision table that forces certain decisions. However, that decision table remains at the level of a specification.

The DMNMD library _refines_ the specification to an implementation, by producing working Python code that implements the logic of the decision table.

In the first draft of the code, every row gets its own "if" statement. But maybe the terms of the "if" are heavyweight functions; we wouldn't want to evaluate any of them more than necessary.

A lazy functional language like Haskell easily solves that problem by inherently "caching" results of intermediate evaluations under a `let` binding, but the traditional approach is to convert a decision table to a decision tree.

There is a rich literature in how to do that:
- https://dl.acm.org/doi/10.1145/356628.356630
- https://www.researchgate.net/publication/220431539_Conversion_of_Limited-Entry_Decision_Tables_to_Optimal_Computer_Programs_I_Minimum_Average_Processing_Time
- https://dl.acm.org/doi/abs/10.1145/360238.360245

The literature is so old it has passed out of common knowledge.

The next round of work on this library will facilitate the automatic extraction of a decison tree (a.k.a a bunch of nested "ifs"). Initially we will do this the naive way; later we will try to optimize.




