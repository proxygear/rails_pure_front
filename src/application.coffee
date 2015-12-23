//= require template_path
//= require vendor
//= require_self
//= require ./demo

DEPS = [
  # From vendors
  'ngResource'
  'ngAnimate'
  'ui.router'

  # From our features
  'app.demo' #see demo folder
]

CONF = ($urlRouterProvider)->
  # Fallback to "/"
  $urlRouterProvider.otherwise '/'

CONF.$inject = [
  '$urlRouterProvider'
]

angular
  .module 'app', DEPS
  .config CONF
