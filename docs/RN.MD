
### Regras de Negócio (RN)

* **RN01 - Classificação Tripla Exclusiva:** Toda inspeção submetida ao modelo deve, obrigatoriamente, resultar em apenas um dos três estados possíveis: Aprovado, Anomalia Detectada ou Falha de Leitura.
* **RN02 - Gatilho de Laudo Automatizado:** A requisição para a API do Gemini (geração de laudos e recomendações) só deve ser disparada se, e somente se, o status da inspeção for classificado como "Anomalia Detectada".
* **RN03 - Fricção Zero no Chão de Fábrica:** Nenhuma etapa de preenchimento manual de formulários deve ser exigida do Inspetor durante o fluxo principal (apenas liberação a edições) de "SCAN"; os dados devem ser estruturados e repassados de forma automatizada pelo sistema.
* **RN04 - Padronização de Laudos:** Os e-mails e ordens de serviço gerados devem seguir um template técnico estrito pré-definido pelo módulo de Inteligência, impedindo variações de formatação que prejudiquem a leitura da equipe de manutenção.
