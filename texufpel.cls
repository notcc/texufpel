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
% Fonte das regras
%
% As regras de formatação seguem o "Manual de normas UFPel para trabalhos
% acadêmicos" (Coordenação de Bibliotecas, versão de 2023). Os comentários
% indicam a página impressa no Manual: "Manual, p. 73" ou "Manual, p. 88-90
% (modelos)". O Manual trata de tese, dissertação e TCC (Manual, p. 2).
%
% Quando uma escolha não vem do Manual, o comentário diz de onde vem:
% "ABNT" (norma citada pela classe), "decisão técnica" (necessidade do
% LaTeX) ou "decisão da classe" (convenção adotada pelo texufpel).
%
% Não implementados (opcionais no Manual): lombada (p. 83), indicação
% "v. 1" na capa e na folha de rosto (p. 82-86), glossário e índice
% (p. 22-24; use \chapter* e o pacote makeidx, que já entram no sumário).
%==============================================================================

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

\newcommand{\universidade}[1]{\gdef\@universidade{#1}}
\newcommand{\universidadeeng}[1]{\gdef\@universidadeeng{#1}}
\universidade{Universidade Federal de Pelotas}
\universidadeeng{Federal University of Pelotas}

% Natureza do trabalho: "apresentado à Faculdade de ... ou Instituto de ..."
% (Manual, p. 84-86, modelos de folha de rosto). O artigo concorda com a unidade:
% \unidade[a]{Faculdade de Educação} -> "apresentado à Faculdade", "da Faculdade"
% \unidade{Centro de ...}  (padrão [o]) -> "apresentado ao Centro", "do Centro"
\newcommand{\unidade}[2][o]{\gdef\@unidade{#2}%
  \def\@tempa{#1}\def\@tempb{a}%
  \ifx\@tempa\@tempb\gdef\ei@aounidade{\`a}\gdef\ei@dounidade{da}%
  \else\gdef\ei@aounidade{ao}\gdef\ei@dounidade{do}\fi}
\gdef\ei@aounidade{ao}\gdef\ei@dounidade{do}
\newcommand{\programa}[1]{\gdef\@programa{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\nomecurso}[1]{\gdef\@nomecurso{#1}}
\newcommand{\titulocurso}[1]{\gdef\@titulocurso{#1}}

\newcommand{\unidadeeng}[1]{\gdef\@unidadeeng{#1}}
\newcommand{\programaeng}[1]{\gdef\@programaeng{#1}}
\newcommand{\cursoeng}[1]{\gdef\@cursoeng{#1}}
\newcommand{\nomecursoeng}[1]{\gdef\@nomecursoeng{#1}}

% Trabalhos que não são depositados na biblioteca (sem capa e sem referência
% no resumo). Decisão da classe: o Manual trata só de tese, dissertação e TCC
% (Manual, p. 2) e a biblioteca recebe só o trabalho final (Manual, p. 9).
\newif\if@ei@naodepositado

% Textos da natureza do trabalho (folha de rosto: Manual, p. 84-86), da folha
% de aprovação (Manual, p. 88-90) e do tipo de trabalho na referência do resumo
% e do abstract (Manual, p. 94-95; para TCC, exemplo das p. 41-42:
% "Trabalho de Conclusão de Curso (Bacharelado em ...) - Centro de ...").

\newcommand{\documento}[1]{\gdef\@documento{#1}}
\newcommand{\tipodocumento}[1]{\gdef\@tipodocumento{#1}}
\newcommand{\descricaodocumento}[1]{\gdef\@descricaodocumento{#1}}
\newcommand{\descricaoaprovacao}[1]{\gdef\@descricaoaprovacao{#1}}

\DeclareOption{tcc}{
\documento{Trabalho de Conclus\~ao de Curso}
\tipodocumento{\tccname\ (\nomecursoname) -- \unidadename}
\descricaodocumento{Trabalho de Conclus\~ao de Curso apresentado \ei@aounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso.}
\descricaoaprovacao{Trabalho de Conclus\~ao de Curso aprovado, como requisito parcial para obten{\c{c}}{\~a}o do grau de \@titulocurso, \@unidade, \@universidade.}
}

\DeclareOption{tcc-proposta}{
\@ei@naodepositadotrue
\tipodocumento{Proposta de Trabalho de Conclus\~ao de Curso (\@nomecurso) -- \@unidade}
\descricaodocumento{Proposta de Trabalho de Conclus\~ao de Curso apresentada \ei@aounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso.}
}

\DeclareOption{diss}{
\documento{Disserta\c c\~ao}
\tipodocumento{\dissname\ (\masterin\ \cursoname) -- \unidadename}
\descricaodocumento{Disserta{\c{c}}{\~a}o apresentada ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
\descricaoaprovacao{Disserta{\c{c}}{\~a}o aprovada, como requisito parcial para obten{\c{c}}{\~a}o do grau de Mestre em \@curso, \@programa, \@unidade, \@universidade.}
}

\DeclareOption{diss-proposta}{
\@ei@naodepositadotrue
\tipodocumento{Proposta de Disserta\c c\~ao (Mestrado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Disserta{\c{c}}{\~a}o apresentada ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
}

\DeclareOption{tese}{
\documento{Tese}
\tipodocumento{\thesisname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{Tese apresentada ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
\descricaoaprovacao{Tese aprovada, como requisito parcial para obten{\c{c}}{\~a}o do grau de Doutor em \@curso, \@programa, \@unidade, \@universidade.}}

% Proposta de tese deixou de existir no PPGC (regimento de 2020); mantida
% para outros programas.
\DeclareOption{tese-proposta}{
\@ei@naodepositadotrue
\tipodocumento{Proposta de Tese (Doutorado em \@curso) -- \@programa, \@unidade}
\descricaodocumento{Proposta de Tese apresentada ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
}

\DeclareOption{eq}{
\documento{Exame de Qualifica{\c{c}}{\~a}o}
\tipodocumento{\eqname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{Exame de Qualifica{\c{c}}{\~a}o apresentado ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
\descricaoaprovacao{Exame de Qualifica{\c{c}}{\~a}o aprovado, como requisito parcial para obten{\c{c}}{\~a}o do grau de Doutor em \@curso, \@programa, \@unidade, \@universidade.}}

\DeclareOption{ti}{
\@ei@naodepositadotrue
\tipodocumento{Trabalho Individual (Mestrado em \@curso) -- \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
}

\DeclareOption{tid}{
\@ei@naodepositadotrue
\tipodocumento{Trabalho Individual (Doutorado em \@curso) -- \@unidade}
\descricaodocumento{Trabalho Individual apresentado ao \@programa\ \ei@dounidade\ \@unidade\ da \@universidade, como requisito parcial \`a obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
}

% Capa: elemento obrigatório da parte externa (Manual, p. 8 e 12)
\newcommand{\capa}[1]{\gdef\@capa{#1}}
\DeclareOption{capa}{\capa{1}}

% nocipinfo: omite a referência do trabalho no resumo e no abstract.
% Nos trabalhos depositados a referência é obrigatória (Manual, p. 14-15).
\newcommand{\nocipinfo}[1]{\gdef\@nocipinfo{#1}}
\DeclareOption{nocipinfo}{\nocipinfo{1}}

\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\relax

% Propostas (tcc-proposta, diss-proposta, tese-proposta) e trabalhos individuais
% (ti, tid) não são depositados na biblioteca: não têm capa nem referência
% do trabalho no resumo (decisão da classe; ver o início do arquivo).
\if@ei@naodepositado
  \@ifundefined{@capa}{}{%
    \ClassWarningNoLine{texufpel}{Opcao capa ignorada:
      propostas e trabalhos individuais nao sao depositados
      na biblioteca}%
    \global\let\@capa\@undefined}%
  \nocipinfo{1}%
\fi

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
% Papel A4 (Manual, p. 72), fonte tamanho 12 (Manual, p. 73) e impressão só no
% anverso. O Manual permite anverso e verso conforme o curso (p. 72 e 74-75),
% mas a classe ainda não implementa esse modo.
\LoadClass[12pt,a4paper,oneside]{report}

\RequirePackage[english,brazilian]{babel}
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{natbib}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{newfloat}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage{pdfpages}
\RequirePackage[T1]{fontenc}
% Legendas de figuras e tabelas: tamanho 10, espaço simples e texto
% justificado (Manual, p. 17, item c; p. 74), identificação com travessão
% entre o número e o título: "Figura 1 – Título" (Manual, p. 16, item a; p. 18,
% item e). O pacote caption usa espaço simples nas legendas.
\RequirePackage[singlelinecheck=off, skip=2pt, font=footnotesize, justification=justified, format=plain, labelsep=endash]{caption}

% Itens das listas designados pela palavra "Figura" ou "Tabela" seguida do
% número (Manual, p. 16 e 17; modelos das p. 96 e 98)
\DeclareCaptionListFormat{figuracf}{\figurename\ #1#2}
\DeclareCaptionListFormat{tabelacf}{\tablename\ #1#2}
% Identificação na parte superior (Manual, p. 16, item a; p. 18, item e).
% position=top põe o espaço entre a legenda e o conteúdo.
\captionsetup[figure]{position=top,listformat=figuracf}
\captionsetup[table]{position=top,listformat=tabelacf}

% Margens do anverso: esquerda e superior de 3 cm, direita e inferior de 2 cm
% (Manual, p. 73)
\geometry{top=3cm,right=2cm,left=3cm,bottom=2cm}

% Textos em cor preta (Manual, p. 72): links sem cor nem caixa
\hypersetup{hidelinks,unicode=true,linktoc=all}
% Endereços eletrônicos (\url) na mesma fonte do texto, Arial (Manual, p. 73),
% e não em fonte monoespaçada
\urlstyle{same}

% Cores usadas só pelo \makecover (capa de estojo, não prevista no Manual)
\definecolor{laranjaufpel}{rgb}{1,0.6,0}
\definecolor{verdeufpel}{rgb}{0.09,0.7,0.44}
\definecolor{azulufpel}{rgb}{0.07,0.49,0.72}
\definecolor{cinzaufpel}{rgb}{0.85,0.85,0.85}

%
% Definições para textos em português.
% Títulos dos elementos conforme o Manual: Referências (p. 21), Resumo (p. 14),
% Sumário (p. 19), Lista de Figuras e Lista de Tabelas (modelos das p. 96 e 98),
% Apêndice e Anexo (p. 23-24), Palavras-chave (p. 14). Os modelos das p. 100-101
% escrevem "Lista de abreviaturas e siglas" e "Lista de símbolos" com
% minúsculas; a classe usa iniciais maiúsculas, como nas listas de figuras.
% Orientador e Coorientador: folha de rosto (Manual, p. 84-86) e referência
% do trabalho (Manual, p. 27 e 94).
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
  \def\advisorsname{Orientadores}%
  \def\coadvisorsname{Coorientadores}%
  \def\collaboratorsname{Colaboradores}%
  \def\listquadroname{Lista de Quadros}%
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
  \def\nomecursoname{\@ifundefined{@nomecurso}{\@curso}{\@nomecurso}}%
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
% Definições para textos em inglês, usadas no abstract (Manual, p. 15 e
% modelo da p. 95: "Advisor", "Dissertation (Masters in ...)", "Keywords").
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
  \def\advisorsname{Advisors}%
  \def\coadvisorsname{Coadvisors}%
  \def\collaboratorsname{Collaborators}%
  \def\listquadroname{List of Charts}%
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
  \def\nomecursoname{\@ifundefined{@nomecursoeng}{\@cursoeng}{\@nomecursoeng}}%
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

% Data da capa e da folha de rosto: só o ano (Manual, p. 82-86). Definida
% também fora dos ganchos de idioma, porque pacotes como o datetime2 (carregado
% pelo pdfcomment) substituem \date<idioma> e o comando ficaria indefinido.
\def\ei@date{\@publyear}

\if@english%
\selectlanguage{english}%
\AtBeginDocument{\selectlanguage{english}}%
\fi

%==============================================================================
% Fonte Arial, tamanho 12, em todo o trabalho (Manual, p. 73).
% Decisão técnica: o pdfLaTeX não tem Arial livre; a classe usa Helvetica
% (phv), que tem as mesmas métricas.
%==============================================================================
\renewcommand*\familydefault{\sfdefault}%
\renewcommand{\rmdefault}{phv}%
\renewcommand{\sfdefault}{phv}

%==============================================================================
% Numeração das páginas (Manual, p. 74-75)
% - todas as folhas são contadas a partir da folha de rosto, mas o número só
%   é impresso a partir da parte textual (p. 74);
% - as páginas iniciais de cada capítulo são contadas e não numeradas (p. 74);
% - número no canto superior direito, a 2 cm da borda superior, em
%   algarismos arábicos (p. 75), tamanho 10 (p. 74).
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
% Definição de autor(es), orientador(es), coorientador(es) e colaborador(es).
% Orientador e coorientador aparecem na folha de rosto (Manual, p. 84-86).
% Colaborador não consta dos modelos do Manual; é um campo opcional da classe.
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
% Palavras-chave (máx. 10). Separadas por ponto e vírgula, a última terminada
% por ponto, com iniciais minúsculas, exceto nomes próprios e científicos
% (Manual, p. 15). A pontuação é escrita pelo autor em cada \keyword.
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
% Redefinição da data (para ter mês e ano separados). Capa e folha de rosto
% trazem só "Pelotas, ano" (Manual, p. 82-86).
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}

%==============================================================================
% Capa e folha de rosto (Manual, p. 12; modelos das p. 82 e 84-86)
%==============================================================================

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}

\location{Pelotas}{RS}

% A contagem das folhas começa na folha de rosto (folha 1); a capa não é
% contada (Manual, p. 12 e 74). Decisão técnica: a capa recebe o rótulo
% ``capa'' para que o hyperref não gere âncoras duplicadas.
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

% Capa (Manual, p. 12; modelo da p. 82): todos os elementos em Arial 12,
% centralizados, em negrito, com entrelinha de 1,5. Elementos do modelo, nesta
% ordem: UNIVERSIDADE FEDERAL DE PELOTAS (em maiúsculas), unidade, programa ou
% "Curso de ...", tipo do trabalho, título, autor, "Pelotas, ano". O modelo
% também traz o logotipo da UFPel.
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

% Folha de rosto (Manual, p. 12; modelos das p. 84-86): Arial 12, centralizada,
% só autor e título em negrito, entrelinha de 1,5; natureza do trabalho em
% espaço simples, recuada 7 cm da margem esquerda; depois orientador(es),
% coorientador(es) e "Pelotas, ano".
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
          \@ifundefined{@advisorb}{\advisorname:}{\advisorsname:} &
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
      	\@ifundefined{@coadvisorb}{\coadvisorname:}{\coadvisorsname:} &
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
      	\@ifundefined{@collaboratorb}{\collaboratorname:}{\collaboratorsname:} &
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
% Sumário (Manual, p. 19; modelo da p. 102): último elemento pré-textual,
% título centralizado sem indicativo numérico, Arial 12, entrelinha de 1,5.
% As entradas não são recuadas, como no modelo.
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
% O sumário enumera as seções "na mesma ordem e grafia do texto" (Manual,
% p. 19, citando a NBR 6027). Como todo indicativo de seção é em negrito
% (Manual, p. 70), todos os níveis ficam em negrito.
\renewcommand*{\l@subsection}[2]
              {\@dottedtocline{2}{0em}{3.7em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsubsection}[2]
              {\@dottedtocline{3}{0em}{4.6em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@paragraph}[2]
              {\@dottedtocline{4}{0em}{5.6em}{\textbf{#1}}{\hss #2}}
% Sumário com todas as seções, até a quinária (Manual, p. 19 e 70; o modelo
% da p. 102 mostra a seção quaternária)
\setcounter{tocdepth}{4}
\newif\if@aftertoc
\@aftertocfalse
% Elementos que vêm antes do sumário (resumo, listas) não constam nele
% (Manual, p. 14-19); os que vêm depois (referências, glossário, apêndices,
% anexos, índice) constam (Manual, p. 22-24). O \@schapter usa \if@aftertoc.
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Lista de abreviaturas e siglas (Manual, p. 18; modelo da p. 100), em ordem
% alfabética, e lista de símbolos (Manual, p. 19; modelo da p. 101), na ordem
% em que aparecem no texto. Título centralizado, sem indicativo numérico,
% fora do sumário. A ordem dos itens é responsabilidade do autor.
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
% Referência do trabalho, usada no resumo, no abstract e na errata: Arial 12,
% espaço simples, alinhada à esquerda (Manual, p. 15). A referência vem antes
% do resumo por decisão do Comitê Técnico (Manual, p. 15, nota 1).
% Formato dos modelos das p. 94-95 e do exemplo das p. 41-42:
%   SOBRENOME, Nome. Título. Orientador: Nome. Coorientador: Nome. Ano.
%   N f. Tipo (Curso) – Unidade, Universidade, Cidade, Ano.
% Orientador e coorientador entram após o título (Manual, p. 26-27 e 42).
% Nomes de orientadores ou coorientadores separados por ``;'' (Manual, p. 24).
% #1 = advisor/coadvisor
\newcommand{\ei@nomes}[1]{%
  \csname @#1afirst\endcsname\ \csname @#1alast\endcsname
  \@ifundefined{@#1b}{}{; \csname @#1bfirst\endcsname\ \csname @#1blast\endcsname}%
  \@ifundefined{@#1c}{}{; \csname @#1cfirst\endcsname\ \csname @#1clast\endcsname}%
  \@ifundefined{@#1d}{}{; \csname @#1dfirst\endcsname\ \csname @#1dlast\endcsname}}
\newcommand{\ei@referencia}[1]{%
  {\singlespacing\raggedright\noindent\MakeUppercase{\@authoralast},
    \@authorafirst. \textbf{#1}.
    \@ifundefined{@advisora}{}{\@ifundefined{@advisorb}{\advisorname}{\advisorsname}: \ei@nomes{advisor}. }%
    \@ifundefined{@coadvisora}{}{\@ifundefined{@coadvisorb}{\coadvisorname}{\coadvisorsname}: \ei@nomes{coadvisor}. }%
    \@publyear. \pageref{LastPage}~f. \@tipodocumento,
    \universidadename, \@city, \@publyear.\par}\vspace{\baselineskip}}

% Resumo (Manual, p. 14-15; modelo da p. 94): título centralizado sem
% indicativo numérico, fora do sumário, Arial 12, espaço simples, texto
% justificado em parágrafo único. Referência do trabalho antes do texto e
% "Palavras-chave:" depois.
\renewenvironment{abstract}{%
  \chapter*{\abstractname}
  \singlespacing
  \@ifundefined{@nocipinfo}{\ei@referencia{\@title}}{}%
  \everypar{{\setbox\z@\lastbox}\everypar{}}% resumo sem recuo (o indentfirst anula \@afterindentfalse)
}{%
  % palavras-chave logo após o texto, separadas por uma linha em branco
  % (Manual, p. 14-15 e modelo da p. 94)
  \par\vspace{\baselineskip}%
  \noindent\keywordsname: \@abstractkw
}

% Resumo em língua estrangeira (Manual, p. 15; modelo da p. 95): mesma
% formatação do resumo, com todos os seus dados traduzidos, inclusive a
% referência.
\newenvironment{englishabstract}[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \gdef\@englishtitle{{#1}}%
  \iflanguage{english}{
    \begin{otherlanguage}{brazilian}
    }{
      \begin{otherlanguage}{english}
      }

      \chapter*{\abstractname}
      \singlespacing
      \@ifundefined{@nocipinfo}{\ei@referencia{\@englishtitle}}{}%
      \everypar{{\setbox\z@\lastbox}\everypar{}}% resumo sem recuo (o indentfirst anula \@afterindentfalse)
    }{
      \par\vspace{\baselineskip}%
      \noindent\keywordsname: \@abstractkweng
    \end{otherlanguage}
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta: aparece somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos (Manual, p. 74).
% Títulos em Arial 12, negrito (Manual, p. 70 e 73), iniciando a 5 cm da
% borda superior (Manual, p. 73): 3 cm de margem + \ei@chaptertopskip.
% Títulos de elementos textuais alinhados à esquerda, com numeração
% progressiva; títulos de elementos pré e pós-textuais centralizados, sem
% numeração (Manual, p. 70 e 73).
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
    % apêndices e anexos: ``Apêndice A – Título'', centralizado (Manual, p. 23-24;
    % modelos das p. 107 e 109); primeira folha contada e não numerada (p. 74)
    {\centering\reset@font\ei@chapterfont\sffamily\bfseries
      \@chapapp\thechapter\ --\ #1\par}%
    \thispagestyle{empty}%
  \else
    % indicativo numérico e título separados apenas por um espaço (Manual, p. 70)
    {\reset@font\noindent\ei@chapterfont\sffamily\bfseries
      \thechapter\space#1\par}%
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

% Decisão técnica: contador de conjuntos de apêndices/anexos, que garante
% âncoras únicas no hyperref (sem ele, o Apêndice A e o Capítulo 1 geram a
% mesma âncora chapter.1).
% Cada apêndice e anexo recebe uma letra em sequência alfabética (Manual, p. 23-24).
% Decisão da classe: figuras e tabelas de apêndices e anexos ficam fora das
% listas (o Manual não trata do assunto).
\newcounter{ei@apxset}
\renewcommand{\appendix}[1][\appendixname]{%
  \setcounter{chapter}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \stepcounter{ei@apxset}%
  \xdef\theHchapter{apx\arabic{ei@apxset}.\noexpand\Alph{chapter}}%
  \setcounter{tocdepth}{0}%
  \captionsetup{list=no}% figuras e tabelas de apêndices/anexos fora das listas
  \global\@ei@apxtrue
  \gdef\@chapapp{#1\space}%
}


\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções (Manual, p. 69-70; modelo da p. 103): número e título
% em negrito, alinhados à esquerda, apenas a primeira letra maiúscula (o autor
% escreve assim), texto começando em outra linha.
% Numeração até a seção quinária (Manual, p. 70): capítulo = primária,
% \section = secundária, ..., \paragraph = quinária.
%==============================================================================
\setcounter{secnumdepth}{4}

% Indicativo da seção separado do título apenas por um espaço, sem ponto,
% hífen ou travessão (Manual, p. 70)
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\space}

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
% Numeração de figuras, tabelas e equações: sequencial em todo o trabalho, em
% algarismos arábicos, pela ordem de ocorrência no texto (Manual, p. 16 e 18);
% equações com o número entre parênteses, à direita (Manual, p. 76).
%==============================================================================
\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}

%==============================================================================
% Listas de figuras e de tabelas (Manual, p. 15-17; modelos das p. 96 e 98):
% título centralizado, sem indicativo numérico, fora do sumário; itens com a
% palavra designativa, o número, a legenda e a página.
%==============================================================================
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}

% Conteúdo de figuras e tabelas (corpo, título e fonte) em tamanho 10
% (Manual, p. 74). Dentro desses ambientes, \small também passa a
% valer 10 pt, para que linhas como {\small Fonte: ...} fiquem no padrão.
% A fonte consultada vai abaixo, é obrigatória mesmo quando for produção do
% próprio autor (Manual, p. 17, item b; p. 18, item f) e é escrita pelo autor
% com \caption*{Fonte: ...}.
\AtBeginEnvironment{figure}{\footnotesize\let\small\footnotesize}
\AtBeginEnvironment{table}{\footnotesize\let\small\footnotesize}

% Quadros. O Manual designa todas as ilustrações como ``Figura'', por decisão
% do Comitê Técnico (Manual, p. 16, nota 1), mas recomenda lista própria por
% tipo de figura quando forem muitas, como a Lista de quadros (Manual, p. 16).
% O ambiente quadro numera junto com as figuras (Figura 1, Figura 2...),
% usa a mesma formatação e vai para a Lista de Quadros (\listofquadros).
\DeclareFloatingEnvironment[fileext=loq,name=\figurename,placement=htbp,within=none]{quadro}
\let\c@quadro\c@figure
\renewcommand{\thequadro}{\thefigure}
\renewcommand{\theHquadro}{quadro.\arabic{figure}}
\captionsetup[quadro]{position=top,listformat=figuracf}
\AtBeginEnvironment{quadro}{\footnotesize\let\small\footnotesize}
\renewcommand{\listofquadros}{\chapter*{\listquadroname}\@starttoc{loq}}
\let\l@quadro\l@figure
\let\l@table\l@figure

%==============================================================================
% Citação direta com mais de três linhas (ambiente quote): recuo de 4 cm da
% margem esquerda, letra menor que a do texto, espaço simples, sem aspas
% (Manual, p. 63). Tamanho 10 (Manual, p. 74) e recuo de 4 cm (Manual, p. 73).
%==============================================================================
\renewenvironment{quote}{%
  \par\footnotesize\singlespacing%
  \begin{list}{}{\setlength{\leftmargin}{40mm}\setlength{\rightmargin}{0pt}%
    \setlength{\topsep}{12pt}\setlength{\parsep}{0pt}\item\relax}
  }{%
  \end{list}
}


%==============================================================================
% Citações e referências
%==============================================================================
% Referências alinhadas à margem esquerda, sem recuo nas linhas seguintes
% (Manual, p. 22)
\setlength{\bibhang}{0pt}
% Sistema autor-data (Manual, p. 62). O natbib escreve o sobrenome em
% maiúsculas e minúsculas, inclusive dentro dos parênteses (Manual, p. 62), e
% separa várias obras por ponto e vírgula (Manual, p. 67). \cite = \citep:
% (Autor, ano); \citet: Autor (ano).
\let\cite\citep

% Referências em Arial 12, espaço simples, alinhadas somente à margem esquerda
% e separadas por uma linha em branco de espaço simples (Manual, p. 22 e 74).
% O título "Referências" é centralizado, sem indicativo numérico, e consta do
% sumário (Manual, p. 21-22).
\renewcommand{\bibfont}{\singlespacing\raggedright\setlength{\bibsep}{\baselineskip}}

%==============================================================================
% Citação de citação (apud), Manual, p. 65: autoria e ano da fonte citada,
% a expressão apud e autoria, ano e página da fonte consultada. Na lista de
% referências entra somente a fonte consultada (Manual, p. 65).
%   \apud{Silva}{2000}{Abreu:2011:XYZ}          -> Silva (2000 apud Abreu, 2011)
%   \apud[p.~45]{Silva}{2000}{Abreu:2011:XYZ}   -> Silva (2000 apud Abreu, 2011, p. 45)
%   \apudp{Silva}{2000}{Abreu:2011:XYZ}         -> (Silva, 2000 apud Abreu, 2011)
%==============================================================================
\newcommand{\apud}[4][]{#2 (#3 apud \citeauthor{#4}, \citeyear{#4}\if\relax\detokenize{#1}\relax\else, #1\fi)}
\newcommand{\apudp}[4][]{(#2, #3 apud \citeauthor{#4}, \citeyear{#4}\if\relax\detokenize{#1}\relax\else, #1\fi)}

% Capa de estojo de CD-ROM. Não prevista no Manual: a biblioteca recebe só a
% versão digital (Manual, p. 9). Mantida por compatibilidade.
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
\includegraphics[width=\columnwidth]{imagens/ufpelw.pdf}
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
\includegraphics[width=3cm]{imagens/ufpel.pdf}\\
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

% Apêndices (Manual, p. 23 e 75; modelo da p. 106): folha em branco só com o
% termo "Apêndices", centralizado no meio da folha, contada e não numerada,
% e incluída no sumário. A numeração das folhas segue contínua (p. 75).
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

% Anexos (Manual, p. 23-24 e 75; modelo da p. 108): mesma regra dos apêndices.
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

% Ficha catalográfica (Manual, p. 12): obrigatória, logo após a folha de rosto
% na versão digital, não contada na paginação. É solicitada à biblioteca pelo
% Sistema Cobalto e já vem formatada (Arial 10, espaço simples).
% Uso: \fichacatalografica            (página provisória)
%      \fichacatalografica[ficha.pdf] (ficha emitida pela biblioteca)
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

% Errata (Manual, p. 13; modelo da p. 87): opcional, logo após a folha de
% rosto, com a referência do trabalho e o texto da errata; título
% centralizado, sem indicativo numérico.
% Uso:
%   \begin{errata}
%   16 & 10 & auto-clavado & autoclavado \\
%   \end{errata}
\newenvironment{errata}{%
  \chapter*{Errata}
  \ei@referencia{\@title}%
  \begin{center}
  \begin{tabular}{c c p{5.4cm} p{5.4cm}}
  \hline
  \textbf{Folha} & \textbf{Linha} & \textbf{Onde se l\^e} & \textbf{Leia-se} \\
  \hline
}{%
  \hline
  \end{tabular}
  \end{center}
}

% Agradecimentos (Manual, p. 13-14; modelo da p. 92): opcional, título
% centralizado sem indicativo numérico, texto justificado, entrelinha de 1,5,
% parágrafo de 1,25 cm.
\newenvironment{agradecimentos}{
	\chapter*{Agradecimentos}
}{
}

% Dedicatória (Manual, p. 13; modelo da p. 91): opcional, sem título, Arial 12.
% Se curta, recuada 6 cm da margem e no meio da folha (formato deste ambiente).
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

% Epígrafe (Manual, p. 14; modelo da p. 93): opcional, sem título, Arial 10,
% itálico, entrelinha de 1,5, recuada 6 cm da margem e no meio da folha,
% seguida da indicação de autoria.
\newenvironment{epigrafe}{
  \clearpage
  \thispagestyle{empty} % folha sem número (elemento pré-textual)
  \vspace*{\fill}       % centraliza na vertical (com o \vspace*{\fill} do fim)
  \onehalfspacing       % entrelinha de 1,5
  \itshape              % itálico
  \fontsize{10pt}{12pt}\selectfont % tamanho 10
  \noindent
  \hspace*{6cm}         % recuo de 6 cm
  \begin{minipage}{9cm} % largura restante da mancha
}{
  \end{minipage}
  \vspace*{\fill}
}

% Folha de aprovação (Manual, p. 13; modelos das p. 88-90): obrigatória nos
% trabalhos depositados, sem título, elementos centralizados em Arial 12;
% natureza do trabalho em texto justificado e espaço simples; depois
% "Data da defesa:" e "Banca examinadora:" com nome, titulação e instituição
% de cada membro (escritos pelo autor dentro do ambiente).
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
	\noindent\textbf{Data da defesa: }{#1}\\
	\mbox{}
	\vfill
	\begin{flushleft}
		\textbf{Banca examinadora: }\\
}{
	\end{flushleft}
	\vfill
}

%==============================================================================
% Ajustes gerais
% - entrelinhas de 1,5 no texto (Manual, p. 74); resumo, citações longas,
%   notas, figuras, tabelas e referências usam espaço simples (Manual, p. 74),
%   definido acima em cada ambiente;
% - recuo de parágrafo de 1,25 cm (Manual, p. 73);
% - texto justificado, exceto as referências (Manual, p. 72-73): é o padrão
%   do LaTeX;
% - no mínimo duas linhas de parágrafo no fim e no início da folha
%   (Manual, p. 73).
%==============================================================================
\onehalfspacing
\setlength{\parindent}{1.25cm}

% Filete das notas de rodapé com 5 cm a partir da margem esquerda. O Manual
% não fixa o tamanho; a regra vem da ABNT (NBR 14724).
% Notas em Arial 10 e espaço simples (Manual, p. 68 e 74): tamanho padrão das
% notas na classe report com fonte 12. A numeração recomeça a cada capítulo
% (Manual, p. 68), como já faz a classe report.
\renewcommand{\footnoterule}{\kern-3\p@\hrule\@width 5cm\kern 2.6\p@}

% Notas alinhadas a partir da segunda linha abaixo da primeira letra da
% primeira palavra, destacando o expoente (Manual, p. 68)
\renewcommand\@makefntext[1]{%
  \setbox\@tempboxa\hbox{\@makefnmark\space}%
  \hangindent\wd\@tempboxa\hangafter\@ne
  \noindent\box\@tempboxa#1}

% Alíneas e subalíneas (Manual, p. 70-72; modelo da p. 104):
% enumerate de 1º nível -> a), b), ..., z), aa), bb), ... (letra minúscula
%   seguida de parêntese, letras dobradas quando esgotado o alfabeto, com recuo
%   em relação à margem e linhas seguintes sob a primeira letra do texto);
% enumerate de 2º nível -> subalíneas iniciadas por travessão seguido de
%   espaço, com recuo em relação à alínea (Manual, p. 71-72).
% A pontuação (ponto e vírgula, dois pontos, ponto final) é escrita pelo autor.
\newcommand{\ei@alinea}[1]{%
  \ifnum\value{#1}>26
    \@alph{\numexpr\value{#1}-26\relax}\@alph{\numexpr\value{#1}-26\relax}%
  \else
    \@alph{\value{#1}}%
  \fi}
\renewcommand{\theenumi}{\ei@alinea{enumi}}
\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\theenumii}{\ei@alinea{enumii}}
\renewcommand{\labelenumii}{--}
\renewcommand{\p@enumii}{\theenumi)}
% Pelo menos duas linhas de um parágrafo no fim e no início da folha
% (Manual, p. 73)
\clubpenalty=10000
\@clubpenalty=10000
\widowpenalty=10000
