<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">

    <div class="row mb-3">
        <div class="col">
            <h4>Browse Policies</h4>
            <p class="text-muted">Below are the available policies. Click Purchase to buy a policy.</p>
        </div>
    </div>

    <s:if test="hasActionErrors()">
        <div class="alert alert-danger"><s:actionerror/></div>
    </s:if>

    <s:if test="policyList == null || policyList.isEmpty()">
        <div class="alert alert-info">No policies available to browse.</div>
    </s:if>

    <s:else>
        <div class="row">
            <s:iterator value="policyList" var="p">
                <div class="col-md-4 mb-3">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <h5 class="card-title"><s:property value="#p.policyName"/></h5>
                            <p class="card-text"><strong>Type:</strong> <s:property value="#p.policyType"/></p>
                            <p class="card-text"><strong>Coverage:</strong> &#8377;<s:property value="#p.coverageAmount"/></p>
                            <p class="card-text"><strong>Premium:</strong> &#8377;<s:property value="#p.premiumAmount"/></p>
                            <p class="card-text"><strong>Duration:</strong> <s:property value="#p.durationMonths"/> Months</p>
                        </div>
                        <div class="card-footer">
                            <s:a action="purchasePolicy" cssClass="btn btn-primary w-100">
                                <s:param name="policyId"><s:property value="#p.policyId"/></s:param>
                                Purchase
                            </s:a>
                        </div>
                    </div>
                </div>
            </s:iterator>
        </div>
    </s:else>

</div>

<%@ include file="footer.jsp" %>
