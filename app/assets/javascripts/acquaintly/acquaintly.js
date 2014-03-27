angular.module('AcquaintlyApp', ['AppController', 'sessionService', 'ngRoute'])
  .config(['$httpProvider', function($httpProvider){
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

  var interceptor = ['$location', '$rootScope', '$q', function($location, $rootScope, $q) {
      function success(response) {
          return response
      };

      function error(response) {
          if (response.status == 401) {
              $rootScope.$broadcast('event:unauthorized');
              $location.path('/users/login');
              return response;
          };
          return $q.reject(response);
      };

      return function(promise) {
          return promise.then(success, error);
      };
  }];
  $httpProvider.responseInterceptors.push(interceptor);
  }])
  .config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: '/templates/login.html',
        controller: 'UsersCtrl'
      }).
      when('/signup', {
        templateUrl: '/templates/signup.html',
        controller: 'UsersCtrl'
      }).
      when('/dashboard', {
        templateUrl: '/templates/dashboard.html',
        controller: 'AppCtrl'
      }).
      when('/categorize', {
        templateUrl: '/templates/categorize.html',
        controller: 'AppCtrl'
      }).
      when('/login', {
        templateUrl: 'templates/login.html',
        controller: 'UsersCtrl'
      })
      // .otherwise({
      //   templateUrl: '/templates/login.html',
      //   controller: 'UsersCtrl'
      // });
  }]);

// login = index
