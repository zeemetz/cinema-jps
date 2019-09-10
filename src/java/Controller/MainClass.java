/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Bean.Movies;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.*;

/**
 *
 * @author KELVIN_THEOPHILUS
 */
public class MainClass {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    private Session session = HibernateUtil.getSessionFactory().openSession();
    
    private void connect(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }
    
    public List getMovies(){
        List data;
        data = session.createQuery("from Movies").list();
        return data;
    }
    
    public List getMoviesByDate(){
        List data;
        data = session.createQuery("from Movies").list();
        return data;
    }
    
    public void insert(Object obj){
        connect();
        try{
            session.beginTransaction().begin();
            session.save(obj);
            session.beginTransaction().commit();
        }catch(HibernateException ex){
            session.beginTransaction().rollback();
        }finally{
            session.close();
        }
    }
    
    public void updateMovies(){
        Transaction tr = session.beginTransaction();
        tr.begin();
        try {
            Query query = session.createQuery("update Movies set MovieName = :pName where MovieId = '1b176663-46f3-11e3-b1d3-c80aa9a0db' ");
            query.setParameter("pName", "Bagkettts");
            query.executeUpdate();
            tr.commit();
        } catch (Exception e) {
            tr.rollback();
        } finally {
            session.close();
        }
    }
    
    public List getData(String query, Class clas){
        List data;
        connect();
        session.getTransaction().begin();
        Query q = session.createSQLQuery(query).addEntity(clas);
        data = q.list();
        return data;
    }
    
    public int toInt(String word){
        return Integer.parseInt(word);
    }
    
    public Date toSQLDate(String str){
        try {
            java.util.Date dd = new SimpleDateFormat("yyyy-MM-dd").parse(str);
            Date temp = new Date(dd.getTime());
            return temp;
        } catch (Exception ex) {
           
        }
        return null;
    }
    
}
