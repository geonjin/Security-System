import RPi.GPIO as GPIO # 라즈베리파이 GPIO 핀을 쓰기위해 임포트
import time # 시간 간격으로 제어하기 위해 임포트
import requests
from bs4 import BeautifulSoup

def servoMotor(pin, degree, t):
    GPIO.setmode(GPIO.BOARD) # 핀의 번호를 보드 기준으로 설정, BCM은 GPIO 번호로 호출함
    GPIO.setup(pin, GPIO.OUT) # GPIO 통신할 핀 설정
    pwm=GPIO.PWM(pin, 50) # 서보모터는 PWM을 이용해야됨. 16번핀을 50Hz 주기로 설정

    pwm.start(3) # 초기 시작값, 반드시 입력해야됨
    time.sleep(t) # 초기 시작값으로 이동하고 싶지 않으면 이 라인을 삭제하면 된다.
    
    pwm.ChangeDutyCycle(10) # 보통 2~12 사이의 값을 입력하면됨
    time.sleep(1) # 서보모터가 이동할만큼의 충분한 시간을 입력. 너무 작은 값을 입력하면 이동하다가 멈춤


    pwm.stop() 
    GPIO.cleanup(pin)

getUrl = "http://192.168.35.7:8080/api/getSensor"
setUrl = "http://192.168.35.7:8080/api/setSensor"
setUrl2 = "http://192.168.35.7:8080/api/setGoingTm"
count = 0



while True:
    response = requests.get(getUrl)
    soup = BeautifulSoup(response.text, 'html.parser')
    state = soup.select_one('.ja').get_text()
    print(soup.select_one('.ja').get_text())
    time.sleep(2)
    if(count == 0):
        if(state == '1'):
            servoMotor(16, 8, 5)
            count = 1
    elif(count == 1):
        if(state == '0'):
            day = time.localtime()
            goingTm = "%04d/%02d/%02d/%02d/%02d/%02d" % (day.tm_year, day.tm_mon, day.tm_mday, day.tm_hour, day.tm_min, day.tm_sec)
            data = {
                'goingTm' : goingTm
                }
            http_post = requests.post(setUrl2, data=data)
            servoMotor(16, 8, 5)
            count = 0