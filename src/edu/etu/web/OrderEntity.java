package edu.etu.web;

import org.hibernate.Session;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "ORDERS")
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;

    @Column(name = "USER", nullable = false)
    private String user;

    @Column(name = "CART", nullable = false)
    private String cart;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "DATE")
    private Date date;

    @Column(name = "DELIVERY", nullable = false)
    private boolean delivery;

    @Column(name = "ADDRESS", nullable = false)
    private String address;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCart() {
        return cart;
    }

    public void setCart(String cart) {
        this.cart = cart;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isDelivery() {
        return delivery;
    }

    public void setDelivery(boolean delivery) {
        this.delivery = delivery;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public static Map<String, Integer> decodeCartString(String query) {
        String[] params = query.split("&");
        Map<String, Integer> map = new HashMap<>();
        for (String param : params) {
            String[] split = param.split("=");
            String name = split[0];
            int value = Integer.parseInt(split[1]);
            map.put(name, value);
        }
        return map;
    }

    public static String encodeCartString(Map<String, Integer> cart) {
        StringJoiner encoded = new StringJoiner("&");

        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
            String entryEncoded = entry.getKey() + "=" + entry.getValue();
            encoded.add(entryEncoded);
        }

        return encoded.toString();
    }

    public static List<OrderEntity> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<OrderEntity> list = session.createCriteria(OrderEntity.class).list();
        session.close();
        return list;
    }

}
