<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container" ng-controller="AdminProductController">
    <div class="row">
        <div class="col-sm-8 col-lg-8 col-sm-offset-2 col-lg-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading text-center"><h4>Formularz produktu</h4></div>
                <div class="panel-body">
                    <form>
                        <div class="form-group">
                            <select ng-model="selBok" ng-click="selectedBook(selBok)">
                                <option ng-repeat="book in books" value="{{book.bookId}}">{{book.title}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="bookId">Id</label>
                            <input path="bookId" id="bookId" class="form-control" ng-model="book.bookId" disabled="disabled"/>
                        </div>
                        <div class="form-group">
                            <label for="title">Tytuł</label>
                            <input path="title" id="title" class="form-control" ng-model="book.title"/>
                        </div>
                        <div class="form-group">
                            <label for="description">Opis</label>
                            <textarea path="description" id="description" class="form-control" rows="5" cols="30"
                                      ng-model="book.description"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="author">Autor</label>
                            <input path="author" id="author" class="form-control" ng-model="book.author"/>
                        </div>
                        <div class="form-group">
                            <label>Kategoria</label>
                            <select ng-model="book.category">
                                <option ng-repeat="category in categories" value="{{category.bookCategoryId}}">
                                    {{category.bookCategory}}
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="unitPrice">Cena</label>
                            <input path="unitPrice" id="unitPrice" class="form-control" ng-model="book.unitPrice"/>
                        </div>

                        <div class="form-group">
                            <label for="quantity">Ilość</label>
                            <input path="quantity" id="quantity" class="form-control" ng-model="book.quantity"/>
                        </div>

                        <div class="form-group">
                            <label for="pages">Strony</label>
                            <input path="pages" id="pages" class="form-control" ng-model="book.pages"/>
                        </div>

                        <div class="form-group">
                            <label for="year">Data wydania</label>
                            <input path="year" id="year" class="form-control" ng-model="book.year"/>
                        </div>

                        <input type="submit" value="Wyslij formularz"
                               class="btn btn-success btn-block"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>