FROM python:3.6.5
MAINTAINER Hendi Kusuma <cs.tojanna@gmail.com>

ENV INSTALL_PATH /web_app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

gunicorn -b 0.0.0.0:8000 --access-logfile - "web_app.app:create_app()"