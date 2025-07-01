#!/bin/bash

ultruo_STRING='    {"id":"ultruo","name":"ultruo-HAT","overlay":"ultruo","alsanum":"2","mixer":"Master","modules":"","script":"","needsreboot":"yes"},'

mkdir -p ~/.ultruo/
[[ -e ~/.ultruo/dacs.json.orig ]] && cp ~/.ultruo/dacs.json.orig /volumio/app/plugins/system_controller/i2s_dacs/dacs.json
cp /volumio/app/plugins/system_controller/i2s_dacs/dacs.json ~/.ultruo/dacs.json.orig

head -n 11 ~/.ultruo/dacs.json.orig > ~/.ultruo/temp.txt
echo "$ultruo_STRING" >> ~/.ultruo/temp.txt
tail -n +12 ~/.ultruo/dacs.json.orig >> ~/.ultruo/temp.txt

cp ~/.ultruo/temp.txt /volumio/app/plugins/system_controller/i2s_dacs/dacs.json
rm ~/.ultruo/temp.txt

echo "ultruo-HAT added to Volumio DAC list. Please reboot"
