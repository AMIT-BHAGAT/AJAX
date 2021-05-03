package com.amit.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.amit.Modal.User;

public class UserDataDao {

	
	//Defining the Variable
	private String jdbcURL = "jdbc:mysql://localhost:3306/aliens";
	private String jdbcUsername = "root";
	private String jdbcPassword = "amit8983";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	private String INSERT_USERS_SQL = "INSERT INTO userdata (name,email,phone,address,password) values(?, ?, ?,?,?);"; 
	private String CHECK_USERS_SQL ="select * from userdata where email=? and password=?";
	private String CHECK_EMAIL_SQL ="select * from userdata where email=?";
	private String CHECK_EMAIL_PRESENT_SQL ="select * from userdata where email=?";
	private String SELECT_USER_BY_EMAIL_SQL = "select id,name,email,phone,address from userdata where email=?";
	private String SELECT_USER_BY_ID = "select id,name,email,phone,address from userdata where id=?";
	private String UPDATE_USERS_SQL = "update userdata set name = ?,email= ?, phone =?, address=? where id=?;";

	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		}
		catch (Exception e){
			System.out.println(e);
		}
	}

	public void insertUser(User user) throws SQLException {
		
		// try-with-resource statement will auto close the connection.
		
			loadDriver(dbDriver);
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
			String password = Encrypted.encrypt(user.getPassword());
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPhone());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, password);

			preparedStatement.executeUpdate();

	}
	
	public boolean checkUser(String email, String password) throws ClassNotFoundException, SQLException 
	{
	
 	
		loadDriver(dbDriver);
		Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
	
		PreparedStatement st = con.prepareStatement(CHECK_USERS_SQL);
		String encpassword = Encrypted.encrypt(password);
		st.setString(1, email);
		st.setString(2, encpassword);
	
		ResultSet rs = st.executeQuery();
	
		
		if(rs.next()) {

			return true;
		}

		return false;
	}
	
	public boolean checkEmail(String email) throws ClassNotFoundException, SQLException 
	{
	
 	
		loadDriver(dbDriver);
		Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
	
		PreparedStatement st = con.prepareStatement(CHECK_EMAIL_SQL);

		st.setString(1, email);
		
	
		ResultSet rs = st.executeQuery();
	
		
		if(rs.next()) {

			return false;
		}

		return true;
	}
	
	
	
	public boolean checkEmailPresent(String email, int id) throws ClassNotFoundException, SQLException 
	{
	
 	
		loadDriver(dbDriver);
		Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
	
		PreparedStatement st = con.prepareStatement(CHECK_EMAIL_PRESENT_SQL);

		st.setString(1, email);
		
	
		ResultSet rs = st.executeQuery();
	
		
		if(rs.next()) {
			int id1 = rs.getInt("id");
			if(id1 == id) {
				return true;
				}else {
				return false;
				}
		}else {
			return true;
		}

		
	}
	
	public User selectUser(String uemail) {
		User user = null;
		loadDriver(dbDriver);
		// Step 1: Establishing a Connection
		try (Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_EMAIL_SQL);) {
			preparedStatement.setString(1, uemail);
			//System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				user = new User(id,name, email, phone,address);
				
			}
		} 
		catch (SQLException e) {
			System.out.println(e);
		}
		return user;
	}
	
	public User selectUserById(int Iid) {
		User user = null;
		loadDriver(dbDriver);
		
		// Step 1: Establishing a Connection
		try (Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, Iid);
			//System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				user = new User(id,name, email, phone,address);
				
			}
		} 
		catch (SQLException e) {
			System.out.println(e);
		}
		return user;
	}
	
	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdated;

		try (Connection connection =DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
			PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			//System.out.println("updated USer:"+statement);
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPhone());
			statement.setString(4, user.getAddress());
			statement.setInt(5, user.getId());
			System.out.println("updateDao");

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	

	
	
}
