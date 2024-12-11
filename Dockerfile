# Use the official Node.js image as a base
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application for production
RUN npm run build

# Install a simple HTTP server to serve the static files
RUN npm install -g serve

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["serve", "-s", "build", "-l", "3000"]
