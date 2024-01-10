# Use an official lightweight Node.js image.
# https://hub.docker.com/_/node
FROM node:14-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# Copying this first prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

# Serve the app on port 8080.
EXPOSE 8080

# Run the web service on container startup.
CMD [ "npm", "start" ]