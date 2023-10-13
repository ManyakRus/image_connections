SERVICENAME=image_connections
SERVICEURL=github.com/ManyakRus/$(SERVICENAME)

FILEMAIN=./internal/main.go
FILEAPP=./bin/$(SERVICENAME)

NEW_REPO=github.com/ManyakRus/image_connections


run:
	clear
	go build -race -o $(FILEAPP) $(FILEMAIN)
	#	cd ./bin && \
	./bin/$(SERVICENAME)
mod:
	clear
	go get -u ./...
	go mod tidy -compat=1.18
	go mod vendor
	go fmt ./...
build:
	clear
	go build -race -o $(FILEAPP) $(FILEMAIN)
	cd ./cmd && \
	./VersionToFile.py
	cp $(FILEAPP) $(GOPATH)/bin

	mkdir -p ./bin/settings
	cp ./settings/connections.txt ./bin/settings/connections.txt
	cp ./settings/connections_add.txt ./bin/settings/connections_add.txt

	mkdir -p $(GOPATH)/bin/settings
	cp ./settings/connections.txt $(GOPATH)/bin/settings/connections.txt
	cp ./settings/connections_add.txt $(GOPATH)/bin/settings/connections_add.txt
lint:
	clear
	go fmt ./...
	golangci-lint run ./internal/...
	golangci-lint run ./pkg/...
	gocyclo -over 10 ./internal
	gocyclo -over 10 ./pkg
	gocritic check ./internal/...
	gocritic check ./pkg/...
	staticcheck ./internal/...
	staticcheck ./pkg/...
run.test:
	clear
	go fmt ./...
	go test -coverprofile cover.out ./internal/v0/app/...
	go tool cover -func=cover.out
newrepo:
	sed -i 's+$(SERVICEURL)+$(NEW_REPO)+g' go.mod
	find -name *.go -not -path "*/vendor/*"|xargs sed -i 's+$(SERVICEURL)+$(NEW_REPO)+g'
graph:
	clear
	image_packages ./ docs/packages.graphml
conn:
	clear
	image_connections ./internal docs/connections.graphml $(SERVICENAME)
