<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container" ng-controller="BookDetailsController">
    {{product.title}}
    <%--<div class="row" >--%>
        <%--<div class="col-sm-12 col-md-12">--%>
            <%--<div class="col-sm-7 col-md-7">--%>
                <%--<div class="thumbnail">--%>
                    <%--<img--%>
                            <%--src="<c:url value="/resources/images/products/{{product.title}}.jpg"/>"--%>
                            <%--alt="{{product.name}}" class="fullImg">--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-sm-5 col-md-5">--%>
                <%--<div class="container">--%>
                    <%--<h3>{{product.title}}</h3>--%>
                    <%--<dl class="dl-horizontal">--%>
                        <%--<dt>Autor:</dt>--%>
                        <%--<dd>${product.manufacturer }</dd>--%>

                        <%--<dt>Kategoria:</dt>--%>
                        <%--<dd>${product.category }</dd>--%>

                        <%--<dt>Cena:</dt>--%>
                        <%--<dd>${product.unitPrice }</dd>--%>

                    <%--</dl>--%>

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
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-sm-12 col-lg-12 ">--%>
                <%--<p class="text-center">${product.description }</p>--%>
            <%--</div>--%>
        <%--</div>--%>

    <%--</div>--%>
<%--</div>--%>
</div>