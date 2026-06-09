# 🛡️ GeoShield

O **GeoShield** é um aplicativo mobile desenvolvido em Flutter focado no tema de **Indústria Espacial**. O objetivo principal do projeto é a prevenção de desastres através do monitoramento climático contínuo utilizando dados orbitais e satelitais em tempo real (simulados).

Este projeto foi desenvolvido como requisito acadêmico para a avaliação **Global Solution**.

---

## 📱 Fluxo do Aplicativo e Telas

A arquitetura do aplicativo foi pensada para ser intuitiva e direta, guiando o usuário desde a compreensão do propósito da ferramenta até a gestão ativa das áreas monitoradas.

### 1. Splash e Introdução

* **Splash Screen:** Apresenta o logo e a identidade visual do GeoShield, carregando os recursos iniciais.
* **Intro Screen:** Uma tela de *onboarding* que explica rapidamente o propósito do aplicativo (cruzamento de dados de satélites para emitir alertas e proteger áreas vulneráveis) antes de liberar o acesso ao painel principal.

<img width="543" height="743" alt="image" src="https://github.com/user-attachments/assets/ccb4b442-ff32-4471-994b-b5432bc88169" />
<img width="545" height="694" alt="image" src="https://github.com/user-attachments/assets/dfe01ced-cbea-4f6e-a996-297fb9eaab56" />


### 2. Dashboard (Painel Geral)

O coração do aplicativo. Apresenta uma visão rápida dos satélites ativos no momento e fornece as rotas de navegação principais:

* Acesso à lista de áreas já monitoradas.
* Acesso ao formulário de cadastro de novas áreas.

<img width="542" height="692" alt="image" src="https://github.com/user-attachments/assets/601b72c9-9b0c-44fa-b425-403b290eae11" />


### 3. Cadastro de Nova Área

Um formulário interativo que permite ao usuário colocar uma nova região no radar do sistema. Contém:

* Nome da região e seleção do **Bioma Predominante** (Dropdown).
* Definição do **Raio de Monitoramento** em quilômetros (Slider).
* Escolha do **Nível de Risco Inicial** (RadioListTile com as opções Baixo, Médio e Alto).
* Opção de ativar notificações via SMS para a Defesa Civil (Switch).

<img width="542" height="694" alt="image" src="https://github.com/user-attachments/assets/d50ebbc9-7a1a-4311-aa38-bcf8362859f5" />


### 4. Monitoramento de Áreas e Filtros

Uma lista dinâmica (Mock em memória) que exibe todas as áreas atualmente vigiadas pelo sistema.

* Os cards mostram um resumo de cada área (Região, Risco e Temperatura atual).
* Possui *ActionChips* no topo que funcionam como filtros interativos, permitindo isolar rapidamente apenas as áreas que se encontram em estado de **Alto Risco**.

<img width="542" height="695" alt="image" src="https://github.com/user-attachments/assets/31d5cea0-cc6b-4314-ac7d-ca86da4352b5" />


### 5. Detalhes da Telemetria

Ao clicar em uma área na tela de monitoramento, o usuário é levado aos detalhes orbitais daquela região.

* Exibe o ID do sensor de origem, o raio de alcance monitorado e a temperatura.
* Possui um botão de ação **"Solicitar Nova Leitura Orbital"** que simula a requisição de novos dados do satélite, atualizando o estado e a temperatura da tela em tempo real, além de exibir uma notificação (SnackBar) de sucesso limpa e sem sobreposição.

> *Substitua o link abaixo pelo print da tela de Detalhes*

---

## 🛠️ Tecnologias e Estrutura

* **Framework:** Flutter / Dart
* **Gerenciamento de Estado:** Nativo (`setState`)
* **Navegação:** Rotas Nomeadas (`Navigator.pushNamed`, `onGenerateRoute`)
* **Bibliotecas Externas:** `equatable` (para comparação eficiente de objetos no modelo de dados).

O projeto adota uma arquitetura limpa e componentizada:

* `models/`: Estrutura de dados e *Enums* (ex: `NivelRisco`).
* `repository/`: Banco de dados mockado em memória e funções de filtragem/inserção.
* `navigation/`: Gerenciamento e mapeamento unificado de rotas.
* `ui/components/`: Widgets reaproveitáveis (como os Cards customizados).
* `ui/screens/`: As telas principais do fluxo do aplicativo.

---

## 🚀 Como executar o projeto

1. Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado na sua máquina.
2. Clone este repositório.
3. Abra o terminal na pasta raiz do projeto e instale as dependências:
```bash
flutter pub get

```


4. Execute o aplicativo em um emulador ou navegador:
```bash
flutter run

```



---

## 👨‍💻 Desenvolvedores

* **Luciano** - github.com/hpbtw
* **Matheus** - github.com/mrsMatheusRocha
