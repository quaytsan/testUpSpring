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
@Table(name = "accounts") //(name="...") đặt tên entity , khai báo table để mapping đến tbl ở sql
public class Account implements Serializable{
	@Id
	@Column(columnDefinition = "varchar(50)")
	private String username;
	@Column(columnDefinition = "nvarchar(100)")
	private String fullname;
	@Column(columnDefinition = "varchar(50)")
	private String password;
	@Column(columnDefinition = "varchar(100)")
	private String email;
	@Column(columnDefinition = "varchar(250)" , nullable = true)
	private String photo;
	private Boolean activated;
	private Boolean admin;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
