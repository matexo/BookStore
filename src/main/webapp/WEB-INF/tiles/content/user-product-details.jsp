<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container" ng-controller="BookDetailsController">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-md-5">
                    <div class="thumbnail-detail">
                        <img class="img-thumbnail" src="<spring:url value="/images/products/{{product.title}}.jpg"/>"/>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="container-fluid">
                        <h3><strong>{{product.title}}</strong></h3>
                        <h5>{{product.author}}</h5>
                        <h5 class="text-muted"><span ng-repeat="category in product.bookCategory">{{category.bookCategory}}, </span>
                        </h5>
                        <h5 class="margin-top-20"><em>Opis:</em></h5>
                        <p class="margin-bottom-20">{{product.description }}</p>
                        <div class="col-md-6"><h4 class="text-info pull-left">Na stanie: {{product.quantity}}</h4></div>
                        <div class="col-md-6"><h4 class="text-danger pull-right">{{product.unitPrice | currency:"PLN
                            "}}</h4></div>
                        <div style="clear: both"></div>
                        <button class="btn btn-default btn-block margin-top-20" disabled="disabled"
                                ng-hide="product.quantity > 0">
                            Produkt niedostępny
                        </button>
                        <button class="btn btn-success btn-block margin-top-20" ng-show="product.quantity > 0 && !{{isAdmin}}">
                            Dodaj do koszyka
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>