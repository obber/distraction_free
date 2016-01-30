#!/bin/sh

# Distracting sites to be disabled. Do not include a www version.
SITES_TO_DISABLE="
facebook.com
youtube.com"

# The forced destination address
DESTINATION="127.0.0.1"

# =================================================================
# 
# No need to edit anything below here
#
#

# counter for line removal
COUNT=$(echo "$SITES_TO_DISABLE" | wc -l);
((COUNT *= 2))

# =======================
# for "on"
#
if [ "$@" == "on" ]; then
  # Error out if DF mode is already on
  if [[ $(tail -n 1 /etc/hosts) == "# DF ON" ]]; then
    echo "\033[1;31mDistraction free mode is already on.\033[0m"
    exit;
  fi

  # add white space for clarity
  echo "\n\n" >> /etc/hosts

  # add disable entries
  while read -r LINE; do
    if [[ -n $LINE ]]; then
      echo "$DESTINATION $LINE" >> /etc/hosts
      echo "$DESTINATION www.$LINE" >> /etc/hosts
    fi
  done <<< "$SITES_TO_DISABLE"

  # add "DF ON" line to keep track of on/off status
  echo "# DF ON" >> /etc/hosts

  # output message
  echo "Distraction Free Mode: \033[1;32mEnabled\033[0m"

# =======================
# for "off"
#
elif [ "$@" == "off" ]; then
  # Error out if DF mode is already on
  if [[ $(tail -n 1 /etc/hosts) != "# DF ON" ]]; then
    echo "\033[1;31mLooks like distraction free mode is not on. You might want to manually check /etc/hosts or turn it on first.\033[0m"
    exit;
  fi

  # overwrite /etc/hosts, removing $COUNT number of lines.
  HEADCOUNT=$(wc -l < /etc/hosts)
  HEADCOUNT=$((HEADCOUNT - COUNT))
  NEW_HOSTS_FILE="$(head -n $HEADCOUNT /etc/hosts)"
  echo "$NEW_HOSTS_FILE" > /etc/hosts

  # output message
  echo "Distraction Free Mode: \033[1;31mDisabled\033[0m"
else
  # error out
  echo "Not a valid argument. Try 'on' or 'off'."
fi