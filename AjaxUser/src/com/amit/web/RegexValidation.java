package com.amit.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexValidation {
	
	 	private Pattern pattern;
	    private Matcher matcher;

	    private static final String EMAIL_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
	            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	    private static final String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
	    private static final String ADDRESS_REGEX = "^[A-Za-z0-9. ]{3,50}$";
	    private static final String PHONE_REGEX = "^[789][0-9]{9}$";
	    private static final String NAME_REGEX = "^[A-Za-z ]{3,30}$";
	    
	    
	    public boolean EmailValidator(String email)
	    {
	        pattern = Pattern.compile(EMAIL_REGEX);
	        matcher = pattern.matcher(email);
	        return matcher.matches();
	    }

	    public boolean PasswordValidator(String password)
	    {
	        pattern = Pattern.compile(PASSWORD_REGEX);
	        matcher = pattern.matcher(password);
	        return matcher.matches();
	    }
	    
	    public boolean NameValidator(String name)
	    {
	        pattern = Pattern.compile(NAME_REGEX);
	        matcher = pattern.matcher(name);
	        return matcher.matches();
	    }
	    
	    public boolean PhoneValidator(String phone)
	    {
	        pattern = Pattern.compile(PHONE_REGEX);
	        matcher = pattern.matcher(phone);
	        return matcher.matches();
	    }
	    
	    public boolean AddressValidator(String Address)
	    {
	        pattern = Pattern.compile(ADDRESS_REGEX);
	        matcher = pattern.matcher(Address);
	        return matcher.matches();
	    }
	    /**
	     * Validate hex with regular expression
	     *
	     * @param email email for validation
	     * @return true valid email, false invalid email
	     */


}
