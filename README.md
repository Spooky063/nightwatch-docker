# Nightwatch testing

This repository contains a simple example of how to use Nightwatch with Docker.

First, you need to install Docker and Docker Compose.

Then, you can run the following commands:

```bash
make up
```

This will start a Docker container with Node.js and Selenium.  
For the rest of the commands, open a new terminal to run the commands inside the container.

## Preparing the environment

You can run the following command to prepare the environment:

```bash
make prepare
```

To install nightwatch, you can run the following command:

```bash
make install
```

## Run tests

You can run the following command to run the tests:  

All the tests are located in the `tests` directory.

```bash
make test
```