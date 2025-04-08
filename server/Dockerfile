FROM node:18

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

# Cài đặt nodemon toàn cục
RUN yarn global add nodemon

COPY . .

EXPOSE 5050

CMD ["nodemon", "server.ts"]
