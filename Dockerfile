FROM python:3.7.9
RUN apt update && apt install openssh-server -y
RUN echo "root:Docker!" | chpasswd 

WORKDIR /usr/src/app
ENV FLASK_APP=app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000 2222
COPY . .
COPY sshd_config /etc/ssh/
ENTRYPOINT /usr/src/app/init.sh

