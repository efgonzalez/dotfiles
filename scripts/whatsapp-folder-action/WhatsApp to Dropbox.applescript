on adding folder items to theFolder after receiving addedItems
    set destinationFolder to (POSIX file "/Users/edu/dropbox/Downloads") as alias
    tell application "Finder"
        repeat with theItem in addedItems
            set itemPath to POSIX path of (theItem as alias)
            try
                set quarantine to do shell script "xattr -p com.apple.quarantine " & quoted form of itemPath & " 2>/dev/null"
                if quarantine contains "WhatsApp" then
                    try
                        move theItem to destinationFolder with replacing
                    end try
                end if
            end try
        end repeat
    end tell
end adding folder items to
