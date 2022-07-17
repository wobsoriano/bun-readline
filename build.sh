#/bin/sh

CGO_ENABLED=1 GOOS=darwin GOARCH=arm64 CC=~/go/bin/zigcc CXX=~/go/bin/zigcpp go build --buildmode c-shared -o ./release/readline.dylib -ldflags "-s -w" readline.go
CGO_ENABLED=1 GOOS=windows GOARCH=amd64 CC=~/go/bin/zigcc CXX=~/go/bin/zigcpp go build --buildmode c-shared -o ./release/readline.dll -ldflags "-s -w -H=windowsgui" readline.go
CGO_ENABLED=1 GOOS=linux GOARCH=amd64 CC=~/go/bin/zigcc CXX=~/go/bin/zigcpp go build --buildmode c-shared -o ./release/readline.so -ldflags "-s -w" readline.go
