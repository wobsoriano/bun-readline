import { dlopen, FFIType, ptr as toPtr, CString, suffix } from 'bun:ffi'

const utf8e = new TextEncoder()

function encode<T>(data: T): Uint8Array {
  return utf8e.encode(data + "\0")
}

export type Signal = {
  signal: 'CtrlC' | 'CtrlD' | null
  value: string | null
}

const location = new URL(`../release/readline-${process.platform}-${process.arch}.${suffix}`, import.meta.url).pathname
const { symbols } = dlopen(location, {
  Readline: {
    args: [FFIType.ptr],
    returns: FFIType.ptr
  },
  FreeString: {
    args: [FFIType.ptr],
    returns: FFIType.void
  }
})

export function freeString(ptr: number) {
  symbols.FreeString(ptr)
}

export function readline(prompt = ''): Signal {
  const data = toPtr(encode(prompt))
  const ptr = symbols.Readline(data)
  const str = new CString(ptr)
  freeString(str.ptr)
  const json = JSON.parse(str.toString())
  if (json.error === "Interrupt") {
    return {
      signal: 'CtrlC',
      value: null,
    }
  }

  if (json.error === "EOF") {
    return {
      signal: 'CtrlD',
      value: null,
    }
  }

  return {
    signal: null,
    value: json.line
  }
}
