# Base
FROM node:18-alpine

# Set working directory
WORKDIR /opt/app

# Copy package files
COPY package*.json ./
RUN npm install

# Copy app files
COPY . .

# Build admin panel
RUN npm run build

# Expose port
EXPOSE 1337

# Start
CMD ["npm", "run", "develop"]