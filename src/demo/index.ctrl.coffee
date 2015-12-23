'use strict'

console.log "Check", getTplPath('demo/index')

# Empty controller
CTRL = ()->
  console.log "I'm a controller"

# Basic routing
ROUTES = ($stateProvider)->
  # "/" serve tpl/demo/index
  $stateProvider.state('app',
    url: '/'
    templateUrl: getTplPath('demo/index')
    controller: 'DemoCtrl'
  )

# Add dependencies
ROUTES.$inject = [
  '$stateProvider'
]

angular
  .module 'app.demo'
  .config ROUTES
  .controller 'DemoCtrl', CTRL
