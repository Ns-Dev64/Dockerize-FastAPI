FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y \
    netcat-openbsd gcc postgresql-client libpq-dev curl

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .


RUN chmod +x wait-for-it.sh start.sh

CMD ["./start.sh"]
