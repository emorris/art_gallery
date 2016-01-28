  var app = angular.module('dashboard')
  app.controller("showController",["$scope", "$location", "$routeParams", "showFactory",
    function($scope, $location, $routeParams, showFactory) {
      $scope.show = {};
      $scope.show = showFactory.get({ 
        "gallery_id": $routeParams.gallery_id, 
        "show_id": $routeParams.show_id
      })
      $scope.$watch('show', function(){
        window_resize()
      })
    }
  ])