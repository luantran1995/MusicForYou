package nashtech.luantran.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	Role findByName(String name);

}
