FROM python:3.12.3

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

COPY start.sh /start.sh

EXPOSE 8080

RUN chmod +x /start.sh