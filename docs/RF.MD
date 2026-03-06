
## Requisitos Funcionais (RF)

* **RF01 - Acesso Direto:** O aplicativo deve permitir o acesso imediato à tela principal de inspeção sem a necessidade de autenticação (login/senha).
* **RF02 - Câmera com Guias Visuais:** O sistema deve disponibilizar uma interface de câmera integrada com o enquadramento correto da peça.
* **RF03 - Captura e Análise de Imagem:** O aplicativo deve capturar a foto da peça e enviá-la instantaneamente para análise do modelo de Inteligência Artificial (Preditiva) embarcado.
* **RF04 - Feedback Visual de Status:** O sistema deve exibir o resultado da inspeção em tempo real utilizando um padrão de cores: Verde (Aprovado), Vermelho (Anomalia Detectada) e Laranja (Falha de Leitura).
* **RF05 - Raio-X da Inspeção:** O aplicativo deve apresentar uma tela de detalhamento para peças reprovadas, destacando os pontos exatos da anomalia na imagem e o grau de confiabilidade (percentual) da IA.
* **RF06 - Geração de Laudos via IA Generativa:** O sistema deve integrar-se ao Google Gemini para redigir automaticamente descrições técnicas detalhando a causa provável do defeito encontrado.
* **RF07 - Recomendações de Ajuste:** O aplicativo deve fornecer sugestões imediatas de ajuste de maquinário (ex: "Reduzir pressão em 5%") geradas pela IA (Generativa).
* **RF08 - Dashboard de KPIs:** O sistema deve possuir um painel gerencial contendo gráficos interativos com: volume total de inspeções, ranking de máquinas com maior índice de falhas/gargalos e a latência de resposta do modelo (exemplos).
* **RF09 - Geração de Ordem de Serviço (OS):** O aplicativo deve permitir a criação simplificada de ordens de serviço a partir de uma anomalia detectada.
* **RF10 - Disparo de Comunicação:** O sistema deve enviar e-mails pré-formatados para a equipe de manutenção com apenas um clique, anexando o laudo e a OS.
