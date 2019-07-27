# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Production image
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Default command defined in 'nginx' image
