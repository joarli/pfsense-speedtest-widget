#!/bin/sh

# Redireciona a saída de erro padrão para ocultar mensagens feias do sistema
exec 2>/dev/null

# 1. VERIFICAÇÃO SE O ARQUIVO EXISTE
if [ ! -f /etc/version ]; then
    echo "=========================================================="
    echo " ERROR: Sistema Operacional Não Identificado"
    echo "=========================================================="
    echo " Detalhes: O arquivo essencial '/etc/version' não foi encontrado."
    echo " Certifique-se de que este script está rodando em um ambiente pfSense."
    echo "=========================================================="
    exit 1
fi

# Armazena os 3 primeiros caracteres da versão em uma variável
VERSAO=$(cat /etc/version | cut -c 1-3 2>/dev/null)

# 2. VERIFICAÇÃO SE A VARIÁVEL FICOU VAZIA
if [ -z "$VERSAO" ]; then
    echo "=========================================================="
    echo " ERROR: Falha na Leitura da Versão"
    echo "=========================================================="
    echo " Detalhes: O arquivo '/etc/version' existe, mas está vazio ou ilegível."
    echo " Não foi possível determinar a versão atual para prosseguir."
    echo "=========================================================="
    exit 1
fi

# Link padrão do widget (centralizado)
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
        echo "Instalando versão speedtest para pfSense 2.6..."
        pkg install -y py38-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "2.7"|"2.8")
        echo "Instalando versão speedtest para pfSense $VERSAO..."
        pkg install -y py311-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "21."|"22.")
        echo "Instalando versão speedtest para pfSense Plus $VERSAO..."
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "23."|"24."|"25.")
        echo "Instalando versão speedtest para pfSense Plus $VERSAO..."
        pkg install -y py311-speedtest-cli-2.1.3
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    "26.")
        echo "Instalando versão speedtest para pfSense Plus 26..."
        pkg install -y py311-speedtest-cli-2.1.3_1
        fetch -q -o "$WIDGET_DEST" "$WIDGET_URL"
        ;;
    *)
        # 3. MENSAGEM MELHORADA PARA VERSÃO NÃO SUPORTADA / DESCONHECIDA
        echo "=========================================================="
        echo " ATTENTION: Versão do Sistema Incompatível"
        echo "=========================================================="
        echo " A versão detectada foi: '$VERSAO'"
        echo " Infelizmente, esta versão não é homologada por este script."
        echo ""
        echo " O que fazer?"
        echo " * Verifique se há uma atualização mais recente deste script."
        echo " * Edite o script para incluir suporte à versão '$VERSAO' manualmente."
        echo "=========================================================="
        exit 1
        ;;
esac

echo "Instalação concluída com sucesso para a versão $VERSAO!"
