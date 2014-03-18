#!/usr/bin/env sh

echo DISCONNECTING
sudo rfcomm release /dev/rfcomm0 00:06:66:47:1C:B7 1
sleep 5

echo CONNECTING
sudo rfcomm bind /dev/rfcomm0 00:06:66:47:1C:B7 1
sleep 5

artoo connect serial rfcomm0 4567
