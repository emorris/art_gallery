  var app = angular.module('dashboard')
  app.controller("showController",["$scope","$routeParams", "showsPostFactory",
    function($scope, $routeParams, showsPostFactory) {
      $scope.show = []
      $scope.newsPosts = newsPostFactory.getAll(function(data){
        console.log(data)
        $scope.newsPosts = data
      })
    }
  ])