<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">

    <s:if test="hasActionErrors()">
        <div class="alert alert-danger"><s:actionerror/></div>
    </s:if>
    <s:if test="hasActionMessages()">
        <div class="alert alert-success"><s:actionmessage/></div>
    </s:if>

    <h4 class="mb-1">Customer Dashboard</h4>
    <p class="text-muted mb-4">Welcome! Browse and purchase policies below.</p>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="card shadow-sm text-center p-4 h-100">
                <i class="fas fa-search fa-2x text-primary mb-3"></i>
                <h5>Browse Policies</h5>
                <p class="text-muted">View all available policies and purchase one.</p>
                <a href="browsePolicies" class="btn btn-primary px-4">Browse Policies</a>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card shadow-sm text-center p-4 h-100">
                <i class="fas fa-list fa-2x text-info mb-3"></i>
                <h5>My Policies</h5>
                <p class="text-muted">View all your purchased policies.</p>
                <a href="myPolicies" class="btn btn-info px-4">View My Policies</a>
            </div>
        </div>
    </div>

</div>

<%@ include file="footer.jsp" %>
