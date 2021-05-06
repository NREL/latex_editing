%  File: nrel.cls v1.0
% This class file provides basic functionality for producing
% PDFs that meet NREL's style and formatting requirements.

% -------------------------------------------------------------
% Identification Part
% -------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nrel}
\typeout{ }
\typeout{NREL.cls -- v2.0, June 2020}
\typeout{Formats documents according to the NREL style guide}
\typeout{ }

% -------------------------------------------------------------
% Create Options
% -------------------------------------------------------------
%% PDF properties
\pdfinterwordspaceon
\pdfminorversion=6
% for processing of conditional statements
\RequirePackage{xifthen}
% Mark as draft
\newboolean{IsDraft}
\setboolean{IsDraft}{false}
% print links in black
\newboolean{blacklinks}
\setboolean{blacklinks}{false}
% Set flag to meet NREL RAAW requirements
% true by default
\newboolean{IsNREL}
\setboolean{IsNREL}{true}
% Set flag to meet EERE RAAW requirements
\newboolean{IsEERE}
\setboolean{IsEERE}{false}
% Set flag for confidentiality statement
\newboolean{IsConfidential}
\setboolean{IsConfidential}{false}
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
% If EERE option is set, format as EERE RAAW
\DeclareOption{EERE}{
	\setboolean{IsEERE}{true}
	\setboolean{IsNREL}{false}
	\def\NREL@class{report}
	\typeout{Using EERE report RAAW}
}
% NREL is assumed to be true by default
% unless switched off by EERE flag
\ifthenelse{\boolean{IsNREL}}{ 
	\def\NREL@class{report}
	\typeout{Using NREL report RAAW}
}{}
% If tagged option is set, format as tagged pdf
\DeclareOption{tagged}{
	\setboolean{IsTagged}{true}
	\typeout{PDF will be tagged}
	}
% If confidential option is set, add confidentiality statement
\DeclareOption{confidential}{
	\setboolean{IsConfidential}{true}
	\typeout{Confidentiality statement added to title page and headers}
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

% titlepage stu
\RequirePackage{titling}
\RequirePackage{datetime}
\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH], \THEYEAR}
% for multiple authors/affils
\RequirePackage{authblk}
% NAG: check for outdated packages
\RequirePackage[l2tabu, orthodox]{nag}
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
% % better tables
\RequirePackage{booktabs}
% \RequirePackage{tabularx}
% For including figures, ignoring the draft status
\RequirePackage[final]{graphicx}
% use fonts of type T1
\RequirePackage[T1]{fontenc}
% colours
\RequirePackage{xcolor}
\definecolor{nrelblue}{RGB}{0, 121, 193}
% set languages
\RequirePackage[english]{babel}
% To stop hyphenation in titles etc
\RequirePackage{hyphenat}
% spacing
\RequirePackage{setspace}
\RequirePackage{parskip}
% to-do notes
\RequirePackage{todonotes}
% code listings
\RequirePackage{listings}
\usepackage[utf8]{inputenc}


