FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip3 install -r requirements.txt

ADD ./backend /app/backend
ADD ./research /app/research

RUN mkdir -p /app/backend/server/static

WORKDIR /app/backend/server

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]
