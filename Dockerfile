FROM python:3.7-slim

MAINTAINER "Neo Peng <pengzhile@gmail.com>"

VOLUME /data
WORKDIR /opt/app
ADD . .
RUN pip install --upgrade pip && pip install .[api] && pip install dist/Pandora_Cloud-0.2.0-py3-none-any.whl
ENTRYPOINT ["bin/startup.sh"]
