FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . .
RUN npm run build && npm i -g serve
EXPOSE 5173
CMD ["serve", "-s", "dist", "-l", "5173"]
