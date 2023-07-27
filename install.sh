#!/bin/sh
#VERSOES COMMUNITY ANTERIORES
if [ "$(cat /etc/version | cut -c 1-3)" == "2.4" ]; then
        pkg install -y py37-speedtest-cli
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi

if [ "$(cat /etc/version | cut -c 1-3)" == "2.5" ]; then
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi
if [ "$(cat /etc/version | cut -c 1-3)" == "2.6" ]; then
        echo "instalando versao speedtest"
        pkg install -y py38-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi
#VERSAO COMMUNITY ATUAL
if [ "$(cat /etc/version | cut -c 1-3)" == "2.7" ]; then #New Edition
        echo "instalando versao speedtest"
        pkg install -y py38-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi
#VERSAO PF+
if [ "$(cat /etc/version | cut -c 1-3)" == "21." ]; then #pfSense PLUS Edition
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi
if [ "$(cat /etc/version | cut -c 1-3)" == "22." ]; then #pfSense PLUS Edition
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi
if [ "$(cat /etc/version | cut -c 1-3)" == "23." ]; then #pfSense PLUS Edition
        pkg install -y py39-speedtest-cli-2.1.3
        fetch -q -o /usr/local/www/widgets/widgets/speedtest.widget.php https://raw.githubusercontent.com/joarli/pfsense-speedtest-widget/master/speedtest.widget.php
fi

