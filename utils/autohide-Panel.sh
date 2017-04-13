#!/bin/bash
state=$(gsettings get org.cinnamon panels-autohide)
if [ $state = "['1:intel']" ]; then
    gsettings set org.cinnamon panels-autohide "['1:false']"
else
    gsettings set org.cinnamon panels-autohide "['1:intel']"
fi
