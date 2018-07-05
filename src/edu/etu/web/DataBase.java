package edu.etu.web;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class DataBase implements Serializable {
    private static Map<String, Item> items = new HashMap<>();

    public static void addItem(Item item) {
        items.put(item.getId(), item);
    }

    public static Map<String, Item> getAllItems() {
        return items;
    }

}
