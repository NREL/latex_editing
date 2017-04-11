% File: nrel.cls v1.0
% This class file provides basic functionality for producing
% PDFs that meet NREL's style and formatting requirements.

% -------------------------------------------------------------
% Identification Part
% -------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NRELarticle}
\typeout{ }
\typeout{NRELarticle.cls -- v1.0, Last Updated March 16, 2017}
\typeout{Formats articles according to the NREL style guide}
\typeout{ }

% -------------------------------------------------------------
% Create Options
% -------------------------------------------------------------
% PDF properties
\pdfinterwordspaceon
%\pdfminorversion=8
\RequirePackage{pdf14}

\RequirePackage{xifthen}

% Mark as draft
\newboolean{IsDraft}
\setboolean{IsDraft}{false}

% print links in black
\newboolean{blacklinks}
\setboolean{blacklinks}{true}

% tagged?
\newboolean{IsTagged}
\setboolean{IsTagged}{false}

% -------------------------------------------------------------
% Check for choice of package and formatting options
% -------------------------------------------------------------

% look out for draft
\DeclareOption{draft}{
	\setboolean{IsDraft}{true}
	\typeout{Formatting as draft}
	}
\DeclareOption{tagged}{
	\setboolean{IsTagged}{true}
	\typeout{PDF will be tagged}
	}

% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass{article}

% -------------------------------------------------------------
% Package Loading
% -------------------------------------------------------------
% NAG: check for outdated packages
\RequirePackage[l2tabu, orthodox]{nag}

% GEOMETRY: set page size
\RequirePackage[head=0.125in,top=0.9in,bottom=1in,inner=1in,outer=1in]{geometry}

% MATHPTMX Times for roman text and math (family ptm)
\RequirePackage{mathptmx}

% Helvetica for sans serif (family phv)
\RequirePackage[scaled=0.83]{helvet}

% Courier for typewriter font (family pcr)
\RequirePackage{courier}

% ams math
\RequirePackage{amsfonts,amssymb,amsmath}

% gensymb. Required for degrees symbol
\RequirePackage{textcomp}
\RequirePackage{gensymb}

% better tables
\RequirePackage{booktabs}

% For including figures, ignoring the draft status
\RequirePackage[final]{graphicx}

% use fonts of type T1
\RequirePackage[T1]{fontenc}

% colours
\RequirePackage{color}
\RequirePackage{xcolor}
\definecolor{nrelblue}{RGB}{0, 121, 193}

% set languages
\RequirePackage[american]{babel}

% To stop hyphenation in titles etc
\RequirePackage{hyphenat}

% spacing
\RequirePackage{setspace}
\RequirePackage{parskip}

% to-do notes
\RequirePackage{todonotes}

% code listings
\RequirePackage{listings}

% For formatting the bibliography. See guidance 
\RequirePackage[babel]{csquotes}
\RequirePackage[style=chicago-authordate,strict,backend=bibtex,%
natbib=true,bibencoding=inputenc,sorting=nyt,doi=true, maxbibnames = 10, maxcitenames = 3 ]{biblatex}
% change the name of the bib (see http://tex.stackexchange.com/questions/82993/how-to-change-the-name-of-document-elements-like-figure-contents-bibliogr)
\DefineBibliographyStrings{american}{%
	bibliography = {References},
}
% see NREL formatting guidelines at https://communications_resources.nrel.gov/style_guide/references
% technical reports
\DeclareBibliographyAlias{techreport}{book}
% make one type of publication look like another
\DeclareBibliographyAlias{*}{misc} % map unknown bibliography entry types to the misc type

% make sure URLs in the bibliography are shown in roman fonts
\urlstyle{same}

% etoolbox (for \AfterEndPreamble}
\RequirePackage{etoolbox}

% --------------
% Main Code
% --------------

% NREL default is ragged right.
% Load ragged2e so \justifying and environment justify are available.
% Redefines \centering, \raggedleft, and \raggedright, and environments center flushleft and flushright to use versions made by ragged2e. Sets default alignment to ragged right. To override, use the command \justifying or the environment justify.
\RequirePackage[newcommands,document]{ragged2e}

%This changes parindent to 0
\setlength{\RaggedRightRightskip}{0pt plus 3em}

% -------------------------------------------
% Changes to TOC and list of figures/tables
% -------------------------------------------

% improved table of contents and list of figures/tables
\RequirePackage{tocloft}

% remove numbering on bibliography but still allow in TOC
\RequirePackage[nottoc, notlot, notlof]{tocbibind}

% add Figure before # and a period after
\renewcommand{\cftfigfont}{\fontfamily{phv} Figure }
\renewcommand{\cfttabfont}{\fontfamily{phv} Table }
\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cfttabaftersnum}{.}

