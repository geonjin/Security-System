from picamera import PiCamera
import requests
import time
import ftplib
import os

def cature():
    try:
        #file save part
        camera = PiCamera()
        day = time.localtime()
        today = "%04d/%02d/%02d" % (day.tm_year, day.tm_mon, day.tm_mday)
        coming_tm = today + "%02d/%02d/%02d" % (day.tm_hour, day.tm_min, day.tm_sec)
        todayTime = "%04d%02d%02d%02d%02d%02d" % (day.tm_year, day.tm_mon, day.tm_mday,day.tm_hour, day.tm_min, day.tm_sec)
        fileUrl = "/home/rasp/python/"+today+"/"+todayTime+".jpg"
        os.makedirs("/home/rasp/python/"+today, exist_ok=True)
        camera.rotation = 180
        time.sleep(1)
        camera.capture(fileUrl)
        time.sleep(8)
        
        #file send part
        files = open(fileUrl, 'rb')
        data= {
            'coming_tm' : coming_tm,
            'url' : today
        }
        files = {
            'file' : files
            }
        url = 'http://192.168.35.7:8080/api/screen'

        http_post_request = requests.post(url, data=data, files=files)
    finally:
        camera.close()


