#!/usr/bin/expect -f

set username "root"
set password "your_password"
set setup_env "source /opt/ros/kinetic/setup.sh"

spawn adb shell

expect "*login*" {send "$username\r"}
expect "*Password*" {send "$password\r"}
expect "*root*" {send "$setup_env\r"}

interact
