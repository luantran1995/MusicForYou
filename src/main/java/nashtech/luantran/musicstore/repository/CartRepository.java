package nashtech.luantran.musicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import nashtech.luantran.musicstore.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {

}
