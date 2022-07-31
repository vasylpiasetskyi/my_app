# pull official base image
#FROM python:3.9-slim-buster
FROM python:3

# set work directory
WORKDIR /app
EXPOSE 8000
# set environment variables
ENV PYTHONUNBUFFERED=1 \
    PORT=8000 \
    PYTHONDONTWRITEBYTECODE=1

RUN apt-get update

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt


# copy project
COPY . .
