# Stage 1: Build the app
FROM node:20-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project
COPY . .

# Stage 2: Production image (distroless or minimal image)
FROM node:20-alpine

WORKDIR /app

# Copy only the necessary files from the build stage (app + node_modules)
COPY --from=build /app .

# Ensure that the app runs with the correct entry point
CMD ["node", "index.js"]

