%%
%% This is file `ucasthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ucasthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005-2013 by Ruini Xue <xueruini@gmail.com>
%% Copyright (C) 2013-2016 derived by Chaolu <wuchaolu@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ucasthesis}
[2012/07/28 4.8dev University of Chinese Academy of Sciences Thesis Template]
\hyphenation{ucas-Thesis}
\def\ucasthesis{\textsc{ucasthesis}}
\def\version{4.8dev}
\newif\ifucas@master\ucas@masterfalse
\newif\ifucas@doctor\ucas@doctorfalse
\newif\ifucas@secret\ucas@secretfalse
\DeclareOption{master}{\ucas@mastertrue}
\DeclareOption{doctor}{\ucas@doctortrue}
\DeclareOption{secret}{\ucas@secrettrue}
\newif\ifucas@arial   %!
\DeclareOption{arial}{\ucas@arialtrue}
\newif\ifucas@arialtoc
\DeclareOption{arialtoc}{\ucas@arialtoctrue}
\newif\ifucas@arialtitle
\DeclareOption{arialtitle}{\ucas@arialtitletrue}
\newif\ifucas@raggedbottom\ucas@raggedbottomtrue
\DeclareOption{noraggedbottom}{\ucas@raggedbottomfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{utf,arialtitle}%?
\ProcessOptions\relax
\RequirePackage{ifxetex}
 \ifxetex
  \LoadClass[cs4size,a4paper,openany,nocap,nofonts,UTF8]{ctexbook}
 \else
  \LoadClass[cs4size,a4paper,openany,nocap,winfonts,UTF8]{ctexbook}
\fi%    \end{macrocode}

\ifucas@master\relax\else
  \ifucas@doctor\relax\else
      \ClassError{ucasthesis}%
                   {You have to specify one of thesis options: master or doctor.}{}
  \fi
\fi

\RequirePackage{ifthen,calc}
\RequirePackage{amsmath}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{indentfirst}

\RequirePackage[neverdecrease]{paralist}
\setdefaultleftmargin{3em}{2.2em}{1.87em}{1.7em}{1em}{1em}
\ifucas@raggedbottom
  \RequirePackage[bottom,perpage]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage]{footmisc}
\fi
\ifdefined \ctexset
\ctexset{autoindent=true}
\fi
\renewcommand{\baselinestretch}{1.0}
\RequirePackage{zhnumber}
\ifxetex
  \xeCJKsetup{AutoFakeBold=false,AutoFakeSlant=false,AllowBreakBetweenPuncts=true}
  \punctstyle{quanjiao}
  \normalspacedchars{-}

  \def\CJK@null{\kern\CJKnullspace\Unicode{48}{7}\kern\CJKnullspace}
  \defaultfontfeatures{Mapping=tex-text} % use TeX --
  \input{fontname.def}

  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
\else
  \RequirePackage{CJKspace}
  \ifucas@arial
    \IfFileExists{arial.sty}%
                 {\RequirePackage{arial}}%
                 {\ClassWarning{ucasthesis}{no arial.sty availiable!}}
  \fi
\fi
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi

\RequirePackage{refcount}
\newcommand{\chapterref}[1]{%
  \@ifundefined{hyperref}{}{\hyperref[#1]%
  {\zhnumber{\getrefnumber{#1}}}}}

\RequirePackage{xcolor}
\definecolor{ucascitecolor}{rgb}{0.0, 0.50, 0.0}
\definecolor{ucaslinkcolor}{rgb}{0.75, 0.0, 0.0}
\definecolor{ucasurlcolor}{rgb}{0.0, 0.0, 0.75}
\hypersetup{%
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=true,
  citecolor=ucascitecolor,
  linkcolor=ucaslinkcolor,
  urlcolor=ucasurlcolor,
  plainpages=false,
  % pdfpagelabels,
  pdfborder=0 0 0}
\urlstyle{same}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  % \pagenumbering{Roman}
  \pagenumbering{alph}
  \pagestyle{ucas@empty}}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{ucas@headings}}
  %#\ifucas@bachelor\pagestyle{ucas@plain}\else\pagestyle{ucas@headings}\fi}
\renewcommand\backmatter{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{ucas@plain}
  \@mainmattertrue}
\newlength\ucas@linespace
\newcommand{\ucas@choosefont}[2]{%
   \setlength{\ucas@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\ucas@linespace}\selectfont}
\def\ucas@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \ucas@choosefont{##1}{#2}}}
\ucas@define@fontsize{chuhao}{42bp}
\ucas@define@fontsize{xiaochu}{36bp}
\ucas@define@fontsize{yihao}{26bp}
\ucas@define@fontsize{xiaoyi}{24bp}
\ucas@define@fontsize{erhao}{22bp}
\ucas@define@fontsize{xiaoer}{18bp}
\ucas@define@fontsize{sanhao}{16bp}
\ucas@define@fontsize{xiaosan}{15bp}
\ucas@define@fontsize{sihao}{14bp}
\ucas@define@fontsize{banxiaosi}{13bp}
\ucas@define@fontsize{xiaosi}{12bp}
\ucas@define@fontsize{dawu}{11bp}
\ucas@define@fontsize{wuhao}{10.5bp}
\ucas@define@fontsize{xiaowu}{9bp}
\ucas@define@fontsize{liuhao}{7.5bp}
\ucas@define@fontsize{xiaoliu}{6.5bp}
\ucas@define@fontsize{qihao}{5.5bp}
\ucas@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
      \@percentchar\@percentchar BeginPaperSize: a4
      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-6.1cm}
\setlength{\topmargin}{3.05cm-1in}
\setlength{\oddsidemargin}{3.1cm-1in}
\setlength{\footskip}{0.8cm}
\setlength{\headsep}{0.4cm}
\addtolength{\textheight}{-7.25cm}

%\setlength\marginparwidth{0cm}
%\setlength\marginparsep{0cm}
%\addtolength{\textwidth}{-5cm}
%\setlength{\topmargin}{1.75cm-1in}
%\setlength{\oddsidemargin}{2.5cm-1in}
%\setlength{\footskip}{0.6cm}
%\setlength{\headsep}{0.5cm}
%\addtolength{\textheight}{-5.25cm}

\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\headheight}{20pt}
\setlength{\topskip}{0pt}
\setlength{\skip\footins}{15pt}
\let\ucas@cleardoublepage\cleardoublepage
\newcommand{\ucas@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\ucas@cleardoublepage}}
\let\cleardoublepage\ucas@clearemptydoublepage
\def\ps@ucas@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@ucas@foot{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\xiaowu\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}
\def\ps@ucas@plain{%
  \def\@oddhead{\vbox to\headheight{%
    % \hb@xt@\textwidth{\hfill\xiaowu\songti\ucas@ctitle：\leftmark\hfill}%
    \hb@xt@\textwidth{\hfill\xiaowu\songti \leftmark\hfill}%奇数页只显示该章节题目@nfx
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@oddfoot{\hfil\xiaowu\thepage\hfil}%
  \def\@evenhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\xiaowu\songti%
       \hfill \ucas@ctitle \hfill}%
       % \hfill \ucas@ctitle：\leftmark \hfill}%偶数页只显示论文题目@nfx
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@oddfoot{\hfil\xiaowu\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}
\def\ps@ucas@headings{%
  \def\@oddhead{\vbox to\headheight{%
    \hb@xt@\textwidth{\hfill\xiaowu\songti\leftmark\hfill}%
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@evenhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\xiaowu\songti%
       \hfill \headingtitle \hfill}%  %正文页眉偶数页显示内容
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  % \def\@oddfoot{\hfil\xiaowu\thepage\hfil}
  % \let\@evenfoot=\@oddfoot
  \def\@oddfoot{\hfill\xiaowu\thepage}%页码奇数页也就是右页，右下角显示@nfx
  \def\@evenfoot{\xiaowu\thepage\hfill}%页码偶数页左下角对齐@nfx
  }


\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
\def\ucas@item@space{%
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc}
\def\ucas@textcircled#1{%
  \ifnum \value{#1} <10 \textcircled{\xiaoliu\arabic{#1}}
  \else\ifnum \value{#1} <100 \textcircled{\qihao\arabic{#1}}\fi
  \fi}

\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\ucas@footnotesize\footnotesize
\renewcommand\footnotesize{\ucas@footnotesize\xiaowu[1.5]}
\def\@makefnmark{\textsuperscript{\hbox{\normalfont\@thefnmark}}}
\long\def\@makefntext#1{
  \bgroup
    \newbox\ucas@tempboxa
    \setbox\ucas@tempboxa\hbox{%
      \hb@xt@ 2em{\@thefnmark\hss}}
    \leftmargin\wd\ucas@tempboxa
    \rightmargin\z@
    \linewidth \columnwidth
    \advance \linewidth -\leftmargin
    \parshape \@ne \leftmargin \linewidth
    \footnotesize
    \@setpar{{\@@par}}%
    \leavevmode
    \llap{\box\ucas@tempboxa}%
    #1
  \par\egroup}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\ucas@make@df@tag@@\make@df@tag@@@}
\def\ucas@make@df@tag@@#1{\gdef\df@tag{\ucas@maketag{#1}\def\@currentlabel{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\def\ucas@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\gdef\@endtrivlist#1{%  % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
    \ifdim\lastskip >\z@ #1\unskip \par
      \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
    \ifdim\lastskip >\z@
       \@tempskipa\lastskip \vskip -\lastskip
      \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
      \vskip\@tempskipa
    \fi
    \@endparenv
  \fi #1}
\theorembodyfont{\kaishu }
\theoremheaderfont{\heiti }
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\ucas@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionLabelFormat{ucas}{{\dawu[1.5]\songti #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{ucas}{\hspace{1em}}
\DeclareCaptionFont{ucas}{\dawu[1.5]}
\captionsetup{labelformat=ucas,labelsep=ucas,font=ucas}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=ucas,skip=6bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\ucas@LT@array\LT@array
\def\LT@array{\dawu[1.5]\ucas@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\ifucas@arialtitle
  \def\ucas@title@font{\sffamily}
\fi
\renewcommand\chapter{%
  \cleardoublepage%
  % \thispagestyle{ucas@foot}% 设定每个小节的首页只显示页脚页码@nfx
  \global\@topnum\z@%
  \@afterindenttrue%
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
     \refstepcounter{chapter}%
     \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}%TODO: shit
   \else
     \addcontentsline{toc}{chapter}{#1}%
   \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}}
\def\@makechapterhead#1{%
  % \vspace*{17bp}
  \vspace*{24bp}%段前24磅@nfx
  {\parindent \z@ \centering
    \csname ucas@title@font\endcsname\heiti\sihao[2.41]
    \ifnum \c@secnumdepth >\m@ne
      \@chapapp\hskip1em
    \fi
    #1\par\nobreak
    \vskip 18bp}}%段后18磅@nfx
    % \vskip 16.5bp}}
\def\@schapter#1{%
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{17bp}%
  {\parindent \z@ \centering
   \csname ucas@title@font\endcsname\heiti\sihao[2.41]
     \def\@tempa{#1}
     \def\@tempb{\eabstractname}
     \ifx\@tempa\@tempb\fi

   \interlinepenalty\@M
   #1\par\nobreak
    \vskip 16.5bp}}
\newcounter{ucas@bookmark}
\def\ucas@chapter*{%
  \@ifnextchar [ % ]
    {\ucas@@chapter}
    {\ucas@@chapter@}}
\def\ucas@@chapter@#1{\ucas@@chapter[#1]{#1}}
\def\ucas@@chapter[#1]#2{%
  \@ifnextchar [ % ]
    {\ucas@@@chapter[#1]{#2}}
    {\ucas@@@chapter[#1]{#2}[]}}
\def\ucas@@@chapter[#1]#2[#3]{%
  \cleardoublepage
  \phantomsection
  \def\@tmpa{#1}
  \def\@tmpb{#3}
  \ifx\@tmpa\@empty
    \ifx\@tmpb\@empty
      \addtocounter{ucas@bookmark}\@ne
      \pdfbookmark[0]{#2}{ucaschapter.\theucas@bookmark}
    \else
      \addtocounter{ucas@bookmark}\@ne
      \pdfbookmark[0]{#3}{ucaschapter.\theucas@bookmark}
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \chapter*{#2}
  \ifx\@tmpb\@empty
    \@mkboth{#2}{#2}
  \else
    \@mkboth{#3}{#3}
  \fi}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                     {8bp\@plus 1ex \@minus .2ex}%
                     {8bp \@plus .2ex}%
                     {\csname ucas@title@font\endcsname\heiti\xiaosi[1.75]}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                        {4bp\@plus 1ex \@minus .2ex}%
                        {4bp \@plus .2ex}%
                        {\csname ucas@title@font\endcsname\heiti\xiaosi[1.75]}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                           {4bp\@plus 1ex \@minus .2ex}%
                           {4bp \@plus .2ex}%
                           {\csname ucas@title@font\endcsname\heiti\xiaosi[1.75]}}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\renewcommand\tableofcontents{%
  \cleardoublepage
  \ucas@chapter*{\contentsname}[\scontentsname]
  \xiaosi[1.5]\@starttoc{toc}\normalsize}
\ifucas@arialtoc
  \def\ucas@toc@font{\sffamily}
\fi
\def\@pnumwidth{2em} % 这个参数没用了
\def\@tocrmarg{2em}
\def\@dotsep{1} % 目录点间的距离
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\csname ucas@toc@font\endcsname #4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #5}%
    \par\penalty\@highpenalty}%
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 8bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\csname ucas@toc@font\endcsname\heiti\xiaosi #1} % numberline is called here, and it uses \@tempdima
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\vspace*{1ex}\@dottedtocline{1}{1.2em}{2.1em}}
\renewcommand*\l@subsection{\vspace*{1ex}\@dottedtocline{2}{2em}{3em}}
%%\renewcommand*\l@subsubsection{\vspace*{1ex}\@dottedtocline{3}{3.5em}{3.8em}}
\def\ucas@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname ucas@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\ucas@define@term{catalognumber}
\ucas@define@term{udc}
\ucas@define@term{id}
\ucas@define@term{secretcontent}
\ucas@define@term{ctitle}
\ucas@define@term{cdegree}
\newcommand\cdepartment[2][]{\def\ucas@cdepartment@short{#1}\def\ucas@cdepartment{#2}}
\def\caffil{\cdepartment} % todo: for compatibility
\def\ucas@cdepartment@short{}
\def\ucas@cdepartment{}
\ucas@define@term{cmajor}
\def\csubject{\cmajor} % todo: for compatibility
\ucas@define@term{cfirstdiscipline}
\ucas@define@term{cseconddiscipline}
\ucas@define@term{cauthor}
\ucas@define@term{csupervisor}
\ucas@define@term{csupervisortitle}
\ucas@define@term{csupervisorplace}
\ucas@define@term{cassosupervisor}
\ucas@define@term{ccosupervisor}

\ucas@define@term{cdate}
\ucas@define@term{etitle}
\ucas@define@term{edegree}
\ucas@define@term{edepartment}
\def\eaffil{\edepartment} % todo: for compability

\ucas@define@term{eauthor}
\ucas@define@term{emajor}
\ucas@define@term{esupervisor}
\ucas@define@term{edepartmnent}
\ucas@define@term{edate}
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\ucas@@cabstract}[1]{\long\gdef\ucas@cabstract{#1}}
\newenvironment{cabstract}{\collect@body\ucas@@cabstract}{}
\newcommand{\ucas@@eabstract}[1]{\long\gdef\ucas@eabstract{#1}}
\newenvironment{eabstract}{\collect@body\ucas@@eabstract}{}
\def\ucas@parse@keywords#1{
  \expandafter\gdef\csname ucas@#1\endcsname{} % todo: need or not?
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname ucas@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname ucas@#1\endcsname{\ignorespaces\csname ucas@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname ucas@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\ucas@parse@keywords{ckeywords}
\ucas@parse@keywords{ekeywords}
\newcommand\ucas@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newlength{\ucas@title@width}
\def\ucas@put@title#1{\makebox[\ucas@title@width][s]{#1}}
\def\ucas@first@titlepage{%
  \ucas@first@titlepage@other}
\newcommand*{\getcmlength}[1]{\strip@pt\dimexpr0.035146\dimexpr#1\relax\relax}
\newcommand{\ucas@first@titlepage@other}{
  \begin{center}
    \vspace*{0cm}
    \parbox[t][1cm][t]{\textwidth}{%
      \ifucas@secret\hspace{23em}{\sihao[1]\songti 密级：\underline{\makebox[6em]{\ucas@secretcontent}}}\fi}
      \begin{figure}[H]
        \centering
        \includegraphics[width=128mm,height=21.7mm]{ucaslogo}
      \end{figure}
      \parbox[t][8cm][t]{\paperwidth-8cm}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
      \yihao\heiti\ucas@apply
      \par\vskip 40bp
      \xiaosan\heiti\bfseries\underline{\makebox[23em]{\ucas@ctitle}}%加下划线的小三黑体加粗@nfx
      \end{center}}

\parbox[t][8cm][t]{\textwidth}{{\sihao\songti\bfseries %加粗@nfx
\begin{center}
\setlength{\ucas@title@width}{4em}
\setlength{\extrarowheight}{2.5ex}
\begin{tabular}{ll}
\ucas@author@title\ucas@title@sep     &\underline{\makebox[23em]{\ucas@cauthor}}\\

\ucas@supervisor@title\ucas@title@sep     &\underline{\makebox[23em]{\ucas@csupervisor\hspace{1em}\ucas@csupervisortitle}}\\

&\underline{\makebox[23em]{\ucas@csupervisorplace}}\\

\ucas@degree@title\ucas@title@sep     &\underline{\makebox[23em]{\ucas@cdegree}}\\

\ucas@major@title\ucas@title@sep     &\underline{\makebox[23em]{\ucas@cmajor}}\\

\ucas@put@title{\ucas@department@title}\ucas@title@sep     &\underline{\makebox[23em]{\ucas@cdepartment}}\\

\end{tabular}
\end{center}}}
  \begin{center}
    {\vskip 3ex\sihao \songti \bfseries \ucas@cdate}
  \end{center}
\end{center}} % end of titlepage
\newcommand{\ucas@engcover}{%
  \def\ucas@master@art{Master of Arts}
  \def\ucas@master@sci{Master of Science}
  \def\ucas@doctor@phi{Doctor of Philosophy}
  \newif\ifucas@professional
  \ucas@professionalfalse

  \begin{center}
    \vspace*{0.2cm}
    \parbox[t][3.2cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \xiaosan\rmfamily\bfseries\ucas@etitle
      \end{center}}
    % \parbox[t][7cm][c]{\paperwidth-7.2cm}{
    %   \renewcommand{\baselinestretch}{1.3}
    %   \begin{center}
    %     \sanhao\rmfamily By\\[3bp]
    %     \rmfamily\ucas@eauthor
    %   \end{center}}
    \par\vspace{0.9cm}
    \parbox[t][8cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5} %设置段内行距为1.5倍@nfx
      \begin{center}
        \sihao
        \bfseries %字体加粗@nfx
        A \ifucas@master Thesis \else dissertation \fi submitted to\\
        \ucas@schoolename\\
        in partial fulfillment of the requirement\\
        for the degree of\\
        \ucas@edegree \\
        in \ucas@emajor
      \end{center}}

    \parbox[t][2cm][c]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \bfseries
        \sanhao\rmfamily By\\[3bp]
        \sihao\rmfamily\ucas@eauthor\\
        {\sihao\rmfamily Supervisor: \ucas@esupervisor}
      \end{center}}


    \par\vspace{0.9cm}
    \vskip2cm
    \parbox[t][2cm][b]{\paperwidth-7.2cm}{
    \renewcommand{\baselinestretch}{1.3}
    \begin{center}
      \bfseries
      \sihao\ucas@edepartment\par\vspace*{1ex}
      \sihao\ucas@edate
    \end{center}}
  \end{center}}
\newcommand{\ucas@declare@mk}{%
\begin{center}\xiaoer\heiti{\ucas@declarename}\end{center}
  \vskip25pt\xiaosi[2.03]\par
  \ucas@declaretext\par
  \vskip1cm
  \xiaosi
  \noindent\ucas@signature\hspace{11em}\ucas@backdate
}
\newcommand{\ucas@authorization@mk}{%
  %\vspace*{0.1cm} % shit code!
  \begin{center}\xiaoer\heiti{\ucas@authtitle}\end{center}
  \vskip25pt\xiaosi[2.03]\par
  \ucas@authorization\par
  \ucas@authorizationaddon\par
  \vskip1cm
  \xiaosi
  \noindent\ucas@authorsig\hspace{11.8em}\ucas@teachersig\
  \newline
  \vskip1cm
  \noindent\ucas@frontdate \hspace{6.3em} \ucas@frontdate
  }
\newcommand{\makecover}{
  \phantomsection
  \pdfbookmark[-1]{\ucas@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \ucas@first@titlepage
\cleardoublepage
\clearpage\ucas@engcover

      \cleardoublepage%
      \begin{list}{}{%
        \topsep\z@%
        \listparindent\parindent%
        \parsep\parskip%
        \setlength{\itemsep}{3cm}
        \setlength{\leftmargin}{0.9mm}%
        \setlength{\rightmargin}{0.9mm}}%
      \item[]\ucas@declare@mk
      \item[]\ucas@authorization@mk%
      \end{list}%
  \end{titlepage}
  \normalsize
  \ucas@makeabstract
  \let\@tabular\ucas@tabular}
\newcommand{\ucas@makeabstract}{%
  \cleardoublepage
  \ucas@chapter*{\cabstractname}[\csabstractname] % no tocline
  \pagestyle{ucas@plain}
  \pagenumbering{Roman}
  \ucas@cabstract
  \vskip12bp
  \setbox0=\hbox{{\songti\bfseries\ucas@ckeywords@title}}%中文摘要中关键字使用宋体加粗@nfx
  \noindent\hangindent\wd0\hangafter1
    \box0\ucas@ckeywords
  \cleardoublepage
  \ucas@chapter*[]{\eabstractname}[\eabstractname] % no tocline
  %\hspace{0em}
  \ucas@eabstract
  \vskip12bp
  \setbox0=\hbox{\textbf{KeyWords:\enskip}}%英文关键字@nfx
  \noindent
    \box0\ucas@ekeywords}
\newenvironment{denotation}[1][2.5cm]{
  \ucas@chapter*[]{\ucas@denotation@name} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}


\newenvironment{ack}{%
    \cleardoublepage
    \ucas@chapter*{\ucas@ackname}[\ucas@sackname]
  }

\def\ucas@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname \hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\ucas@listof#1{% #1: float type
  \cleardoublepage
  \@ifstar
    {\ucas@chapter*[]{\csname list#1name\endcsname}\ucas@starttoc{#1}}
    {\ucas@chapter*{\csname list#1name\endcsname}\ucas@starttoc{#1}}}
\renewcommand\listoffigures{\ucas@listof{figure}}
\renewcommand*\l@figure{\vspace*{1ex}\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\ucas@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\ucas@listof{equation}}
\let\l@equation\l@figure
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewcommand{\cite}[1]{{\onlinecite{#1}}}
\def\ucasdot{\unskip.}
\def\ucasmasterbib{[硕士学位论文]}
\def\ucasphdbib{[博士学位论文]}
\renewenvironment{thebibliography}[1]{%
   \ucas@chapter*{\bibname}%
   \wuhao[1.5]
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{0.4em}
         \setlength{\itemindent}{0pt}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         % \addtolength{\itemsep}{-0.7em} %设置参考文献中每一项的间隔@nfx
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
\let\ucas@appendix\appendix
\renewenvironment{appendix}{%
  \ucas@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
  %\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
  }{}
\newenvironment{resume}[1][\ucas@resume@title]{%
  \cleardoublepage
  \ucas@chapter*{#1}}{}
\newcommand{\resumeitem}[1]{\vspace{2.5em}{\noindent\xiaosi\heiti 【{#1}】 \par}}
\newcommand{\spine}[1][\ucas@ctitle]{
  \newpage\thispagestyle{empty}\heiti\xiaosi
  \parbox[t][23cm][t]{1em}{#1\vfill\ucas@cauthor\vfill 中国科学院大学}}
\iffalse
\newcommand{\bs}{\symbol{'134}}%Print backslash
\newcommand{\cih}[1]{%
  \index{commands!#1@\texttt{\bs#1}}%
  \index{#1@\texttt{\hspace*{-1.2ex}\bs #1}}}
\newcommand{\ci}[1]{\cih{#1}\texttt{\bs#1}}
\newcommand{\pai}[1]{%
  \index{packages!#1@\textsf{#1}}%
  \index{#1@\textsf{#1}}%
  \textsf{#1}}
\newcommand{\ei}[1]{%
  \index{environments!\texttt{#1}}%
  \index{#1@\texttt{#1}}%
  \texttt{#1}}
\newcommand{\wi}[1]{\index{#1}#1}
\fi
\AtEndOfClass{\input{ucasthesis.cfg}}
\def\ucas@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\ucas@ctitle},
    pdfauthor={\ucas@cauthor},
    pdfsubject={\ucas@cdegree},
    pdfkeywords={\ucas@ckeywords},
    pdfcreator={\ucas@cauthor},
    pdfproducer={\ucasthesis}}}
\AtEndOfClass{\sloppy\ucas@item@space}
\endinput
%%
%% End of file `ucasthesis.cls'.
