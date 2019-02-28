<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<jsp:include page="components/head.jsp"/>
<body>
<header>
    <jsp:include page="components/navigation.jsp"/>
</header>
<section class="login-page">
    <h2>Zaloguj się</h2>
    <form role="form" method="post">
        <fieldset>
        <div class="form-group">
            <input class="form-control" type="email" name="email" placeholder="Email"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" name="password" placeholder="Hasło"/>
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <%--<a href="#" class="btn btn--without-border">Załóż konto</a>--%>
            <input type="submit" class="btn">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </fieldset>
        <%--<button class="btn" type="submit">Zaloguj się</button>--%>

        <%--<input type="submit" class="btn btn-primary"></fieldset>--%>
        <%--</div>--%>
    </form>
</section>

<jsp:include page="components/footer.jsp"/>
