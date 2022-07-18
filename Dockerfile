# pull official base image
FROM python:3.9-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install gdal dependencies
RUN apt update \
    && apt install gcc python3-dev musl-dev binutils netcat python3-gdal gdal-bin -y

# python3-gdal libgdal-dev gdal-bin gdal-dev

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
#COPY ./scripts/entrypoint.dev.sh .
#RUN sed -i 's/\r$//g' /apps/entrypoint.dev.sh
#RUN chmod +x /apps/entrypoint.dev.sh

# copy project
COPY . .

# run entrypoint.sh
#ENTRYPOINT ["apps/entrypoint.dev.sh"]