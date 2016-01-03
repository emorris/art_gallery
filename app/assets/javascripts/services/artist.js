var app = angular.module('dashboard')
app.factory('artistFactory',  ['$http','$resource', function($http, $resource){
  var Artist = $resource('/artists/:id.json')
    Artist.getAll =  function(callback){
        return $http.get("/artists.json",{cache: true}).success(
        function(data) { 
          callback(data);
      }).error(
        function(data, status ,headers, config) {
          alert("There was a problem Artists: " + status);
      });
    }
    return Artist
}]);