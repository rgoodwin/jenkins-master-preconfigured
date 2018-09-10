### Jenkins Master Quick Start

Using this container you can quickly launch a working jenkins based build environment.
It contains a pre-configured master with admin login, configured for use with swarm slaves.

### Usage

```bash
docker run -it -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:dev
```

Then go to `http://<host>:8080` and login using

```
user: admin
password: admin
```


To begin running builds you can launch jenkins swarm slaves. [See this slave container](https://hub.docker.com/r/rgoodwin/docker-centos-jenkins-swarm-slave/). 
Or, simply set build executors in jenkins to build directly on the master

### Details

This container does few things to enable auto-launch:

- Pre-configures and admin user
- Installs various useful plugins 
- Disables the standard configuration wizard normally show during a fresh install
- Sets executors to zero; with mind to avoiding builds on the master.
