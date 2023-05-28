package poly.edu.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.edu.model.Account;

public interface AccountDAO extends JpaRepository<Account, String>{

}
