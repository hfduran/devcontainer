# DEVCONTAINER TESTING

This is a simple application that runs two applications on container startup.

## Cloning the repo

This is a repo with **submodules**, so make sure to git clone it correctly.

```bash
git clone --recurse-submodules <url>
```

And for pulling the submodules repos:

```bash
git pull --recurse-submodules <url>
```
I personally prefer seting an alias:

```bash
git config --global alias.clone-all 'clone --recurse-submodules'
git config --global alias.pull-all 'pull --recurse-submodules'

```

and everytime you want to clone or pull the submodule:

```bash
git clone-all
git pull-all
```

## Running the Container

For this topic, you must be sure to have docker installed and configured on your computer.

### Building the Image

```bash
docker build -t devcontainer-image .
```

This command is going to build the image according to Dockerfile. At the and of it, you must have a "devcontainer-test" image on your docker. You can ensure this by checking with this command:

```bash
docker images
```

### Running docker image

```bash
docker run -p 5000:5000 -p 8080:8080 --name my-devcontainer devcontainer-image
```

After running the code, if everything went alright, you might notice on your terminal that two process have spawned. These are the two processes that we're gonna develop on our container. At this point, you might close your terminal and the docker container will continue running.

For making the container to run on "background" since the start, you can pass the *-d* run flag.

### Attaching to the container

To interact with the container, you can exec a bash in your terminal

```bash
docker exec -it my-devcontainer /bin/bash
```

Now you have a terminal inside the container and can interact with it.

### Basic usage

Remember we've spawned two process after the container started? This is due to the *start-script* we ran.

Because the docker must be running a service or else it will stop, the start-script is now on a forever awaiting thread, and the applications we've spawned are on other process.

To kill the applications and open them on your own way (if you want to), all you need to do is run the *stop-script.sh*

```bash
./stop-script.sh
```

### Usage with VSCode

To connect VSCode, you need to install the extensions **Dev Containers, Docker and Remote Explorer**

#### Attaching VSCode to running Docker

On command pallete, search for

> Dev Containers: Attach to Running Container

and select your container.

The other thing you may do is oppening the **Remote Explorer Menu** and search your container among the list, and click to connect.