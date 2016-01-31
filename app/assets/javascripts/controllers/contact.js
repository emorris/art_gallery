var app = angular.module('dashboard')
app.controller("contactController",["$scope","$routeParams","appSettingsFactory","$http",
  function($scope, $routeParams, appSettingsFactory, $http) {
    $scope.captachaExpired = true;
    $scope.emailSent = false;
    $scope.emailFailed = false;

    $scope.$watch('gRecaptchaResponse', function (newValue, oldValue) {
      if(newValue == oldValue ) return
      $scope.captachaExpired = false;
    });

    $scope.expiredCallback = function expiredCallback(){
      $scope.captachaExpired = true;
    };

    $scope.onSubmit = function(){
      console.log("sendEmail")
      var data = {
          email:    $scope.email,
          subject:  $scope.subject,
          message:  $scope.message
      };
      
      $http.post("/contact_form", data).then(function(data, status) {
        $scope.emailSent = true;
        $scope.sendEmailData = data;
      }, function(data, status) {
        $scope.emailFailed = true;
        $scope.sendEmailData = data;
      });

    }          
  }
])

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);
