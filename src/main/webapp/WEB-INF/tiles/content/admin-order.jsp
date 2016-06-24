<%--
  Created by IntelliJ IDEA.
  User: Matexo
  Date: 2016-06-24
  Time: 00:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
        <div class="col-sm-12 col-lg-12" ng-controller="AdminOrderController">
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
                    <td>{{order.date}}</td>
                    <td>{{order.customerInfo.surname}}{{order.customerInfo.name}}</td>
                    <td>{{order.customerInfo.email}}</td>
                    <td>{{order.customerInfo.phoneNumber}}</td>
                    <td>{{order.cart.totalCost}}</td>
                    <td>{{order.shipped}}</td>
                    <td>{{order.paid}}</td>
                    </tr>
            </table>
        </div>
    </div>
</div>