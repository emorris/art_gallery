var app = angular.module('dashboard')

  app.controller("galleryController",["$scope","$routeParams","galleryFactory", "showFactory",
    function($scope, $routeParams, galleryFactory, showFactory) {
      $scope.shows = []
      $scope.galleryId = $routeParams.id
      
      showFactory.getAll($routeParams.id, function(data){
        $scope.shows = data
      })

      $scope.gallery = galleryFactory.get({ "id": $routeParams.id})

      $scope.showOnClick = function(show_id){
        console.log(show_id +","+$routeParams.id )
      }

    }
  ])