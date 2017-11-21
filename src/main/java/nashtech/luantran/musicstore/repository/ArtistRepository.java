package nashtech.luantran.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Artist;

public interface ArtistRepository extends JpaRepository<Artist, Long>{

}
