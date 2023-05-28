package poly.edu.model;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "categories")
public class Category implements Serializable{
	@Id
	@Column(columnDefinition = "varchar(30)")
	private String idCategory;
	@Column(columnDefinition = "nvarchar(100)")
	private String nameCategory;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
	
}
