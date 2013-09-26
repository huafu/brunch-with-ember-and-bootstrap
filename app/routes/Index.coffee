App = require 'app'


###*
  Route IndexRoute

  @class IndexRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.IndexRoute = Ember.Route.extend
  ###*
    Our model, just some info message as of example

    @inheritDoc
  ###
  model: (params) ->
    infoMessage: """
      Compiled on branch #{App.CONFIG.compilation.gitBranch}
      at #{App.CONFIG.compilation.date.toTimeString()}
      on #{App.CONFIG.compilation.date.toDateString()}
      """
