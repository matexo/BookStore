<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="container" ng-controller="OrderController">
    <div class="panel panel-success">
        <div class="panel panel-header">
            <p class="text-center">Dane klienta</p>
        </div>
        <div class="panel panel-body">


            <form modelAttribute="customerOrder" form="form-inline">
                <div class="form-group">
                    <label> Imię </label>
                    <input type="text" id="name" ng-model="name"
                                class="form-control" />
                </div>


                <div class="form-group">
                    <label> Nazwisko </label>

                    <input type="text" id="surname" ng-model="surname"
                                class="form-control" />
                </div>

                <div class="form-group">
                    <label> Numer telefonu </label>
                    <input type="text" id="phoneNumber"
                           ng-model="phoneNumber" class="form-control" />
                </div>

                <div class="form-group">
                    <label> Email </label>

                    <input type="text" id="email" ng-model="email"
                                class="form-control" />
                </div>

                <div class="form-group">
                    <label> Ulica </label>

                    <input type="text" id="streetName"
                           ng-model="streetName" class="form-control" />
                </div>

                <div class="form-group">
                    <label> Miasto</label>

                    <input type="text" id="city" ng-model="city"
                                class="form-control" />
                </div>

                <div class="form-group">
                    <label> Kod pocztowy </label>

                    <input type="text" id="zipcode"
                           ng-model="zipcode" class="form-control" />
                </div>

                <div class="form-group">
                    <label>Forma wysyłki:</label>
                    <radiobutton path="shippingMethod" id="shippingMethod"
                                      value="Kurier" >
                    Kurier[15zł]</radiobutton>
                    <radiobutton path="shippingMethod" id="shippingMethod"
                                      value="Poczta Polska" >
                    Poczta Polska[10zł]</radiobutton>
                    <radiobutton path="shippingMethod" id="shippingMethod"
                                      value="Inpost">
                    Inpost[8zł]</radiobutton>

                </div>
                <input type="button" id="btnAdd" class="btn btn-success"
                        ng-click="finalize()"/>
                <button id="btnCancel" class="btn btn-danger"
                        name="_eventId_cancel">Anuluj</button>
            </form>
        </div>

    </div>
</div>