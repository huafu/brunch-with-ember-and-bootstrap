App = require 'app'

###
# Uncomment this block to enable a store with a REST adapter on your app
# if you're migrating, https://github.com/emberjs/data/blob/master/TRANSITION.md is a good help
App.ApplicationAdapter = DS.RESTAdapter.extend
  host: 'http://www.google.com'
  namespace: 'api/v1'
###

###
# If you need to customize the serializer for any reason, here is where it should go:
App.ApplicationSerializer = DS.RESTSerializer.extend
###
