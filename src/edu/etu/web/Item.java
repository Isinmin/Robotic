package edu.etu.web;

import java.io.Serializable;


public class Item implements Serializable {

    private String id;
    private String productTitle;
    private Integer price;
    private boolean charger;
    private String country;
    private String url;
    private boolean remoteController;
    private boolean accumulators;


    public Item() {
    }

    public boolean isAccumulators() {
        return accumulators;
    }

    public void setAccumulators(boolean accumulators) {
        this.accumulators = accumulators;
    }


    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }


    public boolean isRemoteController() {
        return remoteController;
    }

    public void setRemoteController(boolean remoteController) {
        this.remoteController = remoteController;
    }

    public boolean isCharger() {
        return charger;
    }

    public void setCharger(boolean charger) {
        this.charger = charger;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String _name) {
        productTitle = _name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


}
