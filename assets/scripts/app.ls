app = angular.module \myApp, <[onsen]>
app.controller \AppController, <[$scope $http]> ++ ($scope, $http)->
  $scope
    ..<<<
      user_tiletine:~
        -> @_user_timeline ?= void
        (@_user_tileline)->
      home_timeline:~
        -> @_home_timeline ?= void
        (@_home_timeline)->
      initialize: ->
        window.app = this
        @fetch_home_timeline!
        @listen!
      fetch_home_timeline: ->
        $http
          .get \/twitter/home
          .success (@home_timeline)~>
      fetch_user_timeline: ->
        $http
          .get \/twitter/user
          .success (@user_timeline)~>
      refresh: (type)-> @.("fetch_#{type}_timeline")!
      listen: ->
        @$on \postchange, -> console.log it
    ..initialize!

