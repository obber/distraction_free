#!/bin/sh

# Distracting sites to be disabled. Do not include a www version.
SITES_TO_DISABLE="
facebook.com
youtube.com"

# The forced destination address
DESTINATION="127.0.0.1"

# ====================================================
# No need to edit anything below here
#

# counter for line removal
COUNT=$(echo "$SITES_TO_DISABLE" | wc -l);
((COUNT *= 2))

if [ "$@" == "on" ]; then
  # add white space for clarity
  echo "\n\n" >> /etc/hosts
  # add disable entries
  while read -r LINE; do
    if [[ -n $LINE ]]; then
      echo "$DESTINATION $LINE" >> /etc/hosts
      echo "$DESTINATION www.$LINE" >> /etc/hosts
    fi
  done <<< "$SITES_TO_DISABLE"
elif [ "$@" == "off" ]; then
  # overwrite /etc/hosts, removing $COUNT number of lines.
  HEADCOUNT=$(wc -l < /etc/hosts)
  HEADCOUNT=$((HEADCOUNT - COUNT))
  NEW_HOSTS_FILE="$(head -n $HEADCOUNT /etc/hosts)"
  echo "$NEW_HOSTS_FILE" > /etc/hosts
else
  echo "Not a valid argument. Try 'on' or 'off'."
fi