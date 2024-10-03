FROM node:21.4.0 as builder

WORKDIR /app

COPY . .

RUN npm i

RUN npm run build

FROM nginx:1.25.3-alpine3.18

COPY --from=builder /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
