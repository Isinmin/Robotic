<%@ page import="edu.etu.web.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="spotspotspot" class="edu.etu.web.Item" scope="application" />
<jsp:useBean id="kozmokozmokozmo" class="edu.etu.web.Item" scope="application" />
<jsp:useBean id="r2d2r2d2r2d2" class="edu.etu.web.Item" scope="application" />

<jsp:setProperty name="kozmokozmokozmo" property="id" value="kozmokozmokozmo" />
<jsp:setProperty name="kozmokozmokozmo" property="productTitle" value="Kozmo" />
<jsp:setProperty name="kozmokozmokozmo" property="url" value="/static/robotsImg/kozmo.jpg" />
<jsp:setProperty name="kozmokozmokozmo" property="price" value="19000" />
<jsp:setProperty name="kozmokozmokozmo" property="country" value="China" />
<jsp:setProperty name="kozmokozmokozmo" property="charger" value="false" />
<jsp:setProperty name="kozmokozmokozmo" property="remoteController" value="true" />
<jsp:setProperty name="kozmokozmokozmo" property="accumulators" value="true" />

<jsp:setProperty name="spotspotspot" property="id" value="spotspotspot" />
<jsp:setProperty name="spotspotspot" property="productTitle" value="Spot" />
<jsp:setProperty name="spotspotspot" property="url" value="/static/robotsImg/spot.jpg" />
<jsp:setProperty name="spotspotspot" property="price" value="99999" />
<jsp:setProperty name="spotspotspot" property="country" value="USA" />
<jsp:setProperty name="spotspotspot" property="charger" value="false" />
<jsp:setProperty name="spotspotspot" property="remoteController" value="false" />
<jsp:setProperty name="spotspotspot" property="accumulators" value="true" />

<jsp:setProperty name="r2d2r2d2r2d2" property="id" value="r2d2r2d2r2d2" />
<jsp:setProperty name="r2d2r2d2r2d2" property="productTitle" value="R2D2" />
<jsp:setProperty name="r2d2r2d2r2d2" property="url" value="/static/robotsImg/r2d2.jpg" />
<jsp:setProperty name="r2d2r2d2r2d2" property="price" value="35000" />
<jsp:setProperty name="r2d2r2d2r2d2" property="country" value="China" />
<jsp:setProperty name="r2d2r2d2r2d2" property="charger" value="true" />
<jsp:setProperty name="r2d2r2d2r2d2" property="remoteController" value="true" />
<jsp:setProperty name="r2d2r2d2r2d2" property="accumulators" value="true" />

<%
    DataBase.addItem(kozmokozmokozmo);
    DataBase.addItem(spotspotspot);
    DataBase.addItem(r2d2r2d2r2d2);
%>


