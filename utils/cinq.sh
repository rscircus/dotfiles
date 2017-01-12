#! /bin/bash exec 2>&-
while true; do
  # Get stamps
  time=$(date +%k%M)

  # task
  if [[ -e task ]]; then
    task sync
    echo "$(date +%Y-%m-%d %T): syncing task now..."
  fi

  sleep 60 #seconds

  echo $time

  # Except it's night time:
  if [[ "$time" -ge 1830 ]] && [[ "$time" -le 2220 ]];then
        su -c "gsettings set org.gnome.desktop.lockdown disable-log-out true" $user
      else
            su -c "gsettings set org.gnome.desktop.lockdown disable-log-out false" $user
          fi
done
