#!/bin/sh
# add a autobuild message to the HEAD commit

if grep -q '^Autobuild.User' "$1"; then
    echo "Already marked as tested"
    exit 0
fi

fullname=$(getent passwd $USER | cut -d: -f5| cut -d',' -f1)
cat <<EOF >> "$1"
Autobuild-User: $fullname <$USER@samba.org>
Autobuild-Date: $(date) on $(hostname)
EOF
exit 0