FROM 18-alpine

RUN mkdir -p /code
WORKDIR /loonie-bets
ADD . /loonie-bets
RUN npm install -g -s --no-progress yarn && \
    yarn && \
    yarn run build && \
    yarn run prune && \
    yarn cache clean
ENTRYPOINT [ ./run.sh ]
EXPOSE 3000
