package edu.etu.web;

import edu.etu.web.HibernateUtil;
import edu.etu.web.OrderEntity;
import org.hibernate.Session;

import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SaveOrderTag extends SimpleTagSupport {

    private OrderEntity value;

    public void setValue(OrderEntity value) {
        this.value = value;
    }

    public void doTag() {
        Session dbSession = HibernateUtil.getSessionFactory().openSession();
        dbSession.beginTransaction();
        dbSession.save(value);
        dbSession.getTransaction().commit();
        dbSession.close();
    }
}
