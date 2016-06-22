(function () {
    var app = angular.module('bookStore', ['ngStorage']);
    
    app.controller('BookCategoryController', function ($scope, $http) {
        $http.get('/api/book/category/all').success(function (result) {
            $scope.categories = result;
        });
    });

    app.controller('SessionController', function () {
        this.loggedIn = localStorage.getItem('loggedIn');

        this.login = function () {
            localStorage.setItem('loggedIn', true);
        };

        this.logout = function () {
            localStorage.setItem('loggedIn', false);
        };
    });
})();