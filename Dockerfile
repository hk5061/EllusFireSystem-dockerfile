# 1. 공식 eclipse-mosquitto 최신 이미지를 기반으로 시작
FROM eclipse-mosquitto:latest

# 2. Mosquitto 설정 파일과 데이터/로그 디렉토리 위치 설정 (이미지 내 기본 경로)
WORKDIR /app
COPY . /app

# 3. (선택사항) 로컬에 있는 mosquitto.conf 파일을 이미지 내부로 복사
# 만약 기본 설정을 그대로 쓸 예정이라면 이 줄은 생략해도 됩니다.
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# 4. mosquitto 이미지는 기본적으로 'mosquitto' 사용자(uid/gid 1883)로 실행되도록 설정되어 있음
USER mosquitto

# 5. MQTT 기본 포트(1883)와 웹소켓 포트(9001) 열기
EXPOSE 1883 9001

# 6. Mosquitto 브로커 실행 명령어 (기본 설정 파일 지정)
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]