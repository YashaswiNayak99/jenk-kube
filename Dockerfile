FROM python:3.8.6-slim

RUN ["mkdir","-p","/app","&&","cd","/app"]
WORKDIR /app

COPY . .
RUN ["pip3","install","-r","requirements.txt"]
CMD ["python","app.py"]

EXPOSE 5000