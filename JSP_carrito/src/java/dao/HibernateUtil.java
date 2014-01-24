/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author postal
 */
public class HibernateUtil {
    private static final SessionFactory sFactory;
    
    static {
        try {
            sFactory = new Configuration().configure().buildSessionFactory();
        } catch (HibernateException he) {
            he.printStackTrace();
            throw he;
        }
    }
    
    public static SessionFactory getSFactory() {
        return sFactory;
    } 
}
