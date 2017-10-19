# Shutdown-Button
Shutdown Button for Raspberry pi (GPIO 17)  

sudo apt-get update #Update repositories  
sudo apt-get install -y python-dev #install python Libraries  
sudo apt-get install -y python-pip  
sudo easy_install -b /home/pi -U distribute  
sudo pip install rpi.gpio #Install GPIO Library  

rc.local - sudo python /home/pi/scripts/shutdown.py &
