var app;
import$(window, require('prelude-ls'));
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
  Object.defineProperty(x$, 'frontkansai_timeline', {
    get: function(){
      var ref$;
      return (ref$ = this._frontkansai_timeline) != null
        ? ref$
        : this._frontkansai_timeline = void 8;
    },
    set: function(_frontkansai_timeline){
      this._frontkansai_timeline = _frontkansai_timeline;
    },
    configurable: true,
    enumerable: true
  });
  x$.initialize = function(){
    this.create_fetch_methods();
    return this.fetch_home_timeline();
  };
  x$.create_fetch_methods = function(){
    var this$ = this;
    return map(function(type){
      return this$["fetch_" + type + "_timeline"] = function(refresh, $done){
        var this$ = this;
        refresh == null && (refresh = false);
        return $http.get("/twitter/" + type + (refresh ? "?refresh=true" : "")).success(function(it){
          this$[type + "_timeline"] = it;
          return typeof $done == 'function' ? $done() : void 8;
        });
      };
    })(
    ['home', 'user', 'frontkansai']);
  };
  x$.refresh = function(type, $done){
    return this["fetch_" + type + "_timeline"](true, $done);
  };
  x$.initialize();
  return x$;
}));
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}