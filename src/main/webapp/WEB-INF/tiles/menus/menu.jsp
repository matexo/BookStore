<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Menu</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=<c:url value="/"/>>
                    <span class="glyphicon glyphicon-superscript"></span>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href=<c:url value="/"/>>
                            <span class="glyphicon glyphicon-home"></span> Strona głowna
                        </a>
                    </li>
                    <li>
                        <a href=<c:url value="/products"/>>
                            <span class="glyphicon glyphicon-gift"></span> Produkty
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-list-alt"></span> Kategorie <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" ng-controller="BookCategoryController as categories">
                            <li><a href="<c:url value="/products/Procesor"/>">{{ categories.category.name }}</a></li>
                            <li><a href="<c:url value="/products/Procesor"/>">Procesor</a></li>
                            <li><a href="<c:url value="/products/Karta%20graficzna"/>">Karta Graficzna</a></li>
                            <li><a href="<c:url value="/products/Płyta%20głowna"/>">Płyta Głowna</a></li>
                            <li><a href="<c:url value="/products/Zasilacz"/>">Zasilacz</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="<c:url value="/checkOrder"/>">
                            <span class="glyphicon glyphicon-check"></span> Stan zamowienia
                        </a>
                    </li>
                </ul>
                <hr class="visible-xs divider">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href=<c:url value="/user"/>>
                            <span class="glyphicon glyphicon-plus"></span> Nowe konto
                        </a>
                    </li>
                    <li>
                        <a href=<c:url value="/login"/>>
                            <span class="glyphicon glyphicon-log-in"></span> Zaloguj
                        </a>
                    </li>
                    <li>
                        <a href=<c:url value="/user/menu/"/>>
                            <span class="glyphicon glyphicon-eye-open"></span> Moje zamówienia
                        </a>
                    </li>
                    <li>
                        <a href=<c:url value="/admin/"/>>
                            <span class="glyphicon glyphicon-cog"></span> Panel administratora
                        </a>
                    </li>
                    <c:url var="logoutUrl" value="/logout"/>
                    <li>
                        <a href="<c:url value="/logout"/>">
                            <span class="glyphicon glyphicon-log-out"></span> Wyloguj
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/cart"/>">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Koszyk
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>