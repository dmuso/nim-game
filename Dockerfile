FROM nimlang/nim:0.18.0-alpine AS builder

RUN apk update
RUN apk add sdl2 sdl2-dev
RUN apk add libcrypto1.0 libssl1.0

RUN nimble install -y sdl2 strfmt basic2d

WORKDIR /app
COPY . .

RUN nim c -d:release helpzero.nim

FROM alpine AS app
COPY --from=builder /app/helpzero /app/helpzero
