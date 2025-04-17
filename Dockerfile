# First Stage: Install Dependencies
# Base Image
FROM node:22-slim AS dependencies

# Set the node enviroment
ENV NODE_ENV=production

# Set the working directory
WORKDIR /code

# Copy the package.json
COPY package*.json .

# Install the dependencies 
RUN npm ci --only=production

# Second Stage: Release App
FROM dependencies AS release

# Copy the node module from the prev stage
COPY --from=dependencies /code/node_modules ./node_modules
COPY --from=dependencies /code/package*.json ./
COPY . .

# Use the node non-root user
USER node

# Run The Application
CMD [ "node", "src/app.js" ]