FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <- contains build file of react which we want o copy in our main image

# each FROM command terminates last phase and start new phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


