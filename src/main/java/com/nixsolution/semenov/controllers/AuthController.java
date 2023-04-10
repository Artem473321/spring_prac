package main.java.com.nixsolution.semenov.controllers;

import com.nixsolution.semenov.dao.PersonDAO;
import com.nixsolution.semenov.dao.RoleDAO;
import com.nixsolution.semenov.models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {
    private final PersonDAO personDAO;
    private final RoleDAO roleDAO;

    @Autowired
    public AuthController(PersonDAO personDAO, RoleDAO roleDAO) {
        this.personDAO = personDAO;
        this.roleDAO = roleDAO;
    }

    @GetMapping()
    public String login(@ModelAttribute("person") Person person, Model model){
        model.addAttribute("people", personDAO.index());
        return "auth/login";
    }
}
