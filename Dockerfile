FROM python:3
WORKDIR /data
RUN pip install django==3.2
COPY . .
RUN python manage.py migrate

ENV DOCKER_HOST=tcp://docker:2376
ENV DOCKER_CERT_PATH=/certs/client
ENV DOCKER_TLS_VERIFY=1

EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]


