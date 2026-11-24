# Modelos LaTeX para Trabalhos Acadêmicos – UFPel

Este repositório disponibiliza **modelos LaTeX oficiais e exemplos práticos** para a elaboração de trabalhos acadêmicos da **Universidade Federal de Pelotas (UFPel)**, seguindo as normas da **ABNT** e diretrizes institucionais.

O objetivo é facilitar a escrita, padronização e formatação de documentos acadêmicos, oferecendo modelos prontos e arquivos auxiliares amplamente utilizados e mantidos ao longo dos anos.

---

## 📁 Estrutura do Repositório

### 📌 Arquivos principais

- **`texufpel.cls`**\
  Classe LaTeX principal da UFPel. Responsável pela padronização de capa, margens, fontes, espaçamentos, elementos pré-textuais e estrutura geral do documento.

- **`abnt.bst`**\
  Estilo bibliográfico no padrão ABNT para uso com BibTeX.

- **`bibliografia.bib`**\
  Arquivo de exemplo para organização das referências bibliográficas.

---

## 📄 Exemplos de documentos

Os arquivos abaixo são **modelos completos e funcionais**, prontos para adaptação conforme o tipo de trabalho acadêmico.

### 🎓 Trabalhos acadêmicos

- **`tcc/exemplo-tcc.tex`** – Trabalho de Conclusão de Curso

- **`tcc/exemplo-tcc-proposta.tex`** – Proposta de Trabalho de Conclusão de Curso

- **`dissertação/exemplo-diss.tex`** – Dissertação de Mestrado

- **`dissertação/exemplo-diss-proposta.tex`** – Proposta de Dissertação

- **`tese/exemplo-tese.tex`** – Tese de Doutorado

- **`qualificação/exemplo-qualificacao.tex`** – Exame de Qualificação

- **`trabalho-individual/exemplo-ti.tex`** – Trabalho Individual de mestrado (opção `ti`) ou doutorado (opção `tid`)

---

## 📊 Slides

- Exemplo 1 - <https://www.overleaf.com/read/ypzskcxbpvfb#c1803f>
- Exemplo 2 - <https://www.overleaf.com/project/6ad8045ac639ee8038aea4f9/share#c6af507a7347d140d8e5bf79fdb294b76b9986178b517595>
- Exemplo 3 - <https://www.overleaf.com/project/6ad80a86d19928eb64043a3b/share#804600748c78fa01817e2b599735ef61cd7f4191f62ab25b>

---

## 🛠️ Arquivos auxiliares e tutoriais

Documentos explicativos com orientações sobre funcionalidades específicas e formatações recorrentes em trabalhos acadêmicos.

- **`instruções/como_declarar_uso_de_ia.txt`**\
  Orientações para de *declaração do uso de ferramentas de IA*.

- **`instruções/como_fazer_apud_footcite.txt`**\
  Orientações para utilização de *apud* e citações em notas de rodapé.

- **`instruções/como_incluir_ficha_catalografica.txt`**\
  Instruções para inclusão da ficha catalográfica em PDF no documento LaTeX.

- **`instruções/como_incluir_lista_de_quadros.txt`**\
  Procedimentos para criação e inclusão da lista de quadros.

- **`instruções/como_incluir_tooltip_abreviacoes.txt`**\
  Uso de tooltips para exibição de abreviações e siglas.

---

## 🖼️ Arquivos de apoio

- **`ufpel.pdf`** e **`ufpelw.pdf`**\
  Arquivos gráficos institucionais da Universidade Federal de Pelotas.

---

## 🚀 Como utilizar

1. Escolha o arquivo de exemplo correspondente ao seu tipo de trabalho acadêmico.

2. Edite o arquivo `.tex` com o conteúdo do seu trabalho.

3. Compile o documento utilizando uma das opções abaixo:

   - **Overleaf**

   - **TeXstudio**

   - **VS Code com LaTeX Workshop**

   - **Linha de comando**, a partir da pasta raiz do repositório (onde estão a classe, o `abnt.bst`, o `bibliografia.bib` e a pasta `imagens/`), por exemplo:

     ```bash
     pdflatex tcc/exemplo-tcc
     bibtex   exemplo-tcc
     pdflatex tcc/exemplo-tcc
     pdflatex tcc/exemplo-tcc
     ```

---

## 👥 Público-alvo

- Estudantes de graduação e pós-graduação da UFPel
- Docentes e pesquisadores
- Usuários LaTeX interessados em modelos acadêmicos no padrão ABNT

---

## 📖 Documento Referência

- Manual de Normas - Atualização 2023:\
  <https://wp.ufpel.edu.br/sisbi/manual-de-normas-ufpel-para-trabalhos-academicos-atualizada-2023/>

---

## 🤝 Contribuições

Contribuições são bem-vindas e incentivadas.

- Correções e ajustes
- Atualizações conforme normas vigentes
- Inclusão de novos exemplos
- Melhorias na classe LaTeX

### Utilize **issues** ou envie **pull requests**.

---

## 📜 Licença

This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3c of this license or (at any option) any later version. The latest version of this license is at [https://www.latex-project.org/lppl.txt](url), version 1.3c or later.

This work has the LPPL maintenance status *maintained*.
