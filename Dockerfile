FROM python:3.13-slim

LABEL maintainer="Marline khavele khavelemarline@gmail.com"

# Install build dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    python3-dev \
    curl \
    && apt-get clean

# Install Poetry (ensure it's available)
RUN curl -sSL https://install.python-poetry.org | python3 -

# Ensure Poetry is added to PATH
ENV PATH="/root/.local/bin:$PATH"

# Verify that Poetry is installed
RUN poetry --version

# Set the working directory
WORKDIR /app/

# Ensure Python looks in /app for modules
ENV PYTHONPATH=/app

# Copy necessary project files 
COPY ./pyproject.toml ./poetry.lock* ./Makefile /app/

# Install dependencies via Poetry
RUN poetry config virtualenvs.create false && poetry install --no-root --no-interaction --no-ansi

# Copy the source code into the container
COPY ./app /app/

# Set the command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
