#!/bin/bash
name=$(cat /etc/cache202.sh)
rm /etc/cache202.sh
echo "Qual a nova data : formato AAAA/MM/DD"
 read -p ": " valid
 date=$(echo $valid |awk -F / '{print $2}')
 if [[ "$date" = "" ]]
 then
 rm /etc/VpsPackdir/date/$name /dev/null 2>/dev/null
 data=$(date '+%C%y/%m/%d' -d "$valid $daysrnf days")
 chage -E $data $name 2> /dev/null
 echo "$data" > /etc/VpsPackdir/date/$name
 echo -e "\033[0mUsuario \033[1;36m$name\033[0m teve data definida para: \033[1;32m$data\033[0m"
 else
 rm /etc/VpsPackdir/date/$name /dev/null 2>/dev/null
 chage -E $valid $name 2> /dev/null
 echo "$valid" > /etc/VpsPackdir/date/$name
 echo -e "\033[0mUsuario \033[1;36m$name\033[0m teve data definida para: \033[1;32m$valid\033[0m"
 fi
