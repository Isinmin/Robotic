package edu.etu.web;

import java.util.HashMap;
import java.util.Map;

public class ItemFilter {
    private Integer priceMin = 0;
    private Integer priceMax = 1000000;
    private String country = "any";
    private Boolean accumulators = false;
    private Boolean charger = false;
    private Boolean remoteController = false;

    public ItemFilter(Map<String, String[]> params) {
        if (params.containsKey("price_min")) {
            for (String s : params.get("price_min")) {
                try {
                    priceMin = Integer.parseInt(s);
                } catch (NumberFormatException e) {
                    priceMin = 0;
                }
            }
        }

        if (params.containsKey("price_max")) {
            for (String s : params.get("price_max")) {
                try {
                    priceMax = Integer.parseInt(s);
                } catch (NumberFormatException e) {
                    priceMax = 100000;
                }
            }
        }

        if (params.containsKey("country")) {
            for (String s : params.get("country")) {
                country = s;
            }
        }

        if (params.containsKey("remote_controller")) {
            for (String s : params.get("remote_controller")) {
                remoteController = Boolean.parseBoolean(s);
            }
        }

        if (params.containsKey("accumulators")) {
            for (String s : params.get("accumulators")) {
                accumulators = Boolean.parseBoolean(s);
            }
        }

        if (params.containsKey("charger")) {
            for (String s : params.get("charger")) {
                charger = Boolean.parseBoolean(s);
            }
        }
    }

    public Boolean isAccumulators() {
        return accumulators;
    }

    public void setAccumulators(Boolean accumulators) {
        this.accumulators = accumulators;
    }

    public Boolean isCharger() {
        return charger;
    }

    public void setCharger(Boolean charger) {
        this.charger = charger;
    }

    public Boolean isRemoteController() {
        return remoteController;
    }

    public void setRemoteController(Boolean remoteController) {
        this.remoteController = remoteController;
    }

    public Map<String, Item> getFilteredItems() {
        Map<String, Item> items = DataBase.getAllItems();
        Map<String, Item> filteredItems = new HashMap<>();
        for (Map.Entry<String, Item> itemEntry : items.entrySet()) {
            Item item = itemEntry.getValue();

            if ((item.getPrice() >= priceMin) && (item.getPrice() <= priceMax)
                    && (country.equals("any") || item.getCountry().equalsIgnoreCase(country))
                    && (!remoteController || item.isRemoteController())
                    && (!accumulators || item.isAccumulators())
                    && (!charger || item.isCharger())) {
                filteredItems.put(item.getId(), item);
            }
        }

        return filteredItems;
    }

    public Integer getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Integer priceMin) {
        this.priceMin = priceMin;
    }

    public Integer getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Integer priceMax) {
        this.priceMax = priceMax;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
