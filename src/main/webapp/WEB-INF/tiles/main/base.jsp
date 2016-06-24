<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl" ng-app="bookStore">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/libraries/bootstrap/css/bootstrap.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<spring:url value="/libraries/animate/animate.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<spring:url value="/styles/style.css"/>"/>
    <title><tiles:insertAttribute name="title"/></title>
</head>
<body ng-controller="SessionController">
<div class="wrapper" ng-controller="CartController">
    <div class="alert alert-danger animated cart-info text-center cart-remove">Produkt został usunięty z koszyka</div>
    <div class="alert alert-success animated cart-info text-center cart-add">Produkt został dodany do koszyka</div>
    <tiles:insertAttribute name="navbar"/>
    <tiles:insertAttribute name="content1"/>
    <tiles:insertAttribute name="content2"/>
    <tiles:insertAttribute name="content3"/>
    <div class="push"></div>
</div>
<tiles:insertAttribute name="footer"/>

<script src="<spring:url value="/libraries/jquery/jquery.min.js"/>"></script>
<script src="<spring:url value="/libraries/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<spring:url value="/libraries/angular/angular.min.js"/>"></script>
<script src="<spring:url value="/libraries/angular/ngStorage.min.js"/>"></script>
<script src="<spring:url value="/scripts/script.js"/>"></script>
</body>
</html>
