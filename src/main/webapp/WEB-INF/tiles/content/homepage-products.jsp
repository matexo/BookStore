<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="text-center"><strong>Nowości</strong></h3>
        </div>

        <div class="row" ng-controller="BooksController">
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" ng-repeat="book in books | orderBy:'-bookId' | limitTo: 12">
                <div class="thumbnail">
                    <img class="img-thumbnail" src="<spring:url value="/images/products/{{book.title}}.jpg"/>"/>
                    <div class="caption">
                        <div class="container-fluid">
                            <h5><strong>
                                <a href="<spring:url value="/products/info/{{book.bookId}}"/>">{{book.title}}</a>
                            </strong></h5>
                            <h6>{{book.author}}</h6>
                            <h6 class="text-muted">{{book.bookCategory[0].bookCategory}}</h6>
                            <h4 class="text-danger">{{book.unitPrice | currency:"PLN "}}</h4>
                            <button class="btn btn-default btn-block margin-top-20" disabled="disabled"
                                    ng-hide="book.quantity > 0">
                                Produkt niedostępny
                            </button>
                            <button class="btn btn-success btn-block margin-top-20" ng-show="book.quantity > 0">Dodaj do koszyka
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
