package com.amit.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.json.JSONObject;

/**
 * Servlet Filter implementation class UserServletfilter
 */
@WebFilter("/UserServlet")
public class UserServletfilter implements Filter {

    /**
     * Default constructor. 
     */
    public UserServletfilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		MultiReadHttpServletRequest wrappedRequest = new MultiReadHttpServletRequest(request);
		MultiReadHttpServletRequest req = wrappedRequest;
		
		StringBuffer jb = new StringBuffer();
		  String line = null;
		  try {
		    BufferedReader reader = req.getReader();
		    while ((line = reader.readLine()) != null)
		      jb.append(line);
		  } catch (Exception e) { /*report an error*/ }
		  
		  
		
		  JSONObject output = new JSONObject();
		  PrintWriter printWriter = response.getWriter();
		  try {
//		    JSONObject jsonObject =  HTTP.toJSONObject(jb.toString());
//		    String name = jsonObject.getString("Method");
			JSONObject jsonObject = new  JSONObject(jb.toString());

			String name = jsonObject.getString("name").trim();
			String email = jsonObject.getString("email").trim();
			String phone = jsonObject.getString("phone").trim();
			String address = jsonObject.getString("address").trim();
			String password = jsonObject.getString("password").trim();

			RegexValidation check = new RegexValidation();
			
			String msg = "*";
			boolean status = true;
			if(!check.EmailValidator(email)) {
				msg = msg+"Email ,";
				status = false;
			}
			if(!check.AddressValidator(address)) {
				msg = msg+"Address ,";
				status = false;
			}
			if(!check.NameValidator(name)) {
				msg = msg+"Name ,";
				status = false;
			}
			if(!check.PhoneValidator(phone)) {
				msg = msg+"Phone ,";
				status = false;
			}
			if(!check.PasswordValidator(password)) {
				msg = msg+"Password";
				status = false;
			}
			
			if(status){
				chain.doFilter(wrappedRequest, response);
			}
			else {
				output.put("msg", msg+"are invaild");
				printWriter.print(output.toString());
			}
			
		  } catch (Exception e ) {
			    // crash and burn
				  System.out.println(e);
			    throw new IOException("Error parsing JSON request string");
			    
	 }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
