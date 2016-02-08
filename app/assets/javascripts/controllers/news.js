var app = angular.module('dashboard')
app.controller("newsController",["$scope","$routeParams", "newsPostFactory", "$location",
  function($scope, $routeParams, newsPostFactory, $location) {

    $scope.newsPosts = []
    $scope.path =  $location.path()

    newsPostFactory.getAll(function(data){
      $scope.newsPosts = data
      var years = $scope.newsPosts['years_in_order']
      if (typeof $routeParams.id == "undefined") {
        var id = $scope.newsPosts.links_by_year[years[0]][0].id
        $location.path("/news/"+ id, false);
        $scope.newsPost = newsPostFactory.get({ "id": id})
      }
    })

    if (typeof $routeParams.id != "undefined"){
      $scope.newsPost = newsPostFactory.get({ "id": $routeParams.id})
    }

    $scope.navOnClick = function(obj){
      $scope.newsPost = newsPostFactory.get({ "id": obj.id})
      $location.path("/news/"+ obj.id, false);
      mobileScroll()
    }  
  }
])