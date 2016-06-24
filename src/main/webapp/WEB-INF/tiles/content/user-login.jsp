<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-4 col-lg-4 col-lg-offset-4">
            <form>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="text-center">Logowanie</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <input type="text" name="username" id="username" placeholder="Login" class="form-control"
                                   ng-model="username"/>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" id="password" placeholder="Hasło"
                                   class="form-control" ng-model="password"/>
                        </div>
                        <div class="alert alert-danger" role="alert" ng-show="error">Błędne dane logowania</div>
                        <div class="form-group">
                            <input class="btn btn-success btn-block" type="submit" value="Zaloguj się"
                                   ng-click="login(username,password)"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>