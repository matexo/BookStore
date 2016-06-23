<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="text-center"><strong>Produkty</strong></h3>
        </div>

        <div class="row" ng-controller="BooksController">
            <div class="col-md-3">
                <div class="category-chooser">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Wyszukaj..." ng-model="search">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default" disabled="disabled">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <h5><strong>Kategorie:</strong></h5>
                    <ul class="list-group">
                        <li class="list-group-item" ng-repeat="category in categories">
                            <span>{{category.bookCategory}}</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="col-xs-12 col-sm-2 col-md-4 col-lg-4"
                     ng-repeat="book in books | orderBy:'-bookId' | filter: {'title': search}">
                    <div class="thumbnail">
                        <img class="img-thumbnail" src="<spring:url value="images/products/{{book.title}}.jpg"/>"/>
                        <div class="caption">
                            <div class="container-fluid">
                                <h5><strong>
                                    <a href="<spring:url value="products/info/{{book.bookId}}"/>">{{book.title}}</a>
                                </strong></h5>
                                <h6>{{book.author}}</h6>
                                <h6 class="text-muted">{{book.bookCategory[0].bookCategory}}</h6>
                                <h4 class="text-danger">{{book.unitPrice | currency:"PLN "}}</h4>
                                <button class="btn btn-default btn-block margin-top-20" disabled="disabled"
                                        ng-show="{{book.quantity}} < 1">
                                    Produkt niedostępny
                                </button>
                                <button class="btn btn-success btn-block margin-top-20" ng-show="{{book.quantity}} > 0">
                                    Dodaj do koszyka
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>