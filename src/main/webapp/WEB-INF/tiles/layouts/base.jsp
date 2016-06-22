<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pl" ng-app="bookStore">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="libraries/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="styles/style.css"/>
    <title><tiles:insertAttribute name="title"/></title>
</head>
<body>

<tiles:insertAttribute name="navbar"/>
<tiles:insertAttribute name="content1"/>
<tiles:insertAttribute name="content2"/>
<tiles:insertAttribute name="content3"/>
<tiles:insertAttribute name="footer"/>

<script src="libraries/jquery/jquery.min.js"></script>
<script src="libraries/bootstrap/js/bootstrap.min.js"></script>
<script src="libraries/angular/angular.min.js"></script>
<script src="libraries/angular/ngStorage.min.js"></script>
<script src="scripts/script.js"></script>

</body>
</html>
