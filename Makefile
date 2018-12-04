VERSION = 2.7.15

.PHONY: help build

help:
	# make build

build:
	docker build -t chenwenquan/python:$(VERSION) .
