const EssayContent1 = () => {
  return (
    <div>
      <h1>Our World In Black And White</h1>
      
      <p>Fairly or not, it used to be said that "primitive tribes"
        knew few numbers: one, two, three, and many. In this chapter
        we go even coarser: we have zero, and everything else. They
        say computers are made of eroes and ones? Fine: One is one.
        Two is one. Three is one. Sixteen billion and forty-two? Also
        one.</p>

        <p>Zero is zero.</p>

        <p>Why choose a black and white world? For the same reason photographers do. Samuel Johnson said: "when a man knows he is to be hanged in a fortnight, it concentrates his mind wonderfully." Reducing everything to binary, likewise.</p>

        <p>Take arithmetic. Real addition and multiplication are complicated: we have to carry the one, we have to memorize our times tables, at least up to twelve. I personally never got the hang of thirteens: I lost concentration. With ones and zeroes, everything is simple: one plus two plus three is one: the sum. One times two times three is one: the product.</p>
        
      <p>Anything times zero is zero. Anything plus one is one.</p>

      <p>Now for the trick: we can use numbers to stand for truth.</p>

        <p>Lawyers are used to finding truth in words. In this chapter, we find truth in numbers.</p>

        <p>We assign "one" to mean "true". We take "zero" to mean "false". And that's enough for the trick!</p>

        <p>This trick is valuable for a number of reasons, not least of which is that I don't know how to type &wedge; and &or; on my keyboard. Those symbols stand for "logical and" and "logical or" respectively. I have to look them up every time, and I never remember which way they point. We use &not; to mean "not".</p>

        <p>Instead of those funny symbols, let's use addition to represent "or". We use multiplication to represent "and".</p>

        <p>Mathematicians use these symbols to calculate numerical values. Logicians use these symbols to calculate truth and falsity. Time for an example:</p>
          
        <p>Parking is free if it is a Sunday, or a public holiday: <em>Sunday</em> &or; <em>Holiday</em></p>.

	<p>Now we query: is it <em>true</em> that parking is free today?</p>
	
        <p>We say "or", and write "+":</p>

        <p>Free Parking = Sunday + Holiday</p>

        <p>Suppose today is a Sunday. It's not a public holiday. We plug numbers in to the variables: <em>Sunday = 1</em>; <em>Holiday = 0</em>.</p>

        <p>Free Parking = 1 + 0</p>

        <p>Free Parking = 1</p>

        <p>And that allows us to conclude, yea, we can park for free.</p>

        <p>That is a legal rule, in miniature. The simplest possible rule, really. Calculated using logic.</p>

        <p>Shall we try multiplication? That would be productive.</p>

        <p>Parking is free if it is a Sunday, or a public holiday, or after 8pm on a Saturday.</p>

        <p>Free Parking = Sunday + Holiday + (AfterEight * Saturday)</p>

        <p>You may prefer to write multiplication this way:</p>

        <p>Free Parking = Sunday + Holiday + (AfterEight &times; Saturday)</p>

        <p>Read the plus sign as "or"; read &times; as "and".</p>

        <p>What do the parenthesis do? They group, exactly as they do in ordinary arithmetic algebra.</p>

        <p>The idea "after 8pm on a Saturday" is compound. To be explicit we use parentheses, though by the usual rules they are redundant, because &times; "binds tighter" than +.</p>

        <p>We consider the atomic elements individually: Is it after 8pm? Is it a Saturday? If both are true -- <em>AfterEight &times; Saturday = 1</em> -- then we don't even have to consider the rest of the formula, because we know that anything plus one gives one: <em>_ + _ + 1 = 1</em></p>

        <p>So anyway, you now know Boolean algebra, the foundation of all computer science. The basics, at least. Truth is number, and number truth: isn't it beautiful? With ones and zeros and pluses and times, we can do a lot. With &not; for "not", we can do it all.</p>

<h1>Visualization: Thinking in pictures</h1>

      <p>Reading algebraic formulas can get tiring, especially if they
      run long. Many people have soured on math, from classroom
      skirmishes with poorly taught algebra.</p>

      <p>Or maybe some people are just visual thinkers...</p>

      <p>Can we draw the formula? No parentheses, no * and &times; and + ... just black lines on a white background.</p>

      


<h1>Legalese: Thinking in words</h1>

Expressions. Conjunctions. Disjunctions.

<h1>Algebra: Thinking in symbols</h1>

      <p>Every Boolean formula can be expressed as a picture. Every picture can be expressed as a formula. They are <em>isomorphic</em>.</p>

      <p>What else could be isomorphic to formulas and pictures?</p>

      <p>Law.</p>

      <p>If we could somehow wrangle the law to fit into a Boolean
      logic, we can do very interesting things. We can make
      predictions. We can predict whether a judge will buy an
      argument, or send someone to jail.</p>

      <p>How might we translate a wodge of legal writing into the algebras and pictures above?</p>
      
<h1>415 Cheating</h1>



<h1>Expressions</h1>



<h1>Canonicalization and Normalization</h1>

The idea of a well-formed expression.

We can do things with them.

Database normalization.

Boolean minimization.

Words mean things.


<h1>Expansion and Substitution</h1>

Reading things together.

<h1>Truth Tables</h1>

<h1>Automated Reasoning, SAT Solving, and Boolean Minimization</h1>

Alpha Mind



Don't Care variables

Poh Yuan Nie v Public Prosecutor [2022] SGCA 74

<h1>Rule Against Surplusage / Presumption Against Superfluity</h1>

	•	Definition: This legal principle asserts that every word, phrase, or clause in a statute should be given effect, and no part should be rendered redundant or meaningless. The presumption is that the legislature does not include unnecessary language, so each part of the statute should contribute to its overall meaning.
	•	Application in Your Case:
	•	If expanding the B-group to include  C  leads to a contradiction, then this could render the B-group effectively meaningless or “superfluous.”
	•	The presumption against superfluity would suggest that the legislature did not intend for the B-group to be interpreted in a way that nullifies it entirely. Therefore, the statute should be interpreted in a way that gives effect to both the A-group and B-group, avoiding any interpretation that would introduce redundancy or meaningless terms.

Logical and Legal Alignment

The rule against surplusage is akin to the logical process of avoiding redundancy in Boolean expressions. In Boolean logic, you simplify expressions to avoid unnecessary terms that don’t affect the outcome, just as in legal interpretation, you avoid interpretations that make parts of the statute redundant.

In your case, if expanding the B-group leads to a logical contradiction (i.e., it would always be false), applying the rule against surplusage would support the argument that such an interpretation should be avoided. The statute should be read in a way that maintains the functionality of the B-group, which might mean not expanding it to include  C  if that results in the group becoming superfluous.

Conclusion

The legal rule against surplusage or the presumption against superfluity is a powerful tool in statutory interpretation that aligns with the logical principles you’re studying. It helps ensure that all parts of a statute are meaningful and effective, much like how Boolean minimization ensures that all terms in an expression contribute to its final value.

<h1>Tautology Detection with Espresso</h1>


    </div>
  )
}
