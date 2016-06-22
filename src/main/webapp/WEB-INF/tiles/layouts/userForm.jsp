<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3">
            <form>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="text-center">Rejestracja</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="username">Login</label>
                            <input id="username" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Hasło</label>
                            <input id="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Utwórz" class="btn btn-success btn-block"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>