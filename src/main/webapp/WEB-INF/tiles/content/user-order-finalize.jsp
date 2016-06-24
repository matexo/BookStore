<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container" ng-controller="OrderController ">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="text-center"><strong>Dane klienta</strong></h4>
            </div>
            <div class="panel-body">
                <form>
                    <div class="form-group">
                        <label for="name">Imię</label>
                        <input type="text" id="name" ng-model="name" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="surname">Nazwisko</label>
                        <input type="text" id="surname" ng-model="surname" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Numer telefonu</label>
                        <input type="text" id="phoneNumber" ng-model="phoneNumber" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" ng-model="email" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="streetName">Ulica</label>
                        <input type="text" id="streetName" ng-model="streetName" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="houseNumber">Numer domu</label>
                        <input type="text" id="houseNumber" ng-model="houseNumber" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="city">Miasto</label>
                        <input type="text" id="city" ng-model="city" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="zipcode">Kod pocztowy</label>
                        <input type="text" id="zipcode" ng-model="zipcode" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="shippingMethod">Forma wysyłki:</label>
                        <input class="radio-input" ng-model="method" type="radio" id="shippingMethod" value="Kurier">
                        <span>Kurier[15zł]</span>
                        <input class="radio-input" ng-model="method" type="radio" value="Poczta Polska"><span>Poczta
                        Polska[10zł]</span>
                        <input class="radio-input" ng-model="method" type="radio"
                               value="Inpost"><span>Inpost[8zł]</span>

                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-success"
                                ng-click="finalize(name,surname,phoneNumber,email,streetName,houseNumber,city,zipcode,method)">
                            Zatwierdź
                        </button>
                    </div>
                    <div class="col-md-6">
                        <a class="btn btn-danger" href="<spring:url value="/cart"/>">Anuluj</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>