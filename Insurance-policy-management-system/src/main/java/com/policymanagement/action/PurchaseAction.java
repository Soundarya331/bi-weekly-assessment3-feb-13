package com.policymanagement.action;

import com.opensymphony.xwork2.ActionSupport;
import com.policymanagement.entity.CustomerPolicy;
import com.policymanagement.service.CustomerPolicyService;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Map;

@Component("purchaseAction")
public class PurchaseAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private int policyId;
	private String message;
	private List<CustomerPolicy> myPoliciesList;

	@Autowired
	private CustomerPolicyService customerPolicyService;

	@SkipValidation
	public String purchase() {
		try {
			Object customerIdObj = session.get("customerId");
			if (customerIdObj == null) {
				addActionError("Session expired. Please login again.");
				return ERROR;
			}
			int customerId = (int) customerIdObj;
			customerPolicyService.purchasePolicy(customerId, policyId);
			addActionMessage("Policy purchased successfully!");
			return SUCCESS;
		} catch (IllegalArgumentException e) {
			addActionError(e.getMessage());
			return ERROR;
		} catch (Exception e) {
			addActionError("Purchase failed: " + e.getMessage());
			return ERROR;
		}
	}

	@SkipValidation
	public String myPolicies() {
		Object customerIdObj = session.get("customerId");
		if (customerIdObj == null) {
			addActionError("Session expired. Please login again.");
			return ERROR;
		}
		int customerId = (int) customerIdObj;
		myPoliciesList = customerPolicyService.getMyPolicies(customerId);
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getPolicyId() {
		return policyId;
	}

	public void setPolicyId(int policyId) {
		this.policyId = policyId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<CustomerPolicy> getMyPoliciesList() {
		return myPoliciesList;
	}

	public void setMyPoliciesList(List<CustomerPolicy> list) {
		this.myPoliciesList = list;
	}
}