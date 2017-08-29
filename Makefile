avx-sse:
	docker build --tag opencv:avx-sse .


# default tag
all: avx-sse
	docker tag opencv:avx-sse opencv:latest
