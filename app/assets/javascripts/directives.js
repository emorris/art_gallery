var app = angular.module('dashboard')
app.directive('showNav', function() {
  return {
    restrict: 'E',
    templateUrl: "show_nav.html",
    controller:"showNavController"
  };
});

app.directive('pictureViewer', function() {
  return {
    restrict: 'E',
    scope:{
       pictures: '=',
    },
    controller: ['$scope', function($scope){
       $scope.$watch('pictures', function(pictures){
        if (pictures)
          $scope.onClick(pictures[0])
       })
       $scope.onClick = function(picture){
        $scope.picture_main = picture
      }
    }],
    templateUrl: "picture_viewer.html"
  };
});


app.directive('navBottom', function() {
  return {
    restrict: 'E',
    templateUrl: "nav_bottom.html"
  };
});

app.directive('navTop', function() {
  return {
    restrict: 'E',
    templateUrl: "nav_top.html"
  };
});

app.directive('sideNav', function() {
  return {
    restrict: 'E',
    scope:{
      objects: '=',
      onClick: '&',
      textFormat: '&',
      isActive: '&'
    },
    templateUrl: "generic_side_nav.html"
  };
});

app.directive('newsNavElement', function() {
  return {
    restrict: 'E',
    scope:{
      year: '=',
      objects: '=',
      onClick: '&'
    },
    controller: ["$scope","$routeParams", "$location", "newsPostFactory", function($scope, $routeParams, $location, newsPostFactory){
      $scope.show = false;
      $scope.present_year = new Date().getFullYear()
      $scope.isActive = function(id, event){
        return ("/news/"+ id) === $location.path()
      }

      $scope.navHeaderOnClick = function(event){
        $scope.show = !$scope.show
      }

      $scope.linkTextFormat = function(obj){
        return obj.title
      }
      $scope.showHeader = function(year){
        if($scope.present_year == year){
          $scope.show = true
        }
      }
    }],
    templateUrl: "news_nav_element.html"
  };
});

