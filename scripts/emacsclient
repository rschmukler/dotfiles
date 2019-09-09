#!/bin/sh

emacsclient -e "(frames-on-display-list \"${DISPLAY}\")" 1>/dev/null 2>/dev/null
if [ "$?" = "1" ]; then
    emacsclient -c -n -a "" "$@"
else
    emacsclient -n "$@"
fi