%% ----------------------------
%% References section 
%% ----------------------------
% For formatting the bibliography. See guidance 
\RequirePackage[babel]{csquotes}
\RequirePackage[
	style=chicago-authordate,
	strict,backend=bibtex,
	natbib=true,
	bibencoding=inputenc,
	sorting=nyt,
	doi=true, 
	maxbibnames=10,
	giveninits=true, 
	maxcitenames=3 
]{biblatex}
% change the name of the bib 
% (see http://tex.stackexchange.com/questions/82993/how-to-change-the-name-of-document-elements-like-figure-contents-bibliogr)
\DefineBibliographyStrings{american}{%
  bibliography = {References},
}
% see NREL formatting guidelines at 
% https://communications_resources.nrel.gov/style_guide/references
% technical reports
\DeclareBibliographyAlias{techreport}{book}
% make one type of publication look like another
% map unknown bibliography entry types to the misc type
\DeclareBibliographyAlias{*}{misc} 
% make sure URLs in the bibliography are shown in roman fonts
\urlstyle{same}

% --------------------------------------------------------
% Main Code
% --------------------------------------------------------
% NREL default is ragged right.
% Load ragged2e so \justifying and environment justify are available.
% Redefines \centering, \raggedleft, and \raggedright, and environments center
% flushleft and flushright to use versions made by ragged2e. 
% Sets default alignment to ragged right. 
% To override, use the command \justifying or the environment justify.
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

% title font
\renewcommand{\cfttoctitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}
\renewcommand{\cftloftitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}
\renewcommand{\cftlottitlefont}{\color{nrelblue} \raggedright  \Large\sffamily\bfseries}

% add dotfill in toc
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

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

% -------------------------------------------
% Changes to the chapter and section markings
% -------------------------------------------
% Chapter Headings
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

% \renewenvironment{table}
% 	{\@float{table} \fontfamily{phv}\selectfont}
% 	{\end@float}
% inherit fonts etc from TOC
\let\printlottitle\printtoctitle
\let\printloftitle\printtoctitle

% % Format Captions
% % see e.g. http://www.peteryu.ca/tutorials/publishing/latex_captions for details of how to adjust
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup[table]{font={small,sf,bf},
	labelfont={small,sf,bf},
	textfont={small,sf,bf},
	position=above,
	labelsep=period,
	justification=centering,
	singlelinecheck=true}
\captionsetup[figure]{font={small,sf,bf},
	labelfont={small,sf,bf},
	textfont={small,sf,bf},
	position=below,
	labelsep=period,
	justification=centering,
	singlelinecheck=true}

% number figures and tables continuously across chapters
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{footnote}{chapter}

% Note that if we use the front matter / main matter, we have to change numbers
% need to renew the front, main, and back matter commands
\makeatletter
	\newcommand{\frontmatter}{%
		\renewcommand\thechapter{\hspace{-1.65ex}}
		\pagenumbering{roman} %
		\setcounter{page}{3} %
		\setcounter{figure}{0} %
		\renewcommand{\thefigure}{\Alph{figure}} %
		\setcounter{table}{0} %
		\renewcommand{\thetable}{\Alph{table}}
	}
	\newcommand{\mainmatter}{%
		\clearpage %
		\renewcommand\thechapter{\arabic{chapter}}
		\setcounter{chapter}{0} %
		\pagenumbering{arabic} %
		\setcounter{figure}{0} %
		\renewcommand{\thefigure}{\arabic{figure}} %
		\setcounter{table}{0} %
		\renewcommand{\thetable}{\arabic{table}}%
	}
	\newcommand{\backmatter}{}
\makeatother

% deal with the appendix
\renewcommand\appendix{\par
	\setcounter{chapter}{0} 
	\setcounter{section}{0}
	\setcounter{footnote}{0} 
	\renewcommand\thechapter{\Alph{chapter}}
	% counters should reset each chapter
	\counterwithin{figure}{chapter}
	\counterwithin{table}{chapter}
	% footnote formatting
		\renewcommand*{\thefootnote}{\fnsymbol{footnote}}}


% check that the default san-serif font is sort-of-arial				
% (required for tables)					
% \renewcommand{\sfdefault}{phv} % Arial
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

% % Add .pdf links
% \ifthenelse{\boolean{blacklinks}}{% True
% 	\RequirePackage[
% 		final, 
% 		pdfa, 
% 		linktocpage, 
% 		colorlinks, 
% 		linktoc=all, 
% 		linkcolor=black, 
% 		citecolor=black, 
% 		menucolor=black, 
% 		urlcolor=black, 
% 		pdfborder={0 0 0}, 
% 		unicode, 
% 		pdflang={en-US}
% 	]{hyperref}
% }{% False
% 	\RequirePackage[
% 		final, 
% 		pdfa, 
% 		linktocpage, 
% 		colorlinks, 
% 		linktoc=all, 
% 		linkcolor=black, 
% 		citecolor=nrelblue, 
% 		menucolor=black, 
% 		urlcolor=nrelblue, 
% 		pdfborder={0 0 0},
% 		unicode, 
% 		pdflang={en-US}
% 	]{hyperref}
% }

% Enable tooltips
\RequirePackage[linewidth = 0]{pdfcomment}

%%%#TODO review verbatim/listings code
%% ----------------------------
%% CODE / VERBATIM
%% ----------------------------
% \@ifundefined{lstlisting}{}{%
% 	\let\verbatim\relax%
% 	\lstnewenvironment{verbatim}{\lstset{language=[LaTeX]TeX,                     % the language of the code
% 		basicstyle=\small\sffamily,
% 		numbers=none,                   % where to put the line-numbers
% 		numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
% 		stepnumber=1,                   % the step between two line-numbers. If it's 1, each line will be numbered
% 		numbersep=5pt,                  % how far the line-numbers are from the code
% 		backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
% 		showspaces=false,               % show spaces adding particular underscores
% 		showstringspaces=false,         % underline spaces within strings
% 		breaklines=true,                % sets automatic line breaking
% 		breakatwhitespace=true,        % sets if automatic breaks should only happen at whitespace
% 		keywordstyle=\color{blue},      % keyword style
% 		commentstyle=\color{gray},   % comment style
% 		stringstyle=\color{green},      % string literal style
% 		escapeinside={\%*}{*)},         % if you want to add a comment within your code
% 		morekeywords={*,...}}%            % if you want to add more keywords to the set
% 	}{}%
% }

