FROM python:3.9-slim@sha256:5f0192a4f58a6ce99f732fe05e3b3d00f12ae62e183886bca3ebe3d202686c7f

MAINTAINER "Neo Peng <pengzhile@gmail.com>"

VOLUME /data

WORKDIR /opt/app

ADD . .

RUN pip --no-cache-dir install --upgrade pip && pip --no-cache-dir install .[api] && pip --no-cache-dir install dist/Pandora_Cloud-0.4.10-py3-none-any.whl

ENTRYPOINT ["bin/startup.sh"]
