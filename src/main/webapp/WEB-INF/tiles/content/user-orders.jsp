<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid margin-top-20" ng-controller="UserOrdersController">
    <div class="container" ng-repeat="customerOrder in orders">
        <div class="panel-heading">
            <h4 class="text-center"><strong>Zamowienie nr {{customerOrder.orderNumber}}</strong></h4>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h5 class="text-center"><strong>Dane do wysyłki:</strong></h5>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-package-info">
                                <tr>
                                    <td class="text-right"><strong>Ulica:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.adress.streetName}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Miasto:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.adress.city}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Kod pocztowy:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.adress.zipCode}}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h5 class="text-center"><strong>Dane klienta:</strong></h5>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-package-info">
                                <tr>
                                    <td class="text-right"><strong>Imię:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.name}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Nazwisko:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.surname}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Telefon:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.phoneNumber}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Email:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.customerInfo.email}}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h5 class="text-center"><strong>Dane zamowienia:</strong></h5>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-package-info">
                                <tr>
                                    <td class="text-right"><strong>Metoda wysyłki:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.shippingMethod}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Stan wysyłki:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.shipped}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Tracking:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.trackingNumber}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><strong>Wpłata:</strong></td>
                                    <td style="min-width: 100px">{{customerOrder.paid}}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h5 class="text-center"><strong>Produkty</strong></h5>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Nazwa produktu:</th>
                                    <th class="text-center">Ilość produktu:</th>
                                    <th class="text-center">Cena jednostkowa:</th>
                                    <th class="text-right">Suma</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="item in customerOrder.cart.cartItems">
                                    <td style="vertical-align: middle">{{item.book.title}}</td>
                                    <td style="vertical-align: middle" class="text-center">{{item.quantity}}</td>
                                    <td style="vertical-align: middle" class="text-center">{{item.product.unitPrice}}
                                    </td>
                                    <td style="vertical-align: middle" class="text-right">{{item.totalPrice}}</td>
                                </tr>
                                </tbody>
                            </table>
                            <p class="text-right text-danger">Koszt całkowity:
                                <strong>{{customerOrder.cart.totalCost | currency:"PLN "}}</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>