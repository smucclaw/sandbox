# Prototype: Form-Filling Using Mustache Template

This is a prototype for form-filling using mustache templates.

## Motivations

Since the start of my work at CCLAW, I have been motivated by the possibilities that could be utilised by the generated l4.

The original idea was to consider generating an output to LaTeX after processing the l4 into plain English. The LaTeX file can then be customised according to the use case (e.g. contracts, legislation), before it is then converted onward to a PDF.

More recently, we have been shown pre-prepared contracts using examples such as the YC SAFE, whereby users only need to simply fill in the blanks. We could possibly replace the blanks with moustache-like templates and then have another program automate the filling of the blanks.

This repository is to demonstrate the possibility of using mustache templates directly on textual documents. We will use a handful of markdown documents to illustrate.

## Usage

```console
$ python mustache.py
```

## Considerations

- What do our end users really want out of our intended program - do they want to write in `l4` and then have the `l4` directly convert into a PDF, or Word document? How about other formats such as LaTeX? Markdown? Org-Mode?
- There is already `pandoc` to help us convert between multiple textual formats such as markdown, html and Microsoft Word documents. Will we need such a separate application to help us convert between formats? If so, what should our program do?
