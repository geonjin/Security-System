#!/usr/bin/env python
#-*- coding: utf-8 -*-
 
import RPi.GPIO as GPIO
import requests
import time
import ftplib
import os
from bs4 import BeautifulSoup
 
GPIOIN = 17 
GPIOOUT = 27
 
GPIO.setmode(GPIO.BCM)
print ("HC-SR501 motion detection start")
GPIO.setup(GPIOIN, GPIO.IN)   

try:
    change = 0
    url = 'http://192.168.35.7:8080/api/setSensor'
    url2 = 'http://192.168.35.7:8080/api/getSensor'
    while True:  
        state =  GPIO.input(GPIOIN)
        data = {
            'sensor' : state
        }
        response = requests.get(url2)
        soup = BeautifulSoup(response.text, 'html.parser')
        getState = soup.select_one('.ja').get_text()
        if(state == True):
            print (time.localtime().tm_min," ",time.localtime().tm_sec," "," state: Motion detected")
            if(change == 0):
                http_post_request = requests.post(url, data=data)
                change = 1
        else:
            print (time.localtime().tm_min," ",time.localtime().tm_sec," "," state: No Motion")
            if(change == 1):
                if(getState == '0'):
                    http_post_request = requests.post(url, data=data)
                    change = 0

        print ("state: ", state) 
        time.sleep(2)
        
except KeyboardInterrupt:   
    GPIO.cleanup()       

print ("HC-SR501 motion detection end")