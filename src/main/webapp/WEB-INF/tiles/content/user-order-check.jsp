<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container" ng-controller="UserOrderController">
    <div class="row">
        <div class="col-sm-6 col-lg-6 col-sm-offset-3 col-lg-offset-3">
            <form method="GET" action="">
                <input type="text" id="orderNumber" name="orderNumber" class="formControl" ng-model="orderNumber"/> <input
                    type="submit" value="Sprawdź swoje zamówienie"
                    class="btn btn-success"/>
            </form>
            <c:if test="${empty customerOrder}">
                Takie zamówienie nie istnieje!
            </c:if>
        </div>
    </div>
</div>

<c:if test="${not empty customerOrder}">
    <c:set var="adress" value="${customerOrder.customer.adress}"/>
    <c:set var="customer" value="${customerOrder.customer}"/>
    <div class="panel panel-success">
    <div class="panel-heading">
        <p class="text-center">Zamowienie nr ${ customerOrder.orderNumber }</p>
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
                    <dd>${ adress.streetName }</dd>
                    <dt>Miasto</dt>
                    <dd>${ adress.city }</dd>
                    <dt>Kod pocztowy</dt>
                    <dd>${ adress.zipCode }</dd>

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
                    <dd>${customer.name }</dd>
                    <dt>Nazwisko</dt>
                    <dd>${ customer.surname }</dd>
                    <dt>Telefon</dt>
                    <dd>${ customer.phoneNumber }</dd>
                    <dt>Email</dt>
                    <dd>${ customer.email }</dd>
                </dl>
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4">
        <c:if test="${ customerOrder.paid and customerOrder.shipped }">
        <div class="panel panel-success">
            </c:if>
            <c:if
                    test="${ not customerOrder.paid and not customerOrder.shipped }">
            <div class="panel panel-danger">
                </c:if>
                <c:if
                        test="${ customerOrder.paid and not customerOrder.shipped }">
                <div class="panel panel-warning">
                    </c:if>
                    <c:if
                            test="${ not customerOrder.paid and  customerOrder.shipped }">
                    <div class="panel panel-danger">
                        </c:if>
                        <div class="panel-heading">
                            <p class="text-center">Dane zamowienia</p>
                        </div>
                        <div class="panel panel-body">
                            <dl class="dl-horizontal">
                                <dt>Metoda wysyłki</dt>
                                <dd>${customerOrder.shippingMethod}</dd>
                                <dt>Stan wysyłki</dt>
                                <c:if test="${customerOrder.shipped}">

                                    <dd>Wysłana</dd>
                                    <dt>Tracking</dt>
                                    <dd>${ customerOrder.trackingNumber }</dd>
                                </c:if>
                                <c:if test="${not customerOrder.shipped}">
                                    <dd>Niewysłana</dd>
                                </c:if>
                                <dt>Wpłata</dt>
                                <dd>
                                    <c:if test="${not customerOrder.paid}">Niezaksięgowana</c:if>
                                    <c:if test="${customerOrder.paid}">Zaksięgowana</c:if>
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

                                <c:set var="shippingCost"
                                       value="${customerOrder.cart.totalCost}"/>
                                <tbody>
                                <c:forEach items="${customerOrder.cart.cartItems.values()}"
                                           var="item">
                                    <tr>
                                        <td>${item.product.name}</td>
                                        <td>${item.quantity}</td>
                                        <td>${item.product.unitPrice }</td>
                                        <td>${item.totalPrice}</td>
                                    </tr>
                                    <c:set var="shippingCost"
                                           value="${shippingCost - item.totalPrice}"/>
                                </c:forEach>
                                <tr>
                                    <td>Przesyłka ${customerOrder.shippingMethod}</td>
                                    <td>1</td>
                                    <td><c:out value="${shippingCost}"/></td>
                                    <td><c:out value="${shippingCost}"/></td>
                                </tr>

                                </tbody>
                            </table>
                            <p class="text-right">Cena całkowita produktów z przesyłką:
                                    ${customerOrder.cart.totalCost}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
</div>
</div>
</div>