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
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

`
+ imports +
`

main :: forall eff
  . Eff ( avar :: AVAR
        , console :: CONSOLE
        , testOutput :: TESTOUTPUT
        | eff                     
        )
        Unit
main = runTest do
`
+ calls

fs.writeFileSync(testMainFile, testMain)
