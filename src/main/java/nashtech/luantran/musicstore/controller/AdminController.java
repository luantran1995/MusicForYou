package nashtech.luantran.musicstore.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

public class AdminController extends GeneralController {
	public static final String PARAM_LATESTPHOTO = "LATEST_PHOTO_PARAM";
	public static final String PARAM_BASE_URL = "baseURL";

	@Autowired
	private GenreRepository genreRepository;

	@Autowired
	private AlbumRepository albumRepository;

	@Autowired
	private ArtistRepository artistRepository;

	@Autowired
	private AlbumValidator albumValidator;
//	@Autowired
//	ServletContext context;

	

	@GetMapping(value = "/admin/delete/{albumId}")
	public String deleteAlbum(@PathVariable Long albumId, Model model) {
		albumRepository.delete(albumId);
		return "redirect:/admin";

	}

	@GetMapping(value = "/admin/update/{albumId}")
	public ModelAndView updateAlbumId(@PathVariable Long albumId, Model model, HttpServletRequest request) {
		Album album = albumRepository.findOne(albumId);
		AlbumVO albumVO = new AlbumVO(album);
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));

		model.addAttribute("albumVO", albumVO);
		return new ModelAndView("update");

	}

	@GetMapping(value = "/admin/detail/{albumId}")
	public ModelAndView showDetailAlbum(@PathVariable Long albumId, Model model, HttpServletRequest request) {
		Album album = albumRepository.findOne(albumId);
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));

		model.addAttribute("album", album);
		return new ModelAndView("detail");

	}

	@PostMapping(value = "/admin/update")
	public ModelAndView updateAlbum(@ModelAttribute(value = "albumVO") AlbumVO albumVO, Model model) {
		Album album = new Album();
		album.setId(albumVO.getId());
		album.setArtist(new Artist(albumVO.getIdArtist()));
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



	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String showAlbumByGenre(ModelMap model, HttpServletRequest request) {
		List<Album> albums = albumRepository.findAll();
		model.addAttribute("albums", albums);
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));
		return "admin";
	}

	@PostMapping(value = "/admin/add")
	public String addAlbum(Model model, HttpServletRequest request,
			@ModelAttribute(value = "albumVO") @Valid AlbumVO albumVO, BindingResult bindingResult,
			@RequestParam MultipartFile file) {
		Album album = new Album();
		album.setId(albumVO.getId());
		album.setArtist(new Artist(albumVO.getIdArtist()));
		album.setGenre(new Genre(albumVO.getIdGenre()));
		album.setPrice(albumVO.getPrice());
		album.setTitle(albumVO.getTitle());
		System.out.println("uploadingimgCtlt");
		String latestUploadPhoto = "";
		String rootPath = System.getProperty("catalina.home");
		File dir = new File(rootPath + File.separator + "image");
		if (!dir.exists()) {
			dir.mkdirs();
		}

		File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
		latestUploadPhoto = file.getOriginalFilename();

		// write uploaded image to disk
		try {
			try (InputStream is = file.getInputStream();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
				int i;
				while ((i = is.read()) != -1) {
					stream.write(i);
				}
				stream.flush();
			}
		} catch (IOException e) {
			System.out.println("error : " + e.getMessage());
		}
		album.setAlbumArtUrl(latestUploadPhoto);

		// send baseURL to jsp
		model.addAttribute(PARAM_BASE_URL, getBaseURL(request));
		System.out.println(getBaseURL(request));
		// send photo name to jsp
		model.addAttribute(PARAM_LATESTPHOTO, latestUploadPhoto);

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
