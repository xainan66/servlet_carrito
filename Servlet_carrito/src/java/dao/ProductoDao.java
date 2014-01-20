/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author postal
 */
public class ProductoDao {

    private Session sesion;
    private Transaction transaccion;

    public long guardar(Usuario p){
        long id = -1;
        try {
            sesion = HibernateUtil.getSFactory().openSession();
            transaccion = sesion.beginTransaction();
            id = (long) sesion.save(p);
            transaccion.commit();
        } catch (HibernateException he) {
            transaccion.rollback();
            he.printStackTrace();
        } finally {
            sesion.close();
        }
        return id;
    }
    
    public void actualizar(Usuario p) throws HibernateException{
        try {
            sesion = HibernateUtil.getSFactory().openSession();
            transaccion = sesion.beginTransaction();
            sesion.update(p);
            transaccion.commit();
        } catch (HibernateException he) {
            transaccion.rollback();
            throw new HibernateException("Error en el DAO");
        } finally {
            sesion.close();
        }
    }
    
    public void eliminar(Usuario p) throws HibernateException{
        try {
            sesion = HibernateUtil.getSFactory().openSession();
            transaccion = sesion.beginTransaction();
            sesion.delete(p);
            transaccion.commit();
        } catch (HibernateException he) {
            transaccion.rollback();
            throw new HibernateException("Error en el DAO");
        } finally {
            sesion.close();
        }
    }
    
    public Usuario obtenerUno(long id) throws HibernateException{
         Usuario p = null;
         try {
            sesion = HibernateUtil.getSFactory().openSession();            
            p=(Usuario)sesion.get(Usuario.class, id);
        } catch (HibernateException he) {
            throw new HibernateException("Error en el DAO");
        } finally {
            sesion.close();
        }
        return p;
    }
    
    public List<Usuario> obtenerTodos() throws HibernateException{
         List<Usuario> lista;
         try {
            sesion = HibernateUtil.getSFactory().openSession();
            lista=sesion.createQuery("from Usuarios").list();
        } catch (HibernateException he) {
            throw new HibernateException("Error en el DAO");
        } finally {
            sesion.close();
        }
        return lista;
    }
}
