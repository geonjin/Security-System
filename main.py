from tkinter import *
from file_send import *
import threading
import requests
import time
import os
from bs4 import BeautifulSoup
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(11, GPIO.IN, pull_up_down=GPIO.PUD_UP)

url = 'http://192.168.35.7:8080/api/getSensor'
url2 = 'http://192.168.35.7:8080/api/setSensor'

count = 0

def getSensor():
    global count
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    state = soup.select_one('.ja').get_text()
    print(state)
    time.sleep(1)
    if(count == 0):
        if(state == '1'):
            cature()
            count = 1
    elif(count == 1):
        if(state == '0'):
            count = 0

while True:
    getSensor()
    input_state = GPIO.input(11)
    if(input_state == False):
        GPIO.output(12, GPIO.HIGH)
        data = {
            'sensor' : '0'
            }
        http_post_request = requests.post(url2, data=data)
    else:
        GPIO.output(12, GPIO.LOW)
        
    time.sleep(0.5)