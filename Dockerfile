FROM alpine:3.9

RUN apk -U add nginx python3 bash
RUN mkdir /run/nginx

RUN pip3.6 install websockets flask

COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/

VOLUME /app
WORKDIR /app 
ENTRYPOINT ["/bin/bash", "-c", "FLASK_APP=server.py flask run --reload --host=0.0.0.0 --port=8888 & python3 test.py & echo starting nginx ; nginx"]
