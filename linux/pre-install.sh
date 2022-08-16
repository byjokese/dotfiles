#!/bin/bash

# Script for preparing new linux instance
# 2022 | By-Jokese (byjokese.com)

export DEBIAN_FRONTEND=noninteractive

sudo echo "console-setup console-setup/codeset47 select" | debconf-set-selections
sudo echo "console-setup console-setup/codesetcode string Lat15" | debconf-set-selections
sudo echo "console-setup console-setup/fontface47 select VGA" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize-text47 select 16" | debconf-set-selections
sudo echo "keyboard-configuration console-setup/ask_detect boolean false" | debconf-set-selections
sudo echo "console-setup console-setup/store_defaults_in_debconf_db boolean true" | debconf-set-selections
sudo echo "console-setup console-setup/charmap47 select UTF-8" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize-fb47 select 16" | debconf-set-selections
sudo echo "keyboard-configuration console-setup/detected note" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize string 16" | debconf-set-selections

sudo apt-get install -y console-setup keyboard-configuration kmod
