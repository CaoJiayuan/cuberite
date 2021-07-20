FROM ubuntu:xenial
WORKDIR /build

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl && \
    curl -sSfL https://download.cuberite.org | sh


FROM ubuntu:xenial

ENV PLAYERS=10 \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=admin \
    AUTHENTICATE=0

WORKDIR /app
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y gettext-base libstdc++6 libc6

COPY --from=0 /build /app
RUN ls -l /app
COPY ./settings.ini.tpl /app/settings.ini.tpl
COPY ./run.sh run.sh
COPY ./webadmin.ini.tpl /app
RUN chmod +x run.sh && mkdir /data
EXPOSE 8080 25565
VOLUME [ "/data" ]
ENTRYPOINT /app/run.sh