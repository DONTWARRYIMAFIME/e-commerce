FROM node:16.18.0-alpine AS install-dependencies

# Create app directory
WORKDIR /usr/src/app

# Copy package and yarn lock files to workdir
COPY --chown=node:node package*.json yarn.lock ./

# Install dependencies. We use --production to avoid installing dev dependences
RUN yarn install --production

# Copy app source code to workdir
COPY --chown=node:node . .

FROM node:16.18.0-alpine AS build

WORKDIR /usr/src/app

COPY --chown=node:node --from=install-dependencies /usr/src/app/ ./

# Run the build command which creates the production bundle
RUN yarn build

# Use the node user from the image (instead of the root user)
USER node

FROM node:16.18.0-alpine AS run

WORKDIR /usr/src/app

# Copy the bundled code from the build stage to the production image
COPY --chown=node:node --from=install-dependencies /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

# Start the server using the production build
CMD [ "yarn", "start:prod" ]