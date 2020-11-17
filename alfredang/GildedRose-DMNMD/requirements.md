
### Quality Change logic
| F  | Legendary | Conjured | Aged Brie | Backstage Pass | Sell In | Quality | Delta Sell In (out) | Delta Quality (out) | # Category Name                        |
|----|-----------|----------|-----------|----------------|---------|---------|---------------------|---------------------|----------------------------------------|
| 1  | True      | False    | False     | False          | -       | -       | sellIn -1           | quality +0          | Legendary Items                        |
| 2  | False     | -        | -         | -              | -       | >50     | sellIn -1           | quality +0          | Quality = 50                           |
| 3  | False     | True     | False     | False          | <= 0    | -       | sellIn -1           | max(0, quality -4)  | Conjured (Expired)                     |
| 4  | False     | True     | False     | False          | > 0     | -       | sellIn -1           | max(0, quality -2)  | Conjured (Fresh)                       |
| 5  | False     | -        | True      | False          | -       | -       | sellIn -1           | max(0, quality +1)  | Aged Brie                              |
| 6  | False     | False    | False     | True           | -       | -       | sellIn -1           | max(0, quality +1)  | Backstage Pass (Fresh)                 |
| 7  | False     | False    | False     | True           | [6..10] | -       | sellIn -1           | max(0, quality +2)  | Backstage Pass (<= 10 days to concert) |
| 8  | False     | False    | False     | True           | [1..5]  | -       | sellIn -1           | max(0, quality +3)  | Backstage Pass (<= 5 days to concert)  |
| 9  | False     | False    | False     | True           | <0      | -       | sellIn -1           | 0                   | Backstage Pass (Expired)               |
| 10 | False     | False    | False     | False          | > 0     | -       | sellIn -1           | max(0, quality -1)  | "Normal" (Fresh)                       |
| 11 | False     | False    | False     | False          | <= 0    | -       | sellIn -1           | max(0, quality -2)  | "Normal" (Expired)                     |
#+TBLFM: $7=1



### Requirements Conflicts

- Which quality comes first for camembert?
  	- Case 1: Camembert continues to increase in quality (until it 50) even after sellIn date reaches 0 (argument: cheese doesn't spoil)
  	- Case 2: Camembert decreases in quality after sellIn date reaches 0 (argument: consistency)
  	- Decision : go with case 1, requirements do not describe what to do

- Legendary Conjured Items?
  - Case 1: Legendary so no change in quality
  - Case 2: Spectral so decrease in quality (but by how much?)
  - Decision: go with case 1, more restrictive (Lex specialis). Legendary items are a more restrictive case than conjured items
