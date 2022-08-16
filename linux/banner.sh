#!/bin/bash

if [[ -n "$(PATH="/opt/bin:$PATH" type -p nvidia-smi)" ]]; then
	gpu=$($(PATH="/opt/bin:$PATH" type -p nvidia-smi | cut -f1) -q | awk -F':' '/Product Name/ {gsub(/: /,":"); print $2}' | sed ':a;N;$!ba;s/\n/, /g')
elif [[ -n "$(PATH="/usr/sbin:$PATH" type -p glxinfo)" && -z "${gpu}" ]]; then
	gpu_info=$($(PATH="/usr/sbin:$PATH" type -p glxinfo | cut -f1) 2>/dev/null)
	gpu=$(grep "OpenGL renderer string" <<< "${gpu_info}" | cut -d ':' -f2 | sed -n -e '1h;2,$H;${g;s/\n/, /g' -e 'p' -e '}')
	gpu="${gpu:1}"
	gpu_info=$(grep "OpenGL vendor string" <<< "${gpu_info}")
elif [[ -n "$(PATH="/usr/sbin:$PATH" type -p lspci)" && -z "$gpu" ]]; then
	gpu_info=$($(PATH="/usr/bin:$PATH" type -p lspci | cut -f1) 2> /dev/null | grep VGA)
	gpu=$(grep -oE '\[.*\]' <<< "${gpu_info}" | sed 's/\[//;s/\]//' | sed -n -e '1h;2,$H;${g;s/\n/, /g' -e 'p' -e '}')
fi
if [ -n "$gpu" ];then
	if grep -q -i 'nvidia' <<< "${gpu_info}"; then
		gpu_info="NVidia "
	elif grep -q -i 'intel' <<< "${gpu_info}"; then
		gpu_info="Intel "
	elif grep -q -i 'amd' <<< "${gpu_info}"; then
		gpu_info="AMD "
	elif grep -q -i 'ati' <<< "${gpu_info}" || grep -q -i 'radeon' <<< "${gpu_info}"; then
		gpu_info="ATI "
	else
		gpu_info=$(cut -d ':' -f2 <<< "${gpu_info}")
		gpu_info="${gpu_info:1} "
	fi
	gpu="${gpu}"
else
	gpu="Not Found"
fi

echo "$(cat $HOME/dotfiles/linux/banner)" | lolcat

OS=$(printf "\033[1;31mOS:\033[0m $(lsb_release -d | cut -f2)")
CPU=$(printf "\033[1;31mCPU:\033[0m $(cat /proc/cpuinfo | grep "model name" | uniq | cut -f2 | cut -c3-)")
RAM=$(printf "\033[1;31mRAM:\033[0m $(free -m | grep "Mem" | awk '{print $3}')MiB/$(free -m | grep "Mem" | awk '{print $2}')MiB")
GPU=$(printf "\033[1;31mGPU:\033[0m ${gpu}")

printf "\n"
printf "%-50s %-50s\n" "$OS" "$CPU"
printf "%-50s %-50s\n" "$RAM" "$GPU"
