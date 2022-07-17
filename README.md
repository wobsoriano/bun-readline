# bun-readline

[![npm (tag)](https://img.shields.io/npm/v/bun-readline?style=flat&colorA=000000&colorB=000000)](https://www.npmjs.com/package/bun-readline) ![NPM](https://img.shields.io/npm/l/bun-readline?style=flat&colorA=000000&colorB=000000)

[Reedline](https://github.com/nushell/reedline/) bindings for the Bun runtime. Mac support only (for now).

[Reedline](https://github.com/nushell/reedline/) is a project to create a line editor (like bash's `readline` or zsh's `zle`) that supports many of the modern conveniences of CLIs, including syntax highlighting, completions, multiline support, Unicode support, and more. It is currently primarily developed as the interactive editor for [nushell](https://github.com/nushell/nushell) (starting with v0.60) striving to provide a pleasant interactive experience.

## Install

```bash
bun add bun-readline
```

## Usage

```ts
import Readline from 'bun-readline'

const rl = new Readline()

while (true) {
  const line = await rl.readLine()
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

Build (requires Rust)

```bash
bun run build
```

Run example

```bash
bun ./example.ts
```

Inspired by [reedline-deno](https://github.com/sigmaSd/reedline-deno).

## License

MIT
