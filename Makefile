.PHONY: init update-git build

init:
	@echo "init directory"
	mkdir configs
	mkdir logs
	@echo "git clone ems, redis, videoapi"
	git clone git@github.com:factorzzang/emsContainer.git
	git clone git@github.com:factorzzang/fastApiVideoContainer.git
	git clone git@github.com:factorzzang/redisContainer.git
	# @echo "onairApi update"
	# cd onairApiContainer && # git clone git@github.com:yarang/fastApiOnairTest.git

update:
	@echo "Updating Git..."
	cd emsContainer && git pull origin master
	cd fastApiVideoContainer && git pull origin master
	cd redisContainer && git pull origin master
	# cd onairApiContainer && git pull origin main
	@echo "Git updated successfully."

build:
	@echo "build docker image"
	cd emsContainer && make build
	cd fastApiVideoContainer && make build
	cd redisContainer && make build

all: update build

# 기본 타겟 설정 (make 명령어 실행시 build가 실행되도록)
.DEFAULT_GOAL := build