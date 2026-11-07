%% texufpel.cls
%% Copyright 2026 Marilton Sanchotene de Aguiar
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Marilton Sanchotene de Aguiar (marilton@inf.ufpel.edu.br).
%
% This work consists of the file texufpel.cls.

%==============================================================================
% Identificação
%==============================================================================
\def\currversion{11/07/2026}

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

% \newcommand{\bibliotecario}[1]{\gdef\@nomebibliotecario{#1}}
% \newcommand{\cipdata}[2]{\gdef\@codigocip{#1}\gdef\@codigocdd{#2}}

\newcommand{\universidade}[1]{\gdef\@universidade{#1}}
\newcommand{\universidadeeng}[1]{\gdef\@universidadeeng{#1}}
\universidade{Universidade Federal de Pelotas}
\universidadeeng{Federal University of Pelotas}

\newcommand{\unidade}[1]{\gdef\@unidade{#1}}
\newcommand{\programa}[1]{\gdef\@programa{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\nomecurso}[1]{\gdef\@nomecurso{#1}}
\newcommand{\titulocurso}[1]{\gdef\@titulocurso{#1}}

\newcommand{\unidadeeng}[1]{\gdef\@unidadeeng{#1}}
\newcommand{\programaeng}[1]{\gdef\@programaeng{#1}}
\newcommand{\cursoeng}[1]{\gdef\@cursoeng{#1}}

\newcommand{\documento}[1]{\gdef\@documento{#1}}
\newcommand{\tipodocumento}[1]{\gdef\@tipodocumento{#1}}
\newcommand{\descricaodocumento}[1]{\gdef\@descricaodocumento{#1}}
\newcommand{\descricaoaprovacao}[1]{\gdef\@descricaoaprovacao{#1}}

\DeclareOption{tcc}{
\documento{Trabalho de Conclus\~ao de Curso}
\tipodocumento{\tccname\ (\cursoname) -- \unidadename}
\descricaodocumento{Trabalho de Conclus\~ao de Curso apresentado ao \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso.}
\descricaoaprovacao{Trabalho de Conclus\~ao de Curso aprovado, como requisito parcial, para obten{\c{c}}{\~a}o do grau de \@titulocurso, \@unidade, \@universidade.}
}

\DeclareOption{tcc-proposta}{
\tipodocumento{Proposta de Trabalho de Conclus\~ao de Curso (\@nomecurso) -- \@unidade}
\descricaodocumento{Proposta de Trabalho de Conclus\~ao de Curso apresentada ao \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso.}
}

\DeclareOption{diss}{
\documento{Disserta\c c\~ao}
\tipodocumento{\dissname\ (\masterin\ \cursoname) -- \unidadename}
\descricaodocumento{Disserta{\c{c}}{\~a}o apresentada ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
\descricaoaprovacao{Disserta{\c{c}}{\~a}o aprovada, como requisito parcial, para obten{\c{c}}{\~a}o do grau de Mestre em \@curso, \@programa, \@unidade, \@universidade.}
}

\DeclareOption{diss-proposta}{
\tipodocumento{Proposta de Disserta\c c\~ao (Mestrado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Disserta{\c{c}}{\~a}o apresentada ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
}

\DeclareOption{tese}{
\documento{Tese}
\tipodocumento{\thesisname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{Tese apresentada ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
\descricaoaprovacao{Tese aprovada, como requisito parcial, para obten{\c{c}}{\~a}o do grau de Doutor em \@curso, \@programa, \@unidade, \@universidade.}}

%proposta de tese deixou de existir no PPGC - regimento de 2020
\DeclareOption{tese-proposta}{
\tipodocumento{Proposta de Tese (Doutorado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Tese apresentada ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
}

\DeclareOption{eq}{
\documento{Exame de Qualifica{\c{c}}{\~a}o}
\tipodocumento{\eqname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{Exame de Qualifica{\c{c}}{\~a}o apresentado ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
\descricaoaprovacao{Exame de Qualifica{\c{c}}{\~a}o aprovado, como requisito parcial, para obten{\c{c}}{\~a}o do grau de Doutor em \@curso, \@programa, \@unidade, \@universidade.}}

\DeclareOption{ti}{
\tipodocumento{Trabalho Individual (Mestrado em \@curso) -- \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
}

\DeclareOption{tid}{
\tipodocumento{Trabalho Individual (Doutorado em \@curso) -- \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ do \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
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
\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage{pdfpages}
\RequirePackage[T1]{fontenc}
\RequirePackage[singlelinecheck=off, skip=2pt, font=footnotesize, justification=justified, format=plain, labelsep=endash]{caption}

\DeclareCaptionListFormat{figuracf}{\figurename\ #1#2}
\DeclareCaptionListFormat{tabelacf}{\tablename\ #1#2}
\captionsetup[figure]{position=bottom,listformat=figuracf}
\captionsetup[table]{position=top,listformat=tabelacf}

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
  \def\keywordsname{Palavras-chave}%
  \def\tccname{Trabalho de Conclus\~ao de Curso}%
  \def\thesisname{Tese}%
  \def\eqname{Exame de Qualifica{\c{c}}{\~a}o}%
  \def\doctoratein{Doutorado em}%
  \def\dissname{Disserta\c c\~ao}%
  \def\masterin{Mestrado em}%
  \def\universidadename{\@universidade}%
  \def\unidadename{\@unidade}%
  \def\programaname{\@programa}%
  \def\cursoname{\@curso}%
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
  \def\tccname{Undergraduate Thesis}%
  \def\eqname{Qualification Exam}%
  \def\thesisname{Thesis}%
  \def\doctoratein{Doctorate in}%
  \def\dissname{Dissertation}%
  \def\masterin{Masters in}%
  \def\universidadename{\@universidadeeng}%
  \def\unidadename{\@unidadeeng}%
  \def\programaname{\@programaeng}%
  \def\cursoname{\@cursoeng}%
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
  \def\@oddhead{\hspace*{\fill}{\footnotesize\thepage}}%
  \def\@evenhead{\hspace*{\fill}{\footnotesize\thepage}}%
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
        \@ifundefined{keywb}{}{ \keywb}%
        \@ifundefined{keywc}{}{ \keywc}%
        \@ifundefined{keywd}{}{ \keywd}%
        \@ifundefined{keywe}{}{ \keywe}%
        \@ifundefined{keywf}{}{ \keywf}%
        \@ifundefined{keywg}{}{ \keywg}%
        \@ifundefined{keywh}{}{ \keywh}%
        \@ifundefined{keywi}{}{ \keywi}%
        \@ifundefined{keywj}{}{ \keywj}%
}


\newcommand{\@abstractkweng}{%
        \@ifundefined{keywenga}{}{\expandafter \keywenga}%
        \@ifundefined{keywengb}{}{ \keywengb}%
        \@ifundefined{keywengc}{}{ \keywengc}%
        \@ifundefined{keywengd}{}{ \keywengd}%
        \@ifundefined{keywenge}{}{ \keywenge}%
        \@ifundefined{keywengf}{}{ \keywengf}%
        \@ifundefined{keywengg}{}{ \keywengg}%
        \@ifundefined{keywengh}{}{ \keywengh}%
        \@ifundefined{keywengi}{}{ \keywengi}%
        \@ifundefined{keywengj}{}{ \keywengj}%
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

% A contagem das folhas comeca na folha de rosto (folha 1); a capa nao e'
% contada (Manual UFPel, p. 12 e 74). A capa recebe o rotulo ``capa'' para
% que o hyperref nao gere ancoras duplicadas.
\renewcommand{\maketitle}{%
  \@ifundefined{@capa}{}{%
    \begingroup
    \def\thepage{capa}%
    \begin{titlepage}
    \thecoverpage
    \end{titlepage}%
    \endgroup
  }%
  \begin{titlepage}
  \thetitlepage
  \end{titlepage}%
  \setcounter{page}{2}%
}

\newcommand{\thecoverpage}{%
  \onehalfspacing%
  \noindent%
      \centering%
      \vskip 1cm%
      \MakeUppercase{\textbf{\@universidade}}\\%
      \textbf{\@unidade}\\%
      \@ifundefined{@nomecurso}{\textbf{\@programa}}{\textbf{Curso de \@nomecurso}}\\%
      \vskip 1cm%
      \includegraphics[width=3cm]{imagens/ufpelw.pdf}
      \vskip 1cm%
      \textbf{\@documento}\\%
      \vskip 1cm%
  \vskip 3cm%
  \noindent%
      \centering%
      \vskip .5cm%
      \textbf{\@title}%
      \vskip .5cm%
  \vskip 3cm%
  \noindent%
      \centering%
      \vskip .5cm%
      \textbf{\@authora\\
      \@ifundefined{@authorb}{}{\@authorb\\}%
      \@ifundefined{@authorc}{}{\@authorc\\}%
      \@ifundefined{@authord}{}{\@authord\\}}%
      \vskip .5cm%
  \vfill%
  \noindent%
      \centering%
      \vskip .1cm%
      \textbf{\@city, \ei@date}%
      \vskip .1cm%
}

\newcommand{\thetitlepage}{%
  \noindent%
    \centering%
    \textbf{\@authora}\\
    \@ifundefined{@authorb}{}{\textbf{\@authorb}\\}%
    \@ifundefined{@authorc}{}{\textbf{\@authorc}\\}%
    \@ifundefined{@authord}{}{\textbf{\@authord}\\}%
    \vskip 5cm%
    {\textbf{\@title}}%
  \vskip 8cm%
        \singlespacing%
  \begin{adjustwidth}{7cm}{0cm}
%        \begin{hyphenrules}{nohyphenation}%
        \@descricaodocumento%
 %     	\end{hyphenrules}%
  \end{adjustwidth}
    \vfill%
  \vfill%
  \@ifundefined{@advisora}{}{%
    \onehalfspacing%
    \centering%
        \@ifundefined{@advisora}{}{
          \begin{tabular}{rp{9cm}}%
          \@ifundefined{@advisorb}{\advisorname:}{\advisorname es:} &
          \@ifundefined{@advisora}{}{\@advisora\\}
          \@ifundefined{@advisorb}{}{\ &}
          \@ifundefined{@advisorb}{}{\@advisorb\\}
          \@ifundefined{@advisorc}{}{\ &}
          \@ifundefined{@advisorc}{}{\@advisorc\\}
          \@ifundefined{@advisord}{}{\ &}
          \@ifundefined{@advisord}{}{\@advisord\\}
          \end{tabular}
          }
        \@ifundefined{@coadvisora}{}{
        \begin{tabular}{rp{9cm}}%
      	\@ifundefined{@coadvisorb}{\coadvisorname:}{\coadvisorname es:} &
      	\@ifundefined{@coadvisora}{}{\@coadvisora\\}
        \@ifundefined{@coadvisorb}{}{\ &}
        \@ifundefined{@coadvisorb}{}{\@coadvisorb\\}
        \@ifundefined{@coadvisorc}{}{\ &}
        \@ifundefined{@coadvisorc}{}{\@coadvisorc\\}
        \@ifundefined{@coadvisord}{}{\ &}
        \@ifundefined{@coadvisord}{}{\@coadvisord\\}
        \end{tabular}
        }
        \@ifundefined{@collaboratora}{}{
        \begin{tabular}{rp{9cm}}%
      	\@ifundefined{@collaboratorb}{\collaboratorname:}{\collaboratorname es:} &
      	\@ifundefined{@collaboratora}{}{\@collaboratora\\}
        \@ifundefined{@collaboratorb}{}{\ &}
        \@ifundefined{@collaboratorb}{}{\@collaboratorb\\}
        \@ifundefined{@collaboratorc}{}{\ &}
        \@ifundefined{@collaboratorc}{}{\@collaboratorc\\}
        \@ifundefined{@collaboratord}{}{\ &}
        \@ifundefined{@collaboratord}{}{\@collaboratord\\}
        \end{tabular}
        }
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
        \@dottedtocline{0}{0em}{\ei@chapnumindent}{#1}{#2}
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
% Resumo em espaco simples; a referencia do trabalho fica alinhada a' esquerda
% (Manual UFPel, p. 15)
\renewenvironment{abstract}{%
  \chapter*{\abstractname}
  \singlespacing
  \@ifundefined{@nocipinfo}{%
  {\raggedright\noindent\MakeUppercase{\@authoralast},
    \@authorafirst. \textbf{\@title}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. \@tipodocumento,
    \universidadename, \@city, \@publyear.\par}\vspace{\baselineskip}}{}%
  \everypar{{\setbox\z@\lastbox}\everypar{}}% resumo sem recuo (o indentfirst anula \@afterindentfalse)
}{%
  \par\vfill
  \noindent\keywordsname: \@abstractkw
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
      \singlespacing
      {\raggedright\noindent\MakeUppercase{\@authoralast},
        \@authorafirst. \textbf{\@englishtitle}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. \@tipodocumento,
        \universidadename, \@city, \@publyear.\par}\vspace{\baselineskip}%
      \everypar{{\setbox\z@\lastbox}\everypar{}}% resumo sem recuo (o indentfirst anula \@afterindentfalse)
    }{
      \par\vfill
      \noindent\keywordsname: \@abstractkweng
    \end{otherlanguage}
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos; Manual UFPel, p. 74).
% Títulos em Arial 12, negrito, iniciando a 5 cm da borda superior
% (Manual UFPel, p. 70, 73 e 74).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\ei@chapterfont}{\normalsize}
\newlength{\ei@chaptertopskip}\setlength{\ei@chaptertopskip}{36pt}
\newif\if@ei@apx\@ei@apxfalse
\def\@chapapp{}

\def\@chapter[#1]#2{%
	\onehalfspacing
  \refstepcounter{chapter}%
  \if@ei@apx
    \addcontentsline{toc}{chapter}{\@chapapp\thechapter\ --\ #1}%
  \else
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
  \fi
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \pagestyle{texufpel}\let\ps@plain\ps@texufpel%
  \@makechapterhead{#2}\@afterheading%
}

\def\@makechapterhead#1{%
  \vspace*{\ei@chaptertopskip}%
  \if@ei@apx
    % apendices e anexos: ``Apêndice A – Título'', centralizado (modelo UFPel, p. 107)
    {\centering\reset@font\ei@chapterfont\sffamily\bfseries
      \@chapapp\thechapter\ --\ #1\par}%
  \else
    {\reset@font\noindent\ei@chapterfont\sffamily\bfseries
      \thechapter\hspace{1em}#1\par}%
    \thispagestyle{empty}%
  \fi
  \addvspace{42pt}%
}

\def\@schapter#1{%
  \if@aftertoc\phantomsection\addcontentsline{toc}{chapter}{#1}\fi%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading%
}

\def\@makeschapterhead#1{%
  \vspace*{\ei@chaptertopskip}%
  {\centering\reset@font\ei@chapterfont\sffamily\bfseries #1\par}%
  \addvspace{42pt}%
  \thispagestyle{empty}%
}

% Contador de conjuntos de apendices/anexos: garante ancoras unicas no hyperref
% (sem ele, o Apendice A e o Capitulo 1 geram a mesma ancora chapter.1)
\newcounter{ei@apxset}
\renewcommand{\appendix}[1][\appendixname]{%
  \setcounter{chapter}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \stepcounter{ei@apxset}%
  \xdef\theHchapter{apx\arabic{ei@apxset}.\noexpand\Alph{chapter}}%
  \setcounter{tocdepth}{0}%
  \@captionlistingfalse%
  \global\@ei@apxtrue
  \gdef\@chapapp{#1\space}%
}


\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções (todas em negrito, Arial 12; Manual UFPel, p. 70)
%==============================================================================
\setcounter{secnumdepth}{4} 

\renewcommand{\section}{%
  \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\normalsize\bfseries}
} 

\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
} 

\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\bfseries}
} 

\renewcommand{\paragraph}{%
  \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font\bfseries}
}

\renewcommand{\subparagraph}{%
  \@startsection{subparagraph}{5}{0pt}{12pt}{6pt}{\reset@font\bfseries}
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

% Conteúdo de figuras e tabelas (corpo, título e fonte) em tamanho 10
% (Manual UFPel, p. 74). Dentro desses ambientes, \small também passa a
% valer 10 pt, para que linhas como {\small Fonte: ...} fiquem no padrão.
\AtBeginEnvironment{figure}{\footnotesize\let\small\footnotesize}
\AtBeginEnvironment{table}{\footnotesize\let\small\footnotesize}
\let\l@table\l@figure

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
% Recuo de 4 cm, tamanho 10 e espaço simples (Manual UFPel, p. 63, 73 e 74)
\renewenvironment{quote}{%
  \par\footnotesize\singlespacing%
  \begin{list}{}{\setlength{\leftmargin}{40mm}\setlength{\rightmargin}{0pt}%
    \setlength{\topsep}{12pt}\setlength{\parsep}{0pt}\item\relax}
  }{%
  \end{list}
}


%==============================================================================
% Ajuste do formato das citações e referências
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

% Referências em espaço simples, alinhadas somente à margem esquerda e
% separadas por uma linha em branco de espaço simples (Manual UFPel, p. 22 e 73)
\renewcommand{\bibfont}{\singlespacing\raggedright\setlength{\bibsep}{\baselineskip}}

% \renewcommand{\NAT@nmfmt}[1]{%
%   \ifNAT@swa\expandafter\MakeUppercase\else\expandafter\@firstofone\fi{{\NAT@up #1}}%
% }

%capa do CDROM
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

%apendices
\newcommand{\apendices}{
  \clearpage
  \pagestyle{empty}
  \mbox{}
  \vfill
  \phantomsection\addcontentsline{toc}{chapter}{Ap\^endices}%
  \begin{center}
    \textbf{Ap\^endices}
  \end{center}
  \vfill
  \appendix
}

%anexos
\newcommand{\anexos}{
  \clearpage
  \pagestyle{empty}
  \mbox{}
  \vfill
  \phantomsection\addcontentsline{toc}{chapter}{Anexos}%
  \begin{center}
    \textbf{Anexos}
  \end{center}
  \vfill
  \annex
}

%ficha catalográfica
% Uso: \fichacatalografica            (página provisória)
%      \fichacatalografica[ficha.pdf] (ficha emitida pela biblioteca)
% A ficha não é contada na paginação (Manual UFPel, p. 12).
\newcommand{\fichacatalografica}[1][]{%
	\clearpage
	\begingroup
	\def\thepage{ficha}%
	\if\relax\detokenize{#1}\relax
		\thispagestyle{empty}%
		\mbox{}
		\vfill
		\begin{center}
			\textbf{Insira AQUI a ficha catalogr\'afica\\Quando finalizado o trabalho, deve ser\\solicitada através do Sistema Cobalto\\Biblioteca -- Cadastro -- Ficha catalográfica.}
		\end{center}
		\vfill
		\clearpage
	\else
		\includepdf[pages=1]{#1}%
	\fi
	\endgroup
	\addtocounter{page}{-1}%
}

%agradecimentos
\newenvironment{agradecimentos}{
	\chapter*{Agradecimentos}
}{
}

%dedicatória
\newenvironment{dedicatoria}{
	\clearpage
  \onehalfspacing
	\mbox{}
	\vfill
  \begin{adjustwidth}{6cm}{0cm}
}{
	\end{adjustwidth}
	\vfill
}

%epígrafe
\newenvironment{epigrafe}{
  \clearpage
  \thispagestyle{empty} % Remove page numbering
  \vspace*{\fill}       % Push content to the bottom of the page
  \onehalfspacing       % Line spacing 1.5
  \itshape              % Italic text
  \fontsize{10pt}{12pt}\selectfont % Font Arial, size 10
  \noindent
  \hspace*{6cm}         % Indent 6 cm
  \begin{minipage}{9cm} % Maximum width of text, adjusted for indent
}{
  \end{minipage}
  \vspace*{\fill}       % Additional spacing at the bottom if necessary
}

%nominata da banca
\newenvironment{aprovacao}[1]{
	\clearpage
	\onehalfspacing
	\begin{center}
		\noindent\textbf{\@authora}\\
		\vskip 2cm
		\noindent\textbf{\@title}\\
		\vskip 2cm
		\noindent\parbox[b]{16cm}{
		\singlespacing
		\begin{hyphenrules}{nohyphenation}
			\@descricaoaprovacao
		\end{hyphenrules}
		}
	\end{center}
	\vskip 2cm
	\noindent\textbf{Data da Defesa: }{#1}\\
	\mbox{}
	\vfill
	\begin{flushleft}
		\textbf{Banca Examinadora: }\\
}{
	\end{flushleft}
	\vfill
}

%==============================================================================
% Ajustes gerais (Manual UFPel, p. 73-74)
% - entrelinhas de 1,5 em todo o trabalho (resumo, citações longas, notas,
%   figuras, tabelas e referências usam espaço simples, definidos acima);
% - recuo de parágrafo de 1,25 cm;
% - no mínimo duas linhas de parágrafo no fim e no início da folha.
%==============================================================================
\onehalfspacing
\setlength{\parindent}{1.25cm}
\clubpenalty=10000
\@clubpenalty=10000
\widowpenalty=10000
