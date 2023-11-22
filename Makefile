VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

build: format
	go build -v -o DEVOPS_PRACTICE -ldflags "-X="github.com/la-peregrin/DEVOPS_PRACTICE/cmd.appVersion=${VERSION}

clean:
	rm -rf DEVOPS_PRACTICE