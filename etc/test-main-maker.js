const fs = require('fs')
const os = require('os')
const path = require('path')

const testDir = process.argv[2]

const modules = fs
  .readdirSync(testDir)
  .map(f => f.replace(/.purs$/, ''))

const testMainFile = path.join(testDir, 'Main.purs')

const eol = os.EOL

const imports = modules
  .map(m => 'import Test.' + m + ' as Test' + m)
  .join(eol)

const calls = modules
  .map(m => '  Test' + m + '.suites')
  .join(eol)

const testMain = `
module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Main (runTest)

`
+ imports +
`

main :: Effect Unit
main = runTest do
`
+ calls

fs.writeFileSync(testMainFile, testMain)
