%==============================================================================
% abnt.bst
% Estilo BibTeX de formatação de referências bibliográficas no padrão ABNT
%
% UFRGS TeX Users Group
% Informatics Institute --- UFRGS
% Porto Alegre, Brazil
% http://www.inf.ufrgs.br/utug
% Discussion list: utug-l@inf.ufrgs.br
%
% $Id: abnt.bst,v 5.6 2003/03/03 00:17:46 avila Exp $
%
% Atualizado em 2026 para a NBR 6023:2018: URL sem < >, [...] apos o tipo do
% evento, [S. l.] e [s. n.] com espaco, "4. ed.", "v. 1", "n. 2", "p. 10-20",
% "(ed.)" em minusculas e impressao do DOI.
%
% Atualizado em nov. 2026 para o Manual de normas UFPel para trabalhos
% acadêmicos (2023). Os comentários indicam a página impressa do Manual de
% cada regra. Campos novos: titleaddon (orientador, tradutor etc. após o
% título), editortype (org., coord., comp.; padrão ed.), eventtitle,
% eventnumber, eventyear e venue (eventos). Nomes de entidades devem ser
% escritos com iniciais maiúsculas no .bib, entre chaves: a lista os põe em
% maiúsculas e a chamada no texto os mantém como escritos.
%
% Copyright (C) 2001-2002 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%==============================================================================

%==============================================================================
% Definição dos campos das entradas
%==============================================================================
ENTRY
{ 
	author
	editor
	title
	booktitle
	chapter
	pages
	address
	publisher
	year
	journal
	month
	number
	edition
	howpublished
	institution
	key
	note
	organization
	school
	series
	type
	volume
    url
    urldate
    doi
    titleaddon
    editortype
    eventtitle
    eventnumber
    eventyear
    venue
}
{}
{
	label
	year.char
}

INTEGERS {i j n fn.i fn.j fn.depth inbook.part}
STRINGS {s t last.label last.year.char current.letter names new.pages}
STRINGS {nl fn.s fn.w fn.out fn.c fn.t}

%==============================================================================
% Definicao dos nomes dos meses
%==============================================================================
MACRO {jan} {"Jan."}
MACRO {feb} {"Feb."}
MACRO {mar} {"Mar."}
MACRO {apr} {"Apr."}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"Aug."}
MACRO {sep} {"Sept."}
MACRO {oct} {"Oct."}
MACRO {nov} {"Nov."}
MACRO {dec} {"Dec."}

%==============================================================================
% Definicao de strings usados na elaboracao das referencias
%==============================================================================
% Tipo padrão de teses e dissertações. O campo type deve trazer o tipo, o
% grau e o curso: "Dissertação (Mestrado em ...)" (Manual UFPel, p. 41-42).
FUNCTION {str:mastersthesis} {"Disserta{\c{c}}{\~a}o (Mestrado)"}
FUNCTION {str:phdthesis} {"Tese (Doutorado)"}
FUNCTION {str:chapter} {"Cap."}

