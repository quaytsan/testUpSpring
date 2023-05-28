package poly.edu.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import poly.edu.DAO.AccountDAO;
import poly.edu.model.Account;
import poly.edu.service.ParamService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService param;

	@Autowired
	ServletContext app;

	@GetMapping("/account/list")
	public String showList(Model model) {
		model.addAttribute("account", new Account());
		model.addAttribute("accounts", dao.findAll());
		return "account/layout";
	}

	@RequestMapping("/account/save")
	public String createAccount(@Valid @ModelAttribute("account") Account account, BindingResult result,
	        @RequestParam("photo") MultipartFile photo, Model model) throws IOException {
	    String fileName = StringUtils.cleanPath(photo.getOriginalFilename());
	    if (!photo.isEmpty() || photo != null) {
	        try {
	            String uploadDir = app.getRealPath("/upload");
	            String filePath = Paths.get(uploadDir, fileName).toString();

	            Path path = Paths.get(filePath);
	            Files.copy(photo.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

	            // Gán tên ảnh cho thuộc tính photo của account
	            account.setPhoto(fileName);

	            System.out.println(account.toString());
	            model.addAttribute("dd", fileName); // Gửi tên file ảnh đến view
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        dao.save(account);
	    }

	    return "redirect:/account/list";
	}

//	@RequestMapping("/account/save")
//	public String createAccount(@Valid @ModelAttribute("account") Account account, BindingResult result,
//			@RequestParam("photo") MultipartFile photo, Model model
//			) throws IOException {
//		
//		
//		if (!photo.isEmpty()) {
//			String fileName = StringUtils.cleanPath(photo.getOriginalFilename());
//			// save the file on the local file system
//			try {
//				System.out.println(app.getRealPath(fileName));
//				Path path = Paths.get(app.getRealPath(fileName));
//				Files.copy(photo.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//				// System.out.print(path.toString());
//				String dd = photo.getOriginalFilename();
//
//				if (result.hasErrors()) {
//					System.out.println(account.toString());
//					model.addAttribute("message", "Some fields are not valid. Please fix them!");
//					return "/account/layout";
//				} else {
//		            model.addAttribute("dd",dd); // gọi ảnh ra bên form
//					dao.save(account);
//		            model.addAttribute("svdk", account); // hiển thị thông tin sv đăng ký bên form
//					model.addAttribute("message", "All fields are valid!");
//					
//				}
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else {
//			model.addAttribute("message", "Please upload your image");
//		}
//		return "redirect:/account/list";
//}

//		if (result.hasErrors()) {
//			System.out.println(account.toString());
//			return "/account/layout";
//		} 
//			String filename = StringUtils.cleanPath(multipartfile.getOriginalFilename());
//			String uploadDir = "/uploads";
//			account.setPhoto(filename);
//			dao.save(account);
//			param.save(multipartfile, uploadDir);
//			System.out.println(account.toString());
//		return "redirect:/account/list";

	@GetMapping("/account/remove/{username}")
	public String removeAccount(@PathVariable("username") String username, Model model) {
		dao.deleteById(username);
		return "redirect:/account/list";
	}

	@GetMapping("/account/edit/{username}")
	public String edit(@PathVariable("username") String username, Model model) {
		Optional<Account> account = dao.findById(username);
		if (account.isPresent()) {
			model.addAttribute("account", account);
		}
		model.addAttribute("accounts", dao.findAll());
		return "/account/layout";
	}

}
