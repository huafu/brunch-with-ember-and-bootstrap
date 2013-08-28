http = require 'http'
fs = require 'fs'
child_process = require 'child_process'


# Test runner
task 'test', ->
  server = (require 'karma').server
  server.start configFile: './test/karma.conf.js', (exitCode) ->
    console.log "Karma has exited with #{exitCode}"
    process.exit exitCode

# Gets latest Ember Data
task 'update-ember-data', 'download latest build of Ember Data', (options) ->
  file = fs.createWriteStream 'vendor/scripts/ember-data-latest.js'
  request = http.get 'http://builds.emberjs.com.s3.amazonaws.com/ember-data-latest.js', (response) ->
    response.pipe file

# Get latest Ember
task 'update-ember', 'download the latest Ember', (options) ->
  file = fs.createWriteStream 'vendor/scripts/ember-latest.js'
  request = http.get 'http://builds.emberjs.com.s3.amazonaws.com/ember-latest.js', (response) ->
    response.pipe file

# Get the latest Ember Bootstrap
task 'update-ember-bootstrap', 'download and build the latest Ember Bootstrap', (options) ->
  fs.mkdir 'tmp', (err) ->
    throw err if err
    cmd = '''
      git clone https://github.com/emberjs-addons/ember-bootstrap.git &&
      cd ember-bootstrap &&
      bundle install &&
      rake &&
      cp dist/ember-bootstrap.js ../../vendor/scripts/ember-bootstrap-latest.js
      '''
    child_process.exec cmd, cwd: fs.realpathSync('tmp'), (err, stdout, stderr) ->
      throw err if err
      child_process.exec 'rm -rf tmp'
