package poly.edu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import poly.edu.DAO.CategoryDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.model.Category;
import poly.edu.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO daoCate;

	@GetMapping("/product/list")
	public String showProduct(Model model, @RequestParam("field") Optional<String> field,
			@RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		if (field.isPresent()) {
			model.addAttribute("products", dao.findAll(sort));
		}
		model.addAttribute("products", dao.findAll(pageable).getContent());
		model.addAttribute("page", dao.findAll(pageable));
		model.addAttribute("categories", daoCate.findAll());
		model.addAttribute("product", new Product());
		return "/product/layout";
	}

	@RequestMapping("/product/save")
	public String save(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "/product/layout";
		}
		try {
			dao.save(product);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/product/list";
	}

	@GetMapping("/product/remove/{idProduct}")
	public String remove(@PathVariable("idProduct") Integer id) {
		dao.deleteById(id);
		return "redirect:/product/list";
	}

	@GetMapping("/product/edit/{idProduct}")
	public String edit(@PathVariable("idProduct") Integer id, Model model) {
		Optional<Product> productOptional = dao.findById(id);
		if (productOptional.isPresent()) {
			Product product = productOptional.get();
			model.addAttribute("product", product);
			model.addAttribute("products", dao.findAll());
			model.addAttribute("categories", daoCate.findAll());
			model.addAttribute("selectedCategoryId", String.valueOf(product.getCategory().getIdCategory()));
			return "/product/layout";
		} else {
			// Xử lý trường hợp không tìm thấy sản phẩm với id cung cấp
			// Ví dụ: redirect hoặc hiển thị thông báo lỗi
			return "/error";
		}
	}

}
