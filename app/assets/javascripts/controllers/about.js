  var app = angular.module('dashboard')
  app.controller("aboutController",["$scope","$routeParams","appSettingsFactory",
    function($scope, $routeParams, appSettingsFactory) {
      $scope.appSettings = appSettingsFactory.get()
    }
  ])