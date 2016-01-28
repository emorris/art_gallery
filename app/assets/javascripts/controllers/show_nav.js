  var app = angular.module('dashboard')
  app.controller("showNavController",["$scope", "$location", "$routeParams", "showFactory","galleryFactory",
    function($scope, $location, $routeParams, showFactory, galleryFactory) {
      $scope.shows = [];
      $scope.gallery =  galleryFactory.get({ "id": $routeParams.gallery_id });
      
      showFactory.getAll($routeParams.gallery_id, function(data){
        $scope.shows = data
      });

      $scope.showOnClick = function(show_id){
        var regex = /\/galleries\/\d+$/
        var url = "/galleries/" + $routeParams.gallery_id + "/shows/" + show_id
        if (regex.test($location.path())) {
          $location.path(url)
        } else {
          $scope.show = showFactory.get({ 
            "gallery_id": $routeParams.gallery_id, 
            "show_id": show_id
          })
          $location.path(url, false)
        }
        
      }

      $scope.galleryOnClick = function(id){
        $location.path("/galleries/" + id)
      }

      $scope.isActive = function(show_id){
        return ("/galleries/" + $routeParams.gallery_id + "/shows/" + show_id) === $location.path()
      }

      $scope.isGalleryActive = function(id){
        return "/galleries/" + id === $location.path()
      }
    }
  ])