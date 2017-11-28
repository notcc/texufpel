%==============================================================================
% Identificação
%==============================================================================
\def\currversion{4/3/2017}

\typeout{^^J^^J
--------------------------------------------------^^J
CLASSE texufpel^^J
Formatação de Documentos LaTeX da UFPEL^^J
--------------------------------------------------^^J
Desenvolvida a partir da Classe IIUFRGS^^J
por Marilton S. de Aguiar (marilton@inf.ufpel.edu.br)^^J
--------------------------------------------------^^J
Versão: \currversion^^J
--------------------------------------------------^^J^^J}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texufpel}[\currversion]

%==============================================================================
% Declaração de opções
%==============================================================================

\newcommand{\bibliotecario}[1]{\gdef\@nomebibliotecario{#1}}
\newcommand{\cipdata}[2]{\gdef\@codigocip{#1}\gdef\@codigocdd{#2}}

\newcommand{\universidade}[1]{\gdef\@universidade{#1}}
\universidade{Universidade Federal de Pelotas}

\newcommand{\unidade}[1]{\gdef\@unidade{#1}}
\newcommand{\programa}[1]{\gdef\@programa{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\nomecurso}[1]{\gdef\@nomecurso{#1}}
\newcommand{\titulocurso}[1]{\gdef\@titulocurso{#1}}

\newcommand{\documento}[1]{\gdef\@documento{#1}}
\newcommand{\tipodocumento}[1]{\gdef\@tipodocumento{#1}}
\newcommand{\descricaodocumento}[1]{\gdef\@descricaodocumento{#1}}

\DeclareOption{tcc}{
\documento{Trabalho de Conclus\~ao de Curso}
\tipodocumento{Trabalho de Conclus\~ao de Curso (\@nomecurso) -- \@unidade}
\descricaodocumento{Trabalho de Conclus\~ao de Curso apresentado ao \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso}
}

\DeclareOption{tcc-proposta}{
\tipodocumento{Proposta de Trabalho de Conclus\~ao de Curso (\@nomecurso) -- \@unidade}
\descricaodocumento{Proposta de Trabalho de Conclus\~ao de Curso apresentada ao \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso}
}

\DeclareOption{diss}{
\documento{Disserta\c c\~ao}
\tipodocumento{Disserta\c c\~ao (Mestrado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Disserta{\c{c}}{\~a}o apresentada ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso}
}

\DeclareOption{diss-proposta}{
\tipodocumento{Proposta de Disserta\c c\~ao (Mestrado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Disserta{\c{c}}{\~a}o apresentada ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso}
}

\DeclareOption{tese}{
\documento{Tese}
\tipodocumento{Tese (Doutorado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Tese apresentada ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso}
}

\DeclareOption{tese-proposta}{
\tipodocumento{Proposta de Tese (Doutorado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Tese apresentada ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso}
}

\DeclareOption{ti}{
\tipodocumento{Trabalho Individual (Mestrado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso}
}

\DeclareOption{tid}{
\tipodocumento{Trabalho Individual (Doutorado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso}
}

\newcommand{\capa}[1]{\gdef\@capa{#1}}
\DeclareOption{capa}{\capa{1}}

\newcommand{\nocipinfo}[1]{\gdef\@nocipinfo{#1}}
\DeclareOption{nocipinfo}{\nocipinfo{1}}

\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\relax

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
\LoadClass[12pt,a4paper,oneside]{report}

\RequirePackage[english,brazilian]{babel}
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{natbib}
\RequirePackage{chngcntr}
\RequirePackage{eso-pic}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage[labelsep=endash,hang]{caption}
\RequirePackage[T1]{fontenc}

\geometry{top=3cm,right=2cm,left=3cm,bottom=2cm}

\definecolor{laranjaufpel}{rgb}{1,0.6,0}
\definecolor{verdeufpel}{rgb}{0.09,0.7,0.44}
\definecolor{azulufpel}{rgb}{0.07,0.49,0.72}
\definecolor{cinzaufpel}{rgb}{0.85,0.85,0.85}

%
% definições para textos em português
%
\@namedef{captionsbrazilian}{%
  \def\bibname{Refer{\^e}ncias}%
  \def\abstractname{Resumo}%
  \def\appendixname{Ap{\^e}ndice}%
  \def\contentsname{Sum{\'a}rio}%
  \def\listfigurename{Lista de Figuras}%
  \def\listtablename{Lista de Tabelas}%
  \def\figurename{Figura}%
  \def\tablename{Tabela}%
  \def\advisorname{Orientador}%
  \def\coadvisorname{Coorientador}%
  \def\collaboratorname{Colaborador}%
  \def\listabbrvname{Lista de Abreviaturas e Siglas}%
  \def\listsymbolname{Lista de S{\'\i}mbolos}%
  \def\annexname{Anexo}%
  \def\keywordsname{Palavras-Chave}%
}

\@namedef{datebrazilian}{%
  \def\monthname{%
    \ifcase\month\or%
    janeiro\or fevereiro\or mar{\c{c}}o\or abril\or maio\or junho\or
    julho\or agosto\or setembro\or outubro\or novembro\or dezembro%
    \fi%
  }%
  \def\ei@date{\@publyear}%
  % \def\ei@date{\@publmonth\ de~\@publyear}%
}

%
% definições para textos em inglês
%
\@namedef{captionsenglish}{%
  \def\bibname{References}%
  \def\abstractname{Abstract}%
  \def\appendixname{Appendix}%
  \def\contentsname{Contents}%
  \def\listfigurename{List of Figures}%
  \def\listtablename{List of Tables}%
  \def\figurename{Figure}%
  \def\tablename{Table}%
  \def\advisorname{Advisor}%
  \def\coadvisorname{Coadvisor}%
  \def\collaboratorname{Collaborator}%
  \def\listabbrvname{List of Abbreviations and Acronyms}%
  \def\listsymbolname{List of Symbols}%
  \def\annexname{Annex}%
  \def\keywordsname{Keywords}%
}

\@namedef{dateenglish}{%
  \def\monthname{%
    \ifcase\month\or%
    January\or February\or March\or April\or May\or June\or July\or
    August\or September\or October\or November\or December%
    \fi%
  }%
  \def\ei@date{\@publyear}%
  % \def\ei@date{\@publmonth~\@publyear}%
}

\if@english%
\selectlanguage{english}%
\AtBeginDocument{\selectlanguage{english}}%
\fi

%==============================================================================
% O uso de fonte Arial, 12 pt, é mandatório
%==============================================================================
\renewcommand*\familydefault{\sfdefault}%
\renewcommand{\rmdefault}{phv}%
\renewcommand{\sfdefault}{phv}

%==============================================================================
% Numeração das páginas
%==============================================================================
\def\ps@texufpel{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@oddhead{\hspace*{\fill}{\small\thepage}}%
  \def\@evenhead{\hspace*{\fill}{\small\thepage}}%
} 

\pagestyle{empty}%
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ei@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ei@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ei@authorcount}\endcsname{#2 #1}
}

\newcounter{ei@advisorcount}
\DeclareRobustCommand{\advisor}[3][]{
        \addtocounter{ei@advisorcount}{1}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@coadvisorcount}
\DeclareRobustCommand{\coadvisor}[3][]{
        \addtocounter{ei@coadvisorcount}{1}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@collaboratorcount}
\DeclareRobustCommand{\collaborator}[3][]{
        \addtocounter{ei@collaboratorcount}{1}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}last\endcsname{#2}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}first\endcsname{#3}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}\endcsname{#1~#3 #2}
}


%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcounter{kwcountereng}
\newcommand{\keywordeng}[1]{
        \addtocounter{kwcountereng}{1}
        \expandafter\gdef\csname keyweng\alph{kwcountereng}\endcsname{#1}
}

\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}

\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter \keywa}%
        \@ifundefined{keywb}{}{; \keywb}%
        \@ifundefined{keywc}{}{; \keywc}%
        \@ifundefined{keywd}{}{; \keywd}%
        \@ifundefined{keywe}{}{; \keywe}%
        \@ifundefined{keywf}{}{; \keywf}%
        \@ifundefined{keywg}{}{; \keywg}%
        \@ifundefined{keywh}{}{; \keywh}%
        \@ifundefined{keywi}{}{; \keywi}%
        \@ifundefined{keywj}{}{; \keywj}%
}


\newcommand{\@abstractkweng}{%
        \@ifundefined{keywenga}{}{\expandafter \keywenga}%
        \@ifundefined{keywengb}{}{; \keywengb}%
        \@ifundefined{keywengc}{}{; \keywengc}%
        \@ifundefined{keywengd}{}{; \keywengd}%
        \@ifundefined{keywenge}{}{; \keywenge}%
        \@ifundefined{keywengf}{}{; \keywengf}%
        \@ifundefined{keywengg}{}{; \keywengg}%
        \@ifundefined{keywengh}{}{; \keywengh}%
        \@ifundefined{keywengi}{}{; \keywengi}%
        \@ifundefined{keywengj}{}{; \keywengj}%
}


%==============================================================================
% Redefinição da data (para ter mês e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}

%==============================================================================
% Definição padrão da folha de rosto.
% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluídos com a classe.
%==============================================================================

\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}

\location{Pelotas}{RS}

\renewcommand{\maketitle}{
\@ifundefined{@capa}{%
\begin{titlepage}
\thetitlepage
\end{titlepage}
\clearpage
\setcounter{page}{1}
}{%
\begin{titlepage}
\thecoverpage
\newpage
\thetitlepage
\end{titlepage}
\clearpage
\setcounter{page}{2}
}
}

\newcommand{\thecoverpage}{%
  \onehalfspacing%
  \noindent%
    \parbox[b]{\textwidth}{%
      \centering%
      \vskip 1cm%
      \MakeUppercase{\textbf{\@universidade}}\\%
      \textbf{\@unidade}\\%
      \@ifundefined{@nomecurso}{\@programa}{\textbf{Curso de \@nomecurso}}\\%
      \vskip 1cm%
      \includegraphics[width=3cm]{ufpelw}
      \vskip 1cm%
      \textbf{\@documento}\\%
      \vskip 1cm%
    }%
  \vskip 3cm%
  \noindent%
    \parbox[b]{\textwidth}{%
      \centering%
      \vskip .5cm%
      \textbf{\@title}%
      \vskip .5cm%
    }%
  \vskip 3cm%
  \noindent%
    \parbox[b]{\textwidth}{%
      \centering%
      \vskip .5cm%
      \textbf{\@authora\\
      \@ifundefined{@authorb}{}{\@authorb\\}%
      \@ifundefined{@authorc}{}{\@authorc\\}%
      \@ifundefined{@authord}{}{\@authord\\}}%
      \vskip .5cm%
    }%
  \vfill%
  \noindent%
    \parbox[b]{\textwidth}{%
      \centering%
      \vskip .1cm%
      \textbf{\@city, \ei@date}%
      \vskip .1cm%
    }%
}

\newcommand{\thetitlepage}{%
  \noindent%
  \parbox[b]{\textwidth}{%
    \centering%
    \textbf{\@authora}\\
    \@ifundefined{@authorb}{}{\textbf{\@authorb}\\}%
    \@ifundefined{@authorc}{}{\textbf{\@authorc}\\}%
    \@ifundefined{@authord}{}{\textbf{\@authord}\\}%
    \vskip 5cm%
    {\textbf{\@title}}%
  }
  \vskip 8cm%
  %\@ifundefined{titlepagespecificinfo}{}{%
    \hspace*{\fill}\makebox[.5\textwidth][l]{%
      \parbox[b]{8.5cm}{%
        \singlespacing%
        \begin{hyphenrules}{nohyphenation}%
        \@descricaodocumento%
      	\end{hyphenrules}%
      }%
    }%
    \vfill%
  %}%
  \vfill%
  \@ifundefined{@advisora}{}{%
  \parbox[b]{\textwidth}{%
    \onehalfspacing%
    \centering%
      \begin{tabular}{rp{9cm}}%
        \@ifundefined{@advisora}{}{
          \@ifundefined{@advisorb}{\advisorname:}{\advisorname es:} &
          \@ifundefined{@advisora}{}{\@advisora\\}
          \@ifundefined{@advisorb}{}{\ &}
          \@ifundefined{@advisorb}{}{\@advisorb\\}
          \@ifundefined{@advisorc}{}{\ &}
          \@ifundefined{@advisorc}{}{\@advisorc\\}
          \@ifundefined{@advisord}{}{\ &}
          \@ifundefined{@advisord}{}{\@advisord\\}}
        \@ifundefined{@coadvisora}{}{
	\@ifundefined{@coadvisorb}{\coadvisorname:}{\coadvisorname es:} &
	\@ifundefined{@coadvisora}{}{\@coadvisora\\}
          \@ifundefined{@coadvisorb}{}{\ &}
          \@ifundefined{@coadvisorb}{}{\@coadvisorb\\}
          \@ifundefined{@coadvisorc}{}{\ &}
          \@ifundefined{@coadvisorc}{}{\@coadvisorc\\}
          \@ifundefined{@coadvisord}{}{\ &}
          \@ifundefined{@coadvisord}{}{\@coadvisord\\}}
        \@ifundefined{@collaboratora}{}{
	\@ifundefined{@collaboratorb}{\collaboratorname:}{\collaboratorname es:} &
	\@ifundefined{@collaboratora}{}{\@collaboratora\\}
          \@ifundefined{@collaboratorb}{}{\ &}
          \@ifundefined{@collaboratorb}{}{\@collaboratorb\\}
          \@ifundefined{@collaboratorc}{}{\ &}
          \@ifundefined{@collaboratorc}{}{\@collaboratorc\\}
          \@ifundefined{@collaboratord}{}{\ &}
          \@ifundefined{@collaboratord}{}{\@collaboratord\\}}
        \end{tabular}
      }%
    \vfill%
  }%
  \centerline{\@city, \ei@date}%
}

%==============================================================================
% Ajuste do sumário (nada indentado) 
%==============================================================================
\newlength{\ei@chapnumindent}\setlength{\ei@chapnumindent}{1.8em}

\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries\sffamily
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        \@dottedtocline{0}{0em}{\ei@chapnumindent}{\uppercase{#1}}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]
              {\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Definição das listas de abreviaturas e siglas e de símbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
  \chapter*{\listabbrvname}
  \begin{list}{\textbf{??}}{%
      \settowidth{\labelwidth}{#1}%
      \setlength{\labelsep}{1em}%
      \setlength{\itemindent}{0mm}%
      \setlength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\rightmargin}{0mm}%
      \setlength{\itemsep}{.1\baselineskip}%
      \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
  }{
  \end{list}
} 

\newenvironment{listofsymbols}[1]{
  \chapter*{\listsymbolname}
  \begin{list}{\textbf{??}}{%
      \settowidth{\labelwidth}{#1}%
      \setlength{\labelsep}{1em}%
      \setlength{\itemindent}{0mm}%
      \setlength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\rightmargin}{0mm}%
      \setlength{\itemsep}{.1\baselineskip}%
      \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
  }{
  \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================
\renewenvironment{abstract}{%
  \chapter*{\abstractname}
  \@ifundefined{@nocipinfo}{
  \noindent{\MakeUppercase{\@authoralast},
    \@authorafirst. \textbf{\@title}. {\@publyear}. \pageref{LastPage}~f. \@tipodocumento,
    \@universidade, \@city, \@publyear.}\\~\\}{}
}{%
  \par\vfill
  \noindent\textbf{\keywordsname:} \MakeLowercase{\@abstractkw}
}

\newenvironment{englishabstract}[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  %\gdef\@englishkeywords{#2}%
  \gdef\@englishtitle{{#1}}%
  \iflanguage{english}{
    \begin{otherlanguage}{brazilian}
    }{
      \begin{otherlanguage}{english}
      }

      \chapter*{\abstractname}
      \noindent{\MakeUppercase{\@authoralast},
        \@authorafirst. \textbf{\@englishtitle}. {\@publyear}. \pageref{LastPage}~f. \@tipodocumento,
        \@universidade, \@city, \@publyear.}\\~\\
    }{
      \par\vfill
      \noindent\textbf{\keywordsname:} \MakeLowercase{\@abstractkweng}
    \end{otherlanguage}
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\ei@chapterfont}{\@setfontsize\Large{16}{20}}
\def\@chapapp{}

\def\@chapter[#1]#2{%
	\onehalfspacing
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \pagestyle{texufpel}\let\ps@plain\ps@texufpel%
  \@makechapterhead{#2}\@afterheading%
}

\def\@makechapterhead#1{%
  \vspace*{90pt}%
  \reset@font\noindent{\ei@chapterfont\sffamily\textbf{\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}}\par}%
  \addvspace{42pt}%
  \thispagestyle{empty}%
}

\def\@schapter#1{%
  \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading%
}

\def\@makeschapterhead#1{%
  \vspace*{90pt}%
  \reset@font\centerline{\ei@chapterfont\sffamily\textbf{\MakeUppercase{#1}}}%
  \addvspace{42pt}%
}

\renewcommand{\appendix}[1][\appendixname]{%
  \setcounter{chapter}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \setcounter{tocdepth}{0}%
  \@captionlistingfalse%
  \gdef\@chapapp{\MakeUppercase{#1}\space}%
  \addtocontents{toc}{%
    \protect \settowidth{\ei@chapnumindent}{{\sffamily\textbf{\@chapapp}}}%
    \addtolength{\ei@chapnumindent}{1.8em}%
  }%
}

\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções
%==============================================================================
\setcounter{secnumdepth}{4} 

\renewcommand{\section}{%
  \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\large\bfseries}
} 

\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
} 

\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\itshape}
} 

\renewcommand{\paragraph}{%
  \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font} 
}

\renewcommand{\subparagraph}{%
  \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Formatação das legendas
%==============================================================================
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}

%==============================================================================
% Redefinição do conteúdo das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}

\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
\renewenvironment{quote}{%
  \small%
  \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
  }{%
  \end{list}
}

%==============================================================================
% Ajuste do formato das citações e referências
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

\newcommand{\folhadeaprovacao}{%
  \clearpage%
  \mbox{}%
  \vfill
  \begin{center}
    \textbf{Insira AQUI a folha de aprova\c c\~ao\\(ser\'a entregue ap\'os
      a banca)}
\end{center}
\vfill%
}

\newcommand{\fichacatalografica}{%
  \clearpage%
  \mbox{}%
  \vfill
  \begin{center}
    \textbf{Insira AQUI a ficha catalogr\'afica\\(solicitada na p\'agina da biblioteca)}
\end{center}
\vfill%
}

\newcommand{\makecover}{%
\singlespacing
\thispagestyle{empty}
\clearpage%
\mbox{}%
\vfill%
\fcolorbox{black}{white}{%
\parbox[b]{14cm}{%
\begin{minipage}{1.8cm}
\rotatebox{90}{~\parbox{12cm}{%
\begin{minipage}[c]{1cm}
\includegraphics[width=\columnwidth]{ufpelw}
\end{minipage}\hfill
\begin{minipage}[c]{10.5cm}
\textbf{\@title} -- \@authora
\end{minipage}
}~}
\end{minipage}
\begin{minipage}{12cm}
\noindent%
\fcolorbox{black}{laranjaufpel}{%
\parbox[b]{12cm}{%
\begin{center}
\MakeUppercase{\textbf{\@universidade}}\\%
\@unidade\\%
\@ifundefined{@nomecurso}{\@programa}{Curso de \@nomecurso}\\%
\includegraphics[width=3cm]{ufpel}\\
\@documento%
\end{center}
}%
}%
\vskip .2cm%
\noindent%
\fcolorbox{black}{azulufpel}{%
\parbox[c][2cm]{12cm}{%
\begin{center}
\vfill 
{\color{white}\textbf{\@title}}%
\vfill 
\end{center}
}%
}%
\vskip .2cm%
\noindent%
\fcolorbox{black}{verdeufpel}{%
\parbox[c][2cm]{12cm}{%
\begin{center}
{\textbf{\MakeUppercase{\@authora}\\
\@ifundefined{@authorb}{}{\MakeUppercase{\@authorb}\\}%
\@ifundefined{@authorc}{}{\MakeUppercase{\@authorc}\\}%
\@ifundefined{@authord}{}{\MakeUppercase{\@authord}\\}}}%
\end{center}
}%
}%
\vskip .2cm%
\noindent%
\fcolorbox{black}{cinzaufpel}{%
\parbox[b]{12cm}{%
\centering%
\@city, \ei@date%
}%
}%
\end{minipage}
}
}
\vfill
}


\newenvironment{agradecimentos}{%
  \chapter*{Agradecimentos}%
}{%
}

\newenvironment{dedicatoria}{%
  \clearpage%
%  \bf\textbf%
  \mbox{}\vfill\begin{flushright}%
  }{%
  \end{flushright}\vfill%
}

\newenvironment{epigrafe}{%
  \clearpage%
  \onehalfspacing%
  \em\small%
  \mbox{}\vfill\begin{flushright}%
  }{%
  \end{flushright}\vfill%
}

%ficha catalográfica
\newcommand{\makecippage}{%
\clearpage%
\mbox{}\vfill
\vskip  1cm
\begin{center}
\@universidade\ / Sistema de Bibliotecas\\[.1cm]
Cataloga\c c\~ao na Publica\c c\~ao\\[.3cm]
\texufpel@cipwindow
\vskip  1cm
Elaborada por \@nomebibliotecario\\
\end{center}
}

% definição do quadro
\def\texufpel@cipwindow{%
\framebox[140mm]{%
\begin{minipage}[t]{20mm}% 
\vskip .3cm
\@codigocip
\end{minipage}%
\begin{minipage}[t]{110mm}%
\vspace*{0.2ex}
\setlength{\parindent}{1.5em}%
\setlength{\parskip}{1.3ex}%
\noindent\@authoralast, \@authorafirst
\par \@title\ / \@authora; \@advisorafirst\ \@advisoralast, \MakeLowercase{\advisorname}\@ifundefined{@coadvisorafirst}{.}{; \@coadvisorafirst\ \@coadvisoralast, \MakeLowercase{\coadvisorname}.}  -- \@city, \@publyear.
\par \pageref{LastPage}~f.
\par \@tipodocumento, \@universidade, \@publyear.
\par \@cipkw I.~\@advisoralast, \@advisorafirst, orient.
\@ifundefined{@coadvisorafirst}{II.~T\'{\i}tulo.}{II.~\@coadvisoralast, \@coadvisorafirst, coorient. III.~T\'{\i}tulo.}
\begin{flushright}
CDD: \@codigocdd
\end{flushright}
\vspace{0.4ex}
\end{minipage}%
}%
}
