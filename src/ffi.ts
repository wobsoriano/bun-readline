import { dlopen, FFIType, suffix, CString, ptr } from 'bun:ffi'
import type { Library } from 'bun:ffi'

const utf8e = new TextEncoder()

function encode<T>(data: T): Uint8Array {
  return utf8e.encode(data + "\0")
}

export default class Readline {
  #lib: Library
  constructor() {
    this.#lib = dlopen(`${import.meta.dir}/../release/readline.${suffix}`, {
      Readline: {
        args: [FFIType.ptr],
        returns: FFIType.ptr
      },
      FreeString: {
        args: [FFIType.ptr],
        returns: FFIType.void
      }
    })
  }

  readline(prompt = "") {
    const data = ptr(encode(prompt))
    return this.#lib.symbols.Readline(data)
  }

  free(ptr: number) {
    return this.#lib.symbols.FreeString(ptr)
  }
}

const rl = new Readline()

// const ptr = rl.readline()
// const myString = new CString(ptr);

// console.log(myString)

// rl.free(myString.ptr)

const ptr1 = rl.readline()
const myString = new CString(ptr1);
// if (line.signal === 'CtrlC') {
//   console.log('CtrlC')
//   break
// }
// if (line.signal === 'CtrlD') {
//   console.log('CtrlD')
//   break
// }
// console.log(line.value)
console.log(JSON.parse(myString.toString()))
rl.free(myString.ptr)
