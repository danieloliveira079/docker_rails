NS=mycompany
VERSION ?= local
PORTS= \
	-p 3000:3000
VOLUMES= -v $PWD:/usr/src/app
WORKDIR= -w /usr/src/app
REPO=myrepo.local
NAME=myrails
INSTANCE=default
ENV= \
	-e RAILS_ENV=production

.PHONY: build push shell run start stop rm release up down

up:
	docker-compose up

down:
	docker-compose down
	
build:
	docker build -t $(REPO)/$(NAME):$(VERSION) .

push:
	docker push $(REPO)/$(NAME):$(VERSION)

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(WORKDIR) $(ENV) $(REPO)/$(NAME):$(VERSION) /bin/bash

run:
	docker run -it --rm --name $(NAME)-$(INSTANCE) $(PORTS) $(ENV) $(REPO)/$(NAME):$(VERSION)

start:
	docker run -d --name $(NAME)-$(INSTANCE) $(PORTS) $(ENV) $(REPO)/$(NAME):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

release: build
	make push -e VERSION=$(VERSION)

default: build
