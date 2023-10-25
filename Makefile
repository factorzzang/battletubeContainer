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
	@echo "git clone onairApi"
	@if [ ! -d fastApiContainer/fastApiOnairTest ]; then \
	cd fastApiContainer && git clone git@github.com:yarang/fastApiOnairTest.git; \
	else echo "fastApiOnairTest already exists";\
	fi
	@echo "init directory complete"

update:
	@echo "Updating Git..."
	cd emsContainer && git pull origin master
	cd redisContainer && git pull origin master
	cd fastApiContainer && cd fastApiOnairTest && git pull origin main
	@echo "Git updated successfully."

build:
	@echo "build docker image"
	cd emsContainer && make build
	cd redisContainer && make build
	cd fastApiContainer && make build

clean:
	@echo "clean container directory & docker images"
	@if [ -d configs ]; then rm -r configs;fi
	@if [ -d logs ]; then	rm -r logs;fi
	@if [ -d emsContainer ]; then	rm -r emsContainer;fi
	@if [ -d redisContainer ]; then rm -r redisContainer;fi
	@if [ -d fastApiContainer/fastApiOnairTest ]; then \
	rm -r fastApiContainer/fastApiOnairTest;\
	fi
	@echo "clean complete"


all: update build

# 기본 타겟 설정 (make 명령어 실행시 build가 실행되도록)
.DEFAULT_GOAL := build
