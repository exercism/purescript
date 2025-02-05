# Template Project

Keep these dependencies in sync with the Exercism Purescript test runner.

See: https://github.com/exercism/purescript-test-runner/blob/main/pre-compiled/spago.dhall

Generated as follows:

```
npm install

npx spago --no-comments --tag <package-set-tag>

npx spago install arrays
npx spago install console
npx spago install datetime
npx spago install effect
npx spago install either
npx spago install enums
npx spago install exceptions
npx spago install foldable-traversable
npx spago install integers
npx spago install lists
npx spago install maybe
npx spago install numbers
npx spago install ordered-collections
npx spago install partial
npx spago install prelude
npx spago install psci-support
npx spago install strings
npx spago install test-unit
npx spago install tuples
npx spago install unfoldable
npx spago install unicode
```
