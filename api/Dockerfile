FROM node

WORKDIR /app

COPY server.js /app
COPY package.json /app

RUN npm install

EXPOSE 5001

CMD ["node", "server.js"]






