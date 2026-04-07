
# Backlog do Produto — SIDERA PREDICT

---

## Épico 1: Inspeção Dimensional Automatizada
**Contexto:** Automatizar a inspeção de peças metálicas, reduzindo erros dimensionais e aumentando a confiabilidade do processo.

- **US01 — Acesso Rápido ao Sistema**
  - Como operador, desejo acessar o sistema sem burocracia para não atrasar a produção.
  - Critério: O app deve abrir e estar pronto para uso em até 3 segundos.

- **US02 — Seleção da Peça (OP/Código)**
  - Como operador, desejo selecionar a peça por OP ou código para garantir que a inspeção será feita no modelo correto.
  - Critério: Busca automática do CAD correspondente.

- **US03 — Captura Guiada (Perfil Lateral)**
  - Como operador, desejo ser orientado sobre o ângulo ideal de captura para garantir medições precisas.
  - Critério: Sistema sugere ângulo e valida qualidade da imagem.

- **US04 — Medição por Visão Computacional**
  - Como sistema, desejo extrair medidas reais da peça a partir da imagem capturada.
  - Critério: Medidas extraídas devem ser compatíveis com o CAD.

- **US05 — Comparação Automática com CAD**
  - Como sistema, desejo comparar as medidas reais com as do CAD para identificar conformidade.
  - Critério: Diferenças e desvios destacados.

- **US06 — Validação com Tolerância Técnica**
  - Como sistema, desejo validar as medidas com base em tolerâncias normatizadas.
  - Critério: Tolerâncias parametrizáveis conforme norma.

- **US07 — Feedback Imediato (OK/NOK)**
  - Como operador, desejo receber o resultado da inspeção imediatamente para separar peças não conformes.
  - Critério: Feedback visual (verde/vermelho) em até 2 segundos.

---

## Épico 2: Integração com Engenharia (CAD)
**Contexto:** Garantir que a inspeção utilize sempre o modelo CAD mais atualizado e correto.

- **US08 — Leitura de Arquivos CAD (DXF/DWG)**
  - Como sistema, desejo ler arquivos CAD para obter as dimensões de referência.
  - Critério: Suporte a formatos DXF e DWG.

- **US09 — Extração Automática de Dimensões**
  - Como sistema, desejo extrair automaticamente todas as dimensões relevantes do CAD.
  - Critério: Base, abas, ângulos, furos, etc.

- **US10 — Sincronização com Servidor Interno**
  - Como sistema, desejo sincronizar os arquivos CAD com o servidor da engenharia.
  - Critério: Sempre utilizar a versão mais recente.

- **US11 — Identificação Automática da Peça Correta**
  - Como sistema, desejo identificar automaticamente o modelo correto a partir do código/OP.
  - Critério: Eliminar risco de inspeção com modelo desatualizado.

---

## Épico 3: Inspeção Inteligente Assistida
**Contexto:** Aumentar a precisão e a facilidade de uso, reduzindo erros humanos.

- **US12 — Sugestão de Ângulos de Captura**
  - Como sistema, desejo sugerir ângulos ideais para captura de imagem.
  - Critério: Orientação visual e textual.

- **US13 — Multi-visão (Frente + Lateral)**
  - Como sistema, desejo permitir inspeção por múltiplos ângulos quando necessário.
  - Critério: Sistema solicita imagens adicionais se o perfil exigir.

- **US14 — Detecção de Erros Comuns**
  - Como sistema, desejo identificar automaticamente erros como:
    - Dobra errada
    - Dobra invertida
    - Ângulo fora da especificação
    - Aba fora de medida
  - Critério: Destacar visualmente o tipo de erro.

---

## Épico 4: Registro e Rastreabilidade
**Contexto:** Garantir rastreabilidade total e geração de indicadores para melhoria contínua.

- **US15 — Registro Automático da Inspeção**
  - Como sistema, desejo registrar automaticamente todos os dados da inspeção.
  - Critério: Dados salvos sem intervenção manual.

- **US16 — Identificação de Máquina e Operador**
  - Como sistema, desejo associar cada inspeção à máquina e ao operador responsável.
  - Critério: Rastreabilidade completa.

- **US17 — Histórico por Lote**
  - Como gestor, desejo consultar o histórico de inspeções por lote de produção.
  - Critério: Filtros por data, peça, máquina, operador.

- **US18 — Relatórios Automáticos**
  - Como gestor, desejo gerar relatórios estatísticos e gerenciais automaticamente.
  - Critério: Exportação em PDF/Excel, gráficos e indicadores.

---