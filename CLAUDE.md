# Claude Code instructions

## WhatsApp downloads
WhatsApp on macOS saves files to ~/Downloads. A Folder Action is installed
(via scripts/whatsapp-folder-action/install.sh) that automatically moves any
file downloaded by WhatsApp to ~/dropbox/edu/Downloads. Detection uses the
com.apple.quarantine extended attribute set by macOS (contains "WhatsApp"),
not the filename.
