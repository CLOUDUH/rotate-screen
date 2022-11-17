(*
	2022/11/17 via CLOUDUH clouduh@outlook.com
	More information on GitHub: https://github.com/CLOUDUH/rotate-screen

	Only for macOS 12.X Monterey, Not suitable for macOS 11.X Big Sur or macOS 13.X Ventura
	Because AppleScript not support with Chinese, so I use English to describe the script
	If your system language is not English, please change the script to your language, especially the "XXXX" words.
	You can open system preferences windows, and run "UIsniffer.applescript", checkout the result, your can get the "XXXX" words.

	I will put a Chinese version on Markdown file, you copy into this script.
*)

on run
	
	tell application "System Preferences"
	# quit before system preference application
		quit
		delay 0.5 # delay for avoiding conflict
	end tell
	
	tell application "System Preferences"
	# open new one
		activate 
	end tell
	
	tell application "System Events" 
	# open Displays(en) / xianshiqi(zh) windows in system preferences
		key down {option} 
		# must click with option on Monterey
		delay 0.5
		click button "Displays" of scroll area 1 of window "Displays" of application process "System Preferences"
		delay 1
		key up {option} # release option
	end tell
	
	set x to 0 # create flag
	
	tell application "System Events"
	# check if the screen is rotated, and rotate it inverse:  
		tell pop up button "Rotation:" of group 1 of window "Display" of application process "System Preferences" 
			if value is "Standard" then # 0-->90
				click 
				delay 0.5
				pick menu item "90°" of menu 1 
				set x to 0 # flag
			else # 90/180/270-->0
				click
				delay 0.5
				pick menu item "Standard" of menu 1 
				set x to 90 # flag
			end if
		end tell
	end tell
	
	tell application "System Events"
	# if 0-->90, a confirmation window with a countdown timer will appear
		delay 1 
		if x = 0 then # if 0-->90
			click button "Confirm" of sheet 1 of window "Displays" of application process "System Preferences"
		end if
	end tell
	
	tell application "System Preferences"
	# quit system preference application
		delay 0.5 
		quit 
	end tell
	
end run