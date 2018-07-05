package edu.etu.web;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Map;

public class ServletName extends HttpServlet {
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        final Map<String, String[]> params = request.getParameterMap();
        final Map<String, Cookie> cookies = Util.mapCookiesByName(request.getCookies());

        String lang = "unknown";
        if(!params.containsKey("lang")) {
            if(cookies.containsKey("lang")) {
                lang = cookies.get("lang").getValue();
            } else {
                lang = "ru";
            }
        }
        else {
            lang = params.get("lang")[0];
        }
        response.addCookie(new Cookie("lang", lang));

        String item_id = params.get("id")[0];
        Item item = DataBase.getAllItems().get(item_id);


        Locale locale = new Locale.Builder().setLanguage(lang).build();
        ResourceBundle resources = ResourceBundle.getBundle(item.getId(), locale);

        String description = getServletContext().getInitParameter("firstTab");
        StringBuilder sb = new StringBuilder();
        ResourceBundle shopResources = ResourceBundle.getBundle("langs", locale);

        PrintWriter out = response.getWriter();

        String first = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "\n" +
                "<head>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\n" +
                "    <title>\n" + resources.getString("mainDescription") + "</title>\n" +
                "    <meta charset=\"utf-8\"/>\n" +
                "    <link href=\"/static/css/styles.css\" rel=\"stylesheet\">\n" +
                "    <link href=\"/static/css/slon.css\" rel=\"stylesheet\"/>\n" +
                "    <script src=\"/static/js/slon.js\"></script>\n" +
                "  <script type=\"text/javascript\">" +
                "function changeLang(lang) {window.location.href=\"/item?id=" + item_id + "&lang=\" + lang;}" +
                "</script>"+
                "</head>\n" +
                "<body onload=\"defaultClick()\">\n" +
                "<div class=\"position\">\n";
        out.println(first);
        request.getRequestDispatcher("/header.jsp").include(request, response);

        String second =
                "<div class=\"tabsBlock\">\n" +
                "        <div id=\"description\" class=\"tabNotChecked\" onclick=\"displayWindow(this);checkTab(this)\"> "+shopResources.getString("desc")+"</div>\n" +
                "        <div id=\"characteristic\" class=\"tabNotChecked\" onclick=\"displayWindow(this);checkTab(this)\"> "+shopResources.getString("characteristic") +
                "        </div>\n" +
                "        <div id=\"reports\" class=\"tabNotChecked\" onclick=\"displayWindow(this);checkTab(this)\"> "+shopResources.getString("reports") +"</div>\n" +
                "\n" +
                "    </div>\n" +
                "\n" +
                "    <div class=\"window\">\n" +
                "\n" +
                "\n" +
                "        <div id=\"descriptionWindow\" class=\"displayWin\">\n" +
                "\n" +
                "\n" +
                "            <img class=\"photocard\" src=\"" + item.getUrl() +"\">\n" +
                "\n" +
                "\n" +
                "            <div class=\"cardText\">\n" +
                "                <h1>\n"+resources.getString("robotName")+"</h1>\n" +
                " <b>\n"+
                "                <p>\n" + resources.getString("mainDescription") +
                " </b>\n"+
                "                </p>\n" +
                "            </div>\n" +
                "\n" +
                "            <div class=\"buyItem\">\n" +
                "                <div class=\"mainOrder\">\n" +
                "                <h5>99 999 р.</h5>\n" +
                "                <a href=\"/ProductCart.jsp?add=" + item_id + "&lang=ru\" class=\"buy\">В корзину</a>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div id=\"characteristicWindow\" class=\"displayWin\">\n" +
                "            <div class=\"textOnly\">\n" +
                "\n" +
                "                <p>\n" +
                             resources.getString("char")+
                "                </p>\n" +
                "            </div>\n" +
                "\n" +
                "        </div>\n" +
                "        <div id=\"reportsWindow\" class=\"displayWin\">\n" +
                "            <div class=\"comment\">\n" +
                "                <h6>Анечка</h6>\n" +
                "               " +
                        resources.getString("com2")+

                "            </div>\n" +
                "            <div class=\"comment\">\n" +
                "                <h6>Иван</h6>\n" +
                resources.getString("com8")+

                "            </div>\n" +
                "            <div class=\"comment\">\n" +
                "                <h6>Колян2000</h6>\n" +
                                 resources.getString("com5")+
                "            </div>\n" +
                "            <div class=\"comment\">\n" +
                "                <h6>healthy</h6>\n" +
                             resources.getString("com2")+
                "            </div>\n" +
                "            <div class=\"comment\">\n" +
                "                <h6>Vladislav</h6>\n" +
                                resources.getString("com1")+
                "            </div>\n" +
                "\n" +
                "        </div>\n" +
                "\n" +
                "    </div>\n" +
                "\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>\n";


        //out.println(sb.toString());
        out.print(second);
        out.close();
    }
}