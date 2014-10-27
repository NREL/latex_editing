#Introduction
This is the repository for a LaTeX class file and example template document that can be used to produce LaTeX documents that conform to NREL's style guide. The file also includes instructions for converting the document into formats that can be read by WYSIWYG editors such as Microsoft Word.

#Requirements
1. A working installation of Latex 2014. This can be obtained from e.g. http://tug.org/texlive/ or https://tug.org/mactex/.
2. Some experience with using latex to produce journal articles or reports.
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
NREL staff should check on [The Source](http://thesource.nrel.gov/communications/templates.html) for current guidance on using LaTeX for NREL documents. NREL staff are strongly encouraged to check in with their communications rep before starting to use LaTeX for documents.

#Recent changes
10.8.2014 Added details of how to convert using `pandoc`.

7.31.2014 Added \frontmatter, \mainmatter, and \backmatter commands to customize numbering for all document classes (article, report). These are normally only available for the book class. Also updated the example template, and figured out how to add URLs to the bibliography.

#Code Maintainers
* [Andy Clifton](mailto:andrew.clifton@nrel.gov) (National Renewable Energy Laboratory)

#Project Contributors
* Andy Platt (National Renewable Energy Laboratory)
* Paul Fleming (National Renewable Energy Laboratory)
* Michael Lawson (National Renewable Energy Laboratory)
* Andrew Ning (National Renewable Energy Laboratory)
* Alexsandra Lemke (National Renewable Energy Laboratory)
