package nashtech.luantran.musicstore.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.luantran.nashtech.musicstore.validator.AlbumValidator;
import com.luantran.nashtech.musicstore.vo.AlbumVO;

import nashtech.luantran.musicstore.model.Album;
import nashtech.luantran.musicstore.model.Artist;
import nashtech.luantran.musicstore.model.Genre;
import nashtech.luantran.musicstore.repository.AlbumRepository;
import nashtech.luantran.musicstore.repository.ArtistRepository;
import nashtech.luantran.musicstore.repository.GenreRepository;

@Controller

public class AdminController {
	

	@Autowired
	private GenreRepository genreRepository;

	@Autowired
	private AlbumRepository albumRepository;

	@Autowired
	private ArtistRepository artistRepository;

	@Autowired
	private AlbumValidator albumValidator;

	@GetMapping(value = "/admin/delete/{albumId}")
	public String deleteAlbum(@PathVariable Long albumId, Model model) {
		albumRepository.delete(albumId);
		return "redirect:/admin";

	}

	@GetMapping("/admin")
	public String showAlbumByGenre(Model model) {
		List<Album> albums = albumRepository.findAll();
		model.addAttribute("albums", albums);
		return "admin";
	}

	@GetMapping(value = "/admin/update/{albumId}")
	public ModelAndView updateAlbumId(@PathVariable Long albumId, Model model) {
		Album album = albumRepository.findOne(albumId);
		AlbumVO albumVO = new AlbumVO(album);
		model.addAttribute("albumVO", albumVO);
		return new ModelAndView("update");

	}

	@GetMapping(value = "/admin/detail/{albumId}")
	public ModelAndView showDetailAlbum(@PathVariable Long albumId, Model model) {
		Album album = albumRepository.findOne(albumId);
		model.addAttribute("album", album);
		return new ModelAndView("detail");

	}

	@PostMapping(value = "/admin/update")
	public ModelAndView updateAlbum(@ModelAttribute(value = "albumVO") AlbumVO albumVO, Model model) {
		Album album = new Album();	
		album.setId(albumVO.getId());
		album.setArtist(new Artist(albumVO.getIdArtist()));
		album.setAlbumArtUrl(albumVO.getAlbumArtUrl());
		album.setGenre(new Genre(albumVO.getIdGenre()));
		album.setPrice(albumVO.getPrice());
		album.setTitle(albumVO.getTitle());

		albumRepository.save(album);
		model.addAttribute("albums", albumRepository.findAll());
		return new ModelAndView("admin");

	}

	@GetMapping(value = "/admin/getList")
	public ModelAndView getValue(Model model) {

		List<Genre> genres = genreRepository.findAll();
		List<Artist> artists = artistRepository.findAll();
		model.addAttribute("albumVO", new AlbumVO());
		model.addAttribute("genres", genres);
		model.addAttribute("artists", artists);
		System.out.println("getlist");

		return new ModelAndView("add");

	}

	@PostMapping(value = "/admin/add")
	public String addAlbum(Model model, @ModelAttribute(value = "albumVO") @Valid AlbumVO albumVO,
			 BindingResult bindingResult) {
		Album album = new Album();
		album.setId(albumVO.getId());
		album.setArtist(new Artist(albumVO.getIdArtist()));
		album.setGenre(new Genre(albumVO.getIdGenre()));
		album.setPrice(albumVO.getPrice());
		album.setTitle(albumVO.getTitle());

//		if (!file.isEmpty()) {
//			try {
//				byte[] bytes = file.getBytes();
//
//				// Creating the directory to store file
//				String rootPath = System.getProperty("catalina.home");
//				File dir = new File(rootPath + File.separator + "tmpFiles");
//				if (!dir.exists())
//					dir.mkdirs();
//
//				// Create the file on server
//				File serverFile = new File(dir.getAbsolutePath() + File.separator);
//				// byte[] encodeBase64 = Base64.encodeBase64(bytes);
//				// String base64Encoded = new String(encodeBase64, "UTF-8");
//				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//				stream.write(bytes);
//				stream.close();
//
//			} catch (Exception e) {
//
//			}
//		}
		albumValidator.validate(albumVO, bindingResult);

		if (bindingResult.hasErrors()) {
			List<Genre> genres = genreRepository.findAll();
			List<Artist> artists = artistRepository.findAll();
			model.addAttribute("genres", genres);
			model.addAttribute("artists", artists);
			return "add";
		}
		System.out.println("add album sucess");

		albumRepository.save(album);
		model.addAttribute("albums", albumRepository.findAll());
		return "redirect:/admin";

	}

}
