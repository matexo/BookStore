<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="text-center">Koszyk</h4>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th>Nazwa produktu</th>
                    <th class="text-center">Cena za sztukę</th>
                    <th class="text-center">Ilość sztuk</th>
                    <th class="text-right">Suma</th>
                </tr>
                </thead>
                <tr ng-repeat="item in cartItems">
                    <td>
                        <a class="btn btn-default btn-block" href="<spring:url value="/products/info/{{item.book.bookId}}"/>">Podgląd</a>
                    </td>
                    <td>
                        <button class="btn btn-danger btn-block" ng-click="removeFromCart(item.book.bookId)">
                            Usuń
                        </button>
                    </td>
                    <td style="vertical-align: middle">{{item.book.title}}</td>
                    <td style="vertical-align: middle" class="text-center">{{item.book.unitPrice | currency:"PLN "}}</td>
                    <td style="vertical-align: middle" class="text-center">{{item.quantity}}</td>
                    <td style="vertical-align: middle" class="text-success text-right">{{item.totalPrice | currency:"PLN "}}</td>
                </tr>
            </table>
            <p class="text-right text-danger">Koszt całkowity: <strong>{{cartSum | currency:"PLN "}}</strong></p>
        </div>
        <div class="panel-footer">
            <a class="btn btn-success pull-right" href="/order/finalize/order">Zrealizuj zamowienie</a>
            <div style="clear:both"></div>
        </div>
    </div>
</div>
