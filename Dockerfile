# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install MkDocs and any additional plugins required
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Expose port 8000 (default port for mkdocs)
EXPOSE 8000

# Run MkDocs serve when the container launches
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]