# bun-readline

[![npm (tag)](https://img.shields.io/npm/v/bun-readline?style=flat&colorA=000000&colorB=000000)](https://www.npmjs.com/package/bun-readline) ![NPM](https://img.shields.io/npm/l/bun-readline?style=flat&colorA=000000&colorB=000000)

GNU-Readline kind library for the Bun runtime.

## Install

```bash
bun add bun-readline
```

## Usage

```ts
import { readline } from 'bun-readline'

while (true) {
  const line = readline('Say anything... ')
  if (line.signal === 'CtrlC') {
    console.log('CtrlC')
    break
  }
  if (line.signal === 'CtrlD') {
    console.log('CtrlD')
    break
  }
  console.log(line.value)
}
```

## Development

Install dependencies

```bash
bun install
```

Build (requires Go)

```bash
bun run build
```

Run example

```bash
bun ./example.ts
```

## License

MIT
