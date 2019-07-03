FROM python:3.7-slim as base

FROM base as dependencies

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  gcc

WORKDIR /home/python/app

COPY requirements.txt .

RUN python -m venv venv \
  && . venv/bin/activate \
  && pip install --upgrade pip \
  && pip install --upgrade setuptools \
  && pip install -r requirements.txt \
  && deactivate

FROM base as build-image

RUN useradd py

WORKDIR /home/python/app

RUN chown -R py:py ./

USER py

COPY --from=dependencies /home/python/app/venv ./venv
COPY . .

RUN . venv/bin/activate

EXPOSE 5000
CMD ["python", "app.py"]