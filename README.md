
# SIDERA PREDICT — Sistema Inteligente de Inspeção Dimensional

---

## 1. Visão Geral do Projeto

O **SIDERA PREDICT** é um sistema inteligente de inspeção dimensional automatizada, desenvolvido para aplicação em ambientes industriais, com foco na inspeção de peças metálicas (especialmente perfis dobrados e cortados) diretamente no chão de fábrica. O projeto visa aumentar a confiabilidade, rastreabilidade e eficiência do controle de qualidade, reduzindo falhas dimensionais e custos associados a retrabalho e devoluções.

---

## 2. Motivação e Problema

Na indústria metalúrgica, a conformidade dimensional das peças é crítica para garantir a qualidade do produto final. Os principais problemas enfrentados atualmente incluem:

- **Erros dimensionais** (ex: ângulos fora de especificação, abas fora de medida, dobras invertidas, geometrias incorretas)
- **Inspeção manual e subjetiva**, dependente da atenção do operador
- **Baixa rastreabilidade** e dificuldade em identificar a origem de falhas
- **Impacto financeiro** devido a retrabalho, devoluções e insatisfação do cliente

O SIDERA PREDICT foi concebido para atacar esses pontos, automatizando a inspeção e fornecendo dados confiáveis em tempo real.

---

## 3. Público-Alvo

- **Operadores de Máquina:** Necessitam validar rapidamente a conformidade das peças sem interromper o fluxo produtivo.
- **Inspetores de Qualidade:** Demandam ferramentas para garantir a conformidade dimensional, com rastreabilidade e geração de relatórios.
- **Gestores Industriais:** Buscam indicadores de desempenho, redução de custos e melhoria contínua dos processos.

---

## 4. Objetivos do Sistema

O SIDERA PREDICT tem como objetivos principais:

1. Automatizar a inspeção dimensional de peças metálicas utilizando visão computacional e CAD.
2. Eliminar a subjetividade e dependência da inspeção manual.
3. Garantir rastreabilidade total dos resultados de inspeção.
4. Fornecer feedback imediato ao operador, permitindo ação rápida sobre peças não conformes.
5. Gerar relatórios gerenciais e estatísticos para suporte à tomada de decisão.

---

## 5. Solução Proposta

O sistema consiste em um aplicativo móvel (Flutter) que:

- Captura imagens da peça (perfil lateral e/ou frontal) via câmera
- Extrai medidas reais utilizando algoritmos de visão computacional e referência de escala
- Compara automaticamente as medidas com o modelo CAD (DXF/DWG)
- Valida as dimensões com base em tolerâncias técnicas (normas)
- Classifica a peça como **conforme** ou **não conforme** (OK/NOK)
- Registra automaticamente todos os dados relevantes (peça, máquina, operador, resultado)
- Gera relatórios e históricos para rastreabilidade e melhoria contínua

O sistema foi projetado para ser robusto, rápido, de fácil uso (mesmo com luvas) e compatível com o ambiente industrial.

---

## 6. Diferenciais Técnicos

- Execução local (Edge AI), sem dependência de nuvem
- Baixa latência (resposta em tempo real)
- Interface adaptada para uso industrial (botões grandes, poucos cliques)
- Integração com rede interna e banco de arquivos CAD
- Precisão dimensional confiável, respaldada por normas técnicas

---

## 7. Estrutura do Projeto

- Documentação acadêmica completa (casos de uso, requisitos, backlog, regras de negócio)
- Código-fonte do aplicativo móvel (Flutter)
- Exemplos de arquivos CAD e relatórios

---

## 8. Referências e Normas

- Normas técnicas de tolerância dimensional (ex: ABNT, ISO)
- Documentação de integração CAD (DXF/DWG)
- Práticas recomendadas de inspeção industrial

---

## 9. Contato

Para dúvidas, sugestões ou colaboração, entre em contato com a equipe de desenvolvimento.

Focado na validação automática das peças dobradas.

* **Acesso Direto:** Sem login — foco total na agilidade.
* **Seleção de Peça:** Via código/OP, vinculada ao desenho técnico.
* **Leitura de CAD:** O sistema acessa o modelo original da peça (DXF/DWG).
* **Captura Guiada:** A câmera orienta o melhor ângulo (perfil lateral).
* **Medição por Visão Computacional:** Extração de:
  - Ângulos
  - Comprimento de abas
  - Base do perfil
* **Comparação Automática:** Medidas reais × CAD.
* **Validação com Tolerância:** Baseada em normas técnicas.
* **Feedback Instantâneo:**
  - 🟢 Conforme
  - 🔴 Não Conforme

---

### 📊 Módulo de Inteligência e Qualidade

Transforma medições em dados estratégicos.

* **Detalhamento da Falha:**
  - Qual medida está fora
  - Valor esperado vs real
* **Registro Automático:**
  - Máquina
  - Operador
  - Lote
* **Histórico de Inspeções**
* **Dashboard de KPIs:**
  - Taxa de erro
  - Máquinas com mais falhas
  - Tipos de erro (dobra, ângulo, etc.)

---

## 🚀 Tecnologias Utilizadas

* **Framework:** Flutter (Android/iOS)
* **Visão Computacional:** OpenCV / TensorFlow Lite
* **Processamento:** Edge Computing (local)
* **Integração:** Leitura de arquivos CAD (DXF/DWG)
* **IA Generativa:** Google Gemini (explicações técnicas)
* **UI/UX:** Design otimizado para ambiente industrial

---

## 🧠 Diferencial do Projeto

Ao invés de usar IA genérica para “adivinhar defeitos”, o sistema:

✔ Usa **dados reais de engenharia (CAD)**  
✔ Faz **comparação objetiva (medição)**  
✔ Trabalha com **tolerâncias industriais**  
✔ Resolve o **problema real da fábrica**

---

## 📁 Estrutura do Repositório

* `/docs/`: Documentação oficial
	* `BACKLOG.MD`
	* `RF.MD`
	* `RN.MD`
	* `RNF.MD`
	* `UC.md`
* `/.github/`: Templates de desenvolvimento

---

## 📚 Documentação e Padronização

Todos os documentos seguem rastreabilidade:

- RF (Requisitos Funcionais)
- RN (Regras de Negócio)
- RNF (Não Funcionais)
- UC (Casos de Uso)

> Sempre manter consistência entre os arquivos.

---

## 🤝 Metodologia de Trabalho

1. Criação de Issue
2. Branch por funcionalidade
3. Pull Request com checklist
4. Rastreabilidade obrigatória

---