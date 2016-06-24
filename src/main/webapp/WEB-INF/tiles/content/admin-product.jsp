<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container" ng-controller="AdminProductController">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h4>Lista produktów</h4>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Id książki</th>
                    <th>Tytuł</th>
                    <th>Autor</th>
                    <th>Kategoria</th>
                    <th>Cena produktu</th>
                    <th>Ilość</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tr ng-repeat="book in books">
                    <td><strong>{{book.bookId}}</strong></td>
                    <td>{{book.title}}</td>
                    <td>{{book.author}}</td>
                    <td>{{book.bookCategory[0].bookCategory}}</td>
                    <td>{{book.unitPrice}}</td>
                    <td>{{book.quantity }}</td>
                    <td><a class="btn btn-success"
                           href=<spring:url value="/products/info/{{book.bookId}}"/>>Pokaż
                        więcej</a></td>
                    <td>
                    <td>
                        <button class="btn btn-danger" ng-click="deleteBook(book.bookId)">Usuń</button>
                    </td>

                </tr>
            </table>
        </div>
    </div>
</div>