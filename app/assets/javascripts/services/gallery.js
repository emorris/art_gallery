var app = angular.module('dashboard')
app.factory('galleryFactory',  ['$http','$resource', function($http, $resource){
  var Gallery = $resource('/galleries/:id.json')
  Gallery.getAll =  function(callback){
      return $http.get("/galleries.json",{cache: true}).success(
      function(data) { 
        callback(data);
    }).error(
      function(data, status ,headers, config) {
        alert("There was a problem: " + status);
    });
  }
  return Gallery
}]);