FROM alpine:latest

ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN mkdir /exploit

WORKDIR /exploit

COPY ./payload.java /

EXPOSE 80

CMD ["python3", "-m http.server 80"]
