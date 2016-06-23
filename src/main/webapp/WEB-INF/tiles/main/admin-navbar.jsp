<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href=<c:url value="/admin/products/form"/>>
                            <span class="glyphicon glyphicon-plus-sign"></span> Dodaj produkt
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/admin/products"/>">
                            <span class="glyphicon glyphicon-th-list"></span> Lista produktów
                        </a>
                    </li>
                    <li>
                        <a href=<c:url value="/admin/orders"/>>
                            <span class="glyphicon glyphicon-list-alt"></span> Lista zamówień
                        </a>
                    </li>
                    <c:url var="logoutUrl" value="/logout"/>
                    <li>
                        <a href="<c:url value="/logout"/>">
                            <span class="glyphicon glyphicon-log-out"></span> Wyloguj
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>