(function () {
    var app = angular.module('bookStore', ['ngStorage']);

    app.controller('SessionController', function ($scope) {
        $scope.loggedIn = localStorage.getItem('loggedIn');
        $scope.login = function () {
            localStorage.setItem('loggedIn', true);
        };

        $scope.logout = function () {
            localStorage.setItem('loggedIn', false);
        };
    });
    
    app.controller('BooksController', function ($scope, $http) {
        $http.get('/api/book/all').success(function (result) {
            $scope.books = result;
            console.log(result);
        });

        $http.get('/api/book/category/all').success(function (result) {
            $scope.categories = result;
            console.log(result);
        });
    });


    app.controller('UserOrderController', function ($scope, $http) {
        $http.get('/api/order').success(function (result) {
            $scope.orders = result;
        });
    });

    app.controller('CartController', function ($scope, $http) {

    })
})();