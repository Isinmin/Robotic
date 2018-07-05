<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 29.10.2017
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="productCard">
    <a href="${pageContext.request.contextPath}/item?id=<%=item.getId()%>&lang=<%=lang%>">
        <img src="<%=url%>">

    <div class="robotName">
        <div class="textPosition">
            <h1> <%=productName%> </h1>

            <%=description%>

        </div>

    </div>
    </a>
    <div class="greyBlock"> <div class="order"><h5> <%=price%> </h5><br>
        <a href="${pageContext.request.contextPath}/ProductCart.jsp?add=<%=item.getId()%>&lang=<%=lang%>" class="buy"><%=shopResources.getString("buy")%></a></div></div>

</div>


