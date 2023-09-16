## Super simple docker container 

1. Open Docker Desktop/install docker on your machine. (Download https://www.docker.com/products/docker-desktop/ if you don’t have it).
2. Git clone this repo
3. In the terminal, run: `docker build -t demo . `
4. After docker in done, run: `docker run -i -v ${PWD}/output:/output/ -t demo`. If you want to run the container in the background, add `-d` to the command. If you want to use gpus, run : `docker run -i --gpus=all --ipc=host -v ${PWD}/output:/output/ -t demo`. Your result would be in the "output" folder.


Optional: to clean dockers, run  `docker image prune -a` or `docker image prune -a --filter "until=24h"` or `docker system prune`
