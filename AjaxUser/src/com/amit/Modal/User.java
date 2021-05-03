package com.amit.Modal;

public class User {
		private int id;
		private String  name, email,phone,address,password ;
		
		
		
		
		
		
		public User(int id, String name, String email, String phone, String address) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.address = address;
		}
		public User() {
			super();
		}
		public User(int id, String name, String email, String phone, String address, String password) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.password = password;
		}
		public User(String name, String email, String phone, String address, String password) {
			super();
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.password = password;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		
		


}
