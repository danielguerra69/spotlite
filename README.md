#### Spotlite vnc service for docker

### Image Size

* [![Latest](https://badge.imagelayers.io/danielguerra/spotlite.svg)](https://imagelayers.io/?images=danielguerra/spotlite:latest 'latest') danielguerra/spotlite

### Usage

Start spotlite vnc server

```bash
docker run --name spotlite -d -p 5900:5900 danielguerra/spotlite
```
& check
```bash
docker logs spotlite
```
After this use a vnc client to connect (dockerhost:5900)
Everything should start automaticly.
