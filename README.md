# HydroAlert

**HydroAlert** é um aplicativo Flutter projetado para ajudar os usuários a manterem-se hidratados ao longo do dia, fornecendo lembretes personalizados com base nas metas individuais de consumo de água.

## Funcionalidades

- **Configuração de Perfil**: Permite que o usuário insira seu nome, peso atual e peso desejado.
- **Definição de Metas**: Calcula a quantidade ideal de água a ser consumida diariamente com base nas informações fornecidas.
- **Notificações Personalizadas**: O usuário pode definir quantas vezes por dia deseja receber lembretes para beber água.
- **Interface Intuitiva**: Navegação simples através de telas sequenciais para configuração e acompanhamento.

## Estrutura do Projeto

- `lib/`: Contém o código Dart principal do aplicativo.
  - `main.dart`: Ponto de entrada do aplicativo.
  - `screens/`: Contém as telas individuais, como `name_screen.dart`, `notification_config_screen.dart`, etc.
- `assets/`: Recursos como imagens e fontes.
- `android/` e `ios/`: Arquivos específicos para as plataformas Android e iOS.

## Como Executar o Projeto

1. **Pré-requisitos**:
   - Flutter SDK instalado.
   - Dispositivo ou emulador configurado.

2. **Clonar o Repositório**:
   ```bash
   git clone https://github.com/Dell-sz/hydroalert.git
   cd hydroalert
