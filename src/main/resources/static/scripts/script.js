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

    app.controller('ProductsController', function ($scope,$http) {
        this.books = null;
        $http({method: 'GET',
            url: 'api/book/all' ,
            respondType: 'json'}).then(function (response) {
            $scope.books = response.data;
            
        },function(response){
            alert("Dupa");
        });
        // this.books = [{'nazwa': 'Harry Potter i Kiebasa Prymasa','autor':'J.K.Rollin\'','cena':9.20},
        //     {'nazwa': 'Harry Potter i Podwawelska','autor':'J.K.Rollin\'','kategoria':'Komiedia'}];
        
        this.addToCart = function(){
        }
    });

    app.controller('FeaturedBooksController', function ($scope, $http) {
        $http.get('/api/book/all').success(function (result) {
            $scope.books = result;
        });
    });


    app.controller('UserOrderChechController', function ($scope, $http) {
        $http.get('/api/order').success(function (result) {
            $scope.orders = result;
        });
    });
    
})();