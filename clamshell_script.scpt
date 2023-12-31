-- Check if MacBook is in clamshell mode
set clamshellMode to (do shell script "ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | awk '{print $NF}'")

-- Check if trackpad scrolling direction is set to 1 (natural scrolling)
set trackpadScrollDirection to (do shell script "defaults read -g com.apple.swipescrolldirection")

if clamshellMode is "Yes" then
	-- Toggle trackpad scrolling direction if needed
	if trackpadScrollDirection is "1" then
		tell application "System Settings"
			activate
		end tell
		delay 0.1
		
		tell application "System Events"
			tell process "System Settings"
				click menu item "Trackpad" of menu "View" of menu bar 1
				delay 0.25
				click radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				click checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				tell application "System Settings" to quit
			end tell
		end tell
	end if
	
	-- Enable auto hide for the Dock
	do shell script "defaults write com.apple.dock autohide -bool true"
	do shell script "killall Dock"
end if

if clamshellMode is "No" then
	-- Toggle trackpad scrolling direction if needed
	if trackpadScrollDirection is "0" then
		tell application "System Settings"
			activate
		end tell
		delay 0.1
		
		tell application "System Events"
			tell process "System Settings"
				click menu item "Trackpad" of menu "View" of menu bar 1
				delay 0.25
				click radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				click checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				tell application "System Settings" to quit
			end tell
		end tell
	end if
	
	-- Enable auto hide for the Dock
	do shell script "defaults write com.apple.dock autohide -bool false"
	do shell script "killall Dock"
end if
