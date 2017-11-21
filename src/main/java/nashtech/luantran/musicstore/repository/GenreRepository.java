package nashtech.luantran.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Genre;

public interface GenreRepository extends JpaRepository<Genre, Long> {

}
