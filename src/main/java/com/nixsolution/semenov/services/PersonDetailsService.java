package main.java.com.nixsolution.semenov.services;

import com.nixsolution.semenov.dao.PersonDAO;
import com.nixsolution.semenov.models.Person;
import com.nixsolution.semenov.security.PersonDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PersonDetailsService implements UserDetailsService {
    private final PersonDAO personDAO;

    @Autowired
    public PersonDetailsService(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }


    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Optional<Person> person = Optional.ofNullable(personDAO.findByLogin(s));
        System.out.println(person);
        if (person.isEmpty()){
            throw new UsernameNotFoundException("User not found!");
        }
        return new PersonDetails(person.get());
    }
}
