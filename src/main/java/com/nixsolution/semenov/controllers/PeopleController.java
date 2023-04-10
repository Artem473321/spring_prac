package main.java.com.nixsolution.semenov.controllers;

import com.nixsolution.semenov.dao.PersonDAO;
import com.nixsolution.semenov.dao.RoleDAO;
import com.nixsolution.semenov.models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;

@Controller
@RequestMapping("/people")
public class PeopleController {

    private final PersonDAO personDAO;
    private final RoleDAO roleDAO;
//    private final PersonValidator personValidator;

    @Autowired
    public PeopleController(PersonDAO personDAO, RoleDAO roleDAO) {
        this.personDAO = personDAO;
        this.roleDAO = roleDAO;
    }

    @GetMapping()
    public String index(Model model){
        model.addAttribute("people", personDAO.index());
        model.addAttribute("localDate", new Date());
        System.out.println(roleDAO.findById(1));
        model.addAttribute("roleDAO", roleDAO);
        return "/people/index";
    }

    @GetMapping("/{id}")
    public String show(@PathVariable("id") int id, Model model){
        model.addAttribute("person", personDAO.findById(id));
        return "/people/show";
    }

    @GetMapping("/new")
    public String newPerson(@ModelAttribute("person") Person person, Model model){
        model.addAttribute("person", person);
        model.addAttribute("user", "");
        model.addAttribute("path", "/people");
        model.addAttribute("doOperation", "Create");
        model.addAttribute("operation", "Create person");
        return "people/new";
    }

    @PostMapping()
    public String create(@ModelAttribute("person") @Valid Person person, BindingResult bindingResult){
        System.out.println(12312312);
        personDAO.save(person);
        return "redirect:/people";
    }

    @GetMapping("/{id}/edit")
    public String edit(Model model, @PathVariable("id") int id){
        model.addAttribute("person", personDAO.findById(id));
        model.addAttribute("readonly", "true");
        model.addAttribute("path", "/people/" + id);
        model.addAttribute("method", "PATCH");
        model.addAttribute("user", personDAO.findById(id));
        model.addAttribute("doOperation", "Update");
        model.addAttribute("operation", "Edit " + personDAO.findById(id).getFirst_name());
        return "people/new";
    }

    @PatchMapping("/{id}")
    public String update(@ModelAttribute("person") @Valid Person person, BindingResult bindingResult, @PathVariable("id") int id){
//        personValidator.validate(person, bindingResult);
//        if (bindingResult.hasErrors()){
//            System.out.println(Objects.requireNonNull(bindingResult.getFieldError()).toString());
//            return "people/edit";
//        }
        personDAO.update(id,person);
        return "redirect:/people";
    }
    @DeleteMapping("/{id}")
    public String delete(@PathVariable("id") int id){
        personDAO.delete(id);
        return "redirect:/people";
    }

    @GetMapping("/person/logout")
    public String logout(){
        return "redirect:/";
    }
}
