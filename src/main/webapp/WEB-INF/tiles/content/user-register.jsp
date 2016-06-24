<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-4 col-lg-4 col-lg-offset-4">
            <form>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="text-center">Rejestracja</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="username">Login</label>
                            <input id="username" class="form-control" ng-model="user.username"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" class="form-control" ng-model="user.email" type="email"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Hasło</label>
                            <input id="password" class="form-control" ng-model="user.password" type="password"/>
                        </div>
                        <div class="alert alert-danger login-alert" role="alert" ng-show="success">Zostałeś zarejestrowany. Sprawdź swoją skrzynkę odbiorczą</div>
                        <div class="alert alert-danger login-alert" role="alert" ng-show="error">Rejestracja nieudana</div>
                        <div class="form-group">
                            <input type="submit" value="Utwórz" class="btn btn-success btn-block"
                                   ng-click="register(user)"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>