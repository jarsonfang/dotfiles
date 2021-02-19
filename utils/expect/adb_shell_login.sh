#!/usr/bin/expect

set username "user"
set password "password"
# set source "source /opt/ros/kinetic/setup.sh"

spawn adb shell
expect "login:"
send $username
send "\r"
expect "Password:"
send $password
send "\r"
expect "~#"
# send $source
# send "\r"

interact
