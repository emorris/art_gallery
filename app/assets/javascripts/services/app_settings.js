var app = angular.module('dashboard')
app.factory('appSettingsFactory',  ['$http','$resource', function($http, $resource){
  var AppSettings = $resource('/app_settings')
  return AppSettings
}]);