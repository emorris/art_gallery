// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var app = angular.module(
  'dashboard',
  [
    'ngRoute',
    'templates',
    'ngSanitize',
    'ngResource',
    'noCAPTCHA'
  ]
)

app.run(['$route', '$rootScope', '$location', function ($route, $rootScope, $location) {
    var original = $location.path;
    $location.path = function (path, reload) {
        if (reload === false) {
            var lastRoute = $route.current;
            var un = $rootScope.$on('$locationChangeSuccess', function () {
                $route.current = lastRoute;
                un();
            });
        }
        return original.apply($location, [path]);
    };
}])

app.filter('unsafe', function($sce) {
  return function(val) {
      return $sce.trustAsHtml(val);
  };
});

app.filter('isEmpty', function () {
    return function (obj) {
        for (var key in obj) {
            if (obj.hasOwnProperty(key)) {
                return false;
            }
        }
        return true;
    };
});

app.config([
          "$routeProvider",
  function($routeProvider) {
    $routeProvider.when("/", {
      controller: "overviewController",
      templateUrl: "overview.html"
    }).when("/galleries/:gallery_id", {
      controller: "galleryController",
      templateUrl: "gallery.html"
    }).when("/about", {
      controller: "aboutController",
      templateUrl: "about.html"
    }).when("/news", {
      controller: "newsController",
      templateUrl: "news.html"
    }).when("/news/:id", {
      controller: "newsController",
      templateUrl: "news.html"
    }).when("/artists", {
      controller: "artistsController",
      templateUrl: "artists.html"
    }).when("/artists/:id", {
      controller: "artistsController",
      templateUrl: "artists.html"
    }).when("/galleries/:gallery_id/shows/:show_id", {
      controller: "showController",
      templateUrl: "show.html"
    })
  }
]);








