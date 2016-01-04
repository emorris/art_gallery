// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var app = angular.module(
  'dashboard',
  [
    'ngRoute',
    'templates',
    'ngSanitize',
    'ngResource',
  ]
)

app.filter('unsafe', function($sce) {
  return function(val) {
      return $sce.trustAsHtml(val);
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
    }).when("/artists", {
      controller: "artistsController",
      templateUrl: "artists.html"
    }).when("/galleries/:gallery_id/shows/:show_id", {
      controller: "showController",
      templateUrl: "show.html"
    })
  }
]);

app.directive('showNav', function() {
  return {
    restrict: 'E',
    templateUrl: "show_nav.html"
  };
});










