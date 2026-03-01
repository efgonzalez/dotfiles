#!/bin/bash
# Installs a macOS Folder Action on ~/Downloads that moves any file
# downloaded by WhatsApp to ~/dropbox/edu/Downloads.
# Detection is based on the com.apple.quarantine xattr set by macOS.

set -e

SCRIPT_NAME="WhatsApp to Dropbox.scpt"
SCRIPT_SRC="$(dirname "$0")/WhatsApp to Dropbox.applescript"
SCRIPT_DIR="$HOME/Library/Scripts/Folder Action Scripts"
SCRIPT_DEST="$SCRIPT_DIR/$SCRIPT_NAME"

echo "Installing WhatsApp folder action..."

mkdir -p "$SCRIPT_DIR"
osacompile -o "$SCRIPT_DEST" "$SCRIPT_SRC"

# Get the HFS path for System Events
HFS_PATH=$(osascript -e "POSIX file \"$SCRIPT_DEST\" as string")

osascript << EOF
tell application "System Events"
    set folder actions enabled to true
    set downloadsPath to "/Users/edu/Downloads"
    set scriptHFSPath to "$HFS_PATH"

    -- Create folder action if it doesn't exist
    set faExists to false
    repeat with fa in folder actions
        if path of fa is downloadsPath then
            set faExists to true
            tell fa
                set existingScripts to path of scripts
                if scriptHFSPath is not in existingScripts then
                    make new script at end of scripts with properties {path:scriptHFSPath}
                end if
            end tell
        end if
    end repeat

    if not faExists then
        set fa to make new folder action at end of folder actions with properties {path:downloadsPath}
        tell fa
            make new script at end of scripts with properties {path:scriptHFSPath}
        end tell
    end if
end tell
EOF

echo "Done. WhatsApp downloads will be moved to ~/dropbox/edu/Downloads."
