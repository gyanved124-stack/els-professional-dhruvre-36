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