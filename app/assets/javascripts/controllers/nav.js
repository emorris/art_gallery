  var app = angular.module('dashboard')
  app.controller("navController", [ "$scope","$http","$location","galleryFactory", 
    function($scope, $http, $location, galleryFactory) {
      var gallery_url = 
      $scope.galleries =[]

      $scope.bottomLinks = [
        {
          name:"about",
          title: "About/Contact"
        },
        {
          name:"news",
          title: "News/Faire"
        },
        {
          name:"artists",
          title: "Artists/Etc."
        }
      ]
    
      galleryFactory.getAll(function(data){
        $scope.galleries = data
      })

      $scope.onClickGallery = function(gallery_id){
        $location.path( "/galleries/" + gallery_id);
      }

      $scope.isGalleryActive = function(gallery_id){
        var regex = new RegExp("^\/galleries\/" + gallery_id)
        return regex.test($location.path())
      }

      $scope.onClickBottom = function(name){
        $location.path("/"+name);
      }

      $scope.isBottomActive = function(name){
        return ("/" + name) === $location.path()
      }

  }])
