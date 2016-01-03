  var app = angular.module('dashboard')
  app.controller("overviewController", [ 
            "$scope","$http","galleryFactory",
    function($scope, $http, galleryFactory) {
      $scope.galleries =[]
      galleryFactory.getAll(function(data){
        $scope.galleries = data
      })
    }
  ]);