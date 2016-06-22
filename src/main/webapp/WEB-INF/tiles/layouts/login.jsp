<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page session="true" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3">
            <form>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="text-center">Logowanie</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <input type="text" name="username" id="username" placeholder="Login" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" id="password" placeholder="Hasło"
                                   class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-success btn-block" type="submit" value="Zaloguj się"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>