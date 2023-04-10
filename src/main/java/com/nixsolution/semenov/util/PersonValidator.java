package main.java.com.nixsolution.semenov.util;

import com.nixsolution.semenov.dao.PersonDAO;
import com.nixsolution.semenov.models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class PersonValidator implements Validator {

    private final PersonDAO personDAO;

    @Autowired
    public PersonValidator(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Person.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
//        Person person = (Person) o;
//
//        if (personDAO.show(person.getEmail()).isPresent()) {
//            System.out.println(123);
//            errors.rejectValue("email", "", "This email is already in use");
//        }
//
//        // Проверяем, что у человека имя начинается с заглавной буквы
//        // Если имя не начинается с заглавной буквы - выдаем ошибку
//        if (!Character.isUpperCase(person.getFirst_name().codePointAt(0)))
//            System.out.println(456);
//            errors.rejectValue("first_name", "", "Name should start with a capital letter");
    }
}
