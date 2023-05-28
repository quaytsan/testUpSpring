package poly.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;
import poly.edu.DAO.CategoryDAO;
import poly.edu.model.Category;
import poly.edu.service.ParamService;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO dao;
	@Autowired
	ParamService param; 
	
	@GetMapping("/category/list")
	public String showCategory(Model model) {
		model.addAttribute("category",new Category());
		model.addAttribute("categorys",dao.findAll());
		return "/category/layout";
	}
	
	@RequestMapping("/category/save")
	public String save(@Valid @ModelAttribute("category") Category category, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "/category/layout";
		}

		dao.save(category);
		return "redirect:/category/list";
	}
	
	@GetMapping("/category/edit/{idCategory}")
	public String edit(@PathVariable("idCategory") String id, Model model) {
		model.addAttribute("category",dao.findById(id));
		model.addAttribute("categorys",dao.findAll());
		return "/category/layout";
	}
	
	@GetMapping("/category/remove/{idCategory}")
	public String remove(@PathVariable("idCategory") String id, Model model) {
		dao.deleteById(id);
		return "redirect:/category/list";
	}
}
