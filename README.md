# Introduction
This is the repository for LaTeX class files and template documents that can be used to produce articles, reports, and presentations that conform to NREL's style guide. 

# Requirements
Either:
1. A working installation of Latex 2021 or 2022. This can be obtained from e.g. http://tug.org/texlive/ or https://tug.org/mactex/.
2. Access to the NREL sharelatex.nrel.gov server

And...
1. Some experience with using latex to produce journal articles or reports.
2. Basic understanding of how to use command line programs.

# Download
Click on the "Download ZIP" button on the lower right of this page. 

The following files are the important ones:
* LaTeX class file: each document style (article, report, one-pager) has it's own directory and associated class file (.cls) which defines the style
* Bibliography style file: there's a .bst file in each directory which should be basically the same in each case. This is important if you are using bibtex instead of biblatex. If you are just using the normal class file, this won't make any difference to you.
* Template .tex file: every directory includes a demonstration of the class file in use.
* Example .pdf file: every directory includes a PDF produced from the demonstration .tex file.

# Installing and using the latex class file
The `NREL*.cls` and `nrel.bst` files should be installed either in your local latex tree or in the same directory as your .tex source files. 

Call the class using something like `\documentclass[draft]{NRELreport}` in your preamble. Options for the nrel class are discussed in the `NRELreport.pdf` and `NRELarticle.pdf` documents. Other classes include `NRELarticle` and `NRELbeamer`.

If the above instructions don't mean anything to you, you may wish to rethink your idea of using LaTeX to produce your document. This is not meant to be cheeky; these are fundamental operations and should be understood by most LaTeX users.

# Documentation
Documentation is provided in an example .pdf file which can be found in each directory. The 'tex source used to create that file may be useful as a template.

# Reporting issues and errors
Please use the issue-tracker at https://github.com/NREL/latex_editing/issues to report issues.

# Wiki
Please use the wiki at https://github.com/NREL/latex_editing/wiki as you feel fit. Useful examples may be rolled in to the template file over time.

# Instructions for NREL staff
NREL staff should check on [The Source](https://thesource.nrel.gov/publishing/write-latex.html) for current guidance on using LaTeX for NREL documents.

Please also note that there is an NREL-hosted latex server which is the preferred tool for preparing NREL documents. 
An enterprise overleaf server is available to NREL employees (https://sharelatex.nrel.gov/). External collaborators can be added to specific projects with approval.
NREL communications staff also support the publications process through the overleaf server directly!
# Recent changes
4.10.17 Switch to class files for each major document class
2.22.22 Major updates to Report class.
# Code Maintainers
* [Nicholas Hamilton](mailto:nicholas.hamilton@nrel.gov) (National Renewable Energy Laboratory)
<!-- * [Dave Bielen]() (National Renewable Energy Laboratory) -->
# Project Contributors
* Nicholas Hamilton (National Renewable Energy Laboratory)
* Chioke Harris (National Renewable Energy Laboratory)
* Andy Platt (National Renewable Energy Laboratory)
* Paul Fleming (National Renewable Energy Laboratory)
* Michael Lawson (National Renewable Energy Laboratory)
* Alexsandra Lemke (National Renewable Energy Laboratory)
