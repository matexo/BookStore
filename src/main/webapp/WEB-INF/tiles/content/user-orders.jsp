<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Numer zamówienia</th>
                    <th>Data</th>
                    <th>Nazwisko i imię</th>
                    <th>Email</th>
                    <th>Telefon</th>
                    <th>Wartość</th>
                    <th>Płatność</th>
                    <th>Wysyłka</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <c:forEach items="${list}" var="order">
                    <c:if test="${ order.paid and order.shipped }">
                        <tr class="success">
                    </c:if>
                    <c:if test="${ not order.paid and not order.shipped }">
                        <tr class="danger">
                    </c:if>
                    <c:if test="${ order.paid and not order.shipped }">
                        <tr class="warning">
                    </c:if>
                    <c:if test="${ not order.paid and  order.shipped }">
                        <tr class="danger">
                    </c:if>
                    <td>${order.orderNumber}</td>
                    <td>${order.date}</td>
                    <td>${order.customer.surname}${order.customer.name}</td>
                    <td>${order.customer.email}</td>
                    <td>${order.customer.phoneNumber}</td>
                    <td>${order.cart.totalCost}</td>
                    <td><c:if test="${not order.shipped}">Niewysłana</c:if> <c:if
                            test="${order.shipped}">Wysłana</c:if></td>
                    <td><c:if test="${not order.paid}">Niezaksięgowana</c:if> <c:if
                            test="${order.paid}">Zaksięgowana</c:if></td>
                    <td><a class="btn btn-success"
                           href="<c:url value="/checkOrder?orderNumber=${order.orderNumber}"/>">Zobacz
                        całe zamówienie</a></td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <td><a class="btn btn-success"
                               href=<c:url value="/admin/orderForm?orderNumber=${order.orderNumber}"/>>Edytuj
                            zamówienie</a></td>
                    </sec:authorize>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>
</div>