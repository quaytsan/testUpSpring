package poly.edu.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.edu.model.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{

}
