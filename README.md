# Canopsis Docker - Open source hypervisor
![enter image description here](https://github.com/capensis/canopsis/wiki/images/logo_canopsis.png)
## How to try ?

Build and run container with docker-compose >= v1.6.0

* `docker-compose up` #run and pull if image not exist, to build "--build"

Build and run container without docker-compose

* `docker pull adamamaiga/docker-canopsis .` #pull
* `docker run -d --name canopsis -p 5672:5672 -p 8082:8082 -p 15672:15672 adamamaiga/docker-canopsis` #run

* `docker build -t adamamaiga/docker-canopsis .` #build

## What is Canopsis ?

[Canopsis](http://canopsis.org) is an open-source [hypervisor](http://www.capensis.fr/solutions/hypervision/) whose goal is to [aggregate/consolidate](https://github.com/capensis/canopsis/wiki/consolidation) information and events (containing [metrics](https://github.com/capensis/canopsis/wiki/metrics) of different types such as performance, availability, etc.) coming from multiple sources to create a global solution for [monitoring](https://github.com/capensis/canopsis/wiki/Dashboard) and [administrating](https://github.com/capensis/canopsis/wiki/engines) resources.

Built to last on top of [proven Open Source technologies by and for all IT professionals](http://www.capensis.fr/solutions/supervision/). It is an event based architecture and it is modular by design. Plug your infrastructure tools like `Syslog`, `Nagios`, [`Shinken`](https://github.com/naparuba/shinken), `...` to [Canopsis](http://canopsis.org) and you're ready to go.

A [Glossary](https://github.com/capensis/canopsis/wiki/Glossary) page is also given for better descriptions about canopsis concepts.


## How to use ?

To know more about Canopsis, have a look at this [documentation](https://canopsis.readthedocs.io)

## Other links

* [Community](http://www.canopsis.org)
* [Forum (french)](http://forums.monitoring-fr.org/index.php?board=127.0)


## Web Interface
Host: http://localhost:8082/

Accounts:

user: root, password: root

user: canopsis, password: canopsis

## RabbitMQ Interface
Host: http://localhost:15672/

Account:

user: cpsrabbit

password: canopsis

## MongoDB Shell
Databases:

name: admin, user: admin, password: admin

name: canopsis, user: cpsmongo, password: canopsis

## Requirements
[Docker](https://docs.docker.com/engine/installation/) nice to have [+Docker-compose](https://docs.docker.com/compose/overview/)

Disk Space Requirements : ~6Go
