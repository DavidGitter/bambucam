Bambu Cam
=========
> [!NOTE]
> If you like the docker functionality and give this project a star, please consider also checking out jtessler´s repo who made this possible creating this cli-tool.

This repo contains the containerized version of jtessler´s BambuCam command-line tool which allowes setting up a webserver which streams the cam of Bambulab-Printers.

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
    - DEVICE_IP: "192.168.168.172" # your printers ip
    - DEVICE_ID="1A2B3C12345678" # your printer serial number (tho check if its the right device)
    - ACCESS_CODE="12345678" # your printer access code
    - PORT=8082 # the port number where the video stream should be serviced
    - KEEP_ALIVE=true # true = run infinitly retrying if printer is offline, false = shutdown if printer offline
    - PING_INTERVAL=10 # the interval (seconds) the printer is checked until available

    restart: no
````

## Building the Image
If you want to build the docker image by yourself, follow those steps:
- clone this repo
- create a folder "plugins"
- put your "libBambuStudio.so" in there which is made available by Bambulab Software
- follow the building steps of jtessler´s repo (building the bambucam executeable in the repo root directory)
- build using the Dockerfile
