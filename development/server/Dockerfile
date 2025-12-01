# Debian-based image (supports apt-get)
FROM mirror.gcr.io/library/node:20-bullseye AS build

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

RUN npm run build

EXPOSE 1337
CMD ["npm", "start"]