FROM ubuntu

WORKDIR /usr/src/home

COPY . .

RUN apt update && apt upgrade -y

RUN apt install python3 python3-pip supervisor -y

RUN pip install --no-cache-dir -r flask-mongo/requirements.txt

EXPOSE 5000 8080

CMD chmod +x ./stop-script.sh ./start-script.sh && ./start-script.sh
