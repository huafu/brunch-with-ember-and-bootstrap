sysPath = require 'path'
fs      = require 'fs'

#TODO: find a method to do this in a cleaner way
gitHead = -> fs.readFileSync(sysPath.join('.git', 'HEAD')).toString().replace(/^\s*ref\:\s*/g, '').replace(/\s*$/g, '')
gitBranch = ->
  head = gitHead().split /\//g
  branch = head.slice()
  branch.shift()
  branch.shift()
  branch.join '/'
gitCommitHash = -> fs.readFileSync(sysPath.join('.git', gitHead().split(/\//g).join(sysPath.sep))).toString().replace(/^\s*/g, '').replace(/\s*$/g, '')

exports.config =
  # See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/

      order:
        before: [
          'vendor/scripts/console-polyfill.js'
          'vendor/scripts/jquery-1.9.1.js'
          'vendor/scripts/handlebars-1.0.0.js'
          'vendor/scripts/ember-latest.js'
          'vendor/scripts/ember-data-latest.js'
          'vendor/scripts/bootstrap/bootstrap-tooltip.js'
          ]
        after: [
          'vendor/scripts/ember-bootstrap-latest.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
      order:
        before: ['vendor/styles/normalize.css']

    templates:
      # for smaller builds, disable the pre-compilation of tempaltes
      precompile: true
      root: 'templates'
      joinTo: 'javascripts/app.js' : /^app/

      modules:
        addSourceURLs: true

  # CoffeeScript easy-debugging | don't forget to remove for production release
  sourceMaps: true

  # keyword-brunch plugin
  keyword:
    map:
      git_commit_hash: gitCommitHash
      git_short_commit_hash: -> gitCommitHash().substr 0, 7
      git_branch: gitBranch

  # allow _ prefixed templates so partials work
  conventions:
    ignored: (path) ->
      startsWith = (string, substring) ->
        string.indexOf(substring, 0) is 0
      sep = sysPath.sep
      if path.indexOf("app#{sep}templates#{sep}") is 0
        false
      else
        startsWith sysPath.basename(path), '_'
