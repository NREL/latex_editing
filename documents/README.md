# Introduction
This directory contains a LaTeX class file and example template document that can be used to produce LaTeX documents that conform to NREL's style guide. 

# Requirements
1. A working installation of Latex 2014 or 2015. This can be obtained from e.g. http://tug.org/texlive/ or https://tug.org/mactex/.
2. Some experience with using latex to produce journal articles or reports.
3. Basic understanding of how to use command line programs.

# Download
Click on the "Download ZIP" button on the lower right of this page. 

The following files are the important ones:
* LaTeX class file: each document style (article, report, one-pager) has it's own directory and associated class file (.cls) which defines the style
* Bibliography style file: there's a .bst file in each directory which should be basically the same in each case. This is important if you are using bibtex instead of biblatex. If you are just using the normal class file, this won't make any difference to you.
* Template .tex file: every directory includes a demonstration of the class file in use.
* Example .pdf file: every directory includes a PDF produced from the demonstration .tex file.

# Installing and using the latex class file
The `NREL*.cls` and `nrel.bst` files should be installed either in your local latex tree or in the same directory as your .tex source files. 

Call the class using something like `\documentclass[draft]{NRELreport}` in your preamble. Options for the nrel class are discussed in the `NRELreport.pdf` and `NRELarticle.pdf` documents.

If the above instructions don't mean anything to you, you may wish to rethink your idea of using LaTeX to produce your document. This is not meant to be cheeky; these are fundamental operations and should be understood by most LaTeX users.

# Documentation
Documentation is provided in an example .pdf file which can be found in each directory. The 'tex source used to create that file may be useful as a template.

#Reporting issues and errors
Please use the issue-tracker at https://github.com/NREL/latex_editing/issues to report issues.

# Wiki
Please use the wiki at https://github.com/NREL/latex_editing/wiki as you feel fit. Useful examples may be rolled in to the template file over time.

# Instructions for NREL staff
NREL staff should check on [The Source](http://thesource.nrel.gov/communications/templates.html) for current guidance on using LaTeX for NREL documents.

Please also note that there is an NREL-hosted latex server which is the preferred tool for preparing NREL documents. Details will be provided at a later date. 

NREL staff are strongly encouraged to check in with their communications representatives before starting to use LaTeX for documents.

# Recent changes
4.10.17 Switch to class files for each major document class

# Code Maintainers
* [Andy Clifton](mailto:andrew.clifton@nrel.gov) (National Renewable Energy Laboratory)

# Project Contributors
* Andy Platt (National Renewable Energy Laboratory)
* Paul Fleming (National Renewable Energy Laboratory)
* Michael Lawson (National Renewable Energy Laboratory)
* Andrew Ning (National Renewable Energy Laboratory)
* Alexsandra Lemke (National Renewable Energy Laboratory)
