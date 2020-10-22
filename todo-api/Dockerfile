# Build API
# This Dockerfile is very inefficient.  Convert this to a multi-stage docker build with a node12 container used as runtime.
# If done correctly the final image should be < 300 MB.
# Intermediate docker image
FROM node:12 AS appbuild
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# Production docker image
FROM node:12-alpine
WORKDIR /app
COPY --from=appbuild /app /app
CMD ["npm", "run", "start:prod"]