# Makefile 

# Docker 이미지 이름 및 버전
IMAGE_NAME := fastapi-battletube
IMAGE_VERSION := 1.0

# Docker 빌드 명령어
DOCKER_BUILD := docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

# Docker 이미지 빌드
build:
	$(DOCKER_BUILD)

# 도움말
help:
	@echo "Available targets:"
	@echo "  build   : Build Docker image"
	@echo "  run     : Run Docker container"
	@echo "  help    : Show this help message"
