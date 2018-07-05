<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 13.11.2017
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>

<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>

    <header>
        <a href="/" style="text-decoration: none">
            <div class="hat"></div>
        </a>

        <div class="userPanel">
            <div class="local">
                <a onclick="changeLang('ru')"><img src="/static/langPic/russ.png"></a>
                <a onclick="changeLang('en')"><img src="/static/langPic/eng.png"></a>
                <a onclick="changeLang('fr')"><img src="/static/langPic/fr.png"></a>
            </div>

            <c:choose>
                <c:when test="${empty sessionScope.username}">
                    <a href="/login" class="btn red">
                        <fmt:setBundle basename="langs"></fmt:setBundle>
                        <fmt:message key="login"></fmt:message></a>
                </c:when>
                <c:otherwise>
                    <div style="margin-left:35px; width: 200px">
                    <b>${sessionScope.username}</b>
                    <a href="/profile.jsp">  <fmt:setBundle basename="langs"></fmt:setBundle>
                        <fmt:message key="Profile"></fmt:message></a>
                    <a href="/logout">  <fmt:setBundle basename="langs"></fmt:setBundle>
                        <fmt:message key="Logout"></fmt:message></a>
                    </div>
                </c:otherwise>
            </c:choose>

            </div>
    </header>
    <nav>

        <a href=./ProductCart.jsp>

            <fmt:setBundle basename="langs"></fmt:setBundle>
            <fmt:message key="basket"></fmt:message>
        </a>

        <a> <fmt:setBundle basename="langs"></fmt:setBundle>
            <fmt:message key="history"></fmt:message> </a>
    </nav>