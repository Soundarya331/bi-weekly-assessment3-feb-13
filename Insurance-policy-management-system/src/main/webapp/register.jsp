<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Registration - InsurancePMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="min-height:100vh;">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h5 class="mb-0">Customer Registration</h5>
                </div>
                <div class="card-body p-4">

                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger"><s:actionerror/></div>
                    </s:if>
                    <s:if test="hasActionMessages()">
                        <div class="alert alert-success"><s:actionmessage/></div>
                    </s:if>

                    <s:form action="registerCustomer" method="post" theme="simple">

                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 text-end fw-semibold">Customer Name <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <s:textfield name="customerName" cssClass="form-control" placeholder="Enter full name" required="true"/>
                                <s:fielderror fieldName="customerName" cssClass="text-danger small"/>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 text-end fw-semibold">Email <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <s:textfield name="email" cssClass="form-control" placeholder="Enter email" required="true"/>
                                <s:fielderror fieldName="email" cssClass="text-danger small"/>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 text-end fw-semibold">Password <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <s:password name="password" cssClass="form-control" placeholder="Min 6 characters" required="true"/>
                                <s:fielderror fieldName="password" cssClass="text-danger small"/>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 text-end fw-semibold">Phone Number <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <s:textfield name="phoneNumber" cssClass="form-control" placeholder="10 digit phone number" required="true"/>
                                <s:fielderror fieldName="phoneNumber" cssClass="text-danger small"/>
                            </div>
                        </div>

                        <div class="row mb-4 align-items-center">
                            <label class="col-sm-4 text-end fw-semibold">Date of Birth <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <s:textfield name="dateOfBirth" cssClass="form-control" type="date" required="true"/>
                                <s:fielderror fieldName="dateOfBirth" cssClass="text-danger small"/>
                            </div>
                        </div>

                        <s:hidden name="role" value="CUSTOMER"/>

                        <div class="row">
                            <div class="col-sm-8 offset-sm-4 d-flex gap-2">
                                <s:submit value="Register" cssClass="btn btn-primary px-4"/>
                                <a href="login.jsp" class="btn btn-outline-secondary px-4">Back to Login</a>
                            </div>
                        </div>

                    </s:form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
