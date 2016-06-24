<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container" ng-controller="UserOrderController">
    <div class="row">
        <div class="col-sm-6 col-lg-6 col-sm-offset-3 col-lg-offset-3">
            <form>
                <input type="text" ng-model="orderNumber"/>
                <button class="btn btn-success" ng-model="orderNumber" ng-click="getCustomerOrder(orderNumber)">Sprawdź swoje zamówienie</button>
            </form>
        </div>
    </div>
</div>

<div class="panel panel-success">
    <div class="panel-heading">
        <p class="text-center">Zamowienie nr {{customerOrder.orderNumber}}</p>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4 col-sm-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <p class="text-center">Dane do wysyłki:</p>
                    </div>
                    <div class="panel panel-body">
                        <dl class="dl-horizontal">
                            <dt>Ulica</dt>
                            <dd>{{ customerOrder.customerInfo.adress.streetName }}</dd>
                            <dt>Miasto</dt>
                            <dd>{{ customerOrder.customerInfo.adress.city }}</dd>
                            <dt>Kod pocztowy</dt>
                            <dd>{{ customerOrder.customerInfo.adress.zipCode }}</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <p class="text-center">Dane klienta:</p>
                    </div>
                    <div class="panel panel-body">
                        <dl class="dl-horizontal">
                            <dt>Imię</dt>
                            <dd>{{ customerOrder.customerInfo.name }}</dd>
                            <dt>Nazwisko</dt>
                            <dd>{{ customerOrder.customerInfo.surname }}</dd>
                            <dt>Telefon</dt>
                            <dd>{{ customerOrder.customerInfo.phoneNumber }}</dd>
                            <dt>Email</dt>
                            <dd>{{ customerOrder.customerInfo.email }}</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <p class="text-center">Dane zamowienia</p>
                    </div>
                    <div class="panel panel-body">
                        <dl class="dl-horizontal">
                            <dt>Metoda wysyłki</dt>
                            <dd>{{customerOrder.shippingMethod}}</dd>
                            <dt>Stan wysyłki</dt>
                            <dd>{{customerOrder.shipped}}</dd>
                            <dt>Tracking</dt>
                            <dd>{{ customerOrder.trackingNumber }}</dd>
                            <dt>Wpłata</dt>
                            <dd>
                                {{customerOrder.paid}}
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12">
                <div class="panel panel-success">
                    <div class="panel panel-heading">Produkty</div>
                    <div class="panel panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Nazwa produktu:</th>
                                <th>Ilość produktu:</th>
                                <th>Cena jednostkowa:</th>
                                <th>Cena produktów</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="item in customerOrder.cart.cartItems">
                                <td>{{item.book.title}}</td>
                                <td>{{item.quantity}}</td>
                                <td>{{item.product.unitPrice}}</td>
                                <td>{{item.totalPrice}}</td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="text-right">Cena całkowita produktów
                            {{customerOrder.cart.totalCost}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
