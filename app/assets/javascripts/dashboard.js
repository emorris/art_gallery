// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function(){
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
      }).when("/gallery/:id", {
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
      })
    }
  ]);

 app.factory('galleryFactory',  ['$http','$resource', function($http, $resource){
    var Gallery = $resource('/galleries/:id.json')
      Gallery.getAll =  function(callback){
          return $http.get("/galleries.json",{cache: true}).success(
          function(data) { 
            callback(data);
        }).error(
          function(data, status ,headers, config) {
            alert("There was a problem: " + status);
        });
      }
      return Gallery
  }]);

  app.controller("overviewController", [ 
            "$scope","$http","galleryFactory",
    function($scope, $http, galleryFactory) {
      $scope.galleries =[]
      galleryFactory.getAll(function(data){
        $scope.galleries = data
      })
    }
  ]);

  app.controller("galleryController",["$scope","$routeParams","galleryFactory",
    function($scope, $routeParams, galleryFactory) {
      $scope.gallery = galleryFactory.get({ "id": $routeParams.id})
    }
  ])

  app.controller("artistsController",["$scope","$routeParams",
    function($scope, $routeParams) {
    }
  ])

  app.controller("newsController",["$scope","$routeParams",
    function($scope, $routeParams) {
    }
  ])

  app.controller("aboutController",["$scope","$routeParams",
    function($scope, $routeParams) {
    }
  ])

  app.controller("navController", [ "$scope","$http","$location","galleryFactory", 
    function($scope, $http, $location, galleryFactory) {
      $scope.galleries =[]
      
      galleryFactory.getAll(function(data){
        $scope.galleries = data
      })

      $scope.onClickGallery = function(gallery_id){
        $location.path("/gallery/" + gallery_id);
      }

      $scope.onClickBottom = function(name){
        $location.path("/"+name);
      }

  }])
})()
