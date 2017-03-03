#!/bin/bash

# Start to loop forever (breaks handled via `sleep`)
while true; do

  datetime=$(date +%Y%m%d_%T)

  # Sync: task
  if [ -e task ]; then
    echo "$datetime: syncing task now..."
    task sync
  fi

  sleep 300 #seconds

  #
  # TODO: Except it's night time:
  #
  # Get time stamps
  # time=$(date +%k%M)
  #
  # if [[ "$time" -ge 2030 ]] && [[ "$time" -le 600 ]];then
  #   do_sync
  # else
  #   echo "$datetime: Zz..."
  # fi
done
