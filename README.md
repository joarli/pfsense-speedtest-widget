# Speedtest dashboard widget for pfSense Fork from aln-1

## Install

To use this widget you will need to install the speedtest package

```
pkg update ; pkg install -y py37-speedtest-cli
```

Copy the widget file **speedtest.widget.php** to **/usr/local/www/widgets/widgets/** on your pfSense machine.

Install the widget on your dashboard.

Add information about IP Address source on widget.

