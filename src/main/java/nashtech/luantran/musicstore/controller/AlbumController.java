package nashtech.luantran.musicstore.controller;

import java.util.List;

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

public class AlbumController {


	@Autowired
	private AlbumRepository albumRepository;
	@Autowired
	private GenreRepository genreRepository;
	
	@GetMapping("/genre")
	public String showAlbumByGenreName(@RequestParam String name, Model model) {
		List<Album> albums = albumRepository.findByGenreName(name);
		List<Genre> genres = genreRepository.findAll();
		model.addAttribute("genres", genres);
		//model.addAttribute("albums", albums);
		return "genre";
	}


}
