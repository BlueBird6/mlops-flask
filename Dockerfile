# Base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Run model.py to train the model and save it to disk
RUN python3 model.py

# Expose the port that the application will listen on
EXPOSE 5000

# Start the application
CMD ["python", "server.py"]
