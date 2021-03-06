# Client building environment of Cyber Cangaço
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/cybercangaco/client.environment)

Docker image to run [nuxt.js](nuxtjs.org) projects

> The project must be in the **/usr/local/src** container folder and will be available on port **:3000** of the container

## Tags available

- stable
  - [alpine](https://hub.docker.com/_/alpine/) 3.7
  - [node](https://nodejs.org/) 8.11.1 (carbon)
- latest
  - [alpine](https://hub.docker.com/_/alpine/) 3.7
  - [node](https://nodejs.org/) 8.11.1 (carbon)

## Come on, do your tests

```bash
docker pull cybercangaco/client.environment:stable
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

> You can try building with different versions of software with docker args, for example: NODE_VERISON=10.0.0

```bash
git clone https://github.com/cybercangaco/client.environment.git
cd tap.client.environment
docker build . --tag cybercangaco/client.environment
```

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/usr/share/src -p 3000:3000 cybercangaco/client.environment:stable [command or npm script]

# or docker-compose
docker-compose run nuxt [command or npm script]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  nuxt:
    image: cybercangaco/client.environment:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /usr/share/src
    ports:
      - 3000:3000
      # - 9229:9229 # node debug port
    #command: dev

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm cybercangaco/client.environment sh
# or with docker-compose
docker-compose run nuxt sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
