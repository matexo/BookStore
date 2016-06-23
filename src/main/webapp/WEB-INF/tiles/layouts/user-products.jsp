<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty activationOK}">
    <div class="container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <p class="text-center">${activationOK}</p>
            </div>
        </div>
    </div>
</c:if>
<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <p class="text-center">Nasze produkty ${p.name }</p>
        </div>

        <div class="row" ng-controller="ProductsController">
            <div class="col-sm-4 col-md-4" ng-repeat="book in books">
                <div class="thumbnail">
                    <img src="">
                    <div class="caption">
                        <div class="container">
                            <h3></h3>
                            <p>Autor: {{book.author}}</p>
                            <p>Kategoria:</p>
                            <p>Cena:</p>
                        </div>
                    </div>
                    <button ng-click="products.addToCart()">Dodaj do koszyka</button>
                </div>
            </div>
            <%--<c:forEach items="${list}" var="product">--%>

                <%--<div class="col-sm-4 col-md-4">--%>
                    <%--<div class="thumbnail">--%>

                        <%--<img--%>
                                <%--src="<c:url value="/resources/images/products/${product.productId}.jpg"/>"--%>
                                <%--alt="${product.name}">--%>
                        <%--<div class="caption">--%>
                            <%--<div class="container">--%>
                                <%--<h3>${product.name}</h3>--%>
                                <%--<p>Producent: ${product.manufacturer }</p>--%>
                                <%--<p>Kategoria: ${product.category }</p>--%>
                                <%--<p>Cena: ${product.unitPrice } PLN</p>--%>


                                <%--<c:choose>--%>
                                    <%--<c:when test="${product.quantity < 1 }">--%>
                                        <%--<button class="btn btn-danger"--%>
                                                <%--ng-click="">Produkt niedostępny</button>--%>
                                    <%--</c:when>--%>
                                    <%--<c:when test="${product.quantity >= 1 }">--%>
                                        <%--<button class="btn btn-success"--%>
                                                <%--ng-click="addToCart('${product.productId }')">Dodaj do--%>
                                            <%--koszyka</button>--%>
                                    <%--</c:when>--%>
                                <%--</c:choose>--%>
                                <%--<a--%>
                                        <%--href="<c:url value="/products/showMore/${product.productId}"/>"--%>
                                        <%--class="btn btn-default" role="button">Pokaż więcej</a>--%>
                                <%--</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>




            <%--</c:forEach>--%>
        </div>
    </div>

</div>