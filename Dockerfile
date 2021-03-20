FROM python:3.9.2-slim-buster

# set working directory
WORKDIR /src

RUN apt-get update 

RUN pip install --upgrade pip

COPY pyproject.toml .

RUN pip install poetry

RUN poetry install
EXPOSE 80
COPY ./src .

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]

