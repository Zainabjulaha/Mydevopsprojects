FROM python:3.9-slim

WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all app files (app.py etc.) from current directory
COPY . .

# Set PYTHONPATH if needed
ENV PYTHONPATH=/app

# Expose the port your app runs on
EXPOSE 8000

# Run the application
CMD ["python", "app.py"]

