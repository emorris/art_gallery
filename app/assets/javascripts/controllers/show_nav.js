  var app = angular.module('dashboard')
  app.controller("showNavController",["$scope", "$location", "$routeParams", "showFactory",
    function($scope, $location, $routeParams, showFactory) {
      $scope.shows = [];
      showFactory.getAll($routeParams.gallery_id, function(data){
        $scope.shows = data
      });
      $scope.showOnClick = function(show_id){
        $location.path("/galleries/" + $routeParams.gallery_id + "/shows/" + show_id )
      }
    }
  ])