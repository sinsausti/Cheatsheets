### Docker Cheat Sheet

#### Docker Basics

- **Docker version:** 
  ```sh
  docker --version
  ```
  or
  ```sh
  docker version
  ```

- **Docker info:** 
  ```sh
  docker info
  ```

#### Working with Containers

- **List all running containers:** 
  ```sh
  docker ps
  ```

- **List all containers (running and stopped):** 
  ```sh
  docker ps -a
  ```

- **Run a container:**
  ```sh
  docker run <image>
  ```
  Example:
  ```sh
  docker run ubuntu
  ```

- **Run a container with interactive terminal:**
  ```sh
  docker run -it <image>
  ```
  Example:
  ```sh
  docker run -it ubuntu /bin/bash
  ```

- **Run a container in the background:**
  ```sh
  docker run -d <image>
  ```

- **Run a container with port forwarding:**
  ```sh
  docker run -p <host_port>:<container_port> <image>
  ```
  Example:
  ```sh
  docker run -p 8080:80 nginx
  ```

- **Stop a running container:**
  ```sh
  docker stop <container_id>
  ```

- **Start a stopped container:**
  ```sh
  docker start <container_id>
  ```

- **Restart a container:**
  ```sh
  docker restart <container_id>
  ```

- **Remove a container:**
  ```sh
  docker rm <container_id>
  ```

- **Remove all stopped containers:**
  ```sh
  docker container prune
  ```

#### Working with Images

- **List all Docker images:**
  ```sh
  docker images
  ```

- **Pull an image from a registry:**
  ```sh
  docker pull <image>
  ```
  Example:
  ```sh
  docker pull ubuntu
  ```

- **Build an image from a Dockerfile:**
  ```sh
  docker build -t <image_name> <path_to_dockerfile>
  ```
  Example:
  ```sh
  docker build -t myapp .
  ```

- **Tag an image:**
  ```sh
  docker tag <image_id> <repository>:<tag>
  ```
  Example:
  ```sh
  docker tag myapp:latest myapp:v1.0
  ```

- **Push an image to a registry:**
  ```sh
  docker push <repository>:<tag>
  ```

- **Remove an image:**
  ```sh
  docker rmi <image_id>
  ```

- **Remove unused images:**
  ```sh
  docker image prune
  ```

#### Docker Networks

- **List all networks:**
  ```sh
  docker network ls
  ```

- **Create a network:**
  ```sh
  docker network create <network_name>
  ```

- **Connect a container to a network:**
  ```sh
  docker network connect <network_name> <container_id>
  ```

- **Disconnect a container from a network:**
  ```sh
  docker network disconnect <network_name> <container_id>
  ```

- **Remove a network:**
  ```sh
  docker network rm <network_name>
  ```

#### Docker Volumes

- **List all volumes:**
  ```sh
  docker volume ls
  ```

- **Create a volume:**
  ```sh
  docker volume create <volume_name>
  ```

- **Mount a volume to a container:**
  ```sh
  docker run -v <volume_name>:<path_in_container> <image>
  ```
  Example:
  ```sh
  docker run -v myvolume:/data ubuntu
  ```

- **Remove a volume:**
  ```sh
  docker volume rm <volume_name>
  ```

- **Remove all unused volumes:**
  ```sh
  docker volume prune
  ```

#### Docker Compose

- **Start services defined in a docker-compose file:**
  ```sh
  docker-compose up
  ```

- **Start services in the background:**
  ```sh
  docker-compose up -d
  ```

- **Stop services:**
  ```sh
  docker-compose down
  ```

- **View service logs:**
  ```sh
  docker-compose logs
  ```

- **Build or rebuild services:**
  ```sh
  docker-compose build
  ```

- **Run a one-off command:**
  ```sh
  docker-compose run <service> <command>
  ```
  Example:
  ```sh
  docker-compose run web /bin/bash
  ```

#### Docker Container Management

- **View container logs:**
  ```sh
  docker logs <container_id>
  ```

- **Follow container logs:**
  ```sh
  docker logs -f <container_id>
  ```

- **Inspect a container:**
  ```sh
  docker inspect <container_id>
  ```

- **View container stats:**
  ```sh
  docker stats
  ```

- **Execute a command in a running container:**
  ```sh
  docker exec -it <container_id> <command>
  ```
  Example:
  ```sh
  docker exec -it mycontainer /bin/bash
  ```

#### Docker Clean-Up

- **Remove all stopped containers, unused networks, dangling images, and build cache:**
  ```sh
  docker system prune
  ```

- **Remove all unused data (not just dangling):**
  ```sh
  docker system prune -a
  ```

#### Examples

- **MySQL container:**
  ```
    docker run -d --name mysql1 \
    --network home-network \
    --ip 192.168.11.11 \
    -e MYSQL_ROOT_PASSWORD=password \
    -h mysql1 \
    -p 5100:3306 \
    -p 5101:22 \
    -v /Users/username/Docker/mysql1/datadir:/var/lib/mysql \
    -v /Users/username/Docker/mysql1/sshkey:/root/.ssh \
    -v /Users/sinsausti/Docker/mysql1/confd:/etc/mysql/conf.d \
    mysql
  ```

- **WordpressDB container:**
  ```
    docker run -d --name wordpressdb \
    --network home-network \
    --ip 192.168.11.12 \
    -h wordpressdb \
    -p 5200:3306 \
    -p 5201:22 \
    -v /Users/username/Docker/wordpressdb/datadir:/var/lib/mysql \
    -v /Users/username/Docker/wordpressdb/sshkey:/root/.ssh \
    -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_DATABASE=wordpressdb \
    -e MYSQL_USER=worduser \
    -e MYSQL_PASSWORD=wordpass \
    mysql
  ```

- **Wordpress container:**
  ```
    docker run -d --name wordpress \
    --network home-network \
    --ip 192.168.11.13 \
    -h wordpress \
    -p 5300:80 \
    -p 5301:443 \
    -p 5302:22 \
    -v /Users/username/Docker/wordpress/html:/var/www/html \
    -v /Users/username/Docker/wordpress/sshkey:/root/.ssh \
    wordpress
  ```
