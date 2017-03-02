##############################################
#Name: SetupShutdownButton.sh
#Created by: Matthew Sage
#Date: 02/12/14
#Description: Creates python code and install repositories for a physical shutdown button

#RUN AS ROOT! e.g sudo ./SetupShutdownButton.sh
##############################################

#Create Python Script
echo "import RPi.GPIO as GPIO
import time
import os
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.IN,pull_up_down=GPIO.PUD_UP) #setup GPIO pin #17 as Pull up down
while True:
    print GPIO.input(17)
    if(GPIO.input(17) == False):
        os.system("\""sudo shutdown -h now"\"") #If button pressed shutdown pi
        break
    time.sleep(1)" > /home/pi/shutdown_button.py #Save in home directory

#Installing Libraries needed
sudo apt-get update #Update repositories
sudo apt-get install -y python-dev #install python Libraries
sudo apt-get install -y python-pip
sudo easy_install -b /home/pi -U distribute
sudo pip install rpi.gpio #Install GPIO Library

#Set script to start on boot
sudo sed -i '/exit 0/d' /etc/rc.local #remove exit 0 from /etc/rc.local
sudo echo "sudo python /home/pi/shutdown_button.py
exit 0" >> /etc/rc.local #add python script and Exit 0 into rc.local
