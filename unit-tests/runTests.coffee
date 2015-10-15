Mocha = require('mocha')
fs = require('fs')
path = require('path')

# Instantiate a Mocha instance.
mocha = new Mocha
  ui: 'tdd'
  reporter: 'list'
  compilers: 'coffee:coffee-script/register'
  require: 'coffee-script/register'

#console.log mocha
#console.log Mocha

#mocha.setup 'bdd'

testDir = 'test'
# Add each .js file to the mocha instance
fs.readdirSync(testDir).filter((file) ->
# Only keep the .js files
  file.substr(-7) == '.coffee'
).forEach (file) ->
  mocha.addFile path.join(testDir, file)

# Run the tests.
mocha.run (failures) ->
  process.on 'exit', ->
    process.exit failures

