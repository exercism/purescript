const fs = require('fs')
const os = require('os')
const path = require('path')

const testDir = process.argv[2]

const modules = fs
  .readdirSync(testDir)
  .forEach(f => {
    const moduleFile = path.join(testDir, f)
    const moduleName = f.replace(/.purs$/, '')

    const module = fs.readFileSync(moduleFile, 'utf8')

    const moduleMod = module.replace(
      /module Test\.Main where/,
      'module Test.' + moduleName + ' where')

    fs.writeFileSync(moduleFile, moduleMod)
  })
