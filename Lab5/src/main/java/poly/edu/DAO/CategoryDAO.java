package poly.edu.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.edu.model.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{

}
