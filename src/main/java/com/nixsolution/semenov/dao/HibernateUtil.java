package main.java.com.nixsolution.semenov.dao;

import lombok.extern.log4j.Log4j;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.h2.tools.RunScript;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.internal.SessionImpl;

import java.io.*;
import java.sql.SQLException;
import java.util.Objects;

@Log4j
public abstract class HibernateUtil {
    private static SessionFactory sessionFactory;
    static {
        sessionFactory = getSessionFactory();
        try {
            ClassLoader classloader = Thread.currentThread().getContextClassLoader();
            InputStream is = classloader.getResourceAsStream("ddl.sql");
            InputStreamReader streamReader = new InputStreamReader(is);
            ScriptRunner sr = new ScriptRunner(((SessionImpl) HibernateUtil.getSession()).getJdbcConnectionAccess().obtainConnection());
            Reader reader = new BufferedReader(streamReader);
            sr.runScript(reader);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                return sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
    public static Session getSession(){
        return getSessionFactory().openSession();
    }
}
