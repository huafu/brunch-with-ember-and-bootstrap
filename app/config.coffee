App = require 'app'

module.exports = App.CONFIG =
  compilation:
    gitBranch: '{!git_branch!}'
    gitCommitHash: '{!git_commit_hash!}'
    gitShortCommitHash: '{!git_short_commit_hash!}'
    date: new Date('{!date!}')