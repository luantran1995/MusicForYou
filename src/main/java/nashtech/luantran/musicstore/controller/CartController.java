package nashtech.luantran.musicstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import nashtech.luantran.musicstore.model.Album;
import nashtech.luantran.musicstore.repository.AlbumRepository;
import nashtech.luantran.musicstore.repository.GenreRepository;

@Controller
public class CartController {
	
	@Autowired
	private AlbumRepository albumRepository;
	
	@Autowired
	private GenreRepository genreRepository;
	
	@GetMapping("/cartdetail/{id}")
	public ModelAndView getCartDetail(@PathVariable("id") Long id , Model model) {
		Album album = albumRepository.findOne(id);
//		List<Genre> genres = genreRepository.findAll();
//		model.addAttribute("genres", genres);
		model.addAttribute("album", album);

		return new ModelAndView("cartdetail");
		
	}
}
