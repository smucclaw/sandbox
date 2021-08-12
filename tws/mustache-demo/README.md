# [Prototype] Form-Filling with Templates using Mustache Syntax

In this repo, we will look into templating for a wide variety of forms, including contracts in our context. We demonstrate a prototype for filling forms based on a template. We will use the mustache syntax to achieve that purpose.

## Motivations

- Development of `l4meta`
    - Currently we can embed metadata into documents
    - How about writing metadata inside the document itself?
    - Can be used to "fill-in the blanks" in a contract
- Time and Cost Savings
    - Pre-prepared contracts (e.g. YC SAFE) developed for convenience
    - Bypass the need for a lawyer when contracts are required to be drafted
- Integrate with the computational law ecosystem
    - Imagine a user writing L4 for a contract
    - User writes a bunch of metadata according to the predefined fields in the L4
    - User writes the metadata into the program which automatically generates the English, fills in the blanks and outputs to a PDF for sharing
- Also see [this use case: generating a signable instance of a legal contract by parameterizing a template](https://github.com/smucclaw/dsl/tree/main/caseStudies/web-ui#use-case-3-generating-a-signable-instance-of-a-legal-contract-by-parameterizing-a-template)

## Objectives

- Use open standard file formats (e.g. `json` or `yaml`) to quickly fill forms and contracts
- Automate and speed up the process of form filling, compared to the traditional opening and manual editing of a Word document
- Integrate with other existing tools developed at CCLAW

## Use Case

Preliminary, please propose as you think fit.

### L4 Developers
- Write metadata

### System
- Output to Selected Format

## Proposed Workflow of the Program

- Prepare L4
- Prepare metadata according to predefined fields in L4
- Program process and generate from both L4 and metadata any of the following outputs:
    - Plain text (e.g. markdown, LaTeX)
    - Word document
    - PDF with embedded metadata

Note that from plain text, we can convert them into a PDF, but it is likely they will not have embedded metadata, which is where `l4meta` comes in.

For the PDF with embedded metadata, we propose first converting into LaTeX, then to PDF.

## Usage

```console
$ python mustache.py [TEMPLATE] [DATA]
```

## Considerations

- What level of control do our end users exactly want out of our intended program? Convert directly into a PDF, or convert first into a Word document or LaTeX and then into PDF?
- Competing programs:
    - `pandoc`: Convert between multiple textual formats - perhaps we only need to convert to markdown only?
- Level of integration with existing work? Where inside L4 (starting with `baby-l4`)?
- Any other considerations

## Next Steps and Further Work

- Support for output to multiple formats
- Direct formatting of contract after output to proper language
- Embed metadata in a document, which can then be extracted by other program (see `l4meta`)
