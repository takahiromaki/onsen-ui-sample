window <<< require \prelude-ls
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
      frontkansai_timeline:~
        -> @_frontkansai_timeline ?= void
        (@_frontkansai_timeline)->
      initialize: ->
        @create_fetch_methods!
        @fetch_home_timeline!
      create_fetch_methods: ->
        <[home user frontkansai]> |> map (type)~>
          @.("fetch_#{type}_timeline") = (refresh ?= no, $done)->
            $http
              .get "/twitter/#{type}#{if refresh then "?refresh=true" else ""}"
              .success ~>
                @.("#{type}_timeline") = it
                $done?!
      refresh: (type, $done)->
        @.("fetch_#{type}_timeline") yes, $done
    ..initialize!

