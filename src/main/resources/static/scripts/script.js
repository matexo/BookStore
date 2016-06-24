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

        $scope.register = function (user) {
            $http.post('api/user/addUser', user).then(function (response) {
                $scope.success = true;
            }, function (response) {
                $scope.error = true;
            });
        }
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

    app.controller('BookDetailsController', function ($scope, $http, $window) {
        var productID = $window.location.pathname.split("/")[3];
        $http.get('/api/book/'+productID).success(function (result) {
             $scope.product = result;
             console.log(result);
         });
    });

    app.controller('CartController', function ($scope, $http) {

        $scope.refreshCart = function(cartId)
        {
            $http.get('/api/cart/' + $scope.cartId).success(function(cartInfo)
                {
                    $scope.cart = cartInfo;
                }
            );
        };
        
        $scope.initCartId = function(cartId)
        {
            $scope.cartId = cartId;
            $scope.refreshCart($scope.cartId);
        };

        $scope.addToCart = function(productId)
        {
            $http
                .post('/api/cart/book/' + productId)
                .success(function(cartInfo)
                    {
                        $scope.refreshCart($http.get('/api/cart/' + $scope.cartId));
                        alert("Przedmiot został dodany do koszyka.");
                    }
                );
        };

        $scope.removeFromCart = function(productId)
        {
            $http
                .delete('/api/cart/' + productId)
                .success(function(){ $scope.refreshCart($scope.cartId);}
                );
        };

    });


    app.controller('AdminOrderController', function ($scope, $http) {
        $http.get('/api/order').success(function (result) {
            $scope.orders = result;
        });
    });

    app.controller('AdminProductController', function ($scope, $http , $window) {

        $http.get('/api/book/all').success(function (result) {
            $scope.books = result;
        });

        $http.get('/api/book/category/all').success(function (result) {
            $scope.categories = result;
        });

        $scope.selectedBook = function (bookId) {
            console.log(bookId);
            console.log($scope.books);
            $scope.book = $scope.books[bookId-1];
        };

        $scope.refresh = function () {
            $http.get('/api/book/all').success(function (result) {
                $scope.books = result;
            });
        };
        
        $scope.deleteBook = function (bookId) {
            console.log(bookId);
            var url = '/api/book/' + bookId;
            console.log(localStorage.getItem('apiKey'));
            var request = {
                method: 'DELETE',
                url: url,
                headers: {
                    'Content-Type': 'application/json' ,
                    'apiKey': localStorage.getItem('apiKey')
                }
            };
            $http(request)
                .success(function (response) {
                $scope.refresh();
            });
        };
        
        $scope.addOrEditProduct = function () {
            $http.post( '/api/book', $scope.book ,
                {headers: {'Content-Type': 'application/json' , 'apiKey': localStorage.getItem('apiKey')}})
                .success(function (response) {
                    $window.location = '/admin/products';
                });
        };
        

        
    });
    
})();