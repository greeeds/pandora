FROM python:3.9-slim

MAINTAINER "Neo Peng <pengzhile@gmail.com>"

VOLUME /data

WORKDIR /opt/app

ADD . .

RUN pip --no-cache-dir install --upgrade pip && pip --no-cache-dir install .[api] && pip --no-cache-dir install dist/Pandora_Cloud-0.4.3-py3-none-any.whl

ENTRYPOINT ["bin/startup.sh"]
