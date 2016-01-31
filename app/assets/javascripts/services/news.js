var app = angular.module('dashboard')
app.factory('newsPostFactory',  ['$http','$resource', function($http, $resource){
  var NewsPost = $resource('/news_posts/:id.json')
  NewsPost.getAll =  function(callback){
      return $http.get("/news_posts.json",{cache: true}).success(
      function(data) { 
        console.log(data)
        callback(data);
    }).error(
      function(data, status ,headers, config) {
        alert("There was a problem: " + status);
    });
  }
  return NewsPost
}]);