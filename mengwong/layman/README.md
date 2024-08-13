## The Prompt

Let's build a single-page app in React. In the navbar on the left, the end-user can create, view, select, modify, and delete individual documents, which are managed by react state. The titles of these documents are shown in a list, and a kebab menu for each document allows renaming and deletion of the document. The navbar also links to a Help route. The contents of the documents are shown in the right hand pane.

Each document is rendered and modified as a React page. At the top of the document pane, we display the title, followed by a textarea containing a JSON object, representing a tree structure, where the nodes can be labeled as "all", "any", "element", and "plain". Each node carries metadata: `value` is true/false; and `show` is expanded/collapsed. Leaf nodes are always either `element` or `plain` and do not contain children. Parent nodes are always either `all` (representing conjunction), `any` (representing disjunction), or `plain`, allowing child nodes which are composed conjunctively.

The JSON tree is rendered, with the help of business logic, further down the page. The first render is a visualization of the object as an interactive tree, with the help of a standard visualization library. Initially, each parent node in the tree is marked as "collapsed", and each leaf is false. When a parent node is clicked, its state toggles between expanded and collapsed. When a leaf element node is clicked, its state toggles between true and false. When a leaf plain node is clicked, nothing happens.

The second render is a visualization of the object as a list of sentences. The sentences are generated as iterations through the disjunctions of the tree: for example, given the tree

```
{ "sub": [ { "any": [ { "element": "alice" } { "element": "bob" } ],
             "state": "collapsed" }
           { "plain": "loves" },
           { "any": [ { "element": "carol" } { "element": "dave" } ],
             "state": "expanded" }
         ]
}
```

The second render generates the following sentences:
```
- (alice or bob) loves carol
- (alice or bob) loves dave
```

If the alice,bob elements were in expanded state, there would be four sentences.

Buttons at the top of the document pane offer the options to "expand all" and "collapse all".