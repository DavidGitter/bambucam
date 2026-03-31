Bambu Cam
=========
> [!NOTE]
> If you like the docker functionality and give this project a star, please consider also checking out jtessler´s repo who made this possible creating this cli-tool.

This repo contains the containerized version of jtessler´s BambuCam command-line tool which allowes setting up a webserver which streams the cam of Bamublab-Printers.

## Docker Usage
Use the following docker-compose.yaml to spawn a video-server:
````yaml
version: "3.8"

services:
  bambucam:
    image: dockersilas/bambucam:1.0.0
    container_name: bambucam

    ports:
      - "8082:8082" # the port number mapping where the video stream is serviced

    environment: 
    - DEVICE_ID="1A2B3C12345678" # your printer serial number (tho check for the right device)
    - ACCESS_CODE="12345678" # your printer access code
    - PORT=8082 # the port number where the video stream is serviced
    - KEEP_ALIVE=true # true = run infinitly retrying if printer is offline, false = shutdown if printer offline
    - PING_INTERVAL=10 # the interval (seconds) the printer is checked until available

    restart: no
````
