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
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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

			String name = jsonObject.getString("name").trim();
			String email = jsonObject.getString("email").trim();
			String phone = jsonObject.getString("phone").trim();
			String address = jsonObject.getString("address").trim();
			String password = jsonObject.getString("password").trim();
			
			//Creating pojo object
			User user = new User(name,email,phone,address,password);

			//Inserting data into database
			UserDataDao uDao = new UserDataDao();
			PrintWriter printWriter = response.getWriter();
			
			if(uDao.checkEmail(email)) {
				uDao.insertUser(user);
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
				
//				request.setAttribute("message", "wrong credential");
//				RequestDispatcher dispatcher1 = request.getRequestDispatcher("Login.jsp");
//				dispatcher1.forward(request, response);
				response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        output.put("msg", "Email is already present");
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
