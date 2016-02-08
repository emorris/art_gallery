  var app = angular.module('dashboard')
  app.controller("artistsController",["$scope","$routeParams","$location", "artistFactory",
    function($scope, $routeParams, $location, artistFactory) {
      $scope.artists = []
      
      artistFactory.getAll(function(data){
        $scope.artists = data
      })
      $scope.$watch('artist', function(){
        window_resize()
      })
      
      if (typeof $routeParams.id == "undefined"){
        $scope.$watch("artists",function(){
          $location.path("/artists/" + $scope.artists[0].id)
        })
      } else {
        $scope.artist = artistFactory.get({ "id": $routeParams.id})
      }

      $scope.navOnClick = function(obj){
        $location.path("/artists/"+obj.id)
        mobileScroll()
      }
      
      $scope.isActive = function(obj){
        return ("/artists/"+ obj.id) === $location.path()
      }

      $scope.linkTextFormat = function(obj){
        return obj.name
      }
    }
  ])