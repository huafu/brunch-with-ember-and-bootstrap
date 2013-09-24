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
  channel = options.channel ? 'beta'
  console.log "Downloading latest debug and production sources for Ember Data from channel #{channel}..."
  baseUrl = "http://builds.emberjs.com/#{channel}"
  devFile = fs.createWriteStream 'vendor/scripts/ember-data.dev.js'
  prodFile = fs.createWriteStream 'vendor/scripts/ember-data.prod.js'
  request = http.get "#{baseUrl}/ember-data.js", (response) ->
    response.pipe devFile
  request = http.get "#{baseUrl}/ember-data.prod.js", (response) ->
    response.pipe prodFile


# Get latest Ember
task 'update-ember', 'download the latest Ember', (options) ->
  channel = options.channel ? 'release'
  console.log "Downloading latest debug and production sources for EmberJS from channel #{channel}..."
  baseUrl = "http://builds.emberjs.com/#{channel}"
  devFile = fs.createWriteStream 'vendor/scripts/ember.dev.js'
  prodFile = fs.createWriteStream 'vendor/scripts/ember.prod.js'
  request = http.get "#{baseUrl}/ember.js", (response) ->
    response.pipe devFile
  request = http.get "#{baseUrl}/ember.prod.js", (response) ->
    response.pipe prodFile


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
