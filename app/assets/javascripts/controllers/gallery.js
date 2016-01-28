var app = angular.module('dashboard')

  app.controller("galleryController",["$scope","$routeParams","$location","galleryFactory", "showFactory",
    function($scope, $routeParams,$location, galleryFactory, showFactory) {
      $scope.gallery = galleryFactory.get({ "id": $routeParams.gallery_id})
      $(".overflow-block").css("height", $( window ).height() - 50)
      $scope.$watch('gallery', function(){
        window_resize()
      })
    }
  ])