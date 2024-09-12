FROM public.ecr.aws/docker/library/node:20-bookworm-slim AS build-stage

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD [ "npm", "run", "dev" ]

FROM busybox:1.35
RUN adduser -D static
USER static
WORKDIR /home/static
COPY --from=build-stage /app/dist .
CMD ["busybox", "httpd", "-f", "-v", "-p", "8080"]