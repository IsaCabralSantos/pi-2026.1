
# Requisitos Funcionais — SIDERA PREDICT

---

**RF01 — Acesso Imediato**
O sistema deve permitir acesso imediato ao aplicativo, sem necessidade de login, para não impactar o ritmo da produção.
Critério: O tempo de inicialização não deve exceder 3 segundos.

**RF02 — Seleção de Peça**
O sistema deve permitir a seleção da peça a ser inspecionada por código ou OP (ordem de produção).
Critério: Busca automática do arquivo CAD correspondente.

**RF03 — Acesso ao CAD**
O sistema deve acessar automaticamente o arquivo CAD da peça selecionada, garantindo que a inspeção utilize o modelo correto.
Critério: Suporte a formatos DXF e DWG.

**RF04 — Extração de Dimensões do CAD**
O sistema deve extrair automaticamente todas as dimensões relevantes do CAD (abas, ângulos, base, furos, etc.).
Critério: Extração sem intervenção manual.

**RF05 — Captura de Imagem da Peça**
O sistema deve capturar imagem da peça (perfil lateral e/ou frontal) via câmera do dispositivo.
Critério: Orientação visual para ângulo ideal de captura.

**RF06 — Medição Dimensional por Visão Computacional**
O sistema deve calcular as medidas reais da peça a partir da imagem capturada, utilizando referência de escala.
Critério: Precisão compatível com tolerância técnica.

**RF07 — Comparação Automática com CAD**
O sistema deve comparar as medidas reais extraídas com as dimensões do CAD.
Critério: Destacar diferenças e desvios.

**RF08 — Validação com Tolerância Técnica**
O sistema deve validar as medidas com base em tolerâncias técnicas normatizadas.
Critério: Tolerâncias parametrizáveis conforme norma.

**RF09 — Retorno Imediato de Resultado**
O sistema deve retornar imediatamente o resultado da inspeção:
  - Conforme (OK)
  - Não conforme (NOK)
Critério: Feedback visual (verde/vermelho) em até 2 segundos.

**RF10 — Indicação de Dimensão Não Conforme**
O sistema deve indicar qual(is) dimensão(ões) está(ão) fora da tolerância.
Critério: Destacar visualmente o erro.

**RF11 — Inspeção Multi-ângulo**
O sistema deve permitir inspeção por múltiplos ângulos quando necessário.
Critério: Solicitar imagens adicionais se o perfil exigir.

**RF12 — Registro Automático dos Resultados**
O sistema deve registrar automaticamente todos os resultados de inspeção, associando peça, máquina, operador, data/hora e resultado.
Critério: Dados salvos sem intervenção manual.

---