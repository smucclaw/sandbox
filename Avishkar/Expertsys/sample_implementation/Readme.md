## Introduction:
This folder contains some sample implemtations of the ASP expert system work done so far. 

### Installation instructions:
To run the filles you will need to install the CLORM Python ASP interface and the Clingo ASP. So far the only way I know how to do this is to first install Anaconda (https://docs.anaconda.com/anaconda/install/mac-os/) and then both these can be installed easily. Follow the instrctions here: https://github.com/potassco/clorm once you have installed anaconda it should take only 2 commands to install Clingo and Clorm. Once you have done the instllation, you should be able to run the top level python file as per normal.

### Project description:
There are 2 toy examples taken up here. Once is a set of rules that describes when a person associatied with a company must pay corporation tax, and the other is a simpler temporal example encoding the 'inertia law' ie. if an atom is true at time T, then it is true at time T+1. This temporal example serves to illustrate an important feature of the system which we shall describe later. 

For each example the user only needs to interact with and run, the top level python file called 'corp_tax_python.py' and 'temporal_python.py' respectively. The user first specifies some parameters in the python file such as a 'root query' and some numerical parameters and then runs it. The user then gets asked a sieries of questions relevant to the query and responds by editing the python file. Once the truth value of the query is established the Q and A process ends and if the query is true or if any rules have been overriden the relevant justification graph(s) will be produced (currently a list of directed edges) up to the depth specified in the parameters. 

If the query is not deemed to be true then the user gets a justification graph whose root node is the query itself and whose leaf nodes are user responses whose truth value has been 'flipped' to be the opposite of what the user inputed. Ie it tells the user how the query could have been made true by making as few changes to their initial responses as possible. Or put differently, it explains to the user why the query wasn't true based on their initial responses. More on this later.  

### Setting parameters in the python file:
In the 'corp_tax_python.py' file, on line 12, there is a list of strings called 'params'. In it we specify several parameters in the form over predicates. The 'min_q_level' parameter specifies the minimum depth that an atom should be at in the dependency graph of the root query to be allowed to be possibly asked as a question. The 'max_query_lvl' specifies the corresponding maximum depth. Next we have a parameter for the depth of the justification graph called 'max_graph_level'. 

Finally we have a root query specified in the form of a 'generate_q' predicate and an 'overrides' predicate that states that in our corporate tax example, rule b_2 overrides rule b_1. All these parameters are already entered in the current file but they can be changed by the user simply by editing the 'params' list. With the current parameters the whole system will run an interactive process to determine whether "mustPayCorpTax(gates,microsoft)" is true according to the rules in the 'corp_tax.l4' file. 

On line 6 of the python file, there is a user_inputs list which starts off empty and which the user adds to by responding to asked questions with a "user_input" response. We will describe a sample run of the whole thing next. 

### Sample run:
In our sample run, we will use the corporate tax example. The corresponding rule set can be found in the corp_tax.l4 file. In the python file, we have the main query that we want to answer which is written as 
'generate_q(mustPayCorpTax(gates,microsoft)'. The other parameters are pre set as can be seen in the 'params' list. The user_inputs list starts off empty. Upon running the python, we see 2 ask_user predicates in the output:

ask_user(highMarketShare(microsoft))
ask_user(majorityShareholder(gates,microsoft))

Now say it is true that microsoft has a high market share. Then we enter in the user inputs list the string "user_input(pos,highMarketShare(microsoft))." (Note that there must be a full stop after the predicate). Upon saving the file and running it again, the output this time will include just the single ask_user predicate 'ask_user(majorityShareholder(gates,microsoft)'. Now assume that Gates is indeed the majority shareholder of Microsoft. We will then add to the user inputs list the string "user_input(pos,highMarketShare(microsoft))." 

Now saving and running the file again, we will see in the output 'ask_user(madeLoss(microsoft))'. Now say that in this scenario, it is not true that microsoft has made a loss. We add the string 'user_input(neg,madeLoss(microsoft)).' Note we have changed the first argument of the predicate because this time the answer is no. Upon saving the file and running it, we see the output 'Query is legally true' and also we see a list of directed edges that form the justification graph up to the level specified in the parameters. 

We further see under the heading 'Deleted edges' a list of directed edges and under Changed responses, the predicate 'change(majorityShareHolder(microsoft)'. This information is essentially telling us that if we had said no to the question 'ask_user(majorityShareholder(microsoft)', then our initial query 'payCorpTax(gates,microsoft)' would have been false and the list of directed edges shows us the section of the justification graph for the initial query that would get deleted. This feature however is much more useful and intuitive when based on our responses, the initial query is deemed to be false and we want to know why this is the case.  


### Sample run 2: Negative justification
Let us consider a new scenario where we start off as before with an empty user input list but upon being asked the first question, we respond negatively. That is we add to the user inputs list the string 'user_input(neg,highMarketShare(microsoft)).'. 

Then the the Q and A process would end right there, we would get a message say 'Query not legally true' and under 'Added edges' we get the justification graph that would be formed had we answered in the affirmative to the questions about high market share and majority share holder. Furthermore, under 'Changed responses' we see 'change(highMarketShare(microsoft)' and 'change(majorityShareholder(gates,microsoft)'. Thus the 'Added edges' and 'Changed responses' can be seen as constituting an explanation for why our initial query isn't true.    

### Temporal Example


### Theoretical discussion


### Progress so far and to do list

