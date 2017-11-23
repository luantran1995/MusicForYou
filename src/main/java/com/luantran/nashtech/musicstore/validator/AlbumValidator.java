package com.luantran.nashtech.musicstore.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.luantran.nashtech.musicstore.vo.AlbumVO;
@Component
public class AlbumValidator implements Validator{

	@Override
	public boolean supports(Class<?> bclazz) {
		// TODO Auto-generated method stub
		return AlbumVO.class.equals(bclazz);
	}

	@Override
	public void validate(Object c, Errors errors) {
		AlbumVO album = (AlbumVO) c;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty");
		if(album.getPrice()<0) {
		errors.rejectValue("price", "Price.albumForm");
		}
		 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "NotEmpty");
		if(album.getTitle()=="") {
			errors.rejectValue("title", "Title.albumForm");
		}

	}

}
