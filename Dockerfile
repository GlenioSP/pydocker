FROM python:3.7-slim as base

FROM base as dependencies

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  gcc

WORKDIR /home/py/app

COPY requirements.txt .

RUN python -m venv venv \
  && . venv/bin/activate \
  && pip install --upgrade pip \
  && pip install --upgrade setuptools \
  && pip install -r requirements.txt \
  && deactivate

FROM base as build

RUN useradd py

WORKDIR /home/py/app

RUN chown -R py:py ../

USER py

ENV VIRTUAL_ENV=./venv

COPY --from=dependencies /home/py/app/venv $VIRTUAL_ENV
COPY . .

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 5000

CMD ["python", "app.py"]