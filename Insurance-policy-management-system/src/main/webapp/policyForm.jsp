<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-7">
      <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center py-3">
          <h5 class="mb-0"><i class="fas fa-plus me-2"></i>Create Policy</h5>
        </div>
        <div class="card-body p-4">

          <s:if test="hasActionErrors()">
            <div class="alert alert-danger"><s:actionerror/></div>
          </s:if>

          <s:form action="addPolicy" method="post" theme="simple">
            <input type="hidden" name="policy.active" value="true"/>

            <div class="row mb-3 align-items-center">
              <label class="col-sm-4 text-end fw-semibold">Policy Name <span class="text-danger">*</span></label>
              <div class="col-sm-8">
                <s:textfield name="policyName" cssClass="form-control" placeholder="Enter policy name" required="true"/>
                <s:fielderror fieldName="policyName" cssClass="text-danger small"/>
              </div>
            </div>

            <div class="row mb-3 align-items-center">
              <label class="col-sm-4 text-end fw-semibold">Policy Type <span class="text-danger">*</span></label>
              <div class="col-sm-8">
                <s:select name="policyType" cssClass="form-select" required="true"
                  list="#{'HEALTH':'Health Insurance','LIFE':'Life Insurance','VEHICLE':'Vehicle Insurance','PROPERTY':'Property Insurance'}"
                  headerKey="" headerValue="-- Select Type --"/>
                <s:fielderror fieldName="policyType" cssClass="text-danger small"/>
              </div>
            </div>

            <div class="row mb-3 align-items-center">
              <label class="col-sm-4 text-end fw-semibold">Premium Amount <span class="text-danger">*</span></label>
              <div class="col-sm-8">
                <div class="input-group">
                  <span class="input-group-text">&#8377;</span>
                  <s:textfield name="premiumAmount" cssClass="form-control" placeholder="5000" required="true"/>
                </div>
                <s:fielderror fieldName="premiumAmount" cssClass="text-danger small"/>
              </div>
            </div>

            <div class="row mb-3 align-items-center">
              <label class="col-sm-4 text-end fw-semibold">Coverage Amount <span class="text-danger">*</span></label>
              <div class="col-sm-8">
                <div class="input-group">
                  <span class="input-group-text">&#8377;</span>
                  <s:textfield name="coverageAmount" cssClass="form-control" placeholder="500000" required="true"/>
                </div>
                <s:fielderror fieldName="coverageAmount" cssClass="text-danger small"/>
              </div>
            </div>

            <div class="row mb-4 align-items-center">
              <label class="col-sm-4 text-end fw-semibold">Duration <span class="text-danger">*</span></label>
              <div class="col-sm-8">
                <div class="input-group">
                  <s:textfield name="durationMonths" cssClass="form-control" placeholder="12" required="true"/>
                  <span class="input-group-text">Months</span>
                </div>
                <s:fielderror fieldName="durationMonths" cssClass="text-danger small"/>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-8 offset-sm-4 d-flex gap-2">
                <a href="agentDashboard" class="btn btn-secondary px-4">
                  <i class="fas fa-times me-1"></i>Cancel
                </a>
                <s:submit value="Create Policy" cssClass="btn btn-primary px-4"/>
              </div>
            </div>

          </s:form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>
