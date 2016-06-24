<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container" ng-controller="AdminProductController">
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
                <td>{{book.bookId }}</td>
                <td>{{book.title}}</td>
                <td>{{book.author}}</td>
                <td>{{book.bookCategory.bookCategory}}</td>
                <td>{{book.unitPrice}}</td>
                <td>{{book.quantity }}</td>
                <td><a class="btn btn-success"
                       href=<spring:url value="/products/info/{{book.bookId}}"/>>Pokaż
                    więcej</a></td>
                <td>
                <td><button ng-model="selBook" ng-click="deleteBook(book.bookId)">Usuń</button></td>

            </tr>
    </table>
</div>