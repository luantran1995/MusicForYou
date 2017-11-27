package nashtech.luantran.musicstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import nashtech.luantran.musicstore.model.Album;
import nashtech.luantran.musicstore.model.Genre;
import nashtech.luantran.musicstore.repository.AlbumRepository;
import nashtech.luantran.musicstore.repository.GenreRepository;

@Controller
public class CartController extends GeneralController{
	
	public static final String PARAM_LATESTPHOTO = "LATEST_PHOTO_PARAM";
	public static final String PARAM_BASE_URL = "baseURL";
	@Autowired
	private AlbumRepository albumRepository;
	
	@Autowired
	private GenreRepository genreRepository;

	@GetMapping("/viewproduct/{id}")
	public ModelAndView viewProduct(@PathVariable("id") Long id , Model model,HttpServletRequest request) {
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));

		Album album = albumRepository.findOne(id);
		List<Genre> genres = genreRepository.findAll();
		model.addAttribute("genres", genres);
		model.addAttribute("album", album);

		return new ModelAndView("viewproduct");
		
	}
	
	@GetMapping("/viewcart")
	public ModelAndView viewCart() {
		return new ModelAndView("viewcart");
		
	}
}
