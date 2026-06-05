#!/bin/sh

# Verifica se o arquivo de versão existe
if [ ! -f /etc/version ]; then
    echo "Erro: Arquivo /etc/version não encontrado. Não foi possível identificar o sistema."
    exit 1
fi

# Armazena os 3 primeiros caracteres da versão em uma variável
VERSAO=$(cat /etc/version | cut -c 1-3)

# Se a variável estiver vazia por qualquer motivo, avisa o usuário
if [ -z "$VERSAO" ]; then
    echo "Erro: Não foi possível ler a versão do sistema."
    exit 1
fi

# Link padrão do widget (centralizado para evitar repetição de código)
WIDGET_URL="https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php"
WIDGET_DEST="/usr/local/www/widgets/widgets/speedtest.widget.php"

case "$VERSAO" in
    "2.4")
        pkg install -y py37-speedtest-cli
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "2.5")
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "2.6")
        echo "Instalando versao speedtest para 2.6..."
        pkg install -y py38-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "2.7"|"2.8")
        echo "Instalando versao speedtest para $VERSAO..."
        pkg install -y py311-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "21."|"22.")
        echo "Instalando versao speedtest para pfSense Plus $VERSAO..."
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "23."|"24."|"25.")
        echo "Instalando versao speedtest para pfSense Plus $VERSAO..."
        pkg install -y py311-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "26.")
        echo "Instalando versao speedtest para pfSense Plus 26..."
        pkg install -y py311-speedtest-cli-2.1.3_1
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    *)
        # MENSAGEM CASO NÃO ENCONTRE NENHUMA VERSÃO COMPATÍVEL
        echo "Aviso: A versão detectada ($VERSAO) não é suportada por este script ou não foi reconhecida."
        exit 1
        ;;
esac