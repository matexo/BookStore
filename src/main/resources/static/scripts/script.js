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
        $scope.setFilterCategory = function (category) {
            $scope.filteredCategory = category;
        };

        $scope.filterByCategory = function (categoryArray, category) {
            if (category == null)
                return true;
            var i;
            for (i = 0; i < categoryArray.length; i++) {
                if (category['bookCategory'] == categoryArray[i]['bookCategory'])
                    return true;
            }
            return false;
        };

        $scope.clearCategory = function(){
            $scope.filteredCategory = null;
        };

        $http.get('/api/book/all').success(function (result) {
            $scope.books = result;
            console.log(result);
        });

        $http.get('/api/book/category/all').success(function (result) {
            $scope.categories = result;
        });
    });


    app.controller('UserOrderController', function ($scope, $http) {
        $scope.getOrder = function ($http) {
            $http.get('/api/order').success(function (result) {
                $scope.orderNumber = result;
            });
        }

    });

    app.controller('CartController', function ($scope, $http) {

    });



    app.controller('AdminOrderController', function ($scope, $http) {
        $http.get('/api/order').success(function (result) {
            $scope.orders = result;
        });
    });

    app.controller('AdminProductController', function ($scope, $http) {

        $http.get('/api/book/all').success(function (result) {
            $scope.books = result;
        });

        $http.get('/api/book/category/all').success(function (result) {
            $scope.categories = result;
        });

        $scope.selectedBook = function (bookId) {
            console.log(bookId);
            console.log($scope.books);
            $scope.book = $scope.books[bookId];
        };

        $scope.refresh = function () {
            $http.get('/api/book/all').success(function (result) {
                $scope.books = result;
            });
        };
        
        $scope.deleteBook = function (bookId) {
            var url = 'api/book/' + bookId;
            $http.delete( url,request,
                {headers: {'api-key': localStorage.getItem('api-key')}})
                .success(function (response) {
                $scope.refresh();
            });
        };
        
        $scope.addOrEditProduct = function () {
            
        };
        
        $scope.getProduct = function (bookId) {
            
        };
        
    });
    
})();