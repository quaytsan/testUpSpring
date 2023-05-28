package poly.edu.model;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orderdetails")
public class OrderDetail implements Serializable{
	@Id 	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idOrderDetail;
	
	@ManyToOne
	@JoinColumn(name = "idOrder")
	private Order order;
	
	@ManyToOne
	@JoinColumn(name = "idProduct")
	private Product product;
	
	private Double price;
	
	private Integer quantity;
}
