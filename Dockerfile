FROM python:3
WORKDIR /data
RUN pip install django==3.2
COPY . .
RUN python manage.py migrate

ENV DOCKER_HOST=tcp://docker:2376
ENV DOCKER_CERT_PATH=/certs/client
ENV DOCKER_TLS_VERIFY=1
VOLUME [ "jenkins-data:/var/jenkins_home", "jenkins-docker-certs:/certs/client:ro" ]
EXPOSE 8080/tcp
EXPOSE 5000/tcp


EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]


