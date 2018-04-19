## docker + nginx + gunicorn + django + mysql

demo、scaffold

## Run

create a folder named `mysql` in repo directory

```bash
$ docker-compose up
```

if you can see below, it success

```bash
ht_server | [2018-04-19 03:14:20 +0000] [11] [INFO] Starting gunicorn 19.6.0
ht_server | [2018-04-19 03:14:20 +0000] [11] [INFO] Listening at: http://0.0.0.0:8000 (11)
ht_server | [2018-04-19 03:14:20 +0000] [11] [INFO] Using worker: sync
ht_server | [2018-04-19 03:14:20 +0000] [14] [INFO] Booting worker with pid: 14
```

test [http://localhost:8000/](http://localhost:8000/)

host connect docker database with

`host:127.0.0.1`

`port:8009`

`username:ht`

`password:ht`

`database:ht`

## Notice

1. docker-compose.yml line 38 `django_example.wsgi` need same as `django_example/wsgi.py`

2. `django_example/settings.py` ALLOWED_HOSTS、DATABASES

## Basic commands

1. show running containers

	```bash
    $ docker ps
    ```

2. show all containers

	```bash
    $ docker ps -a
    ```

3. show downloaded docker images

	```bash
    $ docker images
	```

4. Run a command in a new container

	```bash
    $ docker run --rm --name=container_name -it dockerdjango_web sh
	```

    `$ exit`or`ctrl+d`to back to your host terminal

5. Run a command in a running container

	```bash
    $ docker exec -it bf72189a3c51 sh
    ```

    you can find like `bf72189a3c51` in `$ docker ps` as CONTAINER ID

6. create customed image with Dockerfile

	```bash
    $ cd docker-djangno
    $ docker build --rm -t pymysqlclient .  # point means current directory
    $ docker images  # check
    ```

7. 发布镜像到docker hub

	```bash
    $ docker login  # login to your docker hub
    $ docker tag dockerdjango_web dmltzy/dockerdjango
    $ docker images  # check
    $ docker push dmltzy/dockerdjango  # like git push
    ```

## Tips

1. clear all containers

	```bash
    $ docker ps -a | awk 'NR>1 { print $1 }' | xargs docker rm
	```

2. delete specific images

	```bash
    $ docker images | grep 'dockerdjango_web' | awk '{ print $3 }' | xargs docker rmi
    ```

## References

1. [https://github.com/DMLTZY/docker-django](https://github.com/DMLTZY/docker-django)
2. [https://docs.docker.com/compose/django/](https://docs.docker.com/compose/django/)
3. [http://ruddra.com/2016/08/14/docker-django-nginx-postgres/](http://ruddra.com/2016/08/14/docker-django-nginx-postgres/)
