# Claude Code instructions

## WhatsApp downloads

### Prerequisites
1. Install Dropbox for macOS.
2. Create the symlink:
   ```bash
   ln -s /Users/edu/Dropbox-Efesis/edu /Users/edu/dropbox
   ```
3. Confirm `~/dropbox/Downloads` exists (it should, since ~/dropbox points to the edu subfolder).

### Folder Action
WhatsApp on macOS saves files to ~/Downloads. A Folder Action is installed
(via scripts/whatsapp-folder-action/install.sh) that automatically moves any
file downloaded by WhatsApp to ~/dropbox/Downloads. Detection uses the
com.apple.quarantine extended attribute set by macOS (contains "WhatsApp"),
not the filename.
