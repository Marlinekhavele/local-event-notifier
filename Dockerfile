FROM python:3.10-slim

ENV POETRY_VERSION=1.6.1

# Install Poetry
RUN pip install "poetry==$POETRY_VERSION"

# Copy project files
WORKDIR /app
COPY . .

# Install dependencies
RUN poetry install --no-dev --no-interaction --no-ansi

# Command to run your application
CMD ["poetry", "run", "python", "app.main:app"]