package main.java.com.nixsolution.semenov.dao;

import com.nixsolution.semenov.models.Role;
import lombok.extern.log4j.Log4j;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Log4j
@Component
public class RoleDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public RoleDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Transactional
    public Role findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return (Role) session
                    .createQuery("FROM Role R WHERE R.id = " + id)
                    .uniqueResult();
        }
    }
}
