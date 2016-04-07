echo Flashing $1
sudo avrdude -C"/usr/share/arduino/hardware/tools/avr/etc/avrdude.conf" -v -v -v -p atmega32u4 -c avr109 -P /dev/ttyACM0 -b 115200 -D -U flash:w:$1:i
