###################
# BUILD FOR LOCAL DEVELOPMENT
###################

FROM node:16.18.0-alpine As development

# Create app directory
WORKDIR /usr/src/app

# Copy package and yarn lock files to workdir
COPY . .

# Install dependencies. We use --production to avoid installing dev dependences
RUN yarn install --production

# Run the build command which creates the production bundle
RUN yarn build

# Use the node user from the image (instead of the root user)
USER node

CMD ["yarn", "start:prod"]
