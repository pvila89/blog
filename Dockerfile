FROM node:18.16.0-alpine3.18
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app
COPY --chown=app:app package*.json .
RUN npm install
COPY --chown=app:app . .
ENV API_URL=http://api.myapp.com
EXPOSE 3000
CMD npm run dev
