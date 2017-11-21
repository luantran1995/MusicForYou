package com.luantran.nashtech.musicstore.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import nashtech.luantran.musicstore.model.Users;

@Component

public class UserValidator implements Validator {


	@Override
	public boolean supports(Class<?> aClass) {

		return Users.class.equals(aClass);
	}

	@Override
	public void validate(Object b, Errors errors) {

		Users user = (Users) b;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (user.getEmail().length() < 6 || user.getEmail().length() > 32) {
			errors.rejectValue("email", "Size.userForm.username");
		}
		
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }
        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

	}

}
