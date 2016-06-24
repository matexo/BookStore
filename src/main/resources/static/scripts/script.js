(function () {
    var app = angular.module('bookStore', ['ngStorage']);

    app.controller('SessionController', function ($scope, $window, $http) {
        $scope.loggedIn = localStorage.getItem('loggedIn');
        $scope.isAdmin = localStorage.getItem('isAdmin');
        $scope.apiKey = localStorage.getItem('apiKey');

        $scope.login = function (username, password) {
            var request = {'login': username, 'password': password};
            $http.post('api/login', request).then(function (response) {
                localStorage.setItem('loggedIn', true);
                localStorage.setItem('apiKey', response['data']['apiKey']);
                if (response['data']['role']['role'] == 'ROLE_USER')
                    localStorage.setItem('isAdmin', false);
                else if (response['data']['role']['role'] == 'ROLE_ADMIN')
                    localStorage.setItem('isAdmin', true);
                $window.location = '/';
            }, function (request) {
                $scope.error = true;
            });
        };

        $scope.logout = function () {
            localStorage.setItem('loggedIn', false);
            localStorage.setItem('isAdmin', false);
            localStorage.setItem('apiKey', null);
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

        $scope.clearCategory = function () {
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