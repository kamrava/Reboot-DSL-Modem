#!/bin/bash


zenity --info --text "DSL-Modem is rebooting..."


expect -c '
exp_internal 1
set userName admin
set pass admin
set command reboot

set timeout 20
spawn telnet 192.168.1.1
expect "Login:"
send "$userName\r"
expect "Password:"
send "$pass\r"
expect ">"
send "$command\r"
interact
'

zenity --info --text "DSL-Modem rebooted successfully."
