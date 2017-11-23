package com.luantran.nashtech.musicstore.validator;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.luantran.nashtech.musicstore.service.UserService;

import nashtech.luantran.musicstore.model.Users;

@Component

public class UserValidator implements Validator {

	@Autowired
    private UserService userService;
	@Override
	public boolean supports(Class<?> aClass) {

		return Users.class.equals(aClass);
	}

	@Override
	public void validate(Object b, Errors errors) {

		Users user = (Users) b;
		Pattern pattern = Pattern.compile("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*",  Pattern.CASE_INSENSITIVE);
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (user.getEmail().length() < 6 || user.getEmail().length() > 32) {
			errors.rejectValue("email", "Size.userForm.email");
		}
		
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }
        if(userService.findByUsername(user.getEmail())!=null) {
        	errors.rejectValue("email", "Duplicate.userForm.email");
        }
         if(!(pattern.matcher(user.getEmail()).matches())) {
        	 errors.rejectValue("email", "user.email.invalid");
         }
        
        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

	}

}
