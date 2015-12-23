# Rails Front End

A rails application configured to
act as a lazy sass, haml and coffee assets server for development.
and a compiler to static min files for production.

And it comes equipped with Angular JS.

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

### Manage your dependencies with Bower

Manage your web dependencies by editing `Bowerfile`.
Then just `rake bower:install` and your dependencies will magically appear
in `vendor/assets/bower_components`.

`vendor/assets/bower_components` path is already references
for the JS and CSS pipeline.

### JS Helpers

If you check `src/template_path.js.erb`, you'll get that I create
a javascript function `getTplPath`.

  getTplPath('demo/index')
  -> "/tpls/demo/index" // from the web
  -> "/src/demo/index" // inside our project

It's a small helper to help referencing template path.

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
