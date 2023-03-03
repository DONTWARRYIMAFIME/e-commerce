###################
# BUILD FOR LOCAL DEVELOPMENT
###################

FROM node:16.17.0-alpine As development

# Create app directory
WORKDIR /usr/src/app

# Copy package and yarn lock files to workdir
COPY --chown=node:node package*.json yarn.lock ./

# Install dependencies
RUN yarn install --development

# Set NODE_ENV environment variable
ENV NODE_ENV development

# Copy app source code to workdir
COPY --chown=node:node . .

# Use the node user from the image (instead of the root user)
USER node

###################
# BUILD FOR PRODUCTION
###################

FROM node:16.17.0-alpine As build

WORKDIR /usr/src/app

COPY --chown=node:node package*.json yarn.lock ./

# In order to run `npm run build` we need access to the Nest CLI.
# The Nest CLI is a dev dependency,
# In the previous development stage we ran `npm ci` which installed all dependencies.
# So we can copy over the node_modules directory from the development image into this build image.
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules

COPY --chown=node:node . .

# Run the build command which creates the production bundle
RUN yarn build

# Set NODE_ENV environment variable
ENV NODE_ENV production

# Running `npm ci` removes the existing node_modules directory.
# Passing in --only=production ensures that only the production dependencies are installed.
# This ensures that the node_modules directory is as optimized as possible.
RUN yarn install --production && yarn cache clean --force

USER node

###################
# PRODUCTION
###################

FROM node:16.17.0-alpine As production

# Copy the bundled code from the build stage to the production image
COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

# Install dependencies
RUN yarn install --production

# Start the server using the production build
CMD [ "node", "dist/main.js" ]
