# On Linux with Python3.7

## Install dependencies

1. Create a new virtual environment: `python3 -m venv venv`.
2. Activate venv: `source ./venv/bin/activate`.
3. Upgrade pip: `pip install --upgrade pip`.
4. Install dependencies: `pip install -r requirements.txt`.
5. (If necessary) Deactivate virtual environment: `deactivate`.

## Install new dependencies

If installing new dependencies (with the virtual environment activated), do:

1. Install dependency: `pip install dependency_name`.
2. Generate new requirements.txt file: `pip freeze > requirements.txt`.

## Run the app

Before running the app, activate the virtual environment (if deactivated) and generate a new requirements.txt file:

```
source ./venv/bin/activate && \
pip freeze > requirements.txt
```

And run: `docker-compose -f docker-compose.dev.yaml up --build -d`.

## Stop containers

`docker-compose -f docker-compose.dev.yaml down`

## Remove everything

`docker-compose -f docker-compose.dev.yaml down -v --rmi all --remove-orphans`

## Based on tutorials

- [Elegantly activating a virtualenv in a Dockerfile](https://pythonspeed.com/articles/activate-virtualenv-dockerfile/)