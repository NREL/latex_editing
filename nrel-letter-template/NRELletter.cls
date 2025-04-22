% NREL letter class file
% Formal letter with NREL letterhead/logo
% 05 September 2017
% Nicholas Hamilton, nicholas.hamilton(at)nrel.gov

% --- Class structure: identification part
% ---
\ProvidesClass{NRELletter}
\typeout{ }
\typeout{NRELletter.cls -- v1.1, April 2025}
\typeout{Formats letter documents according to the NREL style guide}
\typeout{For support, visit the NREL LaTeX teams page.}
\typeout{ }
\typeout{Author: Nicholas Hamilton, nicholas.hamilton@nrel.gov}

\typeout{ }

\NeedsTeXFormat{LaTeX2e}

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

% -------------------------------------------------------------
% Check for choice of package and formatting options
% -------------------------------------------------------------

% look out for draft
\DeclareOption{draft}{
	\setboolean{IsDraft}{true}
	\typeout{Formatting as draft}
	}

% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass{letter}

% -------------------------------------------------------------
% Package Loading
% -------------------------------------------------------------
% NAG: check for outdated packages
\RequirePackage[l2tabu, orthodox]{nag}

% GEOMETRY: set page size
% \RequirePackage[head=0.125in,top=0.9in,bottom=1in,inner=1in,outer=1in]{geometry}

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
\RequirePackage[utf8]{inputenc} % Required for inputting international characters
\RequirePackage{microtype} % Improves typography

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

% fancyhdr for footer
\RequirePackage{fancyhdr}
% --------------
% Main Code
% --------------

% NREL default is ragged right.
% Load ragged2e so \justifying and environment justify are available.
% Redefines \centering, \raggedleft, and \raggedright, and environments center flushleft and flushright to use versions made by ragged2e. Sets default alignment to ragged right. To override, use the command \justifying or the environment justify.
\RequirePackage[newcommands,document]{ragged2e}

%This changes parindent to 0
\setlength{\RaggedRightRightskip}{0pt plus 3em}

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
		
% check that the default san-serif font is sort-of-arial	(required for tables)				
\renewcommand{\sfdefault}{phv} % Arial

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


%% THINGS WE NEED TO DO AT THE START OF THE DOCUMENT
\AtBeginDocument{
    %----------------------------------------------------------------------------------------
    %	DOCUMENT STRUCTURE
    %----------------------------------------------------------------------------------------

    \pagestyle{empty} % Suppress headers and footers
    
    \setlength\parindent{0cm} % Paragraph indentation
    \setlength\parskip{1em}
    
    % Create a new command for the horizontal rule in the document which allows thickness specification
    \makeatletter
    \newcommand{\vhrulefill}[1]{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
    \makeatother
    
%    %----------------------------------------------------------------------------------------
%    %	DEFINE CUSTOM COMMANDS
%    %----------------------------------------------------------------------------------------
%    
\newcommand{\nrelblue}[1]{{\textcolor{nrelblue}{#1}}}

%    \newcommand{\logo}[1]{\renewcommand{\logo}{#1}}
%    
%    \newcommand{\Who}[1]{\renewcommand{\Who}{#1}}
%    \newcommand{\Title}[1]{\renewcommand{\Title}{#1}}
%    
%    \newcommand{\headerlineone}[1]{\renewcommand{\headerlineone}{#1}}
%    \newcommand{\headerlinetwo}[1]{\renewcommand{\headerlinetwo}{#1}}
%    
%    \newcommand{\authordetails}[1]{\renewcommand{\authordetails}{#1}}
    
    %----------------------------------------------------------------------------------------
    %	AUTHOR DETAILS STRUCTURE
    %----------------------------------------------------------------------------------------
    
    \newcommand{\authordetailsblock}{
%    	\hspace{\fill} % Move the author details to the far right
    	\hspace{2.1cm}\parbox[t]{0.6\textwidth}{\raggedleft% Box holding the author details; width value specifies where it starts and ends, increase to move details left
    		\footnotesize % Use a smaller font size for the details
%    		\Who\\ % Author name
    		{\authordetails} % The author details text, all italicised
    	}
    }
    
    %----------------------------------------------------------------------------------------
    %	HEADER STRUCTURE
    %----------------------------------------------------------------------------------------
    
    \address{
    	\includegraphics[width=2in]{\logo} % Include the logo of author institution
    	\hspace{0.82\textwidth} % Position of the institution logo, increase to move left, decrease to move right
    	\vskip -0.1\textheight~\\ % Position of the large header text in relation to the institution logo, increase to move down, decrease to move up
    	\Large\hspace{0.2\textwidth}\headerlineone\hfill ~\\[0.006\textheight] % First line of institution name, adjust hspace if your logo is wide
    	\hspace{0.2\textwidth}\headerlinetwo\hfill \normalsize % Second line of institution name, adjust hspace if your logo is wide
    	\makebox[0ex][r]{\textbf{\nrelblue{\Who\Title}}}\hspace{0.01\textwidth} % Print author name and title with a little whitespace to the right
    	~\\[-0.01\textheight] % Reduce the whitespace above the horizontal rule
    	\hspace{0cm}\vhrulefill{1pt} \\ % Horizontal rule, adjust hspace if your logo is wide and \vhrulefill for the thickness of the rule
    	\authordetailsblock % Include the letter author's details on the right side of the page under the horizontal rule
    	\hspace{-0.25\textwidth} % Horizontal position of the author details block, increase to move left, decrease to move right
    	\vspace{-0.1\textheight} % Move the date and letter content up for a more compact look
    }
    
    %----------------------------------------------------------------------------------------
    %	COMPOSE THE ENTIRE HEADER
    %----------------------------------------------------------------------------------------
    
    \renewcommand{\opening}[1]{
    	{\centering\fromaddress\vspace{0.05\textheight} \\ % Print the header and from address here, add whitespace to move date down
    	\hspace*{\longindentation}\today\hspace*{\fill}\par} % Print today's date, remove \today to not display it
    	{\raggedright \toname \\ \toaddress \par} % Print the to name and address
    	\vspace{1cm} % White space after the to address
    	\noindent #1 % Print the opening line
    }
    
    \pagestyle{fancy}
    \fancyhf{}
    \rhead{}
    \lhead{}
    % \lfoot{\includegraphics{NREL_footer.png}}
	\lfoot{\footnotesize\textbf{\sffamily{NREL is a national laboratory of the U.S. Department of Energy\\
	Office of Energy Efficiency and Renewable Energy\\
	Operated under Contract No. DE-AC36-08GO28308
    }}}
    
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    
    %----------------------------------------------------------------------------------------
    %	SIGNATURE STRUCTURE
    %----------------------------------------------------------------------------------------
    
    \signature{\Who\Title} % The signature is a combination of the author's name and title
    
    \renewcommand{\closing}[1]{
   	\vspace{2\baselineskip} % Some whitespace after the letter content and before the signature
    	\noindent % Stop paragraph indentation
    	\hspace*{\longindentation} % Move the signature right to the value of \longindentation
    	\parbox{\indentedwidth}{
    		\raggedright
    		#1 % Print the signature text
		\newline
    		\includegraphics[height=1.65cm]{\signat} 
		\newline% Whitespace between the closing text and author's name for a physical signature
    		\fromsig % Prints the value of \signature{}, i.e. author name and title
	}
}

}


%% end of file




