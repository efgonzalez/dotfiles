# Claude Code instructions

## WhatsApp downloads

### Prerequisites
1. Install Dropbox for macOS. The app syncs to `~/Library/CloudStorage/Dropbox-Efesis`.
2. Create symlinks to that folder:
   ```bash
   ln -s ~/Library/CloudStorage/Dropbox-Efesis ~/dropbox
   ln -s ~/Library/CloudStorage/Dropbox-Efesis ~/Dropbox
   ```
3. Confirm `~/dropbox/edu/Downloads` exists before proceeding.

### Folder Action
WhatsApp on macOS saves files to ~/Downloads. A Folder Action is installed
(via scripts/whatsapp-folder-action/install.sh) that automatically moves any
file downloaded by WhatsApp to ~/dropbox/edu/Downloads. Detection uses the
com.apple.quarantine extended attribute set by macOS (contains "WhatsApp"),
not the filename.
