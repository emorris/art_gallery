var app = angular.module('dashboard')

  app.controller("galleryController",["$scope","$routeParams","galleryFactory",
    function($scope, $routeParams, galleryFactory) {
      $scope.gallery = galleryFactory.get({ "id": $routeParams.id})
    }
  ])