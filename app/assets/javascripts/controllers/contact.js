  var app = angular.module('dashboard')
  app.controller("contactController",["$scope","$routeParams","appSettingsFactory",
    function($scope, $routeParams, appSettingsFactory) {
      $scope.captacha_expired = true;
      
      $scope.$watch('gRecaptchaResponse', function (newValue, oldValue) {
        if(newValue == oldValue ) return
        $scope.captacha_expired = false;
      });

      $scope.expiredCallback = function expiredCallback(){
        $scope.captacha_expired = true;
      };
    }
  ])