var app = angular.module('dashboard')
app.factory('showFactory',  ['$http','$resource', function($http, $resource){
  var Show = $resource('/galleries/:gallery_id/shows/:show_id.json')
    Show.getAll =  function(gallery_id, callback){
        return $http.get("/galleries/"+gallery_id+"/shows.json",{cache: true}).success(
        function(data) { 
          callback(data);
      }).error(
        function(data, status ,headers, config) {
          alert("There was a problem: " + status);
      });
    }
    return Show
}]);