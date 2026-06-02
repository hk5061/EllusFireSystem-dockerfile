# 1. 빌드 재현성과 안정성을 위해 eclipse-mosquitto의 특정 버전을 명시합니다.
FROM eclipse-mosquitto:2.0.18

# 2. 로컬의 mosquitto.conf 파일을 이미지 내부 설정 경로로 복사합니다.
# 권한 에러 방지를 위해 복사 시 소유권을 mosquitto 사용자로 지정합니다.
COPY --chown=mosquitto:mosquitto mosquitto.conf /mosquitto/config/mosquitto.conf

# 3. MQTT 기본 포트(1883)와 웹소켓 포트(9001)를 노출합니다.
EXPOSE 1883 9001