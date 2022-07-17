package main

/*
#include <stdlib.h>
#include <string.h>
*/
import "C"

import (
	"encoding/json"
	"fmt"
	"unsafe"

	"github.com/chzyer/readline"
)

func ch(str string) *C.char {
	return C.CString(str)
}

func str(ch *C.char) string {
	return C.GoString(ch)
}

func sf(err error) string {
	if err == nil {
		return ""
	}

	return fmt.Sprintf("%s", err)
}

func ech(err error) *C.char {
	return ch(sf(err))
}

//export FreeString
func FreeString(str *C.char) {
	fmt.Printf("freeing %v... \n", str)
	C.free(unsafe.Pointer(str))
}

type LineAndError struct {
	Line  string `json:"line"`
	Error string `json:"error"`
}

//export Readline
func Readline(prompt *C.char) *C.char {
	line, err := readline.Line(str(prompt))
	result, _ := json.Marshal(&LineAndError{
		Line:  line,
		Error: sf(err),
	})
	return ch(string(result))
}

// Required but ignored
func main() {

}
