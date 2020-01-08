% LaTeX Dokumentenklasse fr die LNI Reihe der GI
%
% (C) 2002 Robert Tolksdorf
% Im Fall von Fragen zu dieser Dokumentenklasse wenden Sie sich bitte
% an mail@robert-tolksdorf.de
%
%
\ProvidesClass{lni}[2002/09/02 v0.1, by Robert Tolksdorf, Berlin]

%\DeclareOption
%\ExecuteOptions

% 10 pt
\LoadClass[10pt,a4paper,fleqn]{article}
% Blocksatz durch LaTeX-Default
% Satzspiegel
\setlength{\textheight}{192mm}
\setlength{\textwidth}{126mm}

% Times als Grundschrift
\RequirePackage{times}
\RequirePackage[english,ngerman]{babel}%aaa english -> german
% Hyphenation
% Durch normale LaTeX-Parameter verhindert (\doublehyphendemerits)

% Title: Kopie aus article.cls mit anderem \thispagestyle
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\fontsize{14}{17}\fontseries{b}\selectfont \@title \par}%
    \vskip 1.5em%
    {\fontsize{10}{12}\selectfont
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1\baselineskip%
  \end{center}%
  \par
  }

% Abstract
\renewenvironment*{abstract}{%
 \renewcommand{\abstractname}{Abstract}
 \fontsize{9}{10}\selectfont
    \quotation\noindent{\bfseries \abstractname:}%
}{\endquotation}  

% % �erschriften
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{12}{14}\fontseries{b}\selectfont}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{10}{12}\fontseries{b}\selectfont}}
% % weitere nicht durch Formatvorlage gekl�t

% ----------- Robs Hack!!! --- aaa --- TODO -----------------------
% �erschriften
% \renewcommand{\section}{\@startsection{section}{1}{\z@}%
%   {2\baselineskip}{\baselineskip}{\fontsize{12}{14}\fontseries{b}\selectfont}}
% \renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
%   {2\baselineskip}{\baselineskip}{\fontsize{10}{12}\fontseries{b}\selectfont}}
% 
% \renewcommand\section{\@startsection {section}{1}{\z@}%
%                                    {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                    {2.3ex \@plus.2ex}%
%                                    {\normalfont\Large\bfseries}} 
% weitere nicht durch Formatvorlage gekl�t
% ----------- End of Robs Hack!!! --- aaa --- TODO ----------------


% keine seitennummern
%\pagestyle{empty}
% Header Macro \header{Titel}{Autor}
\@twosidetrue
\RequirePackage{fancyhdr}
\newcommand{\header}[2]{%
\addcontentsline{toc}{section}{{\rm #2}\newline{\bfseries #1}\rm\dotfill}
\pdfbookmark[1]{#2}{#2}
\pagestyle{fancy}
\lhead[\fancyplain{}{\bf\thepage}]{\fancyplain{}{\bf #2}}
\rhead[\fancyplain{}{\bf #1}]{\fancyplain{}{\bf\thepage}}
\cfoot{}
}
%
%1: toc-title, 2: authors, 3: runningtitle, 4: marker
\newcommand{\sheader}[4]{%
\section*{}
\addcontentsline{toc}{section}{{\rm #2}\newline{\bfseries #1}\rm\dotfill}
\pdfbookmark[1]{#2}{#2}
\pagestyle{fancy}
\lhead[\fancyplain{}{\bf\thepage}]{\fancyplain{}{\bf #2}}
\rhead[\fancyplain{}{\bf #3}]{\fancyplain{}{\bf\thepage}}
\cfoot{}
}
\def\makeemptypage{\rhead[\fancyplain{}{\bf}]{\fancyplain{}{\bf\thepage}}~\newpage}

% Bildunterschriften
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\fontsize{9}{10}\selectfont
   \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}
  \vskip\belowcaptionskip}

% gleichungen mit richtiger einrckung
% fleqn-Option oben
\setlength{\mathindent}{4ex}

% listings mit richtiger einrckung
\RequirePackage{verbatim}
\def\verbatim@processline{\hskip4ex\the\verbatim@line\par}

% Fussnoten mit 5cm Linie und richtiger Gr�e
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width5cm
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}{\fontsize{8}{9}\selectfont#1}}

% Gemutma�e Absatzeinzge und Abst�de
\parindent0pt
\parskip 1ex

% bibliography
\bibliographystyle{lni}
\renewenvironment{thebibliography}[1]
     {%\def\refname{Literaturverzeichnis}
      \section*{\refname}%
      \bgroup\fontsize{9}{10}\selectfont
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\egroup}
