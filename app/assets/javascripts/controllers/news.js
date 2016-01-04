  var app = angular.module('dashboard')
  app.controller("newsController",["$scope","$routeParams", "newsPostFactory",
    function($scope, $routeParams, newsPostFactory) {
      $scope.newsPosts = []
      $scope.newsPosts = newsPostFactory.getAll(function(data){
        console.log(data)
        $scope.newsPosts = data
      })
    }
  ])