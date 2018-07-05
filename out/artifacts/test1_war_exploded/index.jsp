<%@ page import="edu.etu.web.Item" %>
<%@ page import="edu.etu.web.ItemFilter" %>
<%@ page import="edu.etu.web.Util" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 29.10.2017
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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

    Locale locale = new Locale.Builder().setLanguage(lang).build();

    ItemFilter filter = new ItemFilter(params);
    for (Map.Entry<String, Cookie> entry : Util.cookiesFromFilters(filter).entrySet()) {
        Cookie cookie = entry.getValue();
        response.addCookie(cookie);
    }
    ResourceBundle shopResources = ResourceBundle.getBundle("langs", locale);

%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Магазин робототехники</title>
    <link href="/static/css/styles.css" type="text/css" rel="stylesheet">
    <jsp:include page="db.jsp"/>

    <script type="text/javascript">

        function applyFilters(params = "?") {
            let priceMin = document.getElementById("price_min").value;
            let priceMax = document.getElementById("price_max").value;
            let remoteController = document.getElementById("remote_controller").checked;
            let charger = document.getElementById("charger").checked;
            let accumulators = document.getElementById("accumulators").checked;



            params += "&price_min=" + priceMin +
                "&price_max=" + priceMax;


            let country = document.getElementById("country").value;

            if (country !== "any") {
                params += "&country=" + country;
            }

            params += "&remote_controller=" + remoteController;
            params += "&charger=" + charger;
            params += "&accumulators=" + accumulators;

            window.location.href = params;
        }
        function changeLang(lang) {
            applyFilters("?lang=" + lang);
        }

    </script>

</head>
<body>
<div class="position">

    <!--
    <header>
        <div class="hat"></div>
        <div class="userPanel">
            <div class="local">
                <a onclick="changeLang('ru')"><img src="static/langPic/russ.png"></a>
                <a onclick="changeLang('en')"><img src="static/langPic/eng.png"></a>
                <a onclick="changeLang('fr')"><img src="static/langPic/fr.png"></a>
            </div>
            <a href="#" class="btn red"><%= shopResources.getString("login")%></a></div>
    </header>
    <nav>
        <a href=./ProductCart.jsp> <%=shopResources.getString("basket")%> </a>
        <a> <%=shopResources.getString("history")%> </a>
    </nav>-->
 <jsp:include page="/header.jsp"></jsp:include>

    <div style="margin-bottom: 50px">
        <%@ include file="include/filter_form.jsp" %>
    </div>


    <%
        for (Map.Entry<String, Item> itemPageEntry : filter.getFilteredItems().entrySet()) {
            Item item = itemPageEntry.getValue();
            String productName = item.getProductTitle();
            String url = item.getUrl();
            ResourceBundle itemResources = ResourceBundle.getBundle(item.getId(), locale);
            String description = itemResources.getString("description");
            Integer price = item.getPrice();
    %>
    <%@include file="listItem.jsp" %>
    <%
        }
    %>

</div>


</body>
</html>

