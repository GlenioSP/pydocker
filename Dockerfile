FROM python:3.7-alpine

RUN adduser -D py

WORKDIR /home/python/app

COPY requirements.txt requirements.txt

RUN apk --update add python py-pip openssl ca-certificates py-openssl wget
RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base \
  && pip install --upgrade pip \
  && pip install -r requirements.txt \
  && apk del build-dependencies

COPY . .

RUN chown -R py:py ./

USER py

EXPOSE 5000
CMD ["python", "src/server.py"]