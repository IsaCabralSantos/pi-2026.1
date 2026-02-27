# Product Backlog: SIDERA PREDICT - INSPETOR

## 🏭 Visão Estratégica do Produto
O **SIDERA PREDICT - INSPETOR** é uma solução híbrida (Web e Mobile) desenvolvida em Flutter para o chão de fábrica do Grupo Soufer. O sistema visa mitigar falhas estruturais em peças siderúrgicas (tubos e chapas) através da fusão de Inteligência Artificial local e baseada em nuvem.

* **Edge AI (TensorFlow Lite / Teachable Machine):** Visão computacional executada localmente via Dart Isolates para inferência de anomalias com baixíssima latência, imune a quedas de rede.
* **Cloud AI Generativa (Google Gemini):** Sistema especialista para tradução de probabilidades matemáticas em laudos técnicos acionáveis e otimizados para a engenharia de manutenção.
* **Plataforma:** Aplicativo móvel (scanners de alta precisão via smartphone) e painel Web gerencial.



---

## 📋 ÉPICO 1: Autenticação Corporativa e Governança de Sessão
Acesso seguro e rastreável ao pátio virtual da corporação, garantindo a integridade dos dados de inspeção.

| ID | Persona | Funcionalidade (Eu quero...) | Benefício (...para que) | Tags Estruturais |
| :--- | :--- | :--- | :--- | :--- |
| **US-1.1** | Inspetor Operacional | Acessar uma tela de login visualmente limpa, com gradiente corporativo e botão "ACESSAR PAINEL" (#030838). | Prevenir fadiga visual e facilitar o acesso no início do turno fabril. | `<tags> #Prioridade/Alta, #Componente/UI, #Feature/Auth </tags>` |
| **US-1.2** | Sistema de Segurança | Validar credenciais no servidor via regex e autenticação robusta (Firebase/Postgres) antes do roteamento à Tela 2.2. | Impedir acessos não autorizados e garantir a auditoria das métricas individuais. | `<tags> #Prioridade/Critica, #Componente/Backend, #Feature/Auth </tags>` |

---

## 📊 ÉPICO 2: Dashboard Analítico, Métricas de Desempenho e Navegação
Agregador de inteligência tática, consolidando predições de ML e estatísticas operacionais em tempo real.



| ID | Persona | Funcionalidade (Eu quero...) | Benefício (...para que) | Tags Estruturais |
| :--- | :--- | :--- | :--- | :--- |
| **US-2.1** | Gestor de Produção | Visualizar um layout adaptativo (`LayoutBuilder` - Grid no Web, Scroll vertical no Mobile). | Garantir usabilidade dos gráficos em qualquer dispositivo. | `<tags> #Prioridade/Alta, #Componente/UI, #Plataforma/Hibrido </tags>` |
| **US-2.2** | Coordenador de Qualidade | Analisar um gráfico de pizza dinâmico sobre a distribuição dos tipos de defeitos encontrados. | Mapear falhas crônicas para calibrar a linha de montagem de forma preventiva. | `<tags> #Prioridade/Media, #Componente/Graficos, #Feature/DataViz </tags>` |
| **US-2.3** | Gerente de Manutenção | Acompanhar um ranking em gráfico de barras com as máquinas que mais geram anomalias (telas vermelhas). | Direcionar esforços cirúrgicos de manutenção para os maquinários em gargalo. | `<tags> #Prioridade/Media, #Componente/Graficos, #Feature/DataViz </tags>` |
| **US-2.4** | Analista de Operações | Visualizar Cards de Métricas: Falsos Positivos, Volume de Leitura do Operador e Latência Média da IA. | Monitorar a saúde do TFLite, hardware e produtividade humana em tempo real. | `<tags> #Prioridade/Alta, #Componente/Cards, #Feature/DataViz </tags>` |
| **US-2.5** | Inspetor de Qualidade | Acessar uma lista de peças rejeitadas com um botão interativo de "Analisar". | Agilizar o fluxo de triagem e permitir intervenção sobre o diagnóstico da IA. | `<tags> #Prioridade/Critica, #Componente/Lista, #Fluxo/Navegacao </tags>` |

---

## 🧠 ÉPICO 3: Inspeção Profunda de Peças e Fusão Cérebro-Máquina
Interface "Raio-X" da peça avariada, unindo fotografia, probabilidades matemáticas e síntese generativa textual.

| ID | Persona | Funcionalidade (Eu quero...) | Benefício (...para que) | Tags Estruturais |
| :--- | :--- | :--- | :--- | :--- |
| **US-3.1** | Inspetor Especialista | Expandir a fotografia da peça com suporte a gestos interativos (zoom-in/pinça e pan). | Validar empiricamente os danos e ranhuras apontados pela rede neural. | `<tags> #Prioridade/Alta, #Componente/Imagem, #Fluxo/UI </tags>` |
| **US-3.2** | Sistema Predição (TFLite) | Executar o modelo TFLite em um *Dart Isolate* e renderizar gráfico de barras das probabilidades. | Obter inferência instantânea off-line sem causar quedas de FPS (Jank) na UI principal. | `<tags> #Prioridade/Critica, #Componente/Inferencia, #Feature/ML </tags>` |
| **US-3.3** | Módulo Generativo (Gemini) | Consumir via *Stream* um laudo sintético formatado como "Problema: X. Motivo: Y. Ação: Z." | Ter um "co-piloto" de engenharia, eliminando a redação manual de relatórios. | `<tags> #Prioridade/Critica, #Componente/LLM, #Feature/IA </tags>` |
| **US-3.4** | Gestor de Chão de Fábrica | Acionar o botão vermelho (#DE1212) com o texto "DISPARAR ORDEM DE MANUTENÇÃO". | Despachar o reparo imediatamente, integrando o defeito ao fluxo de correção. | `<tags> #Prioridade/Alta, #Componente/Botao, #Fluxo/Acao </tags>` |

---

## ✉️ ÉPICO 4: Comunicação Inter-sistemas e Automação de E-mails Nativos
Roteamento invisível de laudos técnicos diretamente para os clientes de e-mail instalados no dispositivo móvel.

| ID | Persona | Funcionalidade (Eu quero...) | Benefício (...para que) | Tags Estruturais |
| :--- | :--- | :--- | :--- | :--- |
| **US-4.1** | Inspetor Integrado | Invocar a biblioteca nativa `url_launcher` via esquema `mailto:` com "Para:" e "Assunto" pré-preenchidos. | Eliminar atritos e falhas de digitação na transposição manual de falhas. | `<tags> #Prioridade/Critica, #Componente/Invisivel, #Integracao/SO </tags>` |
| **US-4.2** | Engenheiro de Manutenção | Receber o corpo do e-mail com a formatação perfeita, tratada via `Uri.encodeComponent()` e escape `\r\n`. | Consumir a recomendação da IA imaculada, contornando a corrupção de strings no iOS. | `<tags> #Prioridade/Alta, #Componente/Texto, #Codificacao/URI </tags>` |

---

## ⚙️ ÉPICO 5: Módulos de Back-Office e Gestão Administrativa
Governança sistêmica para controle de acessos da força de trabalho e relacionamento do maquinário físico.

| ID | Persona | Funcionalidade (Eu quero...) | Benefício (...para que) | Tags Estruturais |
| :--- | :--- | :--- | :--- | :--- |
| **US-5.1** | Gerente de RH / Operações | Registrar perfis operacionais em um formulário transacional (Nome, E-mail, Senha Provisória). | Permitir rotação ágil de turmas sem dependência técnica do suporte de TI. | `<tags> #Prioridade/Media, #Componente/Formulario, #Acesso/Admin </tags>` |
| **US-5.2** | Chefe de Montagem | Manipular uma lista relacional de Área > Máquina > Funcionário Responsável. | Habilitar o sistema a cruzar dados e inferir automaticamente o remetente na US-4.1. | `<tags> #Prioridade/Alta, #Componente/Listagem, #Acesso/Admin </tags>` |

---

## 🛑 Definition of Done & Diretrizes de Qualidade
Para que uma Sprint seja considerada "Feita", os seguintes critérios arquitetônicos não negociáveis devem ser auditados:

* **Prevalência de Isolates:** É expressamente proibido rodar o método `interpreter.run()` do TensorFlow Lite na *Main Thread*. Obrigatório o uso de `Isolate.spawn()` e coleta rigorosa de lixo via Teardowns no ciclo de vida do Flutter para evitar Memory Leaks.

* **Salvaguardas Generativas (Morgan's Law):** Implementação obrigatória de *Guardrails* e rotas de *fallback* para requisições do Google Gemini. A API não deve renderizar alucinações fora do padrão "Problema / Motivo / Ação".

* **Ensaios Físicos Diretos (Anti-Emulador):** Testes de inferência visual do TFLite devem ser validados em hardware orgânico no ambiente real da fábrica siderúrgica (iluminação variante e fuligem), com perfilamento analítico garantindo latência em milissegundos via *Hardware Delegates* (NNAPI/Metal).