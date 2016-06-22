<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="text-center">Nowości</h4>
        </div>

        <div class="row" ng-controller="FeaturedBooksController">
            <div class="col-xs-12 col-md-4" ng-repeat="book in books | limitTo:6">
                <div class="thumbnail">
                    <img src="<spring:url value="images/products/{{book.bookId}}.jpg"/>"/>
                    <div class="caption">
                        <div class="container">
                            <h3>{{book.title}}</h3>
                            <p>Autor: {{book.author}}</p>
                            <p>Cena: {{book.unitPrice}} PLN</p>
                            <button class="btn btn-danger" disabled="disabled" ng-show="{{book.quantity}} < 1">Produkt niedostępny</button>
                            <button class="btn btn-success" ng-show="{{book.quantity}} > 0">Dodaj do koszyka</button>
                            <a class="btn btn-default" href="<spring:url value="products/showMore/1"/>">Pokaż więcej</a>
                        </div>
                    </div>
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
                                                <%--ng-click="">Produkt niedostępny--%>
                                        <%--</button>--%>
                                    <%--</c:when>--%>
                                    <%--<c:when test="${product.quantity >= 1 }">--%>
                                        <%--<button class="btn btn-success"--%>
                                                <%--ng-click="addToCart('${product.productId }')">Dodaj do--%>
                                            <%--koszyka--%>
                                        <%--</button>--%>
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
