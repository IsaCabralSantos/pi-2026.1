# Casos de Uso — Sistema de Inspeção Dimensional

---

## UC01 — Inspecionar Peça Dimensionalmente
**Descrição:** Permite ao operador inspecionar uma peça dobrada ou cortada, comparando suas dimensões reais com o modelo CAD e validando tolerâncias.

**Atores:** Operador, Sistema

**Pré-condições:**
- O operador está autenticado no sistema.
- O arquivo CAD da peça está disponível na rede.

**Fluxo Principal:**
1. O operador abre o aplicativo de inspeção.
2. Seleciona a peça a ser inspecionada (por OP/código).
3. O sistema localiza e carrega automaticamente o arquivo CAD correspondente.
4. O sistema orienta o operador sobre o ângulo e posição ideais para captura da imagem.
5. O operador posiciona a peça e captura a imagem via câmera do dispositivo.
6. O sistema processa a imagem, extrai as medidas relevantes (base, abas, ângulos, espessura, etc.).
7. O sistema compara as medidas extraídas com as dimensões do CAD.
8. O sistema verifica se as medidas estão dentro das tolerâncias estabelecidas por norma.
9. O sistema apresenta o resultado ao operador:
   - Peça conforme (OK, verde)
   - Peça não conforme (NOK, vermelho)

**Fluxos Alternativos:**
- 3a. Caso o arquivo CAD não seja encontrado, o sistema exibe mensagem de erro e solicita nova seleção.
- 5a. Se a imagem estiver inadequada (baixa qualidade, ângulo incorreto), o sistema solicita nova captura.

**Pós-condições:**
- O resultado da inspeção é registrado no histórico do sistema.

---

## UC02 — Análise de Não Conformidade
**Descrição:** Detalha as divergências encontradas durante a inspeção, facilitando a identificação e correção de falhas.

**Atores:** Sistema, Inspetor de Qualidade

**Pré-condições:**
- Uma inspeção dimensional foi realizada e resultou em não conformidade.

**Fluxo Principal:**
1. O sistema detecta que uma ou mais medidas estão fora da tolerância.
2. Exibe para o usuário:
   - Medida esperada (CAD)
   - Medida real (capturada)
   - Desvio calculado

3. Destaca visualmente o(s) erro(s) identificados (ex: ângulo, aba, base, furo, etc.).
4. Indica que a peça não conforme deve ser separada do lote para descarte ou retrabalho, conforme procedimento interno.
5. Permite ao inspetor registrar observações e possíveis causas.

**Pós-condições:**
- O registro de não conformidade é salvo para análise posterior e geração de relatórios.

---

## UC03 — Registro Automático de Inspeção
**Descrição:** Garante o armazenamento automático de todas as inspeções realizadas, associando dados relevantes para rastreabilidade.

**Atores:** Sistema

**Pré-condições:**
- Uma inspeção foi realizada (conforme ou não conforme).

**Fluxo Principal:**
1. O sistema registra automaticamente:
   - Identificação da peça
   - Máquina utilizada
   - Operador responsável
   - Data e hora
   - Resultado da inspeção
2. Armazena o registro no histórico, disponível para consulta e auditoria.

**Pós-condições:**
- Dados disponíveis para rastreabilidade, estatísticas e relatórios.

---

## UC04 — Geração de Relatórios de Qualidade
**Descrição:** Permite a geração de relatórios gerenciais e estatísticos sobre o processo de inspeção e qualidade das peças.

**Atores:** Gestor, Inspetor de Qualidade

**Pré-condições:**
- Existência de registros de inspeção no sistema.

**Fluxo Principal:**
1. O usuário solicita a geração de relatório.
2. O sistema compila e apresenta informações como:
   - Taxa de erro por período
   - Máquinas com maior incidência de problemas
   - Tipos e frequências de falhas
   - Histórico de não conformidades
3. O usuário pode exportar ou imprimir o relatório.

**Pós-condições:**
- Relatórios disponíveis para tomada de decisão, auditorias e melhoria contínua.

---

# Modelagem Comportamental

## Caso Principal 1 — Inspecionar Peça Dimensionalmente (UC01)

### Fluxo detalhado
1. Operador abre o aplicativo no posto de inspeção.
2. Sistema apresenta tela inicial com opção de selecionar peça por código ou OP.
3. Operador informa código/OP da peça.
4. Sistema busca o CAD correspondente.
5. Sistema valida existência e integridade do arquivo CAD.
6. Sistema extrai dimensões de referência do CAD (abas, ângulos, base, furos).
7. Sistema exibe orientação visual para captura no perfil lateral prioritário.
8. Operador posiciona a peça e realiza a captura.
9. Sistema avalia qualidade da imagem e enquadramento.
10. Sistema processa visão computacional e calcula medidas reais.
11. Sistema compara medidas reais versus medidas do CAD.
12. Sistema valida cada medida com tolerância técnica parametrizada.
13. Sistema determina resultado global (OK/NOK).
14. Sistema destaca pontos fora de tolerância, quando existirem.
15. Sistema registra automaticamente os dados da inspeção.
16. Sistema exibe feedback final em tempo real para o operador.

### Diagrama de atividades (PlantUML)
### Diagramas (imagens)

![Diagrama de atividades UC01](docs/diagrams/UC01_activities.png)

docs/diagrams/UC01_activities.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC01_activities.png

![Diagrama de sequência UC01](docs/diagrams/UC01_sequence.png)

docs/diagrams/UC01_sequence.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC01_sequence.png

## Caso Principal 2 — Analise de Nao Conformidade (UC02)

### Fluxo detalhado
1. Sistema recebe resultado NOK da inspeção dimensional.
2. Sistema identifica dimensões fora da tolerância e calcula desvio por item.
3. Sistema monta painel de diagnóstico com medida esperada, medida real e desvio.
4. Sistema destaca visualmente os pontos críticos na peça/imagem.
5. Inspetor de Qualidade revisa inconsistências e classifica severidade.
6. Sistema orienta segregação da peça para descarte ou retrabalho.
7. Inspetor registra observações e possíveis causas.
8. Sistema salva ocorrência para rastreabilidade e relatório.

### Diagrama de atividades (PlantUML)
### Diagramas (imagens)

![Diagrama de atividades UC02](docs/diagrams/UC02_activities.png)

docs/diagrams/UC02_activities.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC02_activities.png

![Diagrama de sequência UC02](docs/diagrams/UC02_sequence.png)

docs/diagrams/UC02_sequence.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC02_sequence.png

## Caso Principal 3 — Geração de Relatórios de Qualidade (UC04)

### Fluxo detalhado
1. Gestor ou inspetor acessa módulo de relatórios.
2. Usuário define filtros (período, máquina, tipo de falha, status).
3. Sistema consulta base de inspeções e não conformidades.
4. Sistema agrega indicadores (taxa de erro, top falhas, incidência por máquina).
5. Sistema gera visão analítica e lista detalhada de ocorrências.
6. Usuário valida conteúdo e escolhe exportar ou imprimir.
7. Sistema gera artefato final (PDF/impressão) e registra emissão.

### Diagrama de atividades (PlantUML)
### Diagramas (imagens)

![Diagrama de atividades UC04](docs/diagrams/UC04_activities.png)

docs/diagrams/UC04_activities.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC04_activities.png

![Diagrama de sequência UC04](docs/diagrams/UC04_sequence.png)

docs/diagrams/UC04_sequence.png — https://github.com/joaoaugusto-dev/pi-2026.1/blob/main/docs/diagrams/UC04_sequence.png

---
