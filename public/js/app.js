var app;
app = angular.module('myApp', ['onsen']);
app.controller('AppController', ['$scope', '$http'].concat(function($scope, $http){
  var x$;
  x$ = $scope;
  Object.defineProperty(x$, 'user_tiletine', {
    get: function(){
      var ref$;
      return (ref$ = this._user_timeline) != null
        ? ref$
        : this._user_timeline = void 8;
    },
    set: function(_user_tileline){
      this._user_tileline = _user_tileline;
    },
    configurable: true,
    enumerable: true
  });
  Object.defineProperty(x$, 'home_timeline', {
    get: function(){
      var ref$;
      return (ref$ = this._home_timeline) != null
        ? ref$
        : this._home_timeline = void 8;
    },
    set: function(_home_timeline){
      this._home_timeline = _home_timeline;
    },
    configurable: true,
    enumerable: true
  });
  x$.initialize = function(){
    window.app = this;
    this.fetch_home_timeline();
    return this.listen();
  };
  x$.fetch_home_timeline = function(){
    var this$ = this;
    return $http.get('/twitter/home').success(function(home_timeline){
      this$.home_timeline = home_timeline;
    });
  };
  x$.fetch_user_timeline = function(){
    var this$ = this;
    return $http.get('/twitter/user').success(function(user_timeline){
      this$.user_timeline = user_timeline;
    });
  };
  x$.refresh = function(type){
    return this["fetch_" + type + "_timeline"]();
  };
  x$.listen = function(){
    return this.$on('postchange', function(it){
      return console.log(it);
    });
  };
  x$.initialize();
  return x$;
}));