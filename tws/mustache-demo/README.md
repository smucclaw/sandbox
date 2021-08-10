# [Prototype] Form-Filling with Templates using Mustache Syntax

In this repo, we will look into templating for a wide variety of forms, including contracts in our context. We demonstrate a prototype for filling forms based on a template. We will use the mustache syntax to achieve that purpose.

## Objectives

- Define a common standardised format (e.g. `json` or `yaml`) to quickly fill forms, especially if we need to fill more than one form
- Automate the process of form filling, compared to the traditional opening and manual editing of a Word document
- Integrate with other existing tools developed at CCLAW, including L4

## Motivations

- Development of `l4meta`, where we can embed metadata into documents, can be expanded to "fill-in the blanks" in a contract
- Pre-prepared contracts (e.g. YC SAFE) have been developed for users to "fill-in the blanks". Benefits of templating include time and cost savings, especially when users can simply bypass the need for a lawyer when required to create contracts (as what CCLAW aspires to)
- Integrate with the computational law ecosystem
    - imagine a user writing L4 for a contract
    - the user writes a bunch of metadata according to the blanks predefined in the L4
    - the user writes the metadata into the program which automatically generates the English, fills in the blanks and outputs to a PDF for sharing
- Also see [this use case: generating a signable instance of a legal contract by parameterizing a template](https://github.com/smucclaw/dsl/tree/main/caseStudies/web-ui#use-case-3-generating-a-signable-instance-of-a-legal-contract-by-parameterizing-a-template)

## Use Case

TBC

## Proposed Workflow of the Program

- Prepare L4
- Prepare metadata according to predefined fields
- Generate English (or other language) from L4
- Write English into markdown, LaTeX or Word document
- Write metadata
- Convert into PDF, and at the same time write metadata

## Usage

```console
$ python mustache.py
```

## Considerations

- What level of control do our end users exactly want out of our intended program? Convert directly into a PDF, or convert first into a Word document or LaTeX and then into PDF?
- Competing programs:
    - `pandoc`: Convert between multiple textual formats - perhaps we only need to convert to markdown only?

## Next Steps and Further Work

- Support for output to multiple formats, including Word Document and PDF
- Direct formatting of contract in a LaTeX or Word Document after conversion to proper language
- Embed metadata in a document, which can then be extracted by other program (see `l4meta`)
