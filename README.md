Project: Dynamic Wall paper script 

Description: 
- This bash script changes your desktop wallpaper every hour, displaying a different greeting based on the time of day (Good Morning, Good Afternoon, Good Evening). It uses the system event manager for automation. It also uses

prerequisites: 
- Requires a MacOS system with bash, access to cron for automation, and the ability to set up system event manager tasks.

Installation: 
1. Download the script.
2. Set executable permissions with sudo chmod +x script_name.sh.
3. edit your crontab to have it execute every hour 00 * * * * /path/to/script.sh

Usuage: 
- To manually run the script ./scriptname.sh

Error Handling and Troubleshooting
- If you encounter unknown command errors in cron, ensure that full paths are used for all commands in the script. For example, instead of just command, use /usr/bin/command.

- Ensure the script has the correct permissions to execute. You can set permissions using:
bash


