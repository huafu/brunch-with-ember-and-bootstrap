# brunch-with-ember-and-bootstrap
A new and up-to-date [Brunch](http://brunch.io) skeleton for developing [Ember](http://emberjs.com) applications based on the official Ember [Starter Kit](https://github.com/emberjs/starter-kit/archive/master.zip).

It's based the skeleton fron Giovanni Collazo [brunch-with-ember-reloaded](https://github.com/gcollazo/brunch-with-ember-reloaded).


## Demo
Giovanni Collazo built a demo app using his skeleton (on which I've based mine), based on the
[Building an App with Ember.js](http://www.youtube.com/watch?v=Ga99hMi7wfY) video by
[Tom Dale](http://twitter.com/tomdale).

**Demo**: [ember-bloggr](http://dev.gcollazo.com/ember-bloggr)
**Source**: [https://github.com/gcollazo/ember-bloggr](https://github.com/gcollazo/ember-bloggr)

I'll soon publish a little demo tool using my (this) skeleton.


## Versions
- [Ember v1.0.0-rc.7](http://emberjs.com)
- [Handlebars 1.0.0](http://handlebarsjs.com)
- [jQuery v1.9.1](http://jquery.com)
- [HTML5 Boilerplate v4.2.0](http://html5boilerplate.com)
- [Twitter Bootstrap v2.3.2](https://github.com/twitter/bootstrap)

## Features
- **CoffeeScript** - a little language that compiles into JavaScript.
- **Stylus** - Expressive, dynamic, robust CSS pre-processor.
- **auto-reload-brunch** - Adds automatic browser reloading support to brunch.
- **uglify-js-brunch** - Adds UglifyJS support to brunch.


## Getting started
Create a new project using this skeleton:
```
brunch new gh:huafu/brunch-with-ember-and-bootstrap <appname>
cd <appname>
brunch watch -s
```
Open [http://localhost:3333](http://localhost:3333) on your browser.


### Ember Data
The Ember Data is already included in the project from [builds.emberjs.com](http://builds.emberjs.com).

You can easily disable it by prepending `vendor/scripts/ember-data-latest.js` with a `_`, removing it from the `config.coffee` file and commenting out `require 'store'` from `app/initialize.coffee`.


### Ember Bootstrap
[Ember Bootstrap](https://github.com/emberjs-addons/ember-bootstrap) is some helpers to use Twitter Bootstrap elements easy with Ember. It comes with Views accessible as Handlebars template helpers too.


### Generators
This skeleton makes use of [scaffolt](https://github.com/paulmillr/scaffolt#readme) generators to help you create common files quicker. To use first install scaffolt globally with `npm install -g scaffolt`. Then you can use the following command to generate files.

```
scaffolt model <name>              → app/models/Name.coffee
    => App.Name = DS.Model.extend

scaffolt view <name>               → app/views/Name.coffee
    => App.NameView = Ember.View.extend

scaffolt controller <name>         → app/controllers/Name.coffee
    => App.NameController = Ember.Controller.extend

scaffolt objectcontroller <name>   → app/controllers/Name.coffee
    => App.NameController = Ember.ObjectController.extend

scaffolt arraycontroller <name>    → app/controllers/Names.coffee
    => App.NamesController = Ember.ArrayController.extend

scaffolt route <name>              → app/routes/Name.coffee
    => App.NameRoute = Ember.Route.extend

scaffolt template <name>           → app/templates/name.hbs

scaffolt component <comp-name>     → app/templates/components/comp-name.hbs
                                   → app/views/components/CompName.coffee
    => App.CompNameComponent = Ember.Component.extend
```
There's a few more commands you can use with scaffolt and also instruction on how to create your own generators, so make sure you check out the [docs](https://github.com/paulmillr/scaffolt#readme).


### Testing
You can write your tests in the `test` folder, just make sure they are named `*_test.coffee`. You can customize the test to user PhantomJS, Chrome, Firefox, Safari or Opera on the `test/karma.conf.js` file. There's a lot of other settings there as well. Run tests with:

```
cake test
```


## Updating
You have some `cake` tasks to help you update *ember*, *ember-data* and *ember-bootstrap*. More to come in the future.
```bash
# update Ember:
cake update-ember
# update Ember Data:
cake update-ember-data
# update Ember Bootstrap:
cake update-ember-bootstrap
```

## License
All of brunch-with-ember-reloaded is licensed under the MIT license.

Copyright (c) 2013 Huafu Gandon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
