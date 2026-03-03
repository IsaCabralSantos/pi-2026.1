# 🏭 SIDERA PREDICT

Repositório do **SIDERA PREDICT**, um ecossistema inteligente para inspeção de peças e gestão de qualidade no chão de fábrica. 

cite_startNós construímos esta solução dividida em dois aplicativos complementares, unindo Visão Computacional local e Inteligência Artificial Generativa para transformar a maneira como anomalias são detectadas e tratadas.

---

## 🎯 Visão do Produto

### ⚠️ O Problema
Na linha de produção, a inspeção visual de peças muitas vezes sofre com lentidão, gargalos e falta de padronização. Operadores precisam de respostas em tempo real, enquanto inspetores necessitam de dados consolidados para tomar decisões rápidas sobre manutenção e ajustes de maquinário.

### 👥 Público-Alvo
1. **O Inspetor (Gestão/Qualidade):**
Precisa de extrema agilidade, zero atrito e respostas em milissegundos para que todo o processo de "SCAN" seja perfeito. Focado em análise de métricas, gestão do pátio e emissão rápida de laudos técnicos padronizados.

### 🚀 Nosso Objetivo
Criar um fluxo contínuo onde a captura de uma imagem pelo Operador seja processada instantaneamente por um modelo de IA local (Teachable Machine). Caso uma anomalia seja detectada, o Inspetor recebe os dados estruturados e utiliza IA Generativa (Google Gemini) para gerar um laudo automático e disparar ordens de manutenção com um único clique.

---

## 📱 Os Aplicativos

Com certeza, João. Ajustei o texto para refletir que se trata de uma aplicação única, simplificando o fluxo e removendo a etapa de login conforme você solicitou. O foco agora está totalmente na agilidade do inspetor de qualidade no chão de fábrica.

Aqui está a versão atualizada para o seu **README**:

---

## 🛠️ Sidera Predict (SOUFER) - Mobile App

Uma solução integrada de visão computacional e gestão de qualidade, projetada para otimizar a inspeção técnica e a tomada de decisão no ambiente industrial.

### 🔍 Módulo de Inspeção em Tempo Real

Focado na agilidade do chão de fábrica, permitindo que o inspetor identifique falhas sem fricção.

* **Acesso Direto:** Sem necessidade de login para priorizar a velocidade de operação do inspetor de qualidade.
* **Câmera Inteligente com TFLite:** Utiliza guias visuais e o giroscópio do dispositivo para garantir o enquadramento perfeito. O modelo de IA embarcado processa a imagem localmente (Edge AI), fornecendo um veredito em milissegundos.
* **Feedback Visual Instantâneo:** Sistema de cores intuitivo para resultados (Verde: Aprovado | Vermelho: Anomalia Detectada | Laranja: Falha de Leitura).

### 📊 Módulo de Gestão e Inteligência (Híbrido)

Transforma os dados coletados em ações estratégicas de manutenção e qualidade.

* **Raio-X da Inspeção:** Visualização detalhada de peças reprovadas, exibindo o grau de confiabilidade da IA e os pontos exatos da anomalia.
* **Laudos Automatizados (Gemini IA):** Integração com a API do Gemini para gerar automaticamente descrições técnicas da causa provável do defeito e recomendações de ajustes imediatos (ex: "Reduzir pressão em 5%").
* **Dashboard de KPIs:** Gráficos interativos que mostram o volume de inspeções, ranking de máquinas com mais gargalos e latência do modelo.
* **Fluxo de Solicitação:** Geração simplificada de ordens de serviço e disparos de e-mail pré-formatados para a equipe de manutenção.

---

### 🚀 Tecnologias Utilizadas

* **Framework:** Flutter (Android/iOS)
* **IA de Borda:** TensorFlow Lite (TFLite)
* **IA Generativa:** Google Gemini (Geração de laudos e recomendações)
* **UI/UX:** Design focado em ambientes industriais com alta visibilidade.
* 
---

## 📁 Estrutura do Repositório

Nós organizamos nosso repositório para manter a documentação e o código sempre alinhados:

* `/docs/`: Contém todos os nossos Requisitos Funcionais (`RF.md`), Não Funcionais (`RNF.md`) e Regras de Negócio (`RN.md`).
* `/.github/`: Contém os nossos templates de Pull Request e Issues para padronizar o desenvolvimento da equipe.

---

## 🤝 Como estamos trabalhando

Nós utilizamos um fluxo rigoroso de padronização para garantir a qualidade do projeto durante o semestre:

1. **Issues:** Antes de escrever qualquer código, abrimos uma Issue utilizando um de nossos templates (`Funcionalidade`, `Bug`, `Documentação`, `Infraestrutura` ou `Estudos`).
2. **Branches:** Cria-se uma branch a partir da `main` com o número da Issue (ex: `feat/issue-12-tela-login`).
3. **Pull Requests:** Ao finalizar, abrimos um PR preenchendo o nosso Checklist obrigatório (incluindo prints de telas, se houver mudanças visuais). E relacionamos a Issue no PR usando a palavra-chave (ex: `Closes #12`).
