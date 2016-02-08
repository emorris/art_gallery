  var app = angular.module('dashboard')
  app.controller("showNavController",["$scope", "$location", "$routeParams", "showFactory","galleryFactory",
    function($scope, $location, $routeParams, showFactory, galleryFactory) {
      $scope.shows = [];
      $scope.gallery =  galleryFactory.get({ "id": $routeParams.gallery_id });
      
      showFactory.getAll($routeParams.gallery_id, function(data){
        $scope.shows = data
      });

      $scope.showOnClick = function(obj){
        var show_id = obj.id
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
          mobileScroll()
        }
      }

      $scope.galleryOnClick = function(gallery){
        $location.path("/galleries/" + gallery.id)
      }

      $scope.isActive = function(show){
        if (angular.isUndefined(show) || show == null) return false;
        return ("/galleries/" + $routeParams.gallery_id + "/shows/" + show.id) === $location.path()
      }

      $scope.isGalleryActive = function(gallery){
        return "/galleries/" + gallery.id === $location.path()
      }
    }
  ])