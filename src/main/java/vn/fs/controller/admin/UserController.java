package vn.fs.controller.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.fs.entities.User;
import vn.fs.repository.UserRepository;

/**
 * @author DongTHD
 *
 */
@Controller
public class UserController{

	@Autowired
	UserRepository userRepository;

	@GetMapping(value = "/admin/users")
	public String customer(Model model, Principal principal) {
		
		User user = userRepository.findByEmail(principal.getName());
		model.addAttribute("user", user);
		
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		
		return "/admin/users";
	}
	
	 @PostMapping(value = "/admin/users/{userId}/lock")
	    public String lockUser(@PathVariable("userId") Long userId) {
	        User user = userRepository.findById(userId).orElse(null);
	        if (user != null) {
	            user.setStatus(false); // Khóa tài khoản
	            userRepository.save(user);
	        }
	        return "redirect:/admin/users";
	    }

	    @PostMapping(value = "/admin/users/{userId}/unlock")
	    public String unlockUser(@PathVariable("userId") Long userId) {
	        User user = userRepository.findById(userId).orElse(null);
	        if (user != null) {
	            user.setStatus(true); // Mở khóa tài khoản
	            userRepository.save(user);
	        }
	        return "redirect:/admin/users";
	    }
}
