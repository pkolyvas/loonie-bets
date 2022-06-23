FROM node:18-current

COPY scripts/docker/entrypoint.sh /entrypoint.sh

# Expose port 3000
EXPOSE 3000

ENTRYPOINT [ "scripts/docker/entrypoint.sh" ]