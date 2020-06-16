% File: nrel.cls v1.0
% This class file provides basic functionality for producing
% PDFs that meet NREL's style and formatting requirements.

% -------------------------------------------------------------
% Identification Part
% -------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nrel}
\typeout{ }
\typeout{NREL.cls -- v1.x, Last Updated March 1, 2016}
\typeout{Formats documents according to the NREL style guide}
\typeout{ }

% -------------------------------------------------------------
% Create Options
% -------------------------------------------------------------
%% PDF properties
\pdfinterwordspaceon
\pdfminorversion=8

\RequirePackage{xifthen,xcolor}

% Mark as draft
\newboolean{IsDraft}
\setboolean{IsDraft}{false}

% print links in black
\newboolean{blacklinks}
\setboolean{blacklinks}{false}

% memoir, book, report, article?
\newboolean{IsMemoir}
\setboolean{IsMemoir}{false}
\newboolean{IsBook}
\setboolean{IsBook}{false}
\newboolean{IsReport}
\setboolean{IsReport}{false}
\newboolean{IsArticle}
\setboolean{IsArticle}{false}

% do we have chapters?
\newboolean{HasChapters}
\setboolean{HasChapters}{false}

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
% book, report, article?
\DeclareOption{memoir}{
	\setboolean{IsMemoir}{true}
	\def\NREL@class{memoir}
	}
\DeclareOption{book}{
	\setboolean{IsBook}{true}
	\setboolean{HasChapters}{true}
	\def\NREL@class{book}
	\typeout{Using modified book class}
	}
\DeclareOption{report}{
	\setboolean{IsReport}{true}
	\setboolean{HasChapters}{true}
	\def\NREL@class{report}
	\typeout{Using modified report class}
	}
\DeclareOption{article}{
	\setboolean{IsArticle}{true}
	\setboolean{HasChapters}{false}
	\def\NREL@class{article}
	\typeout{Using modified article class}
	}
\DeclareOption{tagged}{
	\setboolean{IsTagged}{true}
	\typeout{PDF will be tagged}
	}

% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\NREL@class}}
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass{\NREL@class}

% -------------------------------------------------------------
% Package Loading
% -------------------------------------------------------------

\RequirePackage{titling}
\RequirePackage{datetime}
\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH], \THEYEAR}
  
% NAG: check for outdated packages
\RequirePackage[2tabu, orthodox]{nag}

% GEOMETRY: set page size
\RequirePackage[head=0.125in,top=0.9in,bottom=1in,inner=1in,outer=1in,includefoot]{geometry}

% MATHPTMX Times for roman text and math (family ptm)
\RequirePackage{mathptmx}

% Helvetica for sans serif (family phv)
\RequirePackage[scaled=0.83]{helvet}

% Courier for typewriter font (family pcr)
\RequirePackage{courier}

% ams math
\RequirePackage{amsfonts,amssymb,amsmath}

% gensymb. Required for degrees symbol
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
natbib=true,bibencoding=inputenc,sorting=nyt,doi=true, maxbibnames = 10,firstinits=true, maxcitenames =3 ]{biblatex}
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


