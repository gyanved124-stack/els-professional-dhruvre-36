# Stage 1: Build the React application
FROM node:20-alpine AS build
WORKDIR /app

ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

# Copy and install dependencies first for better caching
COPY package.json package-lock.json* ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Run the build command
RUN npm run build

# Stage 2: Serve the production build with NGINX
FROM nginx:stable-alpine

# Copy built React app (Vite outputs to dist/)
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy env.sh for runtime config generation
COPY env.sh /usr/share/nginx/html/env.sh
RUN chmod +x /usr/share/nginx/html/env.sh

# Create nginx user and set permissions
RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80
CMD ["/bin/sh", "-c", "/usr/share/nginx/html/env.sh && nginx -g 'daemon off;'"]

# ---------------------------------------------------
# 🐳 LEVEL 1: DOCKER CHALLENGE (CLIENT)
# ---------------------------------------------------
#
# Your task is to write the Dockerfile for this React application!
#
# Hints:
# 1. Use a node base image (e.g., node:18-alpine)
# 2. Set the working directory to /app
# 3. Copy package.json and package-lock.json
# 4. Install dependencies (npm install)
# 5. Copy the rest of the application code
# 6. Build the app (npm run build) - Optional for dev, required for prod
# 7. Expose the port (5173 for Vite dev, 80 for prod)
# 8. Define the startup command (npm run dev)
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
