#/bin/sh

PLATFORM=

if [[ $PLATFORM == "darwin" ]]
then
  go build --buildmode c-shared -o ./release/readline.dylib -ldflags "-s -w" readline.go
elif [[ $PLATFORM == "linux" ]]
then
  go build --buildmode c-shared -o ./release/readline.so -ldflags "-s -w" readline.go
elif [[ $PLATFORM == "windows" ]]
then
  go build --buildmode c-shared -o ./release/readline.exe -ldflags "-s -w" readline.go
elif [[ $PLATFORM == "" ]]
then
  go build --buildmode c-shared -o ./release/readline.exe -ldflags "-s -w" readline.go
  go build --buildmode c-shared -o ./release/readline.dylib -ldflags "-s -w" readline.go
  go build --buildmode c-shared -o ./release/readline.so -ldflags "-s -w" readline.go
else
  echo Unknown platform
fi
