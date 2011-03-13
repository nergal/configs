#!/bin/bash
sleep 15
conky -dc ~/.conky/cfg/cpu & sleep 1
conky -dc ~/.conky/cfg/mem & sleep 5
conky -dc ~/.conky/cfg/rings & sleep 30
conky -dc ~/.conky/cfg/weather & sleep 1
conky -dc ~/.conky/cfg/mail
