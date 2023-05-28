package poly.edu.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.edu.model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{

}
