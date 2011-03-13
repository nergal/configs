#!/bin/bash

conky -dc ~/.conky/cfg/cpu & sleep 1
conky -dc ~/.conky/cfg/mem & sleep 1
conky -dc ~/.conky/cfg/rings & sleep 1
conky -dc ~/.conky/cfg/weather & sleep 1
conky -dc ~/.conky/cfg/mail

