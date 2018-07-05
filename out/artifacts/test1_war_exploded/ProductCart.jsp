<%@ page import="edu.etu.web.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>

<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>
<c:if test="${empty sessionScope.purchaces}">
    <jsp:useBean id="cartMap" class="java.util.HashMap" scope="request"/>
    <c:set var="purchaces" scope="session" value="${cartMap}"/>
</c:if>
<c:set var="itemsMap" value="${DataBase.getAllItems()}" scope="request"/>
<c:if test="${not empty param.add}">
    <c:if test="${empty sessionScope.purchaces[param.add]}">
        <c:set target="${purchaces}" property="${param.add}" value="${0}"/>
    </c:if>
    <c:set target="${purchaces}" property="${param.add}" value="${sessionScope.purchaces[param.add] + 1}"/>
</c:if>
<c:if test="${not empty param.setcountid && not empty param.setcountq}">
    <c:catch var="parseerror">
        <fmt:parseNumber var="setcountqparsed" integerOnly="false" value="${param.setcountq}"/>
    </c:catch>
    <c:if test="${parseerror == null && setcountqparsed > 0}">
        <c:set target="${purchaces}" property="${param.setcountid}" value="${setcountqparsed}"/>
    </c:if>
</c:if>
<c:if test="${not empty param.remove}">
    <c:set target="${purchaces}" property="${param.remove}" value="${null}"/>
</c:if>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        <fmt:setBundle basename="langs"></fmt:setBundle>
        <fmt:message key="title"></fmt:message></title>
    <link href="/static/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/static/css/slon.css" rel="stylesheet" type="text/css">
    <script>
        function setCount(id) {
            window.location.href = "/ProductCart.jsp?setcountid=" + id + "&setcountq=" + document.getElementById(id + '_count').value;
        }
        function changeLang(lang) {
            window.location.href="?lang=" + lang;
        }
    </script>
</head>

<body>
<div class="position">

    <jsp:include page="header.jsp"></jsp:include>
    <div style="margin: 20px">
        <h1>
        <fmt:setBundle basename="langs"></fmt:setBundle>
        <fmt:message key="order"></fmt:message>: <b>
        <c:set var="totalCost" scope="request" value="0"/>
        <c:forEach var="purchace" items="${sessionScope.purchaces}">
            <c:if test="${requestScope.itemsMap.containsKey(purchace.key)}">
                <c:set scope="request" var="item" value="${requestScope.itemsMap.get(purchace.key)}"/>
                <c:set var="totalCost" scope="request"
                       value="${totalCost + requestScope.item.getPrice() * purchace.value}"/>
            </c:if>
        </c:forEach>
        ${totalCost}

    </b>
            <a href="/order_delivery.jsp"><div class="buy" style="margin: 20px; padding: 5px ">
                <fmt:setBundle basename="langs"></fmt:setBundle>
                <fmt:message key="buyAll"></fmt:message></div></a>

        </h1>
    </div>

    <c:if test="${not empty sessionScope.purchaces}">
    <c:forEach var="purchace" items="${sessionScope.purchaces}">
    <c:if test="${requestScope.itemsMap.containsKey(purchace.key)}">
    <c:set scope="request" var="item" value="${requestScope.itemsMap.get(purchace.key)}"/>

    <div class="productCard">
        <img src="${requestScope.item.getUrl()}">
        <div class="robotName">
            <div class="textPosition">
                <h1> <fmt:setBundle basename="${requestScope.item.getId()}_${util:getLang(pageContext.request, pageContext.response)}"></fmt:setBundle>
                    <fmt:message key="robotName"></fmt:message> </h1>
                <div style="padding: 10px">
                    <input value="${purchace.value}" id="${item.getId()}_count" placeholder="количество" style=" font-size: 20px; display: inline-block; width: 120px; padding: 5px" >
                    <button onclick="setCount('${item.getId()}')" style="font-size: 20px; padding: 5px">✓</button></div>

            </div>


        </div>
        <div class="greyBlock"> <div class="order"><h5>${item.getPrice() * purchace.value}</h5><br>
            <a href="${pageContext.request.contextPath}/ProductCart.jsp?remove=${requestScope.item.getId()}&lang=${util:getLang(pageContext.request, pageContext.response)}" class="buy">  <fmt:setBundle basename="langs"></fmt:setBundle>
                <fmt:message key="delete"></fmt:message></a></div></div>
    </div>
    </c:if></c:forEach></c:if>

</div>


</body>
</html>