package nashtech.luantran.musicstore.controller;

import java.security.Principal;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import nashtech.luantran.musicstore.model.Genre;
import nashtech.luantran.musicstore.repository.GenreRepository;

@Controller
public class HomeController {

	@Autowired
	private GenreRepository genreRepository;

	@RequestMapping("/")
	public String showHome(Model model) {
		List<Genre> genres = genreRepository.findAll();
		model.addAttribute("genres", genres);
		return "home";
	}

	


}