FROM ubuntu:bionic

ENV PLAYERS=10 \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=admin

WORKDIR /app/

RUN apt-get update && apt-get install -y curl gettext-base && \
    curl -sSfL https://download.cuberite.org | sh && \
    mv Server cuberite
COPY ./settings.ini /app/cuberite/settings.ini
COPY ./run.sh run.sh
COPY ./webadmin.ini.tpl /app
RUN chmod +x run.sh && mkdir /data
EXPOSE 8080 25565
VOLUME [ "/data" ]
ENTRYPOINT /app/run.sh