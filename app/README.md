# TASK 1:SimpleTimeService — Minimal DevOps Challenge Application
Purpose:

SimpleTimeService is a minimal microservice created as part of the Particle41 DevOps Team Challenge.
# It demonstrates:

Basic web application development

Containerization using Docker

Running applications as a non-root user inside containers

Publishing images to a public registry (Docker Hub)

Documentation and clear setup instructions

# The service exposes one endpoint:

GET /
{
  "timestamp": "<current date and time>",
  "ip": "<visitor ip>"
}

# app directory sturcture

SimpleTimeService/

├── app/                          # Application Code (Task 1)
│   ├── main.py                   # FastAPI / Flask service
│   ├── Dockerfile                # Docker build file
│   ├── requirements.txt          # Python dependencies
│   └── README.md                 # Task 1 README (Docker build + run instructions)



All application code and Dockerfile are located inside the app/ directory as recommended.

# Prerequisites:

To run or deploy this application, you need the following tools (on a local laptop OR any cloud VM like AWS EC2(I used)):

1. Git

Download: https://git-scm.com/downloads

sudo apt install git -y


2. Python 3

Download: https://www.python.org/downloads/

3. Docker Engine (Linux) / Docker Desktop (Windows/Mac)

Docker Desktop: https://www.docker.com/products/docker-desktop/

Docker Engine (Linux): https://docs.docker.com/engine/install/

Command

sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER


4. Docker Hub Account

Create free account: https://hub.docker.com/signup

# Cloning the Repository:

Clone the repo to your laptop or EC2 instance:

https://github.com/bodduvamshi/SimpleTimeService.git

cd SimpleTimeService/app/

Running the App Locally (Optional)

# Install dependencies:

pip install -r requirements.txt


Run the application:

python3 main.py


Access in browser:

http://localhost:8080/

# Docker Instructions

The application is fully Dockerized and runs as a non-root user inside the container as required.

    1. Build Docker Image

From inside the app/ directory:

docker build -t simpletimeservice:latest .

    2. Run the Container

docker run -p 8080:8080 simpletimeservice:latest


Test in browser:

http://localhost:8080/


OR if running on EC2:

http://<EC2-PUBLIC-IP>:8080/  (make sure to include inbound ports 22, 80, 8080 while creation security group)

# Publish to Docker Hub (I did as Required for Task)
1. Login to Docker Hub

docker login

2. Tag your image

docker tag simpletimeservice:latest <your-dockerhub-username>/simpletimeservice:latest

3. Push the image

docker push <your-dockerhub-username>/simpletimeservice:latest


You should now see the image on:

https://hub.docker.com/repositories

Pulling the Image for Testing

# Anyone can run your app using:

docker pull vamshiboddu/simpletimeservice:latest
docker run -p 8080:8080 vamshiboddu/simpletimeservice:latest


Open:

http://localhost:8080/


Or:

http://<cloud-vm-ip>:8080/


Docker image is kept minimal — only required dependencies included.