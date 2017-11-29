package nashtech.luantran.musicstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Album;

public interface AlbumRepository extends JpaRepository<Album, Long> {

	List<Album> findByGenreName(String name);
	
	Long findByid(Long id);
}

