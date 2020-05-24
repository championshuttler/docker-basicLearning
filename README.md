<p align="center">
  <img src="./local_resources/learndocker.png" />
</p>

This is just a simple demonstration to get a basic understanding of how docker works while working step by step. I learnt docker like this and made this repo to solve some problems that I faced during my learning experience so that it might help other beginners. Hope you enjoy learning. If you like it please give it a :star2:. 

**Important :-** By seeing size of readme you might have second thoughts but to be honest if you work from start you won't experience any problem and learn along the way.

## Contents

- [**Requirements**](#requirements)
- [**Docker**](#docker)
  - [What is Docker?](#what-is-Docker)
  - [What is Container?](#what-is-Container)
  - [Why use Container?](#why-use-Container)
- [**Getting Started**](#getting-started)
  - [Setting up your machine](#setting-up-your-machine)
  - [Writing your first Dockerfile](#writing-your-first-dockerfile)
  - [Building your Docker Images](#building-your-docker-images)
 

## Requirements

- You need to have [docker](https://www.docker.com/) installed for your OS

## Docker

#### What is Docker?

Wikipedia defines Docker as
>  is a set of platform as a service (PaaS) products that uses OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating system kernel and therefore use fewer resources than virtual machines.

Damnn, pretty big words!!. In layman language Docker helps you in deploying your applications in a easier way in sandbox (called containers) to run on the host operating system i.e. Mac. Main advantage of docker is that it allows you to package an software with all of its dependencies into a single standardized unit.

#### What is Container?

Container is a solution for how to get software to run without any problems when moved from one computing environment to another. This could be from a staging environment into production or may be from a laptop to different laptop with another operating system.

#### Why use containers?

Containers provides a logical packaging mechanism in which your applications can be abstracted from the environment in which they actually run. The major difference is that every container does not require its own full-fledged OS. In fact, all containers on a single host sharing a single OS. This helps in frees up huge amounts of system resources such as CPU, RAM.

## Getting Started

#### Setting up your machine

Once you are done installing Docker, test your Docker installation by running the following:

```bash
$ docker run hello-world

Hello from Docker.
This message shows that your installation appears to be working correctly.
...
```

#### Writing your first Dockerfile

1. A `Dockerfile` is a text document that contains all the commands you could call on the command line to make an image.Create a file `hello.js` and copy this code into it. Here we basically wrote simple JS code to show Hello World on `localhost:8888`.

```bash
var http = require("http");

http.createServer(function (request, response) {
   response.writeHead(200, {'Content-Type': 'text/plain'});
   response.end('Hello World\n');
}).listen(8888);

// Console will print the message
console.log('Server running at http://127.0.0.1:8888/');
```

2. Create a file named `Dockerfile` and copy this code into it.

```bash
// Extract 
FROM node:8 

LABEL maintainer="championshuttler@gmail.com"

RUN npm i

ADD hello.js /hello.js

EXPOSE 8888

ENTRYPOINT [ "node", "hello.js" ]
```

Even if this is the first Dockerfile you’ve ever seen, I’d say you could have a good guess what’s happening here. The Dockerfile instructions are FROM, ENV, LABEL, RUN , ADD , EXPOSE and ENTRYPOINT; they’re in capitals but that’s a convention, not a requirement. Here’s the breakdown for each instruction:

`FROM` - Every image has to start from another image. In this case, the node image as its starting point.
`RUN` - TODO
`ADD` -  Add files or directories from the local filesystem into the container image. The syntax is [source path] [target path].
`EXPOSE` – TODO
`ENTRYPOINT` - TODO

#### Building your Docker Images

First we will learn about Docker Images.Docker images are like virtual machine templates and are used to start containers. Under the hood they are made up one or more read-only layers, that when stacked together, make up the overall image. Docker takes care of stacking these layers and representing them as a single unified object. **Note:** Docker Images are immutable means Docker images can’t ever change. Once you’ve made one, you can delete it, but you can’t modify it.

<p align="center">
  <img src="./local_resources/dockerimage.jpg" />
</p>

Now we will create a docker image in our local machine. Open your terminal in the current project's folder and run

```bash
docker build -t helloworld .
```

Here you’re telling Docker to build an image called `helloworld` based on the contents of the current directory (note the **dot (.)** at the end of the build command). Docker will look for the Dockerfile in the directory and build the image based on the instructions in the file.

Now check your docker image created by running

```bash
docker image history helloworld                                                                         
IMAGE               CREATED             CREATED BY                                      COMMENT
cb84eb33ca20        58 seconds ago      /bin/sh -c #(nop)  ENTRYPOINT ["node" "hello…  
7d652a817a9f        58 seconds ago      /bin/sh -c #(nop)  EXPOSE 8888              
334575e947c9        59 seconds ago      /bin/sh -c #(nop) ADD file:b9606ef53b832e66e…   
```

