# Drools Sandbox for the Financial Advisor usecase

For reference: see 
- George Luger: Artificial Intelligence, 6th edition, Section 2.4: A logic-based financial adivsor


### FILES

##### com.sample

<b>nonParametric.drl</b>
- fully complete drools file with all required information needed to run in Drools
- corresponds to the version of the financial_advisor.l4 file
- meant to be non-parameterised to persons, i.e. a single Drools session with this set of rules corresponds to storing and querying data regarding a single, non-explicit person


<b>parametric.drl</b>
- fully complete drools file with all required information needed to run in Drools
- corresponds to the version of the financial_advisor_parametric.l4 file
- parametrized by the class Person, can contain multiple facts about multiple persons in a single session

<b>l4_target.drl</b>
- not fully complete
- meant as intermediate milestone/file to diff against for l4 output

<b>l4_out.drl</b>
- not fully complete
- stores the current l4 output when running `l4 expsys rules filename`

<b>cwu.drl</b>
- not fully complete
- exploratory representation of drools output from l4
- differs from parametric.drl & nonParametric.drl in how classDecls are transformed
- On hold until we concretely know what L4 classes need to do, and correspondingly look like



### SETUP

You'll need to install the Eclipse IDE, and the corresponding "Red Hat CodeReady Studio" plugin from the Eclipse marketplace.


### Running

- Modify the kmodule.xml file with the approporiate module name to be executed.
- You'll also need to modify the "query block" within the main java file (see ![here](https://docs.drools.org/7.63.0.Final/drools-docs/html_single/index.html#drl-queries-con_drl-rules))
