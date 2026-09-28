# Modelos LaTeX para Trabalhos Acadêmicos – UFPel

Este repositório disponibiliza **modelos LaTeX oficiais e exemplos práticos** para a elaboração de trabalhos acadêmicos da **Universidade Federal de Pelotas (UFPel)**, seguindo as normas da **ABNT** e diretrizes institucionais.

O objetivo é facilitar a escrita, padronização e formatação de documentos acadêmicos, oferecendo modelos prontos e arquivos auxiliares amplamente utilizados e mantidos ao longo dos anos.

---

## 📁 Estrutura do Repositório

### 📌 Arquivos principais

- **`texufpel.cls`**  
  Classe LaTeX principal da UFPel. Responsável pela padronização de capa, margens, fontes, espaçamentos, elementos pré-textuais e estrutura geral do documento.

- **`abnt.bst`**  
  Estilo bibliográfico no padrão ABNT para uso com BibTeX.

- **`bibliografia.bib`**  
  Arquivo de exemplo para organização das referências bibliográficas.

- **`Makefile`**  
  Arquivo para automatizar o processo de compilação dos documentos LaTeX via linha de comando.

---

## 📄 Exemplos de documentos

Os arquivos abaixo são **modelos completos e funcionais**, prontos para adaptação conforme o tipo de trabalho acadêmico.

### 🎓 Trabalhos acadêmicos

- **`exemplo-tcc.tex`** – Trabalho de Conclusão de Curso  
- **`exemplo-tcc-proposta.tex`** – Proposta de Trabalho de Conclusão de Curso  

- **`exemplo-diss.tex`** – Dissertação de Mestrado  
- **`exemplo-diss-proposta.tex`** – Proposta de Dissertação  

- **`exemplo-tese.tex`** – Tese de Doutorado  
- **`exemplo-tese-proposta.tex`** – Proposta de Tese  

- **`exemplo-qualificacao.tex`** – Exame de Qualificação  

- **`exemplo-ti.tex`** – Trabalho de Iniciação Científica ou Trabalho Técnico  

---

## 📊 Slides

- **`exemplo-slides/`**  
  Diretório contendo exemplos de apresentações acadêmicas desenvolvidas em LaTeX.

---

## 🛠️ Arquivos auxiliares e tutoriais

Documentos explicativos com orientações sobre funcionalidades específicas e formatações recorrentes em trabalhos acadêmicos.

- **`como_fazer_apud_footcite.txt`**  
  Orientações para utilização de *apud* e citações em notas de rodapé.

- **`como_incluir_ficha_catalografica.txt`**  
  Instruções para inclusão da ficha catalográfica em PDF no documento LaTeX.

- **`como_incluir_lista_de_quadros.txt`**  
  Procedimentos para criação e inclusão da lista de quadros.

- **`como_incluir_tooltip_abreviacoes.txt`**  
  Uso de tooltips para exibição de abreviações e siglas.

---

## 🖼️ Arquivos de apoio

- **`figura.pdf`**  
  Arquivo de exemplo para inserção e formatação de figuras.

- **`ufpel.pdf`**  
- **`ufpelw.pdf`**  
  Arquivos gráficos institucionais da Universidade Federal de Pelotas.

---

## 🚀 Como utilizar

1. Escolha o arquivo de exemplo correspondente ao seu tipo de trabalho acadêmico.
2. Edite o arquivo `.tex` com o conteúdo do seu trabalho.
3. Compile o documento utilizando uma das opções abaixo:
   - **Overleaf**
   - **TeXstudio**
   - **VS Code com LaTeX Workshop**
   - **Linha de comando**:
     ```bash
     make
     ```
     ou
     ```bash
     pdflatex arquivo.tex
     ```

---

## 👥 Público-alvo

- Estudantes de graduação e pós-graduação da UFPel  
- Docentes e pesquisadores  
- Usuários LaTeX interessados em modelos acadêmicos no padrão ABNT  

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

This work has the LPPL maintenance status _maintained_.
