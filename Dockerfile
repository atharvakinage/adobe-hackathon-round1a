    # Use a lightweight Python base image compatible with AMD64.
    FROM python:3.9-slim-buster AS builder

    # Set the working directory in the container.
    WORKDIR /app

    # Copy the requirements file and install dependencies.
    COPY requirements.txt .
    # Force reinstall, upgrade, and ensure no binary wheels are used (build from source)
    # This can sometimes resolve deep dependency issues.
    RUN pip install --no-cache-dir --upgrade --force-reinstall -r requirements.txt

    # Copy the main application script.
    COPY outline_extractor.py .

    # Copy the pre-trained model files into the container.
    COPY model/ ./model/

    # Define the command that will be executed when the container starts.
    CMD ["python", "outline_extractor.py"]
    