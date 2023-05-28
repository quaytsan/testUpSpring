package poly.edu.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product implements Serializable{
	@Id 	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idProduct;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String nameProduct;
	@Column(columnDefinition = "varchar(250)")
	private String image;
	private Double price;
	private Integer quantity;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	private Date createdate;
	
	@ManyToOne
	@JoinColumn(name = "idCategory")
	private Category category;
	
	private Boolean available;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
}
