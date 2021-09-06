# Speedtest dashboard widget for pfSense

![speedtes-ip](https://user-images.githubusercontent.com/19557850/132254559-4a0d9aab-117a-465e-a77d-9d7464af2d52.JPG)

## Install

To use this widget you will need to install the speedtest package

```
pkg update ; pkg install -y py37-speedtest-cli
```

Copy the widget file **speedtest.widget.php** to **/usr/local/www/widgets/widgets/** on your pfSense machine.

Install the widget on your dashboard.

Add information about IP Address source on widget.

