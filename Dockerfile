# Stage 1: Build the Vue.js app
FROM node:18-alpine AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app source and build
COPY . .
RUN npm run build

# Stage 2: Serve the app with NGINX
FROM nginx:alpine

# Copy built app to NGINX web root
COPY --from=build /app/dist /usr/share/nginx/html

# Replace default NGINX config with custom one
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Optional: Use a custom entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]