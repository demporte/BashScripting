####################################
# This scrip changes the desktop wallpaper to a random wallpaper
# depending on the hour of the day. If its morning then it pulls the 
# wallpaper from the morning directory and so forth. 
#
# morning is between 06:00 and 11:00 
# afternoon is between 12:00 and 17:00
# evening is between 18:00 and 5:00
#
# script is ran at the top of each hour 
#
#####################


#!/bin/bash 

#create a log file to track changes and errors
log_file=$HOME/Documents/BashScripts/wallpaper_log.log

# Function to change wallpaper 
change_wall(){
  local file_path=$1
     
  if [ -z $file_path ]
  then 
      echo "ERROR: The wallpaper cannot be found" >&2
      echo "ERROR: The wallpaper cannot be found for $(/bin/date)" >> $log_file
      exit 2
   fi      
  #command used to change the wallpaper for MacOS
  osascript -e "tell application \"System Events\" to set picture of every desktop to \"$file_path"\"
  
  if [ $? -ne 0 ]
  then
      echo "ERROR: Wallpaper failed to update" >&2
      echo "ERROR: Wallpaper update on $(/bin/date)" >> $log_file
   else
      echo "SUCESS: Wallpaper changed at: $(/bin/date)" >> $log_file
   fi 
 
}


#setting the path to the directories that hold the wallpaper
Morn_wall=$HOME/Documents/BashScripts/Morning
Aft_wall=$HOME/Documents/BashScripts/Afternoon
Eve_wall=$HOME/Documents/BashScripts/Evening

#obtain the hour of the day
hour_of_day=$(/bin/date +%H)


###############
#check if date provides an hour between 0-24. It may be rare 
#that this may produce an error but it may be good to check since 
#scrip is dependent on it 
###############

if !  [[ "$hour_of_day" =~ ^([01][0-9]|2[0-3])$ ]] 
then 
  echo "The hour of day does not fall between 0&24. The hour provided is: $hour_of_day" >> $HOME/Documents/BashScripts/wallpaper_log.log
  exit 1 
fi


###############
# Logic behind choosing which wallpaper to choose
##############


if [[ $hour_of_day -ge 0 &&  $hour_of_day -le 5 ]]
then
     
    random_wallpaper=$( find "$Eve_walls" -type f | /opt/homebrew/bin/gshuf -n 1)
    change_wall "$random_wallpaper"

elif [[ $hour_of_day -ge 6 && $hour_of_day -le 11 ]]
then 

    random_wallpaper=$( find "$Morn_wall" -type f | /opt/homebrew/bin/gshuf -n 1)
    change_wall "$random_wallpaper" 

elif [[ $hour_of_day -ge 12 &&  $hour_of_day -le 17 ]]
then
    
    random_wallpaper=$( find "$Aft_wall" -type f | /opt/homebrew/bin/gshuf -n 1)
    change_wall "$random_wallpaper"


elif [[ $hour_of_day -ge 18 && $hour_of_day -le 23 ]]
then 
    random_wallpaper=$( find "$Eve_wall" -type f | /opt/homebrew/bin/gshuf -n 1)
    change_wall "$random_wallpaper" 
fi

