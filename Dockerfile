FROM ubuntu:22.04

RUN apt update 
#RUN apt install -y python3.10-minimal python3-pip mariadb-server-10.6
RUN apt install -y python3.10-minimal python3-pip
RUN pip3 install Django tzdata

RUN mkdir -p /home/ubuntu/webproject
WORKDIR /home/ubuntu/webproject

#COPY /home/ubuntu/DockerProject/mysite.tar.gz .

COPY mysite.tar.gz .
#COPY start_daemons.sh .

RUN tar zxvf mysite.tar.gz

EXPOSE 8000

CMD ["python3", "mysite/manage.py", "runserver", "0.0.0.0:8000"]
#CMD ["bash", "start_daemons.sh"]


