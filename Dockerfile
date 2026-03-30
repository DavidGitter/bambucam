FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

ENV DEVICE_IP="printer-ip"
ENV DEVICE_ID="printer-serial-number"
ENV ACCESS_CODE="printer-access-code"
ENV PORT=1234

WORKDIR /app

RUN mkdir plugins

# copy the executable and plugins
COPY ./bambucam .
COPY ./plugins ./plugins

# set plugin path
ENV PLUGIN_PATH=/app/plugins

EXPOSE ${PORT}
ENTRYPOINT ["./bambucam"]