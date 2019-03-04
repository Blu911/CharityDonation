<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:include page="components/head.jsp"/>
<jsp:include page="components/navbar.jsp"/>
<jsp:include page="components/sidebar.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="<c:url value="/admin"/>">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Darowizny</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Darowizny</h1>
        </div>
    </div><!--/.row-->
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">Lista</div>
            <div class="panel-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Data utworzenia</th>
                        <th scope="col">Od kogo</th>
                        <th scope="col">Dla kogo</th>
                        <th scope="col">Ilość worków</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${donationList}" var="donation" varStatus="loop">
                        <tr>
                            <th scope="row">${loop.count}</th>
                            <td><javatime:format value="${donation.created}" style="MM"/></td>
                            <td>${donation.userDetails.username}</td>
                            <td>${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}</td>
                            <td>${donation.quantity}</td>
                            <td>
                                <form method="post">
                                    <a class="btn pull-right"
                                       href="<c:url value="/admin/donations/view/${donation.id}"/>">Wyświetl</a>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="components/footer.jsp"/>