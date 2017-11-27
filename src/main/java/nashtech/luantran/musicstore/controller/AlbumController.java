package nashtech.luantran.musicstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nashtech.luantran.musicstore.model.Album;
import nashtech.luantran.musicstore.model.Genre;
import nashtech.luantran.musicstore.repository.AlbumRepository;
import nashtech.luantran.musicstore.repository.GenreRepository;

@Controller

public class AlbumController extends GeneralController {

	public static final String PARAM_LATESTPHOTO = "LATEST_PHOTO_PARAM";
	public static final String PARAM_BASE_URL = "baseURL";

	@Autowired
	private AlbumRepository albumRepository;
	@Autowired
	private GenreRepository genreRepository;


	@GetMapping("/genre")
	public String showAlbumByGenreName(@RequestParam String name, Model model, HttpServletRequest request) {
		List<Album> albums = albumRepository.findByGenreName(name);
		List<Genre> genres = genreRepository.findAll();
		
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));

		model.addAttribute("genres", genres);
		model.addAttribute("albums", albums);
		model.addAttribute("genreName", name);
		return "genre";
	}


}
