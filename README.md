# Rails Front End

A Rails application configured to
act as a lazy assets server for development,
and a compiler to static min files for production,
including templates.

Yes, it's a Rails application that does not run in production but compile to it.

It comes out of the box equipped with SASS, HAML and CoffeeScript.
And it comes equipped with Angular JS.

You can use it strait by forking.

## Why to use it ?

Today applications are made of :
* In one hand of a HTML/CSS/JS/... client, aka assets
* In another hand an api server

So assets have no reason to be dynamics,
neither to be tight to the API.

However we love to use extra tools to deal with
how bad it is to write HTML/CSS/JS.

* During development we want a lazy and automagic compilation of your files.
* In production you want your web assets to compile into static minified files.

Rails comes along with an awesome [asset pipline](http://guides.rubyonrails.org/asset_pipeline.html).
It handles already assets by environment.

**Rake** provides a nice way to compile what rails don't : templates.

## How it works ?

### A single top folder for your sources

Drop your `.sass`, `.coffee` and `.html.haml` into the `src` folder.
Why ?

Because for front end you want to have the following structure :
* contact/form.ctrl.coffee
* contact/form.html.haml
* contact/form.sass

Your `coffee` and `sass` use normally the asset pipeline.
You can use typical helpers in your HAML files such as :
* `render`
* `yield`
* `*_tag`
* ...

The only difference is layout are not usable (at all).
We are doing javascript apps right ?

About routing :
* root, aka [localhost:3000/](localhost:3000/), will serve src/application.html.haml
* [localhost:3000/tpls/*](localhost:3000/tpls/*) will serve src/tpls/*.html.haml

### Dependencies managed by Bower

Manage your web dependencies by editing `Bowerfile`.
Then just `rake bower:install` and your dependencies will magically appear
in `vendor/assets/bower_components`.

`vendor/assets/bower_components` path is already references
for the JS and CSS pipeline.

### A single JS Helpers

If you check `src/template_path.js.erb`, you'll get that I create
a javascript function `getTplPath`.

  getTplPath('demo/index')
  -> "/tpls/demo/index" // from the web
  -> "/src/demo/index" // inside our project

It's a small helper to help referencing template path.

### And some compilation tasks

  #FIXME

## About changes from a base rails app

### Removed frameworks

* active_record

### Removed gems

* sqlite3
* jquery-rails
* turbolinks
* jbuilder
* sdoc

### Removed folders

* app/mailers
* app/models
* app/assets

### Added

Things you may look about

* haml-rails gem
* bower-rails gem
* app/controllers/views_controller.rb
