# Stage 1: Build the React application
FROM node:20-alpine AS build
WORKDIR /app

ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

COPY package.json package-lock.json* ./
RUN npm install

COPY . .
RUN npm run build



# Stage 2: Serve the production build with NGINX
FROM nginx:stable-alpine

# Ensure runtime env injection happens LAST (fix for your issue)
COPY env.sh /docker-entrypoint.d/99-env.sh
RUN chmod +x /docker-entrypoint.d/99-env.sh

# Copy the built Vite app
COPY --from=build /app/dist /usr/share/nginx/html

# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80

# NGINX entrypoint auto-runs all /docker-entrypoint.d/*.sh BEFORE nginx starts
CMD ["nginx", "-g", "daemon off;"]
