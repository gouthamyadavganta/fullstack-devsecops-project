# Stage 1: Build the app
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Stage 2: Run the app with distroless
FROM gcr.io/distroless/nodejs20-debian11

WORKDIR /app

COPY --from=build /app .

CMD ["server.js"]
