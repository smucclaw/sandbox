/* eslint-disable react/no-unescaped-entities */

import React, { useState } from 'react';

export const EssayContent1: React.FC = () => {
  return (<div>
    <h1>Our World In Black And White</h1>

    <p>Perhaps unfairly, it used to be said that "primitive tribes"
      knew few numbers: one, two, three, and many. In this chapter
      we go even coarser: we shall have zero, and everything else.</p>

    <p>They say computers are made of ones and zeros? Fine: One is
      one. Two is one. Three is one. Sixteen billion and forty-two?
      Also one.</p>

    <p>Zero is zero.</p>

    <p>Why choose a black and white world? For the same reason photographers do. Samuel Johnson said: "when a man knows he is to be hanged in a fortnight, it concentrates his mind wonderfully." Reducing everything to binary, likewise.</p>

    <p>Take arithmetic. Real addition and multiplication are complicated: we have to carry the one, we have to memorize our times tables, at least up to twelve. I personally never got the hang of thirteens: I lost concentration. With ones and zeroes, everything is simple: one plus two plus three is one: the sum. One times two times three is one: the product.</p>

    <p>Anything times zero is zero. Anything plus one is one. The simplicity is delightful.</p>

    <p>Now for the trick: we can use numbers to stand for truth.</p>

    <p>Lawyers are used to finding truth in words. In this chapter, we find truth in numbers.</p>

    <p>We assign "one" to mean "true". We take "zero" to mean "false". And that's enough for the trick!</p>

    <p>This trick is valuable for a number of reasons, not least of which is that I don't know how to type &wedge; and &or; on my keyboard. Those symbols stand for "logical and" and "logical or" respectively. I have to look them up every time, and I never remember which way they point. We use &not; to mean "not".</p>

    <p>Instead of those funny symbols, let's use addition to represent "or". We use multiplication to represent "and".</p>

    <p>Mathematicians use + and &times; to calculate numerical values. Logicians use + and &times; to calculate truth and falsity. Time for an example:</p>

    <p>Parking is free on a Sunday or a public holiday: <em>Sunday</em> &or; <em>Holiday</em></p>.

    <p>Now we query: is parking free today?</p>

    <p>We say "or", and write "+":</p>

    <p>Free Parking = Sunday + Holiday</p>

    <p>Suppose today is a Sunday. It's not a public holiday. We plug numbers in to the variables: <em>Sunday = 1</em>; <em>Holiday = 0</em>.</p>

    <p>Free Parking = 1 + 0</p>

    <p>Free Parking = 1</p>

    <p>And that allows us to conclude, yea, we can park for free.</p>

    <p>That is a legal rule, in miniature. The simplest possible rule, really. Calculated using logic.</p>

    <p>Shall we try multiplication? That would be productive.</p>

    <p>Parking is free if it is a Sunday, or a public holiday, or after 8pm on a Saturday.</p>

    <p>Free Parking = Sunday + Holiday + (AfterEight &times; Saturday)</p>

    <p>Read the plus sign as "or"; read &times; as "and".</p>

    <p>What do the parenthesis do? They group, exactly as they do in ordinary arithmetic algebra.</p>

    <p>The idea "after 8pm on a Saturday" is compound. To be explicit we use parentheses, though by the usual rules they are redundant, because &times; "binds tighter" than +.</p>

    <p>We consider the atomic elements individually: Is it after 8pm? Is it a Saturday? If both are true -- <em>AfterEight &times; Saturday = 1</em> -- then we don't even have to consider the rest of the formula -- anything plus one gives one: <em>_ + _ + 1 = 1</em></p>

    <p>So anyway, you have now learned Boolean algebra, the foundation of all computer science. The basics, at least. Truth is number, and number truth. With ones and zeros and pluses and times, we can do a lot. With &not; for "not", we can do it all.</p>

    <h1>Visualization: Thinking in pictures</h1>

    <svg xmlns="http://www.w3.org/2000/svg" height="121" width="271" version="1.11.1"><rect transform="translate(24 0)translate(0 10)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="156" className="textbox" stroke="none" /><text transform="translate(24 0)translate(0 10)translate(22 -10)translate(23 23)" x="78" y="22" fill="white" dominant-baseline="central" text-anchor="middle">Sunday</text><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_in" d="M -22,32 C 0,32 -22,32 24 32" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_out" d="M 226,32 C 204,32 226,32 180 32" stroke="darkgrey" /><rect transform="translate(0 0)translate(0 64)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="204" class="textbox" stroke="none" /><text transform="translate(0 0)translate(0 64)translate(22 -10)translate(23 23)" x="102" y="22" fill="white" dominant-baseline="central" text-anchor="middle">Public Holiday</text><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_in" d="M -22,32 C 0,32 -22,86 0 86" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_out" d="M 226,32 C 204,32 226,86 204 86" stroke="darkgrey" /></svg>

    <p>Or maybe some people are just visual thinkers...</p>

    <p>Can we draw the formula? No parentheses, no * and &times; and + ... just black lines on a white background.</p>

    <svg xmlns="http://www.w3.org/2000/svg" height="175" width="469" version="1.11.1"><rect transform="translate(123 0)translate(0 10)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="156" className="textbox" stroke="none" /><text transform="translate(123 0)translate(0 10)translate(22 -10)translate(23 23)" x="78" y="22" fill="white" dominant-baseline="central" text-anchor="middle">Sunday</text><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_in" d="M -22,32 C 0,32 -22,32 123 32" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_out" d="M 424,32 C 402,32 424,32 279 32" stroke="darkgrey" /><rect transform="translate(99 0)translate(0 64)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="204" class="textbox" stroke="none" /><text transform="translate(99 0)translate(0 64)translate(22 -10)translate(23 23)" x="102" y="22" fill="white" dominant-baseline="central" text-anchor="middle">Public Holiday</text><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_in" d="M -22,32 C 0,32 -22,86 99 86" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_out" d="M 424,32 C 402,32 424,86 303 86" stroke="darkgrey" /><rect transform="translate(22 0)translate(0 0)translate(0 118)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="168" class="textbox" stroke="none" /><text transform="translate(22 0)translate(0 0)translate(0 118)translate(22 -10)translate(23 23)" x="84" y="22" fill="white" dominant-baseline="central" text-anchor="middle">Saturday</text><rect transform="translate(178 0)translate(22 0)translate(0 0)translate(0 118)translate(22 -10)translate(23 23)" x="0" y="0" fill="darkgrey" height="44" width="180" class="textbox" stroke="none" /><text transform="translate(178 0)translate(22 0)translate(0 0)translate(0 118)translate(22 -10)translate(23 23)" x="90" y="22" fill="white" dominant-baseline="central" text-anchor="middle">AfterEight</text><path transform="translate(22 0)translate(0 0)translate(0 118)translate(22 -10)translate(23 23)" fill="none" class="h_connector" d="M 168,22 c 5,0 5,0 10 0" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_in" d="M -22,32 C 0,32 -22,140 22 140" stroke="darkgrey" /><path transform="translate(22 -10)translate(23 23)" fill="none" class="v_connector_out" d="M 424,32 C 402,32 424,140 380 140" stroke="darkgrey" /></svg>


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

    <p>The idea of a well-formed expression.</p>

    <p>We can do things with them.</p>

    <p>Database normalization.</p>

    <p>Boolean minimization.</p>

    <p>Words mean things.</p>


    <h1>Expansion and Substitution</h1>

    <p>Reading things together.</p>

    <h1>Truth Tables</h1>

    <h1>Automated Reasoning, SAT Solving, and Boolean Minimization</h1>

    <p>Alpha Mind</p>

    <p>Don't Care variables</p>

    <p>Poh Yuan Nie v Public Prosecutor [2022] SGCA 74</p>

    <h1>Rule Against Surplusage / Presumption Against Superfluity</h1>

    <p>
      •	Definition: This legal principle asserts that every word, phrase, or clause in a statute should be given effect, and no part should be rendered redundant or meaningless. The presumption is that the legislature does not include unnecessary language, so each part of the statute should contribute to its overall meaning.
      •	Application in Your Case:
      •	If expanding the B-group to include  C  leads to a contradiction, then this could render the B-group effectively meaningless or “superfluous.”
      •	The presumption against superfluity would suggest that the legislature did not intend for the B-group to be interpreted in a way that nullifies it entirely. Therefore, the statute should be interpreted in a way that gives effect to both the A-group and B-group, avoiding any interpretation that would introduce redundancy or meaningless terms.

      Logical and Legal Alignment

      The rule against surplusage is akin to the logical process of avoiding redundancy in Boolean expressions. In Boolean logic, you simplify expressions to avoid unnecessary terms that don’t affect the outcome, just as in legal interpretation, you avoid interpretations that make parts of the statute redundant.

      In your case, if expanding the B-group leads to a logical contradiction (i.e., it would always be false), applying the rule against surplusage would support the argument that such an interpretation should be avoided. The statute should be read in a way that maintains the functionality of the B-group, which might mean not expanding it to include  C  if that results in the group becoming superfluous.

      Conclusion

      The legal rule against surplusage or the presumption against superfluity is a powerful tool in statutory interpretation that aligns with the logical principles you’re studying. It helps ensure that all parts of a statute are meaningful and effective, much like how Boolean minimization ensures that all terms in an expression contribute to its final value.
    </p>

    <h1>Tautology Detection with Espresso</h1>

    <h1>Colophon</h1>

    <p>In the 4th century B.C., Alexander the Great invaded India, encountered the gymnosophists, and was referred to Dandamis, with whom he spoke, under the shade of a great tree, on the contrasts between Western and Eastern philosophy (<a href="https://www.ted.com/talks/devdutt_pattanaik_east_vs_west_the_myths_that_mystify?subtitle=en">2009</a>).</p>

    <p>In the 21st century A.D., at another crossroads between East and West, a different Alexander Josephus encountered a technosophist. Their colloquy contrasted the philosophies of law and computer science. A version of that discussion is represented here.</p>


  </div>
  )
}
