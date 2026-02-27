APP 1: SIDERA PREDICT - OPERADOR (MOBILE) 

**Foco Principal:** Agilidade extrema, zero atrito e resposta em milissegundos rodando o modelo Teachable Machine (TFLite) localmente. 

Tela 1.1: Login Rápido 

* 
**Fundo:** Gradiente linear a 90° (Azul #030838 para Vermelho #DE1212). 


* 
**Componente Superior:** Câmera ativada em um container quadrado para leitura de Crachá (QR Code/Código de Barras). 


* 
**Componente Inferior:** Teclado numérico nativo em botões grandes e brancos para digitação de PIN (4 a 6 dígitos). 


* 
**Ação:** Validação instantânea e redirecionamento. 



Tela 1.2: Seleção de Posto de Trabalho 

* 
**Fundo:** Azul Escuro #030838 sólido. 


* 
**Header:** Texto de boas-vindas ("Olá, [Nome]"). 


* 
**Componente Central (Dropdowns):** Select 1 para "Selecione a Área" (ex: Forjaria, Soldagem) e Select 2 para "Selecione a Máquina" (alimentado pelo banco de dados gerenciado pelo Inspetor). 


* 
**Botão de Ação:** Botão largo na cor Vermelho #DE1212 com o texto "INICIAR TURNO". 



Tela 1.3: Dashboard do Operador 

* 
**Fundo:** Azul Escuro #030838 com detalhes sutis. 


* 
**Header (App Bar):** Mostra a Máquina atual e um ícone de "Status: Online". 


* 
**Componente Principal (Centro):** Botão circular gigante com borda em gradiente e fundo escuro com o texto " NOVA VARREDURA". 


* 
**Componente Inferior (ListView):** Lista compacta das últimas 5 peças. 


* 
**Cards:** Ícone colorido, contendo "Peça #ID" e a Hora da captura. 



Tela 1.4: Câmera de Captura (Visão Computacional) 

* 
**Fundo:** Feed de vídeo da câmera em tela cheia. 


* 
**Componente de Foco Dinâmico:** Uma mira central (cruz) e marcadores nos quatro cantos da tela que mudam de branco para verde quando o giroscópio indica que o celular está paralelo à peça (evitando distorção de ângulo). 


* 
**Overlays:** Botão de acionamento do Flash/Lanterna. 


* 
**Ação:** Ao capturar, a imagem é cortada (crop) e enviada para o modelo do Teachable Machine embutido no app. 



Tela 1.5: Veredito Imediato (Processamento Local) 

* 
**Ação:** A tela muda totalmente de cor por 3 segundos baseado na probabilidade do JSON retornado pelo Teachable Machine. 


* 
**Estado 1 (Verde):** "PEÇA APROVADA" (Ex: ok: 0.98). 


* 
**Estado 2 (Vermelho):** "ANOMALIA - SEPARAR PEÇA" (Ex: solda_quebrada: 0.95). 


* 
**Estado 3 (Laranja):** "FALHA NA LEITURA - TENTE NOVAMENTE" (Ex: Imagem borrada, confiança do modelo abaixo de 60%). 



---

APP 2: SIDERA PREDICT - INSPETOR (HÍBRIDO WEB/MOBILE) 

**Foco Principal:** Análise de dados, gestão de pátio e integração com a IA Generativa (Google Gemini) para emissão de laudos. 

Tela 2.1: Login Corporativo 

* 
**Fundo:** Branco ou cinza claro com a lateral/topo em gradiente da nossa paleta. 


* 
**Componentes:** TextFields limpos para E-mail Corporativo e Senha. 


* 
**Botão:** "ACESSAR PAINEL" em Azul Escuro #030838. 



Tela 2.2: Dashboard Geral (KPIs e Gráficos) 

* 
**Estrutura:** Grid (Web) ou Scroll (Mobile). 


* 
**Componente 1 (Gráfico de Pizza):** "Tipos de Defeitos" (alimentado pelos retornos do Teachable Machine). 


* 
**Componente 2 (Gráfico de Barras):** "Ranking de Gargalos por Máquina" (quais máquinas estão gerando mais telas vermelhas). 


* 
**Componente 3 (Cards de Métrica):** Apresenta o Índice de Falsos Positivos, Volume de Leitura por Operador e a Latência Média da IA. 


* 
**Componente Inferior:** Tabela/Lista de todas as peças rejeitadas, com botão "Analisar" ao lado de cada uma. 



Tela 2.3: Inspeção Profunda (O Raio-X) 

* 
**Componente Visual (Esquerda/Topo):** A foto da peça com as marcações visuais de onde o defeito se encontra. 


* 
**Componente de Dados Brutos:** Um gráfico de barras horizontais simples mostrando a predição do Teachable Machine (Ex: Solda Quebrada 95%, Amassado 3%). 


* 
**Componente Generativo (Google Gemini):** Um card de texto onde os dados do TM são enviados em background para o Gemini gerar um laudo cruzando com a base da Soufer, exibindo textos como: "Motivo Provável: Tensão térmica na soldagem. Ação: Verificar temperatura do gás de proteção na Máquina 02." 


* 
**Botão de Ação:** "DISPARAR ORDEM DE MANUTENÇÃO" (Vermelho #DE1212). 



Tela 2.4: Integração de E-mail (Ação de Manutenção) 

* 
**Ação Principal:** Ao clicar no botão de disparo de ordem, o Flutter aciona o pacote url_launcher para abrir o cliente de e-mail padrão. 


* 
**Componente Invisível (Construtor de Link):** A saída gerada pelo Gemini é formatada no corpo do e-mail nativo, com o endereço de manutenção preenchido no "Para:". 


* 
**Ação do Inspetor:** O inspetor apenas revisa o conteúdo e clica em enviar diretamente no próprio app de e-mail. 



Tela 2.5: Gestão e Configurações 

* 
**Aba de Pessoal:** Formulário contendo Nome, E-mail e Senha provisória para adicionar novos inspetores através do botão "CADASTRAR". 


* 
**Aba de Maquinário:** Uma lista interativa com opções de "Adicionar", "Editar" ou "Excluir", onde o inspetor digita o nome das "Áreas" (Ex: Caldeiraria) e das "Máquinas" vinculadas. 


* 
**Integração:** Essas informações alimentam diretamente o Dropdown da Tela 1.2 dos operadores. 