FROM python:3.12-slim

WORKDIR /mybooks_app


RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 9000
CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]

