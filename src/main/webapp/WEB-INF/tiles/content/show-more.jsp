<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container" ng-controller="BookDetailsController">
    <div class="row" >
        <div class="col-sm-12 col-md-12">
            <div class="col-sm-7 col-md-7">
                <div class="thumbnail">
                    <img
                            src="<spring:url value="/images/products/{{product.title}}.jpg"/>"
                            alt="{{product.title}}" class="fullImg">
                </div>
            </div>
            <div class="col-sm-5 col-md-5">
                <div class="container">
                    <h3>{{product.title}}</h3>
                    <dl class="dl-horizontal">
                        <dt>Autor:</dt>
                        <dd>{{product.author }}</dd>

                        <dt>Kategoria:</dt>
                        <dd>{{product.bookCategory[0].bookCategory }}</dd>

                        <dt>Cena:</dt>
                        <dd>{{product.unitPrice }}</dd>

                    </dl>

                    <button class="btn btn-default btn-block margin-top-20" disabled="disabled"
                            ng-hide="{{product.quantity}} > 0">
                        Produkt niedostępny
                    </button>
                    <button class="btn btn-success btn-block margin-top-20" ng-show="{{product.quantity}} > 0">
                        Dodaj do koszyka
                    </button>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12 ">
                <p class="text-center">{{product.description }}</p>
            </div>
        </div>

    </div>
</div>
</div>