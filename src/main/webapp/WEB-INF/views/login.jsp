<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<jsp:include page="components/head.jsp"/>
<body>
<header>
    <jsp:include page="components/navigation.jsp"/>
</header>
<section class="login-page">
    <h2>${message}</h2>
    <form role="form" method="post">
        <div class="form-group">
            <input class="form-control" name="username" placeholder="E-mail"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" name="password" placeholder="Hasło"/>
            <a href="<c:url value="/reset-password"/>" class="btn btn--small btn--without-border reset-password">Przypomnij
                hasło</a>
        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/register"/>" class="btn btn--without-border">Załóż konto</a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
    </form>
</section>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
