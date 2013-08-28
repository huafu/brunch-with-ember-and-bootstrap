App = require 'app'

module.exports = App.IndexRoute = Ember.Route.extend
  model: (params) ->
    infoMessage: """
      Compiled on branch #{App.CONFIG.compilation.gitBranch}
      at #{App.CONFIG.compilation.date.toTimeString()}
      on #{App.CONFIG.compilation.date.toDateString()}
      """