%%#TODO update the page format (fancy head/foot)
%% ----------------------------
%% ACCESSIBILITY
%% ----------------------------
\ifthenelse{\boolean{IsTagged}}{% True
	\RequirePackage[tagged,highstructure]{accessibility}
}
{%FALSE
	% can use the footnote
	% need to add page number and availability information to every page, including new chapters.
	\RequirePackage{fancyhdr}
	\fancypagestyle{nrel}{%
		\fancyhf{} % clear all header and footer fields
		\ifthenelse{\boolean{IsConfidential}}{%IsConfidential==True
			\fancyfoot[C]{\thepage\\ \textcolor{gray}{This report is available at no cost from the National Renewable Energy Laboratory at }\textcolor{nrelblue}{\href{www.nrel.gov/publications}{www.nrel.gov/publications}}} % except the center
		}{%IsConfidential==False
			\fancyfoot[C]{\thepage\\ \textcolor{gray}{This report is available at no cost from the National Renewable Energy Laboratory at }\textcolor{nrelblue}{\href{www.nrel.gov/publications}{www.nrel.gov/publications}}} % except the center
		}
		\fancyfoot[L]{CONFIDENTIAL: limited distribution}
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
	% \let\ps@plain\ps@nrel
	% \pagestyle{nrel}
}

%% command to scrape authors from authblk (without affils or markers)
\RequirePackage{xstring}
\RequirePackage{hyperref}

\typeout{TEST LOCATION}
\makeatletter
\typeout{AB@authlist}
\pdfstringdef\cleanlist{\AB@authlist}
\makeatother
\StrDel{\cleanlist}{1}[\cleanlist]
\StrDel{\cleanlist}{2}[\cleanlist]
\StrDel{\cleanlist}{3}[\cleanlist]
\StrDel{\cleanlist}{4}[\cleanlist]
\StrDel{\cleanlist}{5}[\cleanlist]

%% add pdf title and authors
\makeatletter
\typeout{\cleanlist}
\hypersetup{
	final, 
	linktocpage, 
	colorlinks, 
	linktoc=all, 
	linkcolor=black, 
	citecolor=nrelblue, 
	menucolor=black, 
	urlcolor=nrelblue, 
	pdfborder={0 0 0},
	unicode, 
	pdflang={en-US},
	pdftitle=\@title,
	pdfauthor={Nicholas Hamilton}
	% pdfauthor={\cleanlist}
}
\makeatother


%% format of make title (title, authors, affils)
\makeatletter
	\renewcommand{\maketitle}{\bgroup\setlength{\parindent}{0pt}
	\null
	\vskip 2em%
	\begin{flushright}
		\fontfamily{phv}
		\textbf{\huge{\@title}}
		\vskip 1.5em%
		\large{\@author}
		\vskip 1em%
	\end{flushright}
	\egroup
	}
\makeatother


%#TODO add ifthenelse statement to change from NREL cover page to EERE cover page
%% THINGS WE NEED TO DO AT THE START OF THE DOCUMENT
\AtBeginDocument{
	\setlength{\headsep}{6em}

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
			\maketitle			
		\end{minipage}
		\\	
		\vfill
		\begin{minipage}[b]{0.7\textwidth}
			NREL is a national laboratory of the U.S. Department of Energy\\
			Office of Energy Efficiency \& Renewable Energy\\
			Operated by the Alliance for Sustainable Energy, LLC.
			\\
			\vspace{3em}
			\textbf{Technical Report}\\
			NREL/TP-xxxx-xxxx\\ %#TODO add field for TP#
			\monthyeardate\today\\
			\vspace{3em}
			Contract No. DE-AC36-08GO28308
		\end{minipage}
	\end{flushright}
	\justify	
% 	\clearpage
}

% end of file
