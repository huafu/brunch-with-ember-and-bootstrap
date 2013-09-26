http = require 'http'
https = require 'https'
fs = require 'fs'
child_process = require 'child_process'


# Cleanup build directory
task 'clean', 'cleanup build folders and files', (options) ->
  console.log 'Cleaning up build directories...'
  child_process.exec 'rm -rf public'


# Build a production release
task 'build', 'build a production release', (options) ->
  console.log 'Building production ready release...'
  child_process.exec 'rm -rf public public.tgz', (err) ->
    throw err if err
    child_process.exec 'brunch build --production', (err) ->
      throw err if err
      child_process.exec 'tar czf public.tgz public', (err) ->
        console.info 'Production ready build done and packed in public.tgz, check public directory'


# Test runner
task 'test', 'run unit tests', ->
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


# Get latest Ember-Date
task 'update-ember-date', 'download the latest Ember Date', (options) ->
  console.log "Downloading latest sources for Ember-Date..."
  file = fs.createWriteStream 'vendor/scripts/ember-date.js'
  request = https.get "https://raw.github.com/evilmarty/ember-date/master/dist/ember-date.js", (response) ->
    response.pipe file


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
  console.log "Downloading and building latest sources for Ember Bootstrap..."
  fs.mkdir 'tmp', (err) ->
    throw err if err
    cmd = '''
      git clone https://github.com/emberjs-addons/ember-bootstrap.git &&
      cd ember-bootstrap &&
      bundle install &&
      rake &&
      cp dist/ember-bootstrap.js ../../vendor/scripts/ember-bootstrap.js
      '''
    child_process.exec cmd, cwd: fs.realpathSync('tmp'), (err, stdout, stderr) ->
      throw err if err
      child_process.exec 'rm -rf tmp'


# Get the latest Bootstrap (stylus version)
task 'update-bootstrap', 'download the latest Twitter Bootstrap javascript and stylus files', (options) ->
  console.log "Downloading the latest sources for Twitter Bootstrap..."
  fs.mkdir 'tmp', (err) ->
    throw err if err
    cmd = '''
      git clone https://github.com/Acquisio/bootstrap-stylus.git &&
      cd bootstrap-stylus &&
      rm ../../vendor/scripts/bootstrap/*.js ../../vendor/styles/bootstrap/*.styl &&
      cp js/*.js ../../vendor/scripts/bootstrap/ &&
      cp stylus/*.styl ../../vendor/styles/bootstrap/ &&
      cp fonts/* ../../app/assets/fonts/
      '''
    child_process.exec cmd, cwd: fs.realpathSync('tmp'), (err, stdout, stderr) ->
      throw err if err
      child_process.exec 'rm -rf tmp'
