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
 * Servlet implementation class UserUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
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
		  
			JSONObject jsonObject = new  JSONObject(jb.toString());
			JSONObject output = new JSONObject();
		  try {
			int id = jsonObject.getInt("id");
			String name = jsonObject.getString("name");
			String email = jsonObject.getString("email");
			String phone = jsonObject.getString("phone");
			String address = jsonObject.getString("address");


			
			
			//Creating pojo object
			User user = new User(id,name,email,phone,address);

			//Inserting data into database
			UserDataDao uDao = new UserDataDao();
			PrintWriter printWriter = response.getWriter();
	        HttpSession session = request.getSession();
	        int idsession = (int) session.getAttribute("id");
			
			if(uDao.checkEmailPresent(email, id) && (id==idsession)) {
				
				uDao.updateUser(user);
				User userdata = uDao.selectUserById(id);


		        
				response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        output.put("id", userdata.getId());
		        output.put("name", userdata.getName());
		        output.put("email", userdata.getEmail());
		        output.put("phone", userdata.getPhone());
		        output.put("address", userdata.getAddress());
		        output.put("page", "Data.jsp");
		        printWriter.print(output.toString());
			}
			else {
				
				response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        output.put("msg", "Email is already present");
		        printWriter.print(output.toString());
	
				System.out.println("error in user-update");
			}


		  } catch (Exception e ) {
		    // crash and burn
			  System.out.println(e);
		    throw new IOException("Error parsing JSON request string");
		    
		  }
			

	
	}

}
