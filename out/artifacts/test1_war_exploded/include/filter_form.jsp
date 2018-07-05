<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 01.11.2017
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String ref = request.getHeader("referer");
    boolean firstVisit = (ref == null);
    final Map<String, Cookie> userCookies = firstVisit ? cookies : Util.cookiesFromFilters(filter);

    Integer priceMin = 0;
    Integer priceMax = 1000000;
    String country = userCookies.getOrDefault("country", new Cookie("country", "any")).getValue();

    Boolean remoteController = Boolean.parseBoolean(userCookies.getOrDefault("remote_controller", new Cookie("remote_controller", "false")).getValue());
    Boolean accumulators = Boolean.parseBoolean(userCookies.getOrDefault("accumulators", new Cookie("accumulators", "false")).getValue());
    Boolean charger = Boolean.parseBoolean(userCookies.getOrDefault("charger", new Cookie("charger", "false")).getValue());

    try {
        priceMin = Integer.parseInt(userCookies.getOrDefault("price_min", new Cookie("price_min", "0")).getValue());
    } catch (NumberFormatException ignored) {
    }

    try {
        priceMax = Integer.parseInt(userCookies.getOrDefault("price_max", new Cookie("price_max", "1000000")).getValue());
    } catch (NumberFormatException ignored) {
    }
%>

<form method="GET" id="filter">
    <h3> <%=shopResources.getString("parameters")%></h3>
    <div style="float: left">
        <p><%=shopResources.getString("price")%>:
            <input id="price_min" type="text" style="width: 125px" name="price_min" value="<%=priceMin%>">
             <%=shopResources.getString("do") %>
            <input id="price_max" type="text" style="width: 124px" name="price_max" value="<%=priceMax%>">
        </p>
        <p>  <%=shopResources.getString("roboticCountry") %>
            <select id="country" name="country">
                <option <% if (country.equalsIgnoreCase("any")) { %> selected <% } %> value="any"> <%=shopResources.getString("any") %></option>
                <option <% if (country.equalsIgnoreCase("China")) { %> selected <% } %> value="China"> <%=shopResources.getString("china") %></option>
                <option <% if (country.equalsIgnoreCase("USA")) { %> selected <% } %> value="USA"> <%=shopResources.getString("usa") %></option>
            </select>
        </p>

    </div>
    <p style="float: left; margin-left: 30px;">
        <b> <%=shopResources.getString("equipment") %></b>
        <br/>
        <input id="remote_controller" <% if (remoteController) { %> checked <% } %> type="checkbox" name="remoteController"><%=shopResources.getString("control") %>
        <br/>
        <input id="accumulators" <% if (accumulators) { %> checked <% } %> type="checkbox" name="remote_controller" value="true" onclick="setCheckParam(this)"><%=shopResources.getString("accumulators") %>
        <br/>
        <input id="charger" <% if (charger) { %> checked <% } %> type="checkbox" name="charger" value="true" onclick="setCheckParam(this)"><%=shopResources.getString("charger") %>
    </p>

    <input style="width: 90px; height: 50px; margin-left: 30px " type="button" onclick="applyFilters()" value="<%=shopResources.getString("apply") %>">
    <script>
        if(<%=firstVisit%>) {
            applyFilters();
        }
    </script>
</form>
