package com.amit.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;


import com.amit.Dao.UserDataDao;
import com.amit.Modal.User;

/**
 * Servlet implementation class UserValidity
 */
@WebServlet("/UserValidity")
public class UserValidity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		

		  StringBuffer jb = new StringBuffer();
		  String line = null;
		  try {
		    BufferedReader reader = request.getReader();
		    while ((line = reader.readLine()) != null)
		      jb.append(line);
		  } catch (Exception e) { /*report an error*/ }
		  
		 
		
		 
		  try {
//		    JSONObject jsonObject =  HTTP.toJSONObject(jb.toString());
//		    String name = jsonObject.getString("Method");
			JSONObject jsonObject = new  JSONObject(jb.toString());

			String email = jsonObject.getString("email").trim();
			String password = jsonObject.getString("password").trim();

			//Inserting data into database
			UserDataDao uDao = new UserDataDao();
			JSONObject output = new JSONObject();
			PrintWriter printWriter = response.getWriter();
			
			
			if(uDao.checkUser(email,password))
			{

				//RequestDispatcher dispatcher = request.getRequestDispatcher("Data.jsp");
				//dispatcher.forward(request, response);
				User userdata = uDao.selectUser(email);
				
				
				response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        
		        HttpSession session = request.getSession();
				session.setAttribute("username", email);
				session.setAttribute("id", userdata.getId());
				
		        output.put("id", userdata.getId());
		        output.put("name", userdata.getName());
		        output.put("email", userdata.getEmail());
		        output.put("phone", userdata.getPhone());
		        output.put("address", userdata.getAddress());
		        output.put("page", "Data.jsp");
		        printWriter.print(output.toString());
				
			}
			else
			{
				response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        output.put("msg", "Email or password is not match");
		        printWriter.print(output.toString());
				System.out.println("error user-validity");
				
			}
			
	

			
			



		  } catch (Exception e ) {
		    // crash and burn
			  System.out.println(e);
		    throw new IOException("Error parsing JSON request string");
		    
		  }
		  
		  
 
	
			

		
		
		
	}

}
