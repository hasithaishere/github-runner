<div align="center">
  <img src="https://user-images.githubusercontent.com/4580975/194851999-ca3e6db3-c5fa-4b22-b99f-549f4a9a6135.jpg" alt="GitHub Runner"/>
</div>
<div align="center"><img src="https://github.com/hasithaishere/github-runner/actions/workflows/publish-runner.yml/badge.svg" alt="GitHub Runner"/>
</div>
<h1 align="center">GitHub Runner</h1>

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

## Connect Docker Runner with GitHub

Initially you have to generate custom access token for connect your self-hosted runner to GitHub account.

#### How to generate access token

Please follow these steps to generate custo access token.

- Click on your profile icon and click on the settings in the dropdown menu.

<img src="https://user-images.githubusercontent.com/4580975/194856355-7d4bba7e-86a0-4035-99a6-165dc76367e9.gif" alt="GitHub Runner"/>

<hr>

- Then go to **Developer Settings** and Click on the **Personal Access Token**.

<img src="https://user-images.githubusercontent.com/4580975/194856352-e492981d-1fda-4316-ac90-a19aa3624c3a.gif" alt="GitHub Runner"/>

<hr>

- Click on the **Generate New Token** button.

<img src="https://user-images.githubusercontent.com/4580975/194856349-c9268293-0725-4ee3-905d-b55512e74505.png" alt="GitHub Runner"/>

<hr>

- Then select following permissions from the list and generate the token.

<img src="https://user-images.githubusercontent.com/4580975/194856465-13fa5ad3-c0e0-4b75-983f-107229b989ba.gif" alt="GitHub Runner"/>

<hr>

- Please save your token in **safe place** before close the window. Because this token you can retrieve one time only.
