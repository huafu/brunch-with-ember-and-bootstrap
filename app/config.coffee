App = require 'app'

# linkTo and action handlebars helpers are looked up if not quoted
Ember.ENV.HELPER_PARAM_LOOKUPS = yes

# some configuration
module.exports = App.CONFIG =
  # some compilation information (look in /config.coffee for more
  # information about the keyword plugin configuration)
  compilation:
    gitBranch: '{!git_branch!}'
    gitCommitHash: '{!git_commit_hash!}'
    gitShortCommitHash: '{!git_short_commit_hash!}'
    date: new Date('{!date!}')