#!/bin/sh

watch_file=/tmp/watch
wait_file=/tmp/wait

start_sdksrvd() {
    echo `uptime` "start sdksrvd"
    /opt/start_sdksrvd.sh

    while true; do
        if [ -e $watch_file ]
        then
            echo `uptime` "start sdksrvd"
            /opt/start_sdksrvd.sh
        elif [ -e $wait_file ]
        then
            echo `uptime`
        else
            echo "none"
            break
        fi

        sleep 3
    done
}

start_sdksrvd &
wait

test -e $watch_file && rm $watch_file
test -e $wait_file && rm $wait_file

# stop_file=/tmp/stop

# start_sdksrvd() {
#     while :; do
#         test -e $stop_file && break 
#         echo `uptime` "start sdksrvd"
#         test -e /tmp/stop_sdksrvd || {
#             ./start_sdksrvd.sh
#         }
#         sleep 3
#     done
# }

# start_sdksrvd &

# wait

# rm $stop_file