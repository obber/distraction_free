#!/bin/sh

# Distracting sites to be disabled. Do not include a www version.
SITES_TO_DISABLE="
facebook.com
youtube.com"

# The forced destination address
DESTINATION="127.0.0.1"

# IPv6 forced destination for ISPs that provide IPV6 support
IPV6_DESTINATION="fe80::1%lo0"

# =================================================================
# 
# No need to edit anything below here
#
#

# =======================
# for "on" argument
#
if [ "$@" == "on" ]; then
  # Error out if DF mode is already on
  if [[ $(tail -n 1 /etc/hosts) == "#DF_END" ]]; then
    echo "\033[1;31mDistraction free mode is already on.\033[0m"
    exit;
  fi

  # add #DF_BEGIN, Entries, and #DF_END
  echo "\n\n#DF_BEGIN" >> /etc/hosts
  while read -r LINE; do
    if [[ -n $LINE ]]; then
      echo "$DESTINATION $LINE" >> /etc/hosts
      echo "$DESTINATION www.$LINE" >> /etc/hosts
      echo "$IPV6_DESTINATION $LINE" >> /etc/hosts
      echo "$IPV6_DESTINATION www.$LINE" >> /etc/hosts
    fi
  done <<< "$SITES_TO_DISABLE"
  echo "#DF_END" >> /etc/hosts

  # Output message
  echo "Distraction Free Mode: \033[1;32mEnabled\033[0m"
  echo "You may need to restart your browser."

# =======================
# for "off" argument
#
elif [ "$@" == "off" ]; then
  # Error out if DF mode is already on
  if [[ $(tail -n 1 /etc/hosts) != "#DF_END" ]]; then
    echo "\033[1;31mLooks like distraction free mode is not on. You might want to manually check /etc/hosts or turn it on first.\033[0m"
    exit;
  fi

  # overwrite /etc/hosts & output message
  echo "$(sed '/\#DF_BEGIN/,/\#DF_END/d' /etc/hosts)" > /etc/hosts
  echo "Distraction Free Mode: \033[1;31mDisabled\033[0m"
else
  # error out
  echo "Not a valid argument. Try 'on' or 'off'."
fi