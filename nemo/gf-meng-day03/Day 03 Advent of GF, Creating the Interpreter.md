## Creating the .hs file to, in this example, Parse

Note: "Expr" is the same as "Tree"

1. Run `stack ghci` (For local ghci) or `ghci` (For global ghci) to access ghci

We are going to use the 'parse' command, which needs the following:
`parse :: PGF -> Language -> Type -> String -> [Tree]`
So we need a PGF, a Language, a Type, and a String
`
2. `gr <- readPGF "Question2Answer.pgf"` Run the incantation, you can rename gr to whatever you want to save the file name into. readPGF is an IO action from haskell (See library API for more details)
	1. Can confirm this worked with `:t gr` to get its type, and it should give something like `gr:: PGF`
	2. `languages gr` tells you what languages are available for use in, say, the Parse command.

3. `eng = head $ languages gr` where '$' is the bracketing convention in Haskell, and head is the first item of the list. 'eng' is the variable binding.
	1. You can check that this works with `:t eng` and it gets `eng::Language`

4. To make things simpler, use the startCat command as follows: `cat = startCat gr` where it applies startCat to gr, so it returns a Type.

5. `question:_ = parse gr eng cat "Do you swear your loyalty , to me , upon this book ?"` 
	1. This is a variable binding. First, `parse gr eng cat "..."` is the input for the parse command which needs a PGF, a Language, a Type, and a String (as shown above) and outputs a Tree in list format.
		1. `:_`is a way of matching the head of the provided list, and the remainder of the list can be anything i.e. the first element of the list. This will output something of type Tree, not a Tree in list format.
			1. Colon is the list constructor
		
	It's unsafe here because it makes the assumption that the list is non-empty, butit works for our purposes. The below is the safer version of this command that actually provides an error message
			1. `question = parse gr eng cat "Do you swear your loyalty , to me , upon this book ?"`
			2. `getTree trees = case trees of { []  -> error "empthy list" ; tree:_ -> true}`

6. Can run `linearize gr eng question` for funsies

We use unApp, where unApp has type `Expr -> Maybe (CId, [Expr])`

7. `Just (f, args) = unApp question
	1. f = mkQuestion
	2. args = `[EApp (EApp (EFun mkPredicate) (EApp (EApp (EFun Loyalty) (EFun you)) (EFun I))) (EFun book)]`
	3. `showExpr [] tree`
		1. Output: "mkQuestion (mkPredicate (Loyalty you I) book)"

8. Run `functions gr` to see what functions are available
9. `answer = mkApp (mkCId "mkAnswer") args`

So now, `showExpr [] answer` gives `"mkAnswer (mkPredicate (Loyalty you I) book)"`, while `showExpr [] tree` gives `"mkQuestion (mkPredicate (Loyalty you I) book)"`

Now you can run cool thigns like

`linearize gr eng <$> [tree, answer]`

Now you can turn all these steps into a function in Main.hs and then make it a program so the user can put in input and get output

`ghci> question:_ = parse gr eng cat “Do you swear your loyalty , to me , upon this book , on oath ?”  

The steps below are repeated for each question, which you bind in step 5.

``` 
ghci> Just (f, args) = unApp question  
ghci> answer = mkApp (mkCId “mkAnswer”) args  
ghci> mapM_ putStrLn $ linearize gr eng <$> [question, answer]  
Do you swear your loyalty , to me , upon this book , on oath ?  
I hereby swear my loyalty , to you , upon this book , on oath .
```

Note that this doesn't accept custom phrases like "for the heck of it" added to the end of the sentence, because it's not part of the original parser, so it'll return an empty list. This is because it is not in the original gf grammar.

You can create a helpful error message like the following example, which is written after a successful input that outputs a tree.

```
ghci> foos = parse gr eng cat "Do you swear your loyalty , to me ?"
ghci> case foos of { f:_ -> doStuff f ; [] -> putStrLn "couldn't parse input, try again" }
imagine this is the transformed tree


ghci> foos = parse gr eng cat "Do you swear your loyalty , to me ? asdjksdf"
ghci> case foos of { f:_ -> doStuff f ; [] -> putStrLn "couldn't parse input, try again" }
couldn't parse input, try again