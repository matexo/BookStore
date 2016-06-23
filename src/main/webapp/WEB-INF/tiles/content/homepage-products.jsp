<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="text-center"><strong>Nowości</strong></h3>
        </div>

        <div class="row" ng-controller="BooksController">
            <div class="col-xs-3 col-md-3" ng-repeat="book in books | orderBy:'-bookId'">
                <div class="thumbnail">
                    <img class="img-thumbnail" src="<spring:url value="images/products/{{book.title}}.jpg"/>"/>
                    <div class="caption">
                        <div class="container-fluid">
                            <h5><strong>
                                <a href="<spring:url value="products/info/{{book.bookId}}"/>">{{book.title}}</a>
                            </strong></h5>
                            <h6><em>{{book.author}}</em></h6>
                            <h6>Kategoria</h6>
                            <h4 class="text-danger">{{book.unitPrice | currency:"PLN "}}</h4>
                            <button class="btn btn-danger btn-block margin-top-20" disabled="disabled"
                                    ng-show="{{book.quantity}} < 1">
                                Produkt niedostępny
                            </button>
                            <button class="btn btn-success btn-block margin-top-20" ng-show="{{book.quantity}} > 0">Dodaj do koszyka
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