% fix title font
\renewcommand{\cfttoctitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}
\renewcommand{\cftloftitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}
\renewcommand{\cftlottitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}

% add dotfill in toc
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% remove indentation
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

% don't add extra spaces in list of figures between chapters
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}
\setlength{\cftbeforefigskip}{5pt}
\setlength{\cftbeforetabskip}{5pt}
\setlength{\cftaftertoctitleskip}{\baselineskip}
\setlength{\cftafterloftitleskip}{\baselineskip}
\setlength{\cftafterlottitleskip}{\baselineskip}

% add front matter etc
\newcommand{\frontmatter}{\textbf{Error defining front matter!}}
\newcommand{\mainmatter}{\textbf{Error defining main matter!}}
\newcommand{\backmatter}{\textbf{Error defining back matter!}}

% -------------------------------------------
% Changes to the section markings
% -------------------------------------------
% Assign numbers to headings chapter through subparagraph
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

% Section Headings
\renewcommand{\section}{%
	\@startsection{section}{1}{\z@}
	{-3.25ex \@plus -1ex \@minus -.2ex}
	{0.25ex \@plus .2ex}
	{\color{nrelblue}\fontfamily{phv}\fontsize{12}{14}\fontseries{b}\selectfont}}
\renewcommand{\subsection}{%
	\@startsection{subsection}{2}{\z@}
	{-3.25ex \@plus -1ex \@minus -.2ex}
	{0.25ex \@plus .2ex}
	{\color{nrelblue}\sffamily\normalsize\bfseries\slshape}}
\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{\z@}
	{-3.25ex \@plus -1ex \@minus -.2ex}
	{0.25ex \@plus .2ex}
	{\color{nrelblue}\sffamily\normalsize\itshape}}
\renewcommand{\paragraph}{%
	\@startsection{paragraph}{4}{\z@}
	{-3.25ex \@plus -1ex \@minus -.2ex}
	{0.25ex \@plus .2ex}
	{\bfseries\normalsize}}
\renewcommand{\subparagraph}{%
	\@startsection{subparagraph}{5}{\z@}
	{-3.25ex \@plus -1ex \@minus -.2ex}
	{0.25ex \@plus .2ex}
	{\bfseries\normalsize\itshape}}

% inherit fonts etc from TOC
\let\printlottitle\printtoctitle
\let\printloftitle\printtoctitle

% Format Captions
% see e.g. http://www.peteryu.ca/tutorials/publishing/latex_captions for details of how to adjust
\RequirePackage[format=plain,
	labelformat=simple,
	font={small,sf,bf},
	labelfont={small,sf,bf},
	textfont={small,sf,bf},
	indention=0cm,
	labelsep=period,
	justification=centering,
	singlelinecheck=true,
	tableposition=top,
	figureposition=bottom]{caption}
\RequirePackage{subcaption}

% number figures and tables continuously across chapters
\RequirePackage{chngcntr}
\counterwithout{figure}{section}
\counterwithout{table}{section}	

% deal with the appendix
\renewcommand\appendix{\par 
	\setcounter{section}{0} 
	\setcounter{footnote}{0} 
	\gdef\thesection{\@Alph\c@section}
	% counters should reset each section
	\counterwithin{figure}{section}
	\counterwithin{table}{section}
	% footnote formatting
	 \renewcommand*{\thefootnote}{\fnsymbol{footnote}}}
		
