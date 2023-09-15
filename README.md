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
docker build -t devcontainer-test .
```

This command is going to build the image according to Dockerfile. At the and of it, you must have a "devcontainer-test" image on your docker. You can ensure this by checking with this command:

```bash
docker images
```

### Running docker image

```bash
docker run -p 5000:5000 -p 8080:8080 devcontainer-test
```

This command must run the image on a container. Once its done, you must see that **supervisord** started two processes, which are the ones we wanted to run on the first place.

By this time, if you close the terminal, the container will close as well. You can run the container without the terminal with the *-d* run flag.