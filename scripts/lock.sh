#!/bin/bash

scrot /tmp/ss.png
xwobf -s 3 -f /tmp/ss.png
i3lock -i /tmp/ss.png
rm /tmp/ss.png
