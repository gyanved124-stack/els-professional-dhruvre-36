FROM node:20-bullseye

RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    make \
    g++ \
    libvips-dev \
    libpng-dev \
    zlib1g-dev \
    nasm \
    bash \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY package.json package-lock.json* ./
RUN npm install

COPY . .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 1337

ENTRYPOINT ["./entrypoint.sh"]

# ---------------------------------------------------
# 🐳 LEVEL 1: DOCKER CHALLENGE (SERVER)
# ---------------------------------------------------
#
# Your task is to write the Dockerfile for this Strapi application!
#
# Hints:
# 1. Use a node base image (e.g., node:18-alpine)
# 2. Set the working directory to /opt/app
# 3. Copy package.json and package-lock.json
# 4. Install dependencies (npm install)
# 5. Copy the rest of the application code
# 6. Build the admin panel (npm run build)
# 7. Expose the port (1337)
# 8. Define the startup command (npm run develop)
#
# Need help? Check the Level 1 lessons!
# ---------------------------------------------------

# FROM ...
# WORKDIR ...
# COPY ...
# RUN ...
# COPY ...
# EXPOSE ...
# CMD ...