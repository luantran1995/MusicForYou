package nashtech.luantran.musicstore.controller;

import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luantran.nashtech.musicstore.service.SecurityService;
import com.luantran.nashtech.musicstore.service.UserService;
import com.luantran.nashtech.musicstore.validator.UserValidator;

import nashtech.luantran.musicstore.model.Role;
import nashtech.luantran.musicstore.model.Users;
import nashtech.luantran.musicstore.repository.RoleRepository;

@Controller
public class AcountController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;
	@Autowired
	private RoleRepository roleRepository;

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

	@GetMapping("/login")
	public String getLogin(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping("/403")
	public String accessDenied() {
		return "403";
	}

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new Users());
		return "registration";

	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") Users userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}
		 HashSet<Role> roles = new HashSet<>();
         roles.add(roleRepository.findByName("ROLE_MEMBER"));
		
		userForm.setRoles(roles);
		userService.save(userForm);
		securityService.autologin(userForm.getEmail(), userForm.getPasswordConfirm());
		return "redirect:/";

	}

}
