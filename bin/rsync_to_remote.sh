#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify remote host to sync to"
    exit 1
fi
SITE="$1"
shift
ROOT="$HOME"
if [ ! -z "$1" ]; then
    ROOT="$1"
fi
shift

USER="sdahiya"
PASSWORD=""
RSYNC_OPTS="-e \\\"ssh -o StrictHostKeyChecking=no\\\" -azuv"

auto_rsync() {
   expect -c "eval spawn -noecho rsync --exclude .*.swp $RSYNC_OPTS $1 $2
      match_max 10000k
      expect \"*?assword:*\"
      send -- \"$PASSWORD\r\"
      expect eof" >/dev/null 2>&1
}

sync() {
   FILE=$(basename $1)
   DEST=$(dirname $1)
   # download remote site file to current location
   auto_rsync $USER@$SITE:$ROOT/$FILE $DEST
   # update remote site file if newer than backup
   auto_rsync $1 $USER@$SITE:$ROOT
}

# backup specific files
sync "$HOME/rsync" >/dev/null
