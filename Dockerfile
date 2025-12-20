FROM python:3.11-slim

# install system dependencies untuk cairo
RUN apt-get update && apt-get install -y \
    libcairo2 \
    libcairo2-dev \
    pkg-config \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "talent_profile_project.wsgi:application", "--bind", "0.0.0.0:8080"]
