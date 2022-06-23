FROM node:18-current

WORKDIR /loonie-bets
ADD . /loonie-bets

RUN npm install -g -s --no-progress yarn && \
    cd client && yarn install && \
    cd ../server && yarn install

COPY scripts/docker/entrypoint.sh /entrypoint.sh

# Expose port 3000
EXPOSE 3000

ENTRYPOINT [ "scripts/docker/entrypoint.sh" ]