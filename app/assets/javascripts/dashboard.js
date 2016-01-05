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
    templateUrl: "show_nav.html",
    controller:["$scope", "$location", "$routeParams", "showFactory",
      function($scope, $location, $routeParams, showFactory) {
        $scope.shows = [];
        showFactory.getAll($routeParams.gallery_id, function(data){
          $scope.shows = data
        });
        $scope.showOnClick = function(show_id){
          $location.path("/galleries/" + $routeParams.gallery_id + "/shows/" + show_id )
        }
        
        $scope.isActive = function(show_id){
          return ("/galleries/" + $routeParams.gallery_id + "/shows/" + show_id) === $location.path()
        }
      }
    ]
  };
});

app.directive('pictureViewer', function() {
  return {
    restrict: 'E',
    scope:{
       pictures: '=',
    },
    controller: ['$scope', function($scope){
       $scope.$watch('pictures', function(pictures){
        if (pictures)
          $scope.onClick(pictures[0])
       })
       $scope.onClick = function(picture){
        $scope.picture_main = picture
      }
    }],
    templateUrl: "picture_viewer.html"
  };
});










