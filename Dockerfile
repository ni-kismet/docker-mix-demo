# Build containter
FROM elixir:1.8.1 as builder

ARG MIX_ENV=prod
ENV MIX_ENV=${MIX_ENV}
RUN echo "ENVIRONMENT: "${MIX_ENV}

ENV HEX_HTTP_CONCURRENCY=1
ENV HEX_HTTP_TIMEOUT=120

WORKDIR /usr/src/docker-mix-demo

COPY . .
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get

# Run container
FROM elixir:1.8.1

WORKDIR /usr/src/docker-mix-demo

ARG MIX_ENV=prod
ENV MIX_ENV=${MIX_ENV}

COPY --from=builder /usr/src/docker-mix-demo/_build/${MIX_ENV}/rel/docker-mix-demo .

ENV PORT 80

EXPOSE ${PORT}

#TODO CMD ["bin/run.sh"]