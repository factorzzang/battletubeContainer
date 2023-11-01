.PHONY: init update build clean all

init:
	@echo "init directory"
	@if [ ! -d configs ]; then	\
	mkdir -p configs;\
	else echo "configs already exists";\
	fi
	@if [ ! -d logs ]; then	\
	mkdir -p logs;\
	else echo "logs already exists";\
	fi
	@echo "git clone ems, redis"
	@if [ ! -d emsContainer ]; then	\
	git clone git@github.com:factorzzang/emsContainer.git;\
	else echo "emsContainer already exists";\
	fi
	@if [ ! -d redisContainer ]; then \
	git clone git@github.com:factorzzang/redisContainer.git; \
	else echo "redisContainer already exists";\
	fi
	@echo "git clone fastapi"
	@if [ ! -d apiContainer/fastApiOnairTest ]; then \
	cd apiContainer && git clone git@github.com:yarang/fastApiOnairTest.git; \
	else echo "fastApi already exists";\
	fi
	echo "UID=$(shell id -u)" > .env
	echo "GID=$(shell id -g)" >> .env
	@echo "init directory complete"

init_tunestar:
	@echo "init directory for tunestar-server"
	@if [ ! -d configs ]; then	\
	mkdir -p configs;\
	else echo "configs already exists";\
	fi
	@if [ ! -d logs ]; then	\
	mkdir -p logs;\
	else echo "logs already exists";\
	fi
	@echo "git clone ems, redis"
	@if [ ! -d emsContainer ]; then	\
	git clone git@github.com-iszzang:factorzzang/emsContainer.git;\
	else echo "emsContainer already exists";\
	fi
	@if [ ! -d redisContainer ]; then \
	git clone git@github.com-iszzang:factorzzang/redisContainer.git; \
	else echo "redisContainer already exists";\
	fi
	@echo "git clone fastapi"
	@if [ ! -d apiContainer/fastApiOnairTest ]; then \
	cd apiContainer && git clone git@github.com-iszzang:yarang/fastApiOnairTest.git; \
	else echo "fastApi already exists";\
	fi
	echo "UID=$(shell id -u)" > .env
	echo "GID=$(shell id -g)" >> .env
	@echo "init directory complete"

update:
	@echo "Updating Git..."
	cd emsContainer && git pull origin master
	cd redisContainer && git pull origin master
	cd apiContainer && cd fastApiOnairTest && git pull origin main
	@echo "Git updated successfully."

build:
	@echo "build docker image"
	cd emsContainer && make build
	cd redisContainer && make build
	cd apiContainer && make build

clean:
	@echo "clean container directory & docker images"
	@if [ -d configs ]; then rm -r configs;fi
	@if [ -d logs ]; then	rm -r logs;fi
	@if [ -d emsContainer ]; then	rm -r emsContainer;fi
	@if [ -d redisContainer ]; then rm -r redisContainer;fi
	@if [ -d apiContainer/fastApiOnairTest ]; then \
	rm -r apiContainer/fastApiOnairTest;\
	fi
	@echo "clean complete"


all: update build

# 기본 타겟 설정 (make 명령어 실행시 build가 실행되도록)
.DEFAULT_GOAL := build
