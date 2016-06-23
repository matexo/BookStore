<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="text-center">Nowości</h4>
        </div>

        <div class="row" ng-controller="BooksController">
            <div class="col-xs-3 col-md-3" ng-repeat="book in books">
                <div class="thumbnail">
                    <img src="<spring:url value="images/products/{{book.title}}.jpg"/>"/>
                    <div class="caption">
                        <div class="container-fluid">
                            <h3>{{book.title}}</h3>
                            <p>Autor: {{book.author}}</p>
                            <p>Cena: {{book.unitPrice}} PLN</p>
                            <button class="btn btn-danger" disabled="disabled" ng-show="{{book.quantity}} < 1">Produkt
                                niedostępny
                            </button>
                            <button class="btn btn-success" ng-show="{{book.quantity}} > 0">Dodaj do koszyka</button>
                            <a class="btn btn-default" href="<spring:url value="products/info/{{book.bookId}}"/>">Pokaż
                                więcej</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
