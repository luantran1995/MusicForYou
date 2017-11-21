package nashtech.luantran.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Users;

public interface UserRepository extends JpaRepository<Users, Long>  {
	Users findByEmail(String email);
}
