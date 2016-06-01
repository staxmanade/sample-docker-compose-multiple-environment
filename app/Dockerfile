# Start from a standard nodejs image
FROM node

# Copy in the node app to the container
COPY ./server.js /app/server.js
WORKDIR /app

# Allow http connections to the server
EXPOSE 80

# Start the node server
CMD ["node", "server.js"]