%==============================================================================
% Definicao das abreviaturas padrao
%==============================================================================
MACRO {acmcs} {"ACM Computing Surveys"}
MACRO {acta} {"Acta Informatica"}
MACRO {cacm} {"Communications of the ACM"}
MACRO {ibmjrd} {"IBM Journal of Research and Development"}
MACRO {ibmsj} {"IBM Systems Journal"}
MACRO {ieeese} {"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} {"IEEE Transactions on Computers"}
MACRO {ieeetcad}
	{"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} {"Information Processing Letters"}
MACRO {jacm} {"Journal of the ACM"}
MACRO {jcss} {"Journal of Computer and System Sciences"}
MACRO {scp} {"Science of Computer Programming"}
MACRO {sicomp} {"SIAM Journal on Computing"}
MACRO {tocs} {"ACM Transactions on Computer Systems"}
MACRO {tods} {"ACM Transactions on Database Systems"}
MACRO {tog} {"ACM Transactions on Graphics"}
MACRO {toms} {"ACM Transactions on Mathematical Software"}
MACRO {toois} {"ACM Transactions on Office Information Systems"}
MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} {"Theoretical Computer Science"}

%==============================================================================
% Exibe warning quando um campo ``required'' esta' faltando. Recebe na pilha o
% tipo do campo.
%==============================================================================
FUNCTION {show.missing.field.warning}
{
	"Falta o campo " swap$ " em " cite$ * * * warning$
}

%==============================================================================
% Funcoes logicas
%==============================================================================
FUNCTION {not}
{
		{ #0 }
		{ #1 }
	if$
}

FUNCTION {and}
{
		'skip$
		{ pop$ #0 }
	if$
}

FUNCTION {or}
{
		{ pop$ #1 }
		'skip$
	if$
}

FUNCTION {is.numeric.char}
{
	#1 #1 substring$
	duplicate$ "" =
		{pop$ #0}
		{
			duplicate$ chr.to.int$ #47 >
			swap$ chr.to.int$ #58 <
			and
		}
	if$
}

FUNCTION {is.uppercase.char}
{
	#1 #1 substring$
	duplicate$ "" =
		{pop$ #0}
		{
			duplicate$ chr.to.int$ #64 >
			swap$ chr.to.int$ #91 <
			and
		}
	if$
}

%==============================================================================
% Escreve no arquivo o comando que gera o item
%
% Parm:
%	 um string com a formatacao do item
%==============================================================================
FUNCTION {write.item}
{
	"\bibitem[" label * "]{" * cite$ * "} " *
	swap$ *
	write$ newline$ newline$
}

%==============================================================================
% Separa o titulo em titulo e sub-titulo, empilhando o sub-titulo e o titulo,
% nessa ordem
%
% Parm:
%	 o titulo
%==============================================================================
FUNCTION {extract.subtitle}
{
	#1 'i :=

	duplicate$
	i #1 substring$
	{
		duplicate$ ":" = not
		swap$ "" = not
		and
	}
	{
		#1 i + 'i :=
		duplicate$
		i #1 substring$
	} while$

	duplicate$ i #999 substring$
	swap$
	#1 i #1 - substring$
}

%==============================================================================
% Separa a primeira palavra do texto, empilhando o resto e a palavra, nessa
% ordem
%
% Parm:
%	 o texto
%==============================================================================
FUNCTION {extract.first.word}
{
	#1 'i :=

	duplicate$
	i #1 substring$
	{
		duplicate$ " " = not
		swap$ "" = not
		and
	}
	{
		#1 i + 'i :=
		duplicate$
		i #1 substring$
	} while$

	duplicate$ i #999 substring$
	swap$
	#1 i #1 - substring$
}

%==============================================================================
% Enfatiza um string
%
% Parm:
%	 o string
%==============================================================================
FUNCTION {emphasize}
{
	"\textbf{" swap$ * "}" *
}

%==============================================================================
% Adiciona um texto (se nao-empty$) ja' formatado ao item, separando-o por
% ponto.
% Ex.: NOME. Titulo. data. ano.
%
% Parm:
%	 um string representando o item (pode ser vazio, para iniciar o item)
%	 o texto a ser adicionado
%==============================================================================
FUNCTION {add.to.item}
{
	duplicate$ empty$
		'pop$
		{
			swap$
			duplicate$ empty$
				'skip$
				{" " *}
			if$
			swap$ add.period$ *
		}
	if$
}

%==============================================================================
% Adiciona um item (se nao-empty$) a uma lista do tipo "a, b, c, ..."
%
% Parm:
%	 um string representando a lista (pode ser vazio, para criar uma lista)
%	 o item a ser adicionado
%==============================================================================
FUNCTION {add.to.list}
{
	duplicate$ empty$
		'pop$
		{
			swap$
			duplicate$ empty$
				'skip$
				{", " *}
			if$
			swap$ *
		}
	if$
}

%==============================================================================
% Adiciona um nome a uma lista de nomes (separados por ponto-e-virgula)
%
% Parm:
%	 um string representando a lista (pode ser vazio, para criar uma lista)
%	 o nome a ser adicionado
%==============================================================================
FUNCTION {add.to.namelist}
{
	swap$
	duplicate$ empty$
		'skip$
		{"; " *}
	if$
	swap$ *
}

%==============================================================================
% Formata uma lista de nomes.
%
% Parm:
%	 os nomes a serem formatados
%==============================================================================
%==============================================================================
% Abrevia os prenomes guardados em fn.s: "Tamara Meneghetti da" -> "T. M. da".
% Palavras iniciadas por minúscula (da, de, do, dos, das, e) são partículas e
% ficam por extenso (Manual UFPel, p. 39 e 42: "SANTOS, E. F. dos").
% A inicial pode ser um caractere especial ({\'E}) ou UTF-8 (É).
%==============================================================================
FUNCTION {abbrev.word}
{
	fn.w empty$
		'skip$
		{
			fn.w #1 #1 substring$ 'fn.c :=
			fn.c chr.to.int$ #96 >
			fn.c chr.to.int$ #123 <
			and
				{ fn.out fn.w * 'fn.out := }
				{
					fn.c "{" =
						{ fn.out fn.w #1 text.prefix$ * "." * 'fn.out := }
						{
							fn.c chr.to.int$ #127 >
								{
									fn.w " " * 'fn.t :=
									#2 'fn.j :=
									{
										fn.t fn.j #1 substring$ chr.to.int$ #127 >
										fn.t fn.j #1 substring$ chr.to.int$ #192 <
										and
									}
									{ fn.j #1 + 'fn.j := }
									while$
									fn.out fn.w #1 fn.j #1 - substring$ * "." * 'fn.out :=
								}
								{ fn.out fn.c * "." * 'fn.out := }
							if$
						}
					if$
				}
			if$
		}
	if$
	"" 'fn.w :=
}

FUNCTION {abbrev.first}
{
	"" 'fn.out :=
	"" 'fn.w :=
	#0 'fn.depth :=
	#1 'fn.i :=
	{ fn.s fn.i #1 substring$ "" = not }
	{
		fn.s fn.i #1 substring$ 'fn.c :=
		fn.c "{" = { fn.depth #1 + 'fn.depth := } 'skip$ if$
		fn.c "}" = { fn.depth #1 - 'fn.depth := } 'skip$ if$
		fn.depth #0 =
		fn.c " " = fn.c "~" = or fn.c "-" = or
		and
			{
				abbrev.word
				fn.c "-" =
					{ fn.out "-" * 'fn.out := }
					{ fn.out " " * 'fn.out := }
				if$
			}
			{ fn.w fn.c * 'fn.w := }
		if$
		fn.i #1 + 'fn.i :=
	}
	while$
	abbrev.word
	fn.out
}

%==============================================================================
% Formata o i-ésimo nome de nl: SOBRENOME, P. N. partícula.
% O sobrenome vai para maiúsculas com \MakeUppercase, que converte também
% letras acentuadas em UTF-8 (Manual UFPel, p. 24) e o nome de entidades
% escrito com iniciais maiúsculas no .bib (Manual UFPel, p. 27).
%==============================================================================
FUNCTION {format.one.name}
{
	"\MakeUppercase{" nl i "{ll}{~jj}" format.name$ * "}" *
	nl i "{ff}" format.name$ 'fn.s :=
	fn.s empty$
		'skip$
		{ ", " * abbrev.first * }
	if$
	nl i "{vv}" format.name$ 'fn.w :=
	fn.w empty$
		'skip$
		{ " " * fn.w * }
	if$
}

%==============================================================================
% Formata uma lista de nomes: até três autores, todos; quatro ou mais, o
% primeiro seguido de et al. (Manual UFPel, p. 25 e 41). Separados por ";".
%==============================================================================
FUNCTION {format.names}
{
	'nl :=
	nl num.names$ 'n :=
	#1 'i :=
	"" 'names :=
	{i n #1 + <}
	{
		nl i "{ll}" format.name$ "others" =
		n #3 >
		i #2 =
		and
		or
			{
				names " \MakeLowercase{et~al.}" * 'names :=
				n 'i :=
			}
			{ names format.one.name add.to.namelist 'names := }
		if$
		#1 i + 'i :=
	} while$
	names
	duplicate$ #-1 #1 substring$ "." = {
		#-2 global.max$ substring$
		"\@." *
	}
		'skip$
	if$
}

%==============================================================================
% Nomes para ordenação (sem comandos LaTeX): "sobrenome prenomes; ..."
%==============================================================================
FUNCTION {format.sort.names}
{
	'nl :=
	nl num.names$ 'n :=
	#1 'i :=
	"" 'names :=
	{i n #1 + <}
	{
		nl i "{ll}" format.name$ "others" =
			{ names " et al" * 'names := }
			{ names nl i "{ll}{ jj}{ ff}{ vv}" format.name$ * "   " * 'names := }
		if$
		#1 i + 'i :=
	} while$
	names
}

%==============================================================================
% Formata uma lista de sobrenomes.
%
% Parm:
%	 os nomes a serem formatados
%==============================================================================
FUNCTION {format.family.names}
{
	duplicate$ num.names$ 'n :=
	#1 'i :=
	"" 'names :=

	{i n #1 + <}
	{
		duplicate$ i "{ll}{~jj}" format.name$ 
		duplicate$ "others" =
		n #3 >
		i #2 =
		and
		or
		{
			pop$ names " \MakeLowercase{et~al.}" *
			n 'i :=
		}{
			names swap$ add.to.namelist
		} if$ 'names :=
		#1 i + 'i :=
	} while$
	pop$
	names
}

%==============================================================================
% Formata uma lista de sobrenomes com todos os autores.
%
% Parm:
%	 os nomes a serem formatados
%==============================================================================
FUNCTION {format.family.names.all}
{
	duplicate$ num.names$ 'n :=
	#1 'i :=
	"" 'names :=

	{i n #1 + <}
	{
		duplicate$ i "{ll}{~jj}" format.name$ 
		duplicate$ "others" =
		{
			pop$ names " \MakeLowercase{et~al.}" *
			n 'i :=
		}{
			names swap$ add.to.namelist
		} if$ 'names :=
		#1 i + 'i :=
	} while$
	pop$
	names
}

%==============================================================================
% Formata um titulo (pode ser `title' ou `booktitle')
%
% Parm:
%	 um valor (0 ou 1) que indica se a formatacao deve ser enfatizada ou nao
%	 um string com o titulo a ser formatado
%==============================================================================
FUNCTION {format.title}
{
	swap$ {
		extract.subtitle emphasize swap$ *
	}{
		skip$
	} if$
}

%==============================================================================
% Retorna a indicacao de paginas ajustada para ter dois tracos (`--') se a
% entrada so' tiver um.
%==============================================================================
FUNCTION {get.adjusted.pages}
{
	#1 'i :=
	"" 'new.pages :=
	{pages i #1 substring$ "" = not}
	{
		pages i #1 substring$ "-" =
		pages i #1 - #1 substring$ "-" =
		and
			'skip$
			{new.pages pages i #1 substring$ * 'new.pages :=}
		if$
		#1 i + 'i :=
	} while$
	new.pages
}

%==============================================================================
% Coloca a primeira palavra do titulo em letras maiusculas e o resto em
% minusculas. Esta funcao e' usada para gerar referencias cuja entrada e' pelo
% titulo.
%==============================================================================
%==============================================================================
% Artigos definidos e indefinidos (pt, en, es, fr, it, de). Recebe a palavra
% em minúsculas; devolve 1 se for artigo.
%==============================================================================
FUNCTION {is.article}
{
	'fn.t :=
	fn.t "o" = fn.t "a" = or fn.t "os" = or fn.t "as" = or
	fn.t "um" = or fn.t "uma" = or fn.t "uns" = or fn.t "umas" = or
	fn.t "the" = or fn.t "an" = or
	fn.t "el" = or fn.t "la" = or fn.t "los" = or fn.t "las" = or fn.t "lo" = or
	fn.t "le" = or fn.t "les" = or fn.t "un" = or fn.t "une" = or fn.t "des" = or
	fn.t "il" = or fn.t "der" = or fn.t "die" = or fn.t "das" = or
	fn.t "ein" = or fn.t "eine" = or
}

%==============================================================================
% Separa do título as palavras de entrada: a primeira e, se ela for artigo,
% também a seguinte (Manual UFPel, p. 22 e 28: "OS GRANDES julgamentos").
% Empilha o resto e as palavras de entrada, nessa ordem.
%==============================================================================
FUNCTION {split.entry.words}
{
	extract.first.word
	duplicate$ purify$ "l" change.case$ is.article
		{
			swap$
			duplicate$ #1 #1 substring$ " " =
				{ #2 global.max$ substring$ }
				'skip$
			if$
			extract.first.word
			'fn.t :=
			swap$ " " * fn.t *
		}
		'skip$
	if$
}

%==============================================================================
% Entrada pelo título: palavras de entrada em maiúsculas, sem negrito
% (Manual UFPel, p. 22 e 27-28: "EXPERIÊNCIAS de química: técnicas...").
%==============================================================================
FUNCTION {format.entrytitle}
{
	title split.entry.words
	"\MakeUppercase{" swap$ * "}" *
	swap$ *
}

%==============================================================================
% Chamada no texto para entrada pelo título: palavras de entrada seguidas de
% reticências, em maiúsculas e minúsculas (Manual UFPel, p. 62-63:
% "(O anteprojeto..., 2009, p. 69)").
%==============================================================================
FUNCTION {format.title.label}
{
	title split.entry.words
	swap$ duplicate$ empty$
		{ pop$ }
		{ pop$ "..." * }
	if$
}

%==============================================================================
% Converte a edicao literal ("First", "Second", etc., que é o padrão indicado
% no manual do BibTeX) para o algarismo correspondente. Recebe na pilha o
% string e devolve o numero.
%==============================================================================
FUNCTION {convert.to.number}
{
	duplicate$ "First" =
	{pop$ "1"}
	{duplicate$ "Second" =
	{pop$ "2"}
	{duplicate$ "Third" =
	{pop$ "3"}
	{duplicate$ "Fourth" =
	{pop$ "4"}
	{duplicate$ "Fifth" =
	{pop$ "5"}
	{duplicate$ "Sixth" =
	{pop$ "6"}
	{duplicate$ "Seventh" =
	{pop$ "7"}
	{duplicate$ "Eighth" =
	{pop$ "8"}
	{duplicate$ "Ninth" =
	{pop$ "9"}
	{duplicate$ "Tenth" =
	{pop$ "10"}
	{skip$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
}

%=========================================================================
% Formatacao dos campos. Se o campo nao existir a funcao devolve um string
% vazio.
%==============================================================================
FUNCTION {format.author}
{
	author empty$
		{""}
		{author format.names}
	if$
}

%==============================================================================
% Responsável pelo conjunto da obra seguido do tipo de participação, em
% minúsculas e no singular, entre parênteses: (org.), (coord.), (ed.), (comp.)
% (Manual UFPel, p. 26). O campo editortype traz a abreviatura; padrão: ed.
%==============================================================================
FUNCTION {format.editor}
{
	editor empty$
		{""}
		{
			editor format.names "~(" *
			editortype empty$ {"ed."} {editortype} if$ * ")" *
		}
	if$
}

%==============================================================================
% Edição (Manual UFPel, p. 18 e 28-29): indicada a partir da 2ª; número
% seguido de "ed." (2. ed.). Se o campo já trouxer texto no idioma do
% documento ("2nd", "2nd ed.", "3. ed. rev. ampl."), é transcrito como está.
%==============================================================================
% Devolve 1 se a cadeia (abaixo na pilha) contém o trecho (no topo)
FUNCTION {str.contains}
{
	'fn.w :=
	'fn.s :=
	#0 'fn.j :=
	#1 'fn.depth :=
	{ fn.s fn.depth fn.w text.length$ substring$ "" = not fn.j not and }
	{
		fn.s fn.depth fn.w text.length$ substring$ fn.w =
			{ #1 'fn.j := }
			'skip$
		if$
		fn.depth #1 + 'fn.depth :=
	}
	while$
	fn.j
}

FUNCTION {format.edition}
{
	edition empty$
		{""}
		{
			edition convert.to.number 'fn.t :=
			fn.t "1" =
				{""}
				{
					fn.t #-1 #1 substring$ is.numeric.char
						{ fn.t ". ed." * }
						{
							fn.t "ed." str.contains
								{ fn.t }
								{ fn.t " ed." * }
							if$
						}
					if$
				}
			if$
		}
	if$
}

FUNCTION {format.volume}
{
	volume empty$
		{""}
		{"v.~" volume *}
	if$
}

FUNCTION {format.number}
{
	number empty$
		{""}
		{"n.~" number *}
	if$
}

FUNCTION {format.month}
{
	month empty$
		{""}
		{month}
	if$
}

FUNCTION {format.address}
{
	address empty$
		{""}
		{address}
	if$
}

FUNCTION {format.publisher}
{
	type$ "mastersthesis" =
	type$ "phdthesis" =
	or
	{
		school empty$
			{""}
			{school}
		if$
	}{
	type$ "techreport" =
	{
		institution empty$
			{""}
			{institution}
		if$
	}{
		publisher empty$
			{""}
			{publisher}
		if$
	} if$
	} if$
}

FUNCTION {format.year}
{
	year empty$
		{""}
		{year}
	if$
}

FUNCTION {format.chapter}
{
	chapter empty$
		{""}
		{
			type empty$
				{str:chapter}
				{type "~" *}
			if$
			chapter *
		}
	if$
}

FUNCTION {format.pages}
{
	pages empty$
		{""}
		{"p.~" get.adjusted.pages *}
	if$
}

FUNCTION {format.totalpages}
{
	pages empty$
		{""}
		{pages "~p." *}
	if$
}

FUNCTION {format.totalleaves}
{
	pages empty$
		{""}
		{pages "~f." *}
	if$
}

FUNCTION {format.note}
{
	note empty$
		{""}
		{note}
	if$
}

FUNCTION {format.month.year}
{
	month empty$
		{year}
		{month "~" * year *}
	if$
}

FUNCTION {format.type}
{
	type empty$
		'skip$
		{pop$ type}
	if$
}

FUNCTION {format.howpublished}
{
	howpublished empty$
		{""}
		{howpublished}
	if$
}

FUNCTION {format.series}
{
	series empty$
		{""}
		{series}
	if$
}

FUNCTION {format.parenthised.number}
{
	number empty$ {
		""
	}{
		"(" number * ")" *
	} if$
}

%==============================================================================
% As seguintes funcoes adicionam um item a uma lista passada na pilha.
%==============================================================================
FUNCTION {add.address} {format.address add.to.list}
FUNCTION {add.publisher} {format.publisher add.to.list}
FUNCTION {add.year} {format.year add.to.list}
FUNCTION {add.chapter} {format.chapter add.to.list}
FUNCTION {add.edition} {format.edition add.to.list}
FUNCTION {add.volume} {format.volume add.to.list}
FUNCTION {add.number} {format.number add.to.list}
FUNCTION {add.month} {format.month add.to.list}
FUNCTION {add.totalpages} {format.totalpages add.to.list}
FUNCTION {add.pages} {format.pages add.to.list}
FUNCTION {add.note} {format.note add.to.list}
FUNCTION {add.month.year} {format.month.year add.to.list}
FUNCTION {add.howpublished} {format.howpublished add.to.list}

FUNCTION {format.urldate} {
	urldate empty$
    	{""}
		{"Acesso em: " urldate *}
   	if$
}

%==============================================================================
% DOI como endereço: "DOI: https://doi.org/10..." (Manual UFPel, p. 47).
% Aceita o campo com ou sem o prefixo https://doi.org/.
%==============================================================================
FUNCTION {format.doi} {
	doi empty$
		{""}
		{
			doi #1 #4 substring$ "http" =
				{ "DOI: \url{" doi * "}" * }
				{ "DOI: \url{https://doi.org/" doi * "}" * }
			if$
		}
	if$
}

%==============================================================================
% "Disponível em:" seguido do endereço (Manual UFPel, p. 39). O \url{} evita
% erro com _, %, # e & e permite quebrar endereços longos.
%==============================================================================
FUNCTION {format.url} {
	url empty$
		{""}
		{"Dispon{\'\i}vel em: \url{" url * "}" *}
	if$
}


%==============================================================================
% Converte virgula para dois-pontos; usado na formatacao do publisher de
% proceedings e inproceedings, que normalmente levam tambem o local de publi-
% cao; no padrao ABNT essa separacao deve ser por dois-pontos.
% Recebe o string original e devolve o novo.
%==============================================================================
FUNCTION {comma.to.colon}
{
	's :=
	"" 't :=
	#1 'i :=
	{s i #1 substring$ "" = not}
	{
		s i #1 substring$ duplicate$ "," =
			{pop$ t ":" * 't :=}
			{t swap$ * 't :=}
		if$
		i #1 + 'i :=
	} while$
	t
}

%
% localiza a posicao do primeiro caractere maiusculo
% recebe o string, devolve a posicao
%
FUNCTION {find.first.uppercase.char}
{
	's :=
	#1 'j :=
	#1 'i :=
	{
		s i #1 substring$ 't :=
		t "" = not
		t is.uppercase.char not
		and
	}
	{
		i #1 + 'i :=
		t "\" = not
		t "{" = not
		and
		t "}" = not
		and
			{i 'j :=}
			'skip$
		if$
	} while$
	t "" =
		{#1}
		{j}
	if$
}

%
% extrai o primeiro numero que aparece no string passado na pilha,
% retornando-o; se nao ha' numero, retorna ""
%
FUNCTION {extract.first.number}
{
	's :=
	"" 't :=
	#1 'i :=
	{
		s i #1 substring$
		duplicate$ is.numeric.char not
		swap$ "" = not
		and
	}
	{
		i #1 + 'i :=
	} while$
	{s i #1 substring$ is.numeric.char}
	{
		t s i #1 substring$ * 't :=
		i #1 + 'i :=
	} while$
	t
}

%
% divide um string em dois
% recebe o string e a posicao
% devolve a primeira e a segunda parte
FUNCTION {split.string}
{
	swap$ 's :=
	duplicate$
	s swap$ #1 swap$ #1 - substring$
	swap$ s swap$ global.max$ substring$
}

%
% recebe o titulo original e devolve, na ordem, o tipo de proceedings e o
% restante do titulo
%
FUNCTION {extract.proceedings.type}
{
	's :=
	type empty$ not
		{type s}
		{"dummy"
	pop$ s #1 #11 substring$ duplicate$ "Proceedings" =
		{s #12 global.max$ substring$}{
	pop$ s #1 #5 substring$ duplicate$ "Proc." =
		{pop$ "Proceedings" s #6 global.max$ substring$}{
	pop$ s #1 #22 substring$ duplicate$ "Conference Proceedings" =
		{pop$ "Proceedings" s #23 global.max$ substring$}{
	pop$ s #1 #6 substring$ duplicate$ "Annals" =
		{s #7 global.max$ substring$}{
	pop$ s #1 #5 substring$ duplicate$ "Actas" =
		{s #6 global.max$ substring$}{
	pop$ s #1 #5 substring$ duplicate$ "Anais" =
		{s #6 global.max$ substring$}{
	pop$ s #1 #6 substring$ duplicate$ "Anales" =
		{s #7 global.max$ substring$}{
	pop$ s #1 #8 substring$ duplicate$ "Memorias" =
		{s #9 global.max$ substring$}{
	pop$ s #1 #22 substring$ duplicate$ "Trabajos Seleccionados" =
		{s #23 global.max$ substring$}{
	pop$ s #1 #11 substring$ duplicate$ "Tagungsband" =
		{s #12 global.max$ substring$}
		{pop$ "Anais" s} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$
}

%==============================================================================
% Converte um booktitle do tipo "Proc. of XXX" no padrao ABNT
% Recebe na pilha o titulo original
% Devolve na pilha, na ordem:
% - o tipo de publicacao
% - o titulo ja' formatado (em maiusculas e com a edicao)
%==============================================================================
FUNCTION {process.proceedings.booktitle}
{
	extract.proceedings.type
	duplicate$ find.first.uppercase.char split.string "u" change.case$
	swap$ extract.first.number
	duplicate$ empty$
		'pop$
		{", " swap$ * * "." *}
	if$
}

%==============================================================================
% Estas funcoes formatam partes comuns a varios tipos de referencia.
%==============================================================================
FUNCTION {format.publication}
{
	""
	address empty$
		{
			"[S.~l."
			format.publisher empty$
				{":~s.~n.]" *}
				{"]: " format.publisher * *}
			if$ add.year add.to.item
		}
		{
			format.address
			format.publisher empty$
				{": [s.~n.]" *}
				{": " format.publisher * *}
			if$ add.year add.to.item
		}
	if$
}

%==============================================================================
% Responsabilidade e título de monografias. Com autor, entra pelo autor (o
% editor, se houver, é ignorado: use titleaddon para "Organização de ...").
% Sem autor, entra pelo editor. Sem nenhum dos dois, entra pelo título
% (Manual UFPel, p. 24-28). Recebe o item na pilha.
%==============================================================================
FUNCTION {add.head.and.title}
{
	author empty$ not
		{
			editor empty$ not
				{ "o editor de " cite$ * " foi ignorado porque a entrada tem autor" * warning$ }
				'skip$
			if$
			format.author add.to.item
			#1 title format.title add.to.item
		}
		{
			editor empty$ not
				{
					format.editor add.to.item
					#1 title format.title add.to.item
				}
				{ format.entrytitle add.to.item }
			if$
		}
	if$
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
}

%==============================================================================
% DOI, endereço eletrônico e data de acesso, nesta ordem, no fim da
% referência (Manual UFPel, p. 39 e 47).
%==============================================================================
FUNCTION {add.online}
{
	format.doi add.to.item
	format.url add.to.item
	format.urldate add.to.item
}

FUNCTION {format.proceedings.publication}
{
	publisher empty$
		{"[S.~l.:~s.~n.]"}
		{publisher comma.to.colon}
	if$ add.year
}

FUNCTION {format.misc.publication}
{
	address empty$
	publisher empty$
	and
		{""}
		{format.publication}
	if$
}

FUNCTION {format.series.info}
{
	"(" format.series *
	add.volume ")" *
}

FUNCTION {format.complementary.data.with.totalpages}
{
	"" format.totalpages add.to.item
	""
	series empty$
		{add.volume add.number add.to.item}
		{add.number add.to.item format.series.info add.to.item}
	if$
}

FUNCTION {format.complementary.data.with.page.range}
{
	""
	series empty$
		{add.volume add.number add.pages}
		{"" add.number add.pages add.to.item format.series.info add.to.item}
	if$
}

%
% esta funcao recebe o titulo a ser formatado
%
FUNCTION {format.proceedings.booktitle}
{
	process.proceedings.booktitle "" swap$ add.year add.address add.to.item
	swap$ emphasize " [\ldots]." * " " swap$ * *
}

%==============================================================================
% Evento com campos próprios (Manual UFPel, p. 48-51):
%   NOME DO EVENTO, número., ano, local. Tipo [...]. Local: Editora, ano.
% eventtitle = nome; eventnumber = número; eventyear = ano de realização
% (padrão: year); venue = cidade de realização; type = Anais (padrão),
% Anais eletrônicos, Proceedings etc.; address e publisher = publicação.
%==============================================================================
FUNCTION {format.event.head}
{
	"\MakeUppercase{" eventtitle * "}" *
	eventnumber empty$ 'skip$ { ", " * eventnumber * "." * } if$
	eventyear empty$ { year } { eventyear } if$ add.to.list
	venue empty$ 'skip$ { venue add.to.list } if$
	"" swap$ add.to.item
	type empty$ { "Anais" } { type } if$ emphasize " [\ldots]" * add.to.item
	format.publication add.to.item
}

%==============================================================================
% Formatacao das entradas
%==============================================================================
%==============================================================================
% Artigo de periódico (Manual UFPel, p. 46-47): AUTOR. Título. Periódico,
% local, v., n., p., mês ano. "[s. l.]" em minúsculas, porque não abre os
% dados de publicação (Manual UFPel, p. 30 e 47). Sem autor, entra pelo título
% (Manual UFPel, p. 48: "NETFLIX reúne...").
%==============================================================================
FUNCTION {article}
{
	""
	author empty$
		{ format.entrytitle add.to.item }
		{
			format.author add.to.item
			#0 title format.title add.to.item
		}
	if$
	journal emphasize
		address empty$ {
			"[s.~l.]" add.to.list
		}{
			add.address
		} if$
		add.volume add.number add.pages add.month.year add.to.item
	format.note add.to.item
	add.online
	write.item
}

%==============================================================================
% Monografia no todo (Manual UFPel, p. 41-43)
%==============================================================================
FUNCTION {book}
{
	""
	add.head.and.title
	format.edition add.to.item
	format.publication add.to.item
	format.complementary.data.with.totalpages add.to.item
	format.note add.to.item
	add.online
	write.item
}

%==============================================================================
% Parte de monografia do mesmo autor (Manual UFPel, p. 44-45): AUTOR. Título
% da parte. In: AUTOR. Título da obra. Local: Editora, ano. p. x-y.
% O título da parte vai em chapter; se chapter for só um número, a parte é
% indicada como "cap. N" antes das páginas.
%==============================================================================
FUNCTION {inbook}
{
	""
	chapter empty$
		{ #0 'inbook.part := }
		{ chapter #1 #1 substring$ is.numeric.char
			{ #0 'inbook.part := }
			{ #1 'inbook.part := }
		if$ }
	if$
	inbook.part
		{
			format.author add.to.item
			chapter add.to.item
			"In:"
				editor empty$
					{ format.author add.to.item }
					{ format.editor add.to.item }
				if$
				#1 title format.title add.to.item
			add.to.item
			titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
		}
		{ add.head.and.title }
	if$
	format.edition add.to.item
	format.publication add.to.item
	"" format.volume add.to.list
	inbook.part
		{ "" }
		{ chapter empty$ { "" } { "cap.~" chapter * } if$ }
	if$
	add.to.list
	format.pages add.to.list
	series empty$ 'skip$ { format.series.info add.to.item } if$
	add.to.item
	format.note add.to.item
	add.online
	write.item
}

%==============================================================================
% Parte de monografia (Manual UFPel, p. 44-45): AUTOR. Título da parte. In:
% RESPONSÁVEL (org.). Título da obra. Local: Editora, ano. p. x-y.
%==============================================================================
FUNCTION {incollection}
{
	""
	format.author add.to.item
	#0 title format.title add.to.item
	"In:"
		editor empty$
			'skip$
			{format.editor add.to.item}
		if$ 
		#1 booktitle format.title add.to.item add.to.item
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
	format.edition add.to.item
	format.publication add.to.item
	format.complementary.data.with.page.range add.to.item
	format.note add.to.item
	add.online
	write.item
}

FUNCTION {inproceedings}
{
	""
	format.author add.to.item
	#0 title format.title add.to.item
	eventtitle empty$
		{
			" In: " booktitle format.proceedings.booktitle * *
			format.proceedings.publication add.to.item
		}
		{ "In:" format.event.head add.to.item add.to.item }
	if$
	format.complementary.data.with.page.range add.to.item
	format.note add.to.item
	add.online
	write.item
}

FUNCTION {manual}
{
	""
	add.head.and.title
	format.edition add.to.item
	format.publication add.to.item
	format.complementary.data.with.totalpages add.to.item
	format.note add.to.item
	add.online
	write.item
}

%==============================================================================
% Trabalho acadêmico (Manual UFPel, p. 41-44):
%   AUTOR. Título. Orientador: Nome. Ano. N f. Tipo (Grau em Curso) – Unidade,
%   Universidade, Local, ano da defesa. Disponível em: ... Acesso em: ...
% Orientador e coorientador vão no campo titleaddon
% ("Orientadora: Nome. Coorientador: Nome"). O ano de defesa, no fim, é o
% campo year.
%==============================================================================
FUNCTION {mastersthesis}
{
	""
	format.author add.to.item
	#1 title format.title add.to.item
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
	format.year add.to.item
	format.totalleaves add.to.item
	str:mastersthesis format.type " -- " * format.publisher *
		add.address add.year add.to.item
	format.note add.to.item
	format.parenthised.number add.to.item
	add.online
	write.item
}

%==============================================================================
% Outros documentos: páginas da web, programas, legislação, preprints etc.
% (Manual UFPel, p. 53-62). AUTOR (ou TÍTULO). Título. Edição. Local: Editora,
% ano (ou só o ano). Descrição (howpublished). Nota. DOI. Disponível em: ...
% Acesso em: ... O ano aparece uma única vez.
%==============================================================================
FUNCTION {misc}
{
	""
	author empty$
		{
			title empty$
				'skip$
				{format.entrytitle add.to.item}
			if$
		}
		{
			format.author add.to.item
			title empty$
				'skip$
				{#1 title format.title add.to.item}
			if$
		}
	if$
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
	format.edition add.to.item
	address empty$ publisher empty$ and
		{ format.year add.to.item }
		{ format.publication add.to.item }
	if$
	format.complementary.data.with.totalpages add.to.item
	format.howpublished add.to.item
	format.note add.to.item
	add.online
	write.item
}

%==============================================================================
% Trabalho acadêmico (Manual UFPel, p. 41-44):
%   AUTOR. Título. Orientador: Nome. Ano. N f. Tipo (Grau em Curso) – Unidade,
%   Universidade, Local, ano da defesa. Disponível em: ... Acesso em: ...
% Orientador e coorientador vão no campo titleaddon
% ("Orientadora: Nome. Coorientador: Nome"). O ano de defesa, no fim, é o
% campo year.
%==============================================================================
FUNCTION {phdthesis}
{
	""
	format.author add.to.item
	#1 title format.title add.to.item
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
	format.year add.to.item
	format.totalleaves add.to.item
	str:phdthesis format.type " -- " * format.publisher *
		add.address add.year add.to.item
	format.note add.to.item
	format.parenthised.number add.to.item
	add.online
	write.item
}

FUNCTION {proceedings}
{
	""
	eventtitle empty$
		{
			title format.proceedings.booktitle *
			format.proceedings.publication add.to.item
		}
		{ format.event.head add.to.item }
	if$
	format.complementary.data.with.page.range add.to.item
	format.note add.to.item
	add.online
	write.item
}

FUNCTION {techreport}
{
	""
	format.author add.to.item
	#1 title format.title add.to.item
	titleaddon empty$ 'skip$ { titleaddon add.to.item } if$
	format.publication add.to.item
	type empty$
		{""}
		{type}
	if$ add.note add.to.item
	format.parenthised.number add.to.item
	add.online
	write.item
}

FUNCTION {booklet} {misc}
FUNCTION {unpublished} {misc}
FUNCTION {default.type} {misc}

%==============================================================================
% Inicializa algumas variaveis globais
%==============================================================================
FUNCTION {init}
{
	"" 'last.label :=
	"b" 'current.letter :=
}

%==============================================================================
% Retorna na pilha o string a ser usado para a ordenacao das entradas.
%==============================================================================
%==============================================================================
% Chave de ordenação: autoria (ou título), depois título. Documentos do mesmo
% autor são ordenados pelo título (Manual UFPel, p. 40).
%==============================================================================
FUNCTION {get.sortstring}
{
	author empty$ not {author format.sort.names}{
	editor empty$ not {editor format.sort.names}{
	eventtitle empty$ not {eventtitle}{
	title empty$ not {title}{
	note empty$ not {note}{
	key empty$ not {key}{
	"???"
	} if$
	} if$
	} if$
	} if$
	} if$
	} if$

	type$ "proceedings" = eventtitle empty$ and {
		pop$
		title process.proceedings.booktitle
		swap$ pop$
	}
		'skip$
	if$
	"    " *
	author empty$ editor empty$ and eventtitle empty$ and
		'skip$
		{ title empty$ 'skip$ { title * } if$ }
	if$
	purify$ "l" change.case$
}

%==============================================================================
% Define as ``keys'' para ordenacao
%==============================================================================
FUNCTION {set.sortkeys}
{
	get.sortstring
	"    " * format.year *
	#1 entry.max$ substring$
	#1 global.max$ substring$
	'sort.key$ :=
}

%==============================================================================
% Ajusta os labels, adicionando letras minusculas aos labels de mesmo autor e
% ano
%==============================================================================
FUNCTION {adjust.label}
{
        last.label
        label 'last.label :=
        label = {
                current.letter 'year.char :=
                current.letter chr.to.int$
                #1 + int.to.chr$
                'current.letter :=
        }{
		"" 'year.char :=
                "b" 'current.letter :=
	} if$
}
FUNCTION {reverse.adjust.label}
{
        last.year.char "b" = {
		"a" 'year.char :=
	}
		'skip$
	if$
        year.char 'last.year.char :=
}

%==============================================================================
% Retorna na pilha o string a ser usado para a construcao do label. Quase sempre
% sera' o sobrenome do primeiro autor, mas para alguns tipos de referencia pode
% ser o editor, a entidade ou o titulo
%==============================================================================
FUNCTION {get.labelstring}
{
	author empty$ not
		{author format.family.names}
		{
			editor empty$ not
				{editor format.family.names}
				{
					eventtitle empty$ not
						{eventtitle}
					{
					title empty$ not
						{format.title.label}
						{
							key empty$ not
								{key}
								{"???"}
							if$
						}
					if$
					}
					if$
				}
			if$
		}
	if$
}

%==============================================================================
% Retorna na pilha o string a ser usado para a construcao do label. Quase sempre
% sera' o sobrenome do primeiro autor, mas para alguns tipos de referencia pode
% ser o editor, a entidade ou o titulo
%
% esta versao retorna os nomes completos
%==============================================================================
FUNCTION {get.labelstring.all}
{
	author empty$ not
		{author format.family.names.all}
		{
			editor empty$ not
				{editor format.family.names.all}
				{
					eventtitle empty$ not
						{eventtitle}
					{
					title empty$ not
						{format.title.label}
						{
							key empty$ not
								{key}
								{"???"}
							if$
						}
					if$
					}
					if$
				}
			if$
		}
	if$
}

%==============================================================================
% Construção dos labels
%==============================================================================
FUNCTION {prepare.label.sorting}
{
	get.labelstring.all format.year *
	duplicate$ 'label :=
	"    " * title empty$ { "" } { title purify$ "l" change.case$ } if$ *
	'sort.key$ :=
}
FUNCTION {make.label}
{
	get.labelstring
	"(" *
	year empty$ {
		"????"
	}{
		year year.char *
	} if$ *
	")" *
	get.labelstring.all *
	#1 entry.max$ substring$
	#1 global.max$ substring$
	'label :=
}

%==============================================================================
% Inicia a definicao das referencias
%==============================================================================
FUNCTION {begin.bib}
{
	preamble$ empty$
		'skip$
		{preamble$ write$ newline$ newline$}
	if$
	"\begin{thebibliography}{\hspace{\parindent}}" write$ newline$
	newline$
}

%==============================================================================
% Termina a definicao das referencias
%==============================================================================
FUNCTION {end.bib}
{
	"\end{thebibliography}" write$ newline$
}

%==============================================================================
% main()
%==============================================================================
READ
EXECUTE {init}
ITERATE {prepare.label.sorting}
SORT
ITERATE {adjust.label}
REVERSE {reverse.adjust.label}
ITERATE {make.label}
ITERATE {set.sortkeys}
SORT
EXECUTE {begin.bib}
ITERATE {call.type$}
EXECUTE {end.bib}
