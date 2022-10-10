<div align="center">
  <img src=".." alt="Custom GitHub Runner"/>
</div>
<h1 align="center">Custom GitHub Runner</h1>

Generally, Github provides free 2000 build minutes in an every month. You can use these build minutes for your personal or any other business purposes. However, sometimes that isn't enough. You might need more build minutes, which is where we come in.

In this project, we build a general purpose GitHub custom runner using Docker. So you can use these docker image to run your wn custom runner in any of your cloud provider or locally without any complexity.

## Steps for building container locally

Before following this, make sure you have the prerequisites installed/fulfilled:

- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/)

Next, clone the repository and follow the steps below.

```shell
git clone https://github.com/hasithaishere/github-runner
```

Then you can go the project root directory and execute build command

```shell
cd github-runner
sh build.sh <Docker Hub User Name> <Docker Hub User Password> <OS Name> <OS Version>
```

>If you only want to run this in locally, so please ignore `Docker Hub User Name` and `Docker Hub User Password` arguments.

>In this version this build script only support ubuntu based docker base images, os `OS Name` variable should be `ubuntu` and `OS Vesrion` need to be  basic ubuntu version ex- `20.04` or `22.04`

This you can run following docker command and see the build images in locally.

```shell
docker images
```
## Pull image form Docker Hub

However if you don't want to build the container locally you can directly pull the image from Docker Hub using following command.

```shell
docker pull hasithaishere/github-runner
```
_**OR**_
```shell
docker pull hasithaishere/github-runner:tag
```

