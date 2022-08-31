#!/bin/bash
# A script to do nslookup scan of 254 host in subnet with 24 mask.
# Author: Artemy Ccrsky
# Contact: temk1603
# Release date: August 31, 2022

# Header
echo -e "\n\e[00;33m#########################################################\e[00m"
echo -e "\e[00;33m#                                                       #\e[00m" 
echo -e "\e[00;33m#\e[00m" "\e[01;32m       Nslookup of subnet (10.0.0.1-254)             \e[00m" "\e[00;33m#\e[00m"
echo -e "\e[00;33m#                                                       #\e[00m" 
echo -e "\e[00;33m#########################################################\e[00m"
echo -e ""

# Input data format: 10.10.10
NETS=$1

# Check domain
if [ -z "$NETS" ] 
then
        echo -e "\e[00;33m# Usage example:\e[00m" "\e[01;31m$0 10.10.10 \e[00m\n"
        exit
else
        echo -e "\e[00;33m# Get information about:   \e[00m" "\e[01;31m$NETS.0/24\e[00m"
        echo -e "\e[00;33m# Processing...\e[00m\n"
fi


IPRange="1 254"
for NET in $NETS; do
  for n in $(seq $IPRange); do
        ADDR=${NET}.${n}
        result=`nslookup ${ADDR} | grep 'name' | cut -d ' ' -f 3 | tr '\n' ' '`
        if [ ! -z "$result" ]
        then
                echo "${ADDR}, ${result}" >> nslookup_${NET}.txt
        fi
        # echo "${ADDR},`nslookup ${ADDR} | grep 'name' | cut -d ' ' -f 3`" >> nslookup_${NET}.txt
  done
done
          