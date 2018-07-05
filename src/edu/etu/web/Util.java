package edu.etu.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class Util {
    public static String getLang(HttpServletRequest request,
                                 HttpServletResponse response) {
        final Map<String, String[]> params = request.getParameterMap();
        final Map<String, Cookie> cookies = Util.mapCookiesByName(request.getCookies());

        String lang = "";
        if (!params.containsKey("lang")) {
            if (cookies.containsKey("lang")) {
                lang = cookies.get("lang").getValue();
            } else {
                lang = "ru";
            }
        } else {
            lang = params.get("lang")[0];
        }
        response.addCookie(new Cookie("lang", lang));
        return lang;
    }


    public static Map<String, Cookie> mapCookiesByName(Cookie[] cookies) {
        final HashMap<String, Cookie> cookiesMap = new HashMap<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookiesMap.put(cookie.getName(), cookie);
            }
        }
        return cookiesMap;
    }

    public static Map<String, Cookie> cookiesFromFilters(ItemFilter filter) {
        final HashMap<String, Cookie> cookieHashMap = new HashMap<>();

        final Integer cookieTime = 300;

        cookieHashMap.put("price_min", new Cookie("price_min", filter.getPriceMin().toString()));
        cookieHashMap.put("price_max", new Cookie("price_max", filter.getPriceMax().toString()));
        cookieHashMap.put("country", new Cookie("country", filter.getCountry()));
        cookieHashMap.put("remote_controller", new Cookie("remote_controller", filter.isRemoteController().toString()));
        cookieHashMap.put("charger", new Cookie("charger", filter.isCharger().toString()));
        cookieHashMap.put("accumulators", new Cookie("accumulators", filter.isAccumulators().toString()));

        for (Map.Entry<String, Cookie> entry : cookieHashMap.entrySet()) {
            entry.getValue().setMaxAge(cookieTime);
        }

        return cookieHashMap;
    }
}
