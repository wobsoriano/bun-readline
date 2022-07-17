#/bin/sh

CC=~/go/bin/zigcc
CXX=~/go/bin/zigcpp
CGO_ENABLED=1
FILENAME=readline.go

CGO_ENABLED=$CGO_ENABLED GOOS=darwin GOARCH=amd64 CC=$CC CXX=$CXX go build --buildmode c-shared -o ./release/darwin-amd64 -ldflags="-s -w" -gcflags=all="-l -B" $FILENAME
CGO_ENABLED=$CGO_ENABLED GOOS=darwin GOARCH=arm64 CC=$CC CXX=$CXX go build --buildmode c-shared -o ./release/darwin-arm64 -ldflags="-s -w" -gcflags=all="-l -B" $FILENAME
CGO_ENABLED=$CGO_ENABLED GOOS=windows GOARCH=amd64 CC=$CC CXX=$CXX go build --buildmode c-shared -o ./release/win32-amd64 -ldflags="-s -w -H=windowsgui" -gcflags=all="-l -B" $FILENAME
CGO_ENABLED=$CGO_ENABLED GOOS=linux GOARCH=amd64 CC=$CC CXX=$CXX go build --buildmode c-shared -o ./release/linux-amd64 -ldflags="-s -w" -gcflags=all="-l -B" $FILENAME
CGO_ENABLED=$CGO_ENABLED GOOS=linux GOARCH=arm64 CC=$CC CXX=$CXX go build --buildmode c-shared -o ./release/linux-arm64 -ldflags="-s -w" -gcflags=all="-l -B" $FILENAME
