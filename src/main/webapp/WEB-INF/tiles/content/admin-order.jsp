<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="col-md-12" ng-controller="AdminOrderController">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h4>Lista zamówień</h4>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Numer zamówienia</th>
                        <th>Data</th>
                        <th>Nazwisko i imię</th>
                        <th>Email</th>
                        <th>Telefon</th>
                        <th>Wartość</th>
                        <th>Wysyłka</th>
                        <th>Płatność</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tr ng-repeat="order in orders">
                        <td>{{order.orderNumber}}</td>
                        <td>{{parseOrderDate(order.date)}}</td>
                        <td>{{order.customerInfo.surname}} {{order.customerInfo.name}}</td>
                        <td>{{order.customerInfo.email}}</td>
                        <td>{{order.customerInfo.phoneNumber}}</td>
                        <td>{{order.cart.totalCost | currency:"PLN "}}</td>
                        <td>{{order.shipped}}</td>
                        <td>{{order.paid}}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>