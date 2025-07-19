    FROM python:3.9-slim-buster AS builder

    WORKDIR /app

    COPY requirements.txt .
    RUN pip install --no-cache-dir --upgrade --force-reinstall -r requirements.txt

    COPY outline_extractor.py .

    COPY model/ ./model/

    CMD ["python", "outline_extractor.py"]
    