% Note that if we use the front matter / main matter, we have to change numbers
% need to renew the front, main, and back matter commands
\renewcommand{\frontmatter}{%
	\pagenumbering{roman} %
	\setcounter{page}{3} %
	\setcounter{figure}{0} %
	\renewcommand{\thefigure}{\Alph{figure}} %
	\setcounter{table}{0} %
	\renewcommand{\thetable}{\Alph{table}}}
\renewcommand{\mainmatter}{%
	\clearpage %
	\pagenumbering{arabic} %
	\setcounter{figure}{0} %
	\renewcommand{\thefigure}{\arabic{figure}} %
	\setcounter{table}{0} %
	\renewcommand{\thetable}{\arabic{table}}}
\renewcommand{\backmatter}{}

% check that the default san-serif font is sort-of-arial	(required for tables)					
\renewcommand{\sfdefault}{phv} % Arial

% Indenting and spacing between paragraphs
\setlength{\parindent}{0pt}

%-----------------------
% GENERAL CODE
%-----------------------
% Require at least 3 characters before a hyphenation.
\lefthyphenmin=3

% Don't hyphenate the months (or any proper noun---other proper nouns must be addressed in the tex file
\hyphenation{January February April July August September October December Department Energy National Renewable Laboratory Washington Colorado Standard}

% Enumerate list environment -- change the default numbering to match our style
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\Alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\alph{enumiv}}
\renewcommand{\labelenumi}{\theenumi.}
\renewcommand{\labelenumii}{\theenumii.}
\renewcommand{\labelenumiii}{\theenumiii.}
\renewcommand{\labelenumiv}{\theenumiv)}

% Draft mode
\ifthenelse{\boolean{IsDraft}}{ % tue
	\RequirePackage{draftwatermark}
	\SetWatermarkAngle{60}
	\SetWatermarkLightness{0.875}
	\SetWatermarkFontSize{6cm}
	\setboolean{blacklinks}{false}
	}{% False
	}

% Add .pdf links
\ifthenelse{\boolean{blacklinks}}{% True
	\RequirePackage[unicode, final, pdfa, linktocpage, colorlinks, linktoc=all, linkcolor=black, citecolor=black, menucolor=black, urlcolor=black, pdfborder={0 0 0}, unicode, pdflang={en-US}]{hyperref}
	}{% False
	\RequirePackage[unicode, final, pdfa, linktocpage, colorlinks, linktoc=all, linkcolor=blue, citecolor=blue, menucolor=blue, urlcolor=blue, pdfborder={0 0 0},unicode, pdflang={en-US}]{hyperref}
	}

% Enable tooltips
\RequirePackage[linewidth = 0]{pdfcomment}

%% ACCESSIBILITY
\ifthenelse{\boolean{IsTagged}}{% True
	\RequirePackage[tagged,highstructure]{accessibilityMeta}
	}{% False: can use the footnote
	% need to add page number and availability information to every page, including new chapters.
	\RequirePackage{fancyhdr}
	\fancypagestyle{nrel}{%
		\fancyhf{} % clear all header and footer fields
		\fancyfoot[C]{\thepage\\ \textcolor{gray}{This report is available at no cost from the National Renewable Energy Laboratory at }\textcolor{blue}{\href{www.nrel.gov/publications}{www.nrel.gov/publications}}} % except the center
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}}
	% note that the first page of a chapter uses "plain", so we need to redefine that to match the "nrel" page style.
	\let\ps@plain\ps@nrel
	\pagestyle{nrel}}

%% THINGS WE NEED TO DO AT THE START OF THE DOCUMENT
\AtBeginDocument{
	% table font should be sans-serif
	\renewenvironment{table}
		{\renewcommand\familydefault\sfdefault\selectfont
		\@float{table}}
		{\end@float}
	% fix hyperlinks
	\hypersetup{
		pdftitle = {\@title},
		pdfauthor = {\@author}
		}
	}
\AfterEndPreamble{
	\maketitle
	}

% end of file