.PHONY: init update build all

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
	@echo "git clone ems, redis, videoapi"
	@if [ ! -d emsContainer ]; then	\
	git clone git@github.com:factorzzang/emsContainer.git;\
	else echo "emsContainer already exists";\
	fi
	@if [ ! -d fastApiVideoContainer ]; then \
	git clone git@github.com:factorzzang/fastApiVideoContainer.git;\
	else echo "fastApiVideoContainer already exists";\
	fi
	@if [ ! -d redisContainer ]; then \
	git clone git@github.com:factorzzang/redisContainer.git; \
	else echo "redisContainer already exists";\
	fi
	@echo "git clone onairApi"
	@if [ ! -d onairApiContainer/fastApiOnairTest ]; then \
	cd onairApiContainer && git clone git@github.com:yarang/fastApiOnairTest.git; \
	else echo "fastApiOnairTest already exists";\
	fi

update:
	@echo "Updating Git..."
	cd emsContainer && git pull origin master
	cd fastApiVideoContainer && git pull origin master
	cd redisContainer && git pull origin master
	cd onairApiContainer && cd fastApiOnairTest && git pull origin main
	@echo "Git updated successfully."

build:
	@echo "build docker image"
	cd emsContainer && make build
	cd fastApiVideoContainer && make build
	cd redisContainer && make build

all: update build

# 기본 타겟 설정 (make 명령어 실행시 build가 실행되도록)
.DEFAULT_GOAL := build
