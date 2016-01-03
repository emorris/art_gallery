  var app = angular.module('dashboard')
  app.controller("artistsController",["$scope","$routeParams", "artistFactory",
    function($scope, $routeParams, artistFactory) {
      $scope.artists = []
      artistFactory.getAll(function(data){
        $scope.artists = data
      })
    }
  ])