\ifthenelse{\NOT \boolean{IsMemoir}}{  % not memoir class

	% improved table of contents and list of figures/tables
	\RequirePackage{tocloft}

	% remove numbering on bibliography but still allow in TOC
	\RequirePackage[nottoc, notlot, notlof]{tocbibind}

	% add Figure before # and a period after
	\renewcommand{\cftfigfont}{\fontfamily{phv} Figure }
	\renewcommand{\cfttabfont}{\fontfamily{phv} Table }
	\renewcommand{\cftfigaftersnum}{.}
	\renewcommand{\cfttabaftersnum}{.}

	% title font
	\ifthenelse{\boolean{HasChapters}}{
		\renewcommand{\cfttoctitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}
		\renewcommand{\cftloftitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}
		\renewcommand{\cftlottitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}

	}{ % no chapters (section has a smaller font size)
		\renewcommand{\cfttoctitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}
		\renewcommand{\cftloftitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}
		\renewcommand{\cftlottitlefont}{\color{nrelblue} \raggedright  \fontsize{12}{14}\sffamily\bfseries}

	}

	% add dotfill in toc
	\ifthenelse{\boolean{HasChapters}}{
		\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
	}{
		\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
	}

	% remove indentation
	\setlength{\cftfigindent}{0pt}
	%\setlength{\cftsubfigindent}{0pt}
	\setlength{\cfttabindent}{0pt}
	%\setlength{\cftsubtabindent}{0pt}

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
	\ifthenelse{\boolean{IsBook}}{%TRUE
		}{%FALSE
		\newcommand{\frontmatter}{\textbf{Error defining front matter!}}
		\newcommand{\mainmatter}{\textbf{Error defining main matter!}}
		\newcommand{\backmatter}{\textbf{Error defining back matter!}}
	}	

}{  % else IsMemoir

	% add Figure before # and a period after
	\renewcommand{\cftfigurefont}{\fontfamily{phv} Figure }
	\renewcommand{\cfttablefont}{\fontfamily{phv} Figure }
	\renewcommand{\cftfigureaftersnum}{.}
	\renewcommand{\cfttableaftersnum}{.}

	% title font
	\renewcommand{\printtoctitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
	\renewcommand{\printloftitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
	\renewcommand{\printlottitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
	% \renewcommand{\bibname}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries Bibliography}

	% remove indentation
	\setlength{\cftsectionindent}{0pt}
	\setlength{\cftsubsectionindent}{2em}
	\setlength{\cftfigureindent}{0pt}
	\setlength{\cfttableindent}{0pt}

	% additional spacing
	\setlength{\cftbeforefigureskip}{5pt}
	\setlength{\cftbeforetableskip}{5pt}
}


% -------------------------------------------
% Changes to the chapter and section markings
% -------------------------------------------
% Assign numbers to headings chapter through subparagraph
\ifthenelse{\boolean{IsMemoir}}{% True (memoir)
	\setsecnumdepth{subsubsection}
	\maxtocdepth{subparagraph}
	}{% False (other classes)
	\setcounter{secnumdepth}{5}
	\setcounter{tocdepth}{5}
	}

% Chapter Headings
\ifthenelse{\boolean{HasChapters}}{% True
	\renewcommand{\@makechapterhead}[1]{%
	{\color{nrelblue} \parindent \z@ \raggedright \normalfont \interlinepenalty\@M
	\ifnum \c@secnumdepth >\m@ne
		\fontfamily{phv} \fontsize{14}{20}\fontseries{b}\selectfont
		\thechapter \hspace*{1em}#1
		\else
		\fontfamily{phv} \fontsize{14}{20}\fontseries{b}\selectfont #1
	\fi
	\par\nobreak
	\vspace*{12pt}}}

\renewcommand{\@makeschapterhead}[1]{%
	{\color{nrelblue} \parindent \z@ \raggedright \normalfont \interlinepenalty\@M
	\Large\sffamily\bfseries #1
	\par\nobreak
	\vspace*{12pt}}}
	}{% False
	}

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

% change the formatting of the TOC heading
\ifthenelse{\boolean{IsMemoir}}{%True
	\def\chapterheadstart{}
	\renewcommand\printtoctitle[1]{%
		\parindent \z@ \raggedright \normalfont \interlinepenalty\@M
		\fontfamily{phv} \fontsize{14}{20} \fontseries{b}\selectfont #1}
	\def\afterchaptertitle{%
		\par\nobreak
		\vspace*{12pt}}
	}{% False
	}

% To harmonise the font sizes
\ifthenelse{\boolean{IsMemoir}}{% True
	\renewcommand{\chapnumfont}{\chaptitlefont}
	\renewcommand{\chapnamefont}{\chaptitlefont}
	}{% False
	}

% use dots as the separator
\ifthenelse{\boolean{IsMemoir}}{% True
	\renewcommand*{\cftchapterdotsep}{\cftdotsep}
	}{% False
	}

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
\ifthenelse{\boolean{HasChapters}}{
	\counterwithout{figure}{chapter}
	\counterwithout{table}{chapter}
	\counterwithout{footnote}{chapter}

	% deal with the appendix
	\renewcommand\appendix{\par
		\setcounter{chapter}{0} 
		\setcounter{section}{0}
		\setcounter{footnote}{0} 
		\gdef\thechapter{\@Alph\c@chapter}
		% counters should reset each chapter
		\counterwithin{figure}{chapter}
		\counterwithin{table}{chapter}
		% footnote formatting
		 \renewcommand*{\thefootnote}{\fnsymbol{footnote}}}
}{% else
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
}
		
% Note that if we use the front matter / main matter, we have to change numbers
\ifthenelse{\boolean{IsMemoir}}{% True
	}{%FALSE
	% not memoir class
	% need to renew the front, main, and back matter commands
	\renewcommand{\frontmatter}{%
		\pagenumbering{roman} %
		\setcounter{page}{3} %
		\setcounter{figure}{0} %
		\renewcommand{\thefigure}{\Alph{figure}} %
		\setcounter{table}{0} %
		\renewcommand{\thetable}{\Alph{table}}
	}
	\renewcommand{\mainmatter}{%
		\clearpage %
		\pagenumbering{arabic} %
		\setcounter{figure}{0} %
		\renewcommand{\thefigure}{\arabic{figure}} %
		\setcounter{table}{0} %
		\renewcommand{\thetable}{\arabic{table}}%
	}
	\renewcommand{\backmatter}{%
	%
	}
}


% check that the default san-serif font is sort-of-arial	(required for tables)					
\renewcommand{\sfdefault}{phv} % Arial

% Indenting and spacing between paragraphs
\setlength{\parindent}{0pt}
\ifthenelse{\boolean{IsMemoir}}{% True
	\nonzeroparskip
	}{% False
	}

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
	\RequirePackage[final, pdfa, linktocpage, colorlinks, linktoc=all, linkcolor=black, citecolor=black, menucolor=black, urlcolor=black, pdfborder={0 0 0}, unicode, pdflang={en-US}]{hyperref}
	}{% False
	\RequirePackage[final, pdfa, linktocpage, colorlinks, linktoc=all, linkcolor=black, citecolor=black, menucolor=black, urlcolor=nrelblue, pdfborder={0 0 0},unicode, pdflang={en-US}]{hyperref}
	}

% Enable tooltips
\RequirePackage[linewidth = 0]{pdfcomment}

\ifthenelse{\boolean{IsMemoir}}{ % for some reason this is overriden from above so need to define at end
	\renewcommand{\printtoctitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
	\renewcommand{\printloftitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
	\renewcommand{\printlottitle}[1]{\color{nrelblue} \raggedright  \Large\sffamily\bfseries #1}
}

%% ACCESSIBILITY
\ifthenelse{\boolean{IsTagged}}{% True
	\RequirePackage[tagged,highstructure]{accessibility}
	}{% can use the footnote
	\ifthenelse{\boolean{IsMemoir}}{% TRU
	}{
		% need to add page number and availability information to every page, including new chapters.
	\RequirePackage{fancyhdr}
	\fancypagestyle{nrel}{%
		\fancyhf{} % clear all header and footer fields
% 		\fancyfoot[L]{CONFIDENTIAL: limited distribution}
		\fancyfoot[R]{{\thepage}} 

		\renewcommand{\headrulewidth}{0.5pt}
		\renewcommand{\headrule}{\hbox to\headwidth{%
				\color{nrelblue}\leaders\hrule height \headrulewidth\hfill}}

		\renewcommand{\footrulewidth}{0.5pt}
		\renewcommand{\footrule}{\hbox to\headwidth{%
				\color{nrelblue}\leaders\hrule height \headrulewidth\hfill}}
			
% 		\fancyhead[RE,LO]{
% 			\includegraphics[height=1.5cm]{nrelLogo}
% 						 }
		}
	% note that the first page of a chapter uses "plain", so we need to redefine that to match the "nrel" page style.
	\let\ps@plain\ps@nrel
	\pagestyle{nrel}

	}
}
 


%% THINGS WE NEED TO DO AT THE START OF THE DOCUMENT
\AtBeginDocument{
	\setlength{\headsep}{6em}
	% table font should be sans-serif
	\makeatletter
%	\appto\@floatboxreset{%
%	  \ifx\@captype\nrel@table
%	    \sffamily
%	  \fi
%	}
%	\def\nrel@table{table}
	\renewenvironment{table}
		{\renewcommand\familydefault\sfdefault\selectfont
		\@float{table}}
		{\end@float}
	\makeatother
	% fix hyperlinks
	\makeatletter
	\hypersetup{
		pdftitle = {\@title},
		pdfauthor = {\@author}
	}
	\makeatother
	\makeatletter
		\setlength{\@fptop}{0pt}
	\makeatother	
	
	\makeatletter
	\def\blx@maxline{77}
	\makeatother
%
%
% \makeatletter
% \def\@maketitle{%
%   \thispagestyle{empty}		
% 	\centering
% 	\vspace*{-8em}
% 	\includegraphics[width=\textwidth]{header}\\
% 	\vspace*{4em}
% 	\begin{flushright}
% 		\begin{minipage}{0.7\textwidth}
% 			\huge{\thetitle}\\
% % 			\\
% 			\vspace*{1.5em}				
% 			\large{\theauthor}\\
% % 			\\
% 			\normalsize			
% 			National Renewable Energy Laboratory\\			
% 		\end{minipage}
% 		\\	
% 		\vspace{25em}
% 		\begin{minipage}[b]{0.7\textwidth}
% 			NREL is a national laboratory of the U.S. Department of Energy\\
% 			Office of Energy Efficiency \& Renewable Energy\\
% 			Operated by the Alliance for Sustainable Energy, LLC.
% 			\\
% 			\vspace{3em}
% 			\textbf{Technical Report}\\
% % 			NREL/TP-xxxx-xxxx\\
% 			\monthyeardate\today\\
% 			\vspace{3em}
% % 			Contract No. DE-xxxx-xxxxxxxxx
% % 			\large{CONFIDENTIAL:} Private report for the Carbon Trust, Offshore Wind Accelerator and within NREL/DOE
% 		\end{minipage}
% 	\end{flushright}
% 	\justify	
% \makeatother

	% -------------------------------------
	% hard-coded formatting for title page
	% * no changes needed *
	% -------------------------------------
	\thispagestyle{empty}		
	\centering
	\vspace*{-8em}
	\includegraphics[width=\textwidth]{header}\\
	\vspace*{4em}
	\begin{flushright}
		\begin{minipage}{0.7\textwidth}
			\huge{\thetitle}\\
% 			\\
			\vspace*{1.5em}				
			\large{\@author}\\
% 			\\
% 			\normalsize			
% 			National Renewable Energy Laboratory\\			
		\end{minipage}
		\\	
		\vfill
% 		\vspace{15em} 
		\begin{minipage}[b]{0.7\textwidth}
			NREL is a national laboratory of the U.S. Department of Energy\\
			Office of Energy Efficiency \& Renewable Energy\\
			Operated by the Alliance for Sustainable Energy, LLC.
			\\
			\vspace{3em}
			\textbf{Technical Report}\\
% 			NREL/TP-xxxx-xxxx\\
			\monthyeardate\today\\
			\vspace{3em}
% 			Contract No. DE-xxxx-xxxxxxxxx
% 			\large{CONFIDENTIAL:} Private report for the Carbon Trust, Offshore Wind Accelerator and within NREL/DOE
		\end{minipage}
	\end{flushright}
	\justify	


% 	\clearpage
}
% end of file
