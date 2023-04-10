package main.java.com.nixsolution.semenov.dao;

import com.nixsolution.semenov.dao.HibernateUtil;
import com.nixsolution.semenov.models.Person;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

@Log4j
@Component
public class PersonDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public PersonDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
        try {
            ClassLoader classloader = Thread.currentThread().getContextClassLoader();
            InputStream is = classloader.getResourceAsStream("ddl.sql");
            InputStreamReader streamReader = new InputStreamReader(is);
            ScriptRunner sr = new ScriptRunner(((SessionImpl) sessionFactory.openSession()).getJdbcConnectionAccess().obtainConnection());
            Reader reader = new BufferedReader(streamReader);
            sr.runScript(reader);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Transactional
    public List<Person> index() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("SELECT a FROM Person a", Person.class).getResultList();

    }

    @Transactional
    public void save(Person person) {
        Session session = sessionFactory.getCurrentSession();
        System.out.println(person);
        session.persist(person);
    }

    @Transactional
    public void update(int id, Person updatedPerson) {
        try(Session session = sessionFactory.openSession()){
            updatedPerson.setUser_id(id);
            System.out.println(updatedPerson);
            session.update(updatedPerson);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(findById(id));
    }

    @Transactional
    public Person findById(int id) {
        return (Person) sessionFactory
                .getCurrentSession()
                .createQuery("FROM Person U WHERE U.id = " + id)
                .uniqueResult();
    }

    @Transactional
    public Person findByLogin(String login) {
        return (Person) sessionFactory
                .getCurrentSession()
                .createQuery("FROM Person U WHERE U.login = '" + login + "'")
                .uniqueResult();
    }
}