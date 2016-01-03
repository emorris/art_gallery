  var app = angular.module('dashboard')
  app.controller("navController", [ "$scope","$http","$location","galleryFactory", 
    function($scope, $http, $location, galleryFactory) {
      $scope.galleries =[]
      
      galleryFactory.getAll(function(data){
        $scope.galleries = data
      })

      $scope.onClickGallery = function(gallery_id){
        $location.path("/galleries/" + gallery_id);
      }

      $scope.onClickBottom = function(name){
        $location.path("/"+name);
      }

  }])
