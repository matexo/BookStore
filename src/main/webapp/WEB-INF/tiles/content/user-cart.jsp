<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div class="container" ng-controller="CartController">
    <div class="panel panel-success"
         ng-init="initCartId('${cartId }')">
        <div class="panel-heading">
            <p class="text-center">Koszyk</p>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <table class="table table-hover">
                        <tr>
                            <th
                                    ng-repeat="label in ['Nazwa produktu' , 'Cena za sztukę' , 'Ilość sztuk' , 'Cena' , ' ']">{{label}}</th>
                        </tr>
                        <tr ng-repeat="item in cart.cartItems">

                            <td>{{item.product.title}}</td>
                            <td>{{item.product.unitPrice}}</td>
                            <td>{{item.quantity}}</td>
                            <td>{{item.totalPrice}}</td>
                            <td><button class="btn btn-danger"
                                        ng-click="removeFromCart(item.product.productId)">Usuń
                                produkt</button></td>
                        </tr>
                    </table>
                    <p class="text-right">Koszt całkowity:{{cart.totalCost}}</p>
                </div>

                <div class="col-sm-12 col-lg-12">
                    <div class="panel panel-footer">
                        <div class="row">
                            <div class="col-sm-2 col-lg-2 col-sm-offset-1 col-lg-offset-1">
                                <a href=" <spring:url value="/checkout?cartId=${cartId}"/>"
                                   class="btn btn-success">Zrealizuj zamowienie</a>
                                ${ customerOrder.cart.cartItems }
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
