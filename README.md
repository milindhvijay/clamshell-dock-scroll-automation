
# MacBook Clamshell Automator

This repository provides a solution for automatically turn on dock auto show & hide and turn off natural scrolling while in clamshell mode and vice versa when you get out of clamshell mode. 

The included AppleScript ('clamshell_script.scpt') checks the "AppleClamshellState" and if YES, it turns on auto show & hide for dock and toggles trackpad setting (Natural Scrolling to OFF).

The 'InvokeScript.sh' runs an infinite loop and checks the current "lid_state" AKA Clamshell State. It compares the "lid_state" and invokes the AppleScript on state change.

This is made for my personal use case where I wanted to have dock available on multiple monitors (which is only possible with auto show & hide); and I use a third-party mouse where I needed to invert the scroll wheel action.



## Setup

To run this script:

1. Clone the Repository:

```bash
  https://github.com/milindhvijay/clamshell-dock-scroll-automation.git
  cd clamshell-dock-scroll-automation
```

2. Create a Script in Automator

* Go to Finder
* Select Application
* Open Automator
* Double-click on Application from popup.
* Click Utilities under Library section.
* Double-click Run Shell Script
* Paste contents of InvokeScript.sh
* Save it to clamshell-dock-scroll-automation directory. File format will be application.

3. Run InvokeScript.app with Login Action

* Go to System Preferences -> Login Items
* Click on (+), go to the directory, and add InvokeScript.app

4. Reboot the system and login where you might get popups asking for permission. Provide appropriate permissions.

5. Reboot your system again to apply changes.
