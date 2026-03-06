# MVP — Produto Mínimo Viável

Aqui descrevemos o escopo mínimo necessário para validar o sistema SIDERA PREDICT com usuários reais.

## Funcionalidades Essenciais
- Inspeção visual de peças com veredito instantâneo (Aprovado, Anomalia, Falha de Leitura)
- Interface de câmera com guias visuais
- Processamento local da imagem via IA (TFLite)
- Exibição de feedback visual (cores)
- Geração automática de laudo técnico via IA generativa (Google Gemini)
- Dashboard simples com KPIs principais
- Disparo de ordem de serviço e comunicação por e-mail

## Casos de Uso do MVP
- UC01 — Realizar Inspeção de Peça (SCAN)
- UC02 — Analisar Anomalia e Gerar Laudo
- UC03 — Emitir Ordem de Serviço e Notificar Equipe
- UC04 — Acompanhar Dashboard de KPIs

## Requisitos Funcionais do MVP
- RF01 a RF04: Inspeção, câmera, análise, feedback visual
- RF05 a RF07: Detalhamento, laudo IA, recomendações
- RF08: Dashboard de KPIs
- RF09: Geração de Ordem de Serviço
- RF10: Disparo de Comunicação (E-Mail)
