<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Menu</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=<spring:url value="/"/>>
                    <span class="glyphicon glyphicon-superscript"></span>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href=<spring:url value="/"/>>
                            <span class="glyphicon glyphicon-home"></span> Strona głowna
                        </a>
                    </li>
                    <li>
                        <a href=<spring:url value="/products"/>>
                            <span class="glyphicon glyphicon-gift"></span> Produkty
                        </a>
                    </li>
                    <li>
                        <a href="<spring:url value="/order/status"/>">
                            <span class="glyphicon glyphicon-check"></span> Stan zamowienia
                        </a>
                    </li>
                </ul>
                <hr class="visible-xs divider">
                <ul class="nav navbar-nav navbar-right" ng-controller="SessionController">
                    <li ng-hide={{loggedIn}}>
                        <a href=<spring:url value="/userForm"/>>
                            <span class="glyphicon glyphicon-user"></span> Nowe konto
                        </a>
                    </li>
                    <li ng-click="login()" ng-hide={{loggedIn}}>
                        <a href=<spring:url value="/login"/>>
                            <span class="glyphicon glyphicon-log-in"></span> Zaloguj
                        </a>
                    </li>
                    <li ng-show={{loggedIn}}>
                        <a href=<spring:url value="/user/orders"/>>
                            <span class="glyphicon glyphicon-eye-open"></span> Moje zamówienia
                        </a>
                    </li>
                    <li ng-show={{loggedIn}}>
                        <a href=<spring:url value="/admin"/>>
                            <span class="glyphicon glyphicon-cog"></span> Panel administratora
                        </a>
                    </li>
                    <li ng-click="logout()" ng-show={{loggedIn}}>
                        <a href=<spring:url value="/logout"/>>
                            <span class="glyphicon glyphicon-log-out"></span> Wyloguj
                        </a>
                    </li>
                    <li>
                        <a href="<spring:url value="/cart"/>">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Koszyk
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>