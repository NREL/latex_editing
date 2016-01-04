#Introduction
This directory contains LaTeX class files and an example template document that can be used to produce LaTeX "beamer" presentations that conform to NREL's style guide.

#Requirements
1. A working installation of Latex 2014 or 2015. This can be obtained from e.g. http://tug.org/texlive/ or https://tug.org/mactex/.
2. Some experience with using latex to produce presentations.
3. Basic understanding of how to use command line programs.

#Download
Click on the "Download ZIP" button on the lower right of this page. 

The following files are the important ones:
* LaTeX class file: https://github.com/NREL/latex_editing/blob/master/nrel.cls
* Bibliography style file: https://github.com/NREL/latex_editing/blob/master/nrel.bst
* Template .tex file: https://github.com/NREL/latex_editing/blob/master/intro_to_NREL_latex.tex
* Example .pdf file: https://github.com/NREL/latex_editing/blob/master/intro_to_NREL_latex.pdf

#Installing and using the latex class file
The nrel.cls and nrel.bst files should be installed either in your local latex tree or in the same directory as your .tex source files. 

Call the class using something like `\documentclass[draft,report]{nrel}` in your preamble. Options for the nrel class are discussed in the `intro_to_NREL_latex.pdf` document.

If the above instructions don't mean anything to you, you may wish to rethink your idea of using LaTeX to produce your document. This is not meant to be cheeky; these are fundamental operations and should be understood by most LaTeX users.

#Documentation
Documentation is provided in an example .pdf file which can be found at  https://github.com/NREL/latex_editing/blob/master/intro_to_NREL_latex.pdf. The 'tex source used to create that file may be useful as a template.

#Reporting issues and errors
Please use the issue-tracker at https://github.com/NREL/latex_editing/issues to report issues.

#Wiki
Please use the wiki at https://github.com/NREL/latex_editing/wiki as you feel fit. Useful examples may be rolled in to the template file over time.

#Instructions for NREL staff
NREL staff should check on [The Source](http://thesource.nrel.gov/communications/templates.html) for current guidance on using LaTeX for NREL documents.

Please also note that there is an NREL-hosted latex server which is the preferred tool for preparing NREL documents. Details will be provided at a later date. 

NREL staff are strongly encouraged to check in with their communications representatives before starting to use LaTeX for documents.

#Recent changes
01.04.2016 First commit of the presentation files.

#Code Maintainers
* [Dave Bielen](mailto:@nrel.gov) (National Renewable Energy Laboratory)

#Project Contributors
* Dave Bielen
