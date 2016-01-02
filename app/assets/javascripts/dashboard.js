// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function(){
  var app = angular.module(
    'dashboard',
    [
      'ngRoute',
      'templates',
      'ngSanitize'
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
      })
    }
  ]);

  app.controller("overviewController", [ 
            "$scope","$http","$routeParams",
    function($scope , $http , $routeParams) {
      $scope.galleries =[]
      $http.get("/galleries.json").success(
        function(data) { 
          $scope.galleries = data;
          console.log($scope.galleries)
      }).error(
        function(data, status ,headers, config) {
          alert("There was a problem: " + status);
        });
    }
  ]);
})()
