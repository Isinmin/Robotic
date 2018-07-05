<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 21.11.2017
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>
<%@ page import="edu.etu.web.OrderEntity" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="lang" value="${util:getLang(pageContext.request, pageContext.response)}"/>
<fmt:setLocale value="${lang}"/>

<c:if test="${empty sessionScope.purchaces || empty sessionScope.username ||empty param.address || empty param.delivery}">
    <c:redirect url="/"/>
</c:if>


<jsp:useBean class="edu.etu.web.OrderEntity" id="order"/>
<jsp:setProperty name="order" property="user" value="${sessionScope.username}"/>
<jsp:setProperty name="order" property="address" value="${param.address}"/>
<jsp:setProperty name="order" property="delivery" value="${param.delivery}"/>
<jsp:setProperty name="order" property="cart" value="${OrderEntity.encodeCartString(sessionScope.purchaces)}"/>
<jsp:useBean id="now" class="java.util.Date"/>
<jsp:setProperty name="order" property="date" value="${now}"/>

<util:saveOrder value="${order}"/>
<c:remove var="purchaces"/>


<!DOCTYPE html>
<html>
<head>
    <title>Магазин робототехники</title>
    <link href="/static/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/static/css/slon.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="position">
<jsp:include page="/header.jsp"></jsp:include>
    <h1>  <fmt:setBundle basename="langs"/>
        <fmt:message key="ordered"/></h1>
</div>
</body>
</html>
