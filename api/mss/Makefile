NAME      := let-mss-api
GOVERSION := 1.14.4

FALSE = false
PWD = pwd
RM = rm

ifeq (${OS},Windows_NT)
	FALSE = cmd.exe /C false 2> NUL
	PWD = cmd.exe /C cd
	RM = cmd.exe /C del
endif

.PHONY: all
all: test build

.PHONY: run
run:
	docker-compose up -d sms-mss-db
	docker-compose run --rm wait -timeout 60s -wait tcp://sms-mss-db:3306 \
|| (docker-compose logs sms-mss-db && ${FALSE})
ifeq (${OS},Windows_NT)
	cmd.exe /C " \
	for /f %%V in ('${PWD}') do \
	docker run -it --rm --env-file %%V\.env -p 8082:80 --net sms-mss -v %%V\..:/go/src/github.com/koota110/stock-management-demo/api -w /go/src/github.com/koota110/stock-management-demo/api/mss/api/cmd golang:${GOVERSION} \
		go run main.go \
	"
else
	export GOPATH=$$(go env GOPATH || echo $${HOME}/go) \
 && mkdir -p $${GOPATH}/pkg/mod \
 && docker run -it --rm --env-file $${PWD}/.env -p 8082:80 --net sms-mss --mount type=bind,src=$${GOPATH}/pkg/mod,target=/go/pkg/mod -v $${PWD}/..:/go/src/github.com/koota110/stock-management-demo/api -w /go/src/github.com/koota110/stock-management-demo/api/mss/api/cmd golang:${GOVERSION} \
		go run main.go
endif

.PHONY: test
test:
	cp -p db/migrations/*.up.sql db/init.d/.
	docker-compose up -d let-mss-db
	docker-compose run --rm wait -timeout 60s -wait tcp://let-mss-db:3306 \
 || (docker-compose logs let-mss-db && false)
	export GOPATH=$$(go env GOPATH || echo $${HOME}/go) \
 && mkdir -p $${GOPATH}/pkg/mod \
 && docker run --rm --mount type=bind,src=$${GOPATH}/pkg/mod,target=/go/pkg/mod -v $${PWD}/..:/go/src/github.com/egxp/let-suite/api -w /go/src/github.com/egxp/let-suite/api/mss/api golang:${GOVERSION} /bin/sh -c ' \
		go test -v -coverprofile=cover.out ./... \
	'

.PHONY: coverage
coverage:
	docker run --rm -v $${PWD}/..:/go/src/github.com/egxp/let-suite/api -w /go/src/github.com/egxp/let-suite/api/mss/api golang:${GOVERSION} go tool cover -html cover.out -o cover.html
	xdg-open api/cover.html || open api/cover.html

.PHONY: build
build:
	export GOPATH=$$(go env GOPATH || echo $${HOME}/go) \
 && mkdir -p $${GOPATH}/pkg/mod \
 && docker run --rm --mount type=bind,src=$${GOPATH}/pkg/mod,target=/go/pkg/mod -v $${PWD}/..:/go/src/github.com/egxp/let-suite/api -w /go/src/github.com/egxp/let-suite/api/mss/api/cmd golang:${GOVERSION} go build -o ${NAME}

.PHONY: container
container:
	cd ../ && docker build -t let-mss-api:latest -f mss/Dockerfile .

.PHONY: launch
launch:
	docker-compose up

.PHONY: db
db:
	docker-compose run -T --rm --service-ports sms-mss-db

CLEAN_TARGET = api/cover.out api/cover.html api/cmd/${NAME}
.PHONY: clean
clean:
	docker-compose down -v --rmi local
ifeq (${OS},Windows_NT)
	${RM} ${subst /,\,${CLEAN_TARGET}}.exe
else
	${RM} ${CLEAN_TARGET}
endif

.PHONY: format
format:
	@echo "start format"
	@echo "start format go"
	docker run --rm -v $${PWD}/api:/go/src/github.com/egxp/let-suite/api/mss/api golang:${GOVERSION} /bin/bash -c ' \
		go get golang.org/x/tools/cmd/goimports \
	 && cd /go/src/github.com/egxp/let-suite/api/mss/api \
	 && shopt -s globstar \
	 && goimports -w **/*.go \
	'
	@echo "finish format go"
	./format_json.sh
	@echo "finish format"
