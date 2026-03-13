package com.policymanagement.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.policymanagement.entity.Customer;
import com.policymanagement.service.CustomerService;

@Component("loginAction")
public class LoginAction extends ActionSupport implements ModelDriven<Customer> {

	private Customer customer = new Customer();
	private String role;
	private String email;
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private Map<String, String> jsonResponse = new HashMap<>();

	@Autowired
	private CustomerService customerService;

	public String login() {

		if (email != null)
			customer.setEmail(email);
		if (password != null)
			customer.setPassword(password);

		if ("admin@insurance.com".equals(customer.getEmail()) && "admin123".equals(customer.getPassword())) {

			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("email", customer.getEmail());
			session.setAttribute("role", "AGENT");

			jsonResponse.put("status", "success");
			jsonResponse.put("role", "AGENT");
			jsonResponse.put("redirect", "agentDashboard");
			return "agent";
		}

		Customer dbCustomer = customerService.findByEmailAndPassword(customer.getEmail(), customer.getPassword());

		if (dbCustomer != null) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("email", dbCustomer.getEmail());
			session.setAttribute("role", dbCustomer.getRole());
			session.setAttribute("loggedInCustomer", dbCustomer);
			session.setAttribute("customerId", dbCustomer.getCustomerId());

			if ("AGENT".equalsIgnoreCase(dbCustomer.getRole())) {
				jsonResponse.put("status", "success");
				jsonResponse.put("role", "AGENT");
				jsonResponse.put("redirect", "agentDashboard");
				return "agent";
			}
			if ("CUSTOMER".equalsIgnoreCase(dbCustomer.getRole())) {
				jsonResponse.put("status", "success");
				jsonResponse.put("role", "CUSTOMER");
				jsonResponse.put("redirect", "customerDashboard");
				return "customer";
			}
		}

		jsonResponse.put("status", "error");
		jsonResponse.put("message", "Invalid email or password. Please try again.");
		return ERROR;
	}

	public String logout() {
		HttpSession session = ServletActionContext.getRequest().getSession(false);
		if (session != null)
			session.invalidate();
		return SUCCESS;
	}

	@Override
	public Customer getModel() {
		return customer;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer c) {
		this.customer = c;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Map<String, String> getJsonResponse() {
		return jsonResponse;
	}
}
