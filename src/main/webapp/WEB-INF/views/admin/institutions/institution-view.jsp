<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<jsp:include page="../components/head.jsp"/>
<jsp:include page="../components/navbar.jsp"/>
<jsp:include page="../components/sidebar.jsp"/>


<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="<c:url value="/admin"/>">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Instytucje / Dane Instytucji</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Instytucje</h1>
        </div>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Dane Instytucji
                    <a class="btn btn-primary pull-right" href="<c:url value="/admin/institutions"/>" role="button">
                        Powrót</a>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" action="" method="post">
                        <fieldset>
                            <span> Dodano: <javatime:format value="${user.created}" style="MM"/></span>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Id</label>
                                <div class="col-md-9">
                                    ${user.id}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Login</label>
                                <div class="col-md-9">
                                    ${user.username}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Nazwa</label>
                                <div class="col-md-9">
                                    ${user.institutionName}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Typ instytucji</label>
                                <div class="col-md-9">
                                    ${user.institutionType.name}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Cel i misja instytucji</label>
                                <div class="col-md-9">
                                    ${user.institutionGoalAndMission}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Instytucja pomaga</label>
                                <div class="col-md-9">
                                    <c:forEach items="${user.institutionHelpsWho}" var="who" varStatus="loop">
                                        <li>${who.name}</li>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Instytucja potrzebuje</label>
                                <div class="col-md-9">
                                    <c:forEach items="${user.institutionNeedsWhat}" var="what" varStatus="loop">
                                        <li>${what.name}</li>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Liczba otrzymanych darowizn</label>
                                <div class="col-md-9">
                                    ${nrOfDonations}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    ${user.email}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Telefon</label>
                                <div class="col-md-9">
                                    ${user.phoneNumber}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Adres</label>
                                <div class="col-md-9">
                                    <c:forEach items="${user.addresses}" var="address" varStatus="loop">
                                        <li>Nr mieszkania: ${address.flatNumber}</li>
                                        <li>Nr domu: ${address.houseNumber}</li>
                                        <li>Ulica: ${address.street}</li>
                                        <li>Miasto: ${address.city}</li>
                                        <li>Kod pocztowy: ${address.zipCode}</li>
                                    </c:forEach>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../components/footer.jsp"/>