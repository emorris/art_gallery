  var app = angular.module('dashboard')
  app.controller("newsController",["$scope","$routeParams", "newsPostFactory", "$location",
    function($scope, $routeParams, newsPostFactory, $location) {
      $scope.newsPosts = []
      
      $scope.newsPosts = newsPostFactory.getAll(function(data){
        $scope.newsPosts = data
      })

      if (typeof $routeParams.id == "undefined"){
        $scope.$watch("newsPosts",function(){
          console.log($scope.newsPosts)
          $location.path("/news/"+$scope.newsPosts[0].id)
        })
      } else {
        $scope.newsPost = newsPostFactory.get({ "id": $routeParams.id})

      }

      $scope.navOnClick = function(obj){
        $location.path("/news/"+obj.id)
      }
      
      $scope.isActive = function(obj){
        return ("/news/"+ obj.id) === $location.path()
      }

      $scope.linkTextFormat = function(obj){
        return obj.title
      }
    }
  ])