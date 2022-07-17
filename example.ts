import { readline } from "./src"

while (true) {
  const line = readline("Say anything... ")
  if (line.signal === 'CtrlC') {
    console.log('CtrlC')
    break
  }
  if (line.signal === 'CtrlD') {
    console.log('CtrlD')
    break
  }
  console.log(`Your name is: ${line.value}`)
}

// console.log(getScreenWidth())
