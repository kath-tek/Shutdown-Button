#!/usr/bin/python
import RPi.GPIO as GPIO
import time
import subprocess

GPIO.setmode(GPIO.BOARD)

GPIO.setup(17, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

oldButtonState1 = False

while True:
    #grab the current button state
    buttonState1 = GPIO.input(17)

    # check to see if button has been pushed
    if buttonState1 != oldButtonState1 and buttonState1 == True:
        # shutdown
        subprocess.call("shutdown -h now", shell=True,
          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        oldButtonState1 = buttonState1

    time.sleep(.5)
