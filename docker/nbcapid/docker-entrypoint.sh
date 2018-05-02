#!/bin/bash

watch_file=/tmp/watch
wait_file=/tmp/wait

start_nbcapid() {
    echo `uptime` "start nbcapid"
    /opt/start_nbcapid.sh

    while true; do
        if [ -e $watch_file ]
        then
            echo `uptime` "start nbcapid"
            /opt/start_nbcapid.sh
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

start_nbcapid &
wait

test -e $watch_file && rm $watch_file
test -e $wait_file && rm $wait_file

# stop_file=/tmp/stop

# start_nbcapid() {
#     while :; do
#         test -e $stop_file && break 
#         echo `uptime` "start nbcapid"
#         test -e /tmp/stop_nbcapid || {
#             /opt/start_nbcapid.sh
#         }
#         sleep 3
#     done
# }

# start_nbcapid &

# wait

# rm $stop_file
