<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 20.11.2017
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util"%>
<%@ page import="edu.etu.web.OrderEntity" %>
<%@ page import="edu.etu.web.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="itemsMap" value="${DataBase.getAllItems()}" scope="request"/>

<c:set var="lang" value="${util:getLang(pageContext.request, pageContext.response)}"/>
<fmt:setLocale value="${lang}"/>

<html>
<head>
    <title>Profile</title>
    <link href="/static/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/static/css/slon.css" rel="stylesheet" type="text/css">
    <script>
        function changeLang(lang) {
            window.location.href="?lang=" + lang;
        }
        function loadComments() {
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = () => {
                if (xhr.readyState === 4) {
                    document.getElementsByClassName("comments_container")[0].innerHTML = xhr.responseText;
                }
            };

            xhr.open("GET", "/comment", true);
            xhr.send();
        }

        function postComment() {
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = () => {

                if (xhr.readyState === 4) {
                    document.getElementsByName("comment_text")[0].value = "";
                    loadComments();
                }
            };

            xhr.open("POST", "/comment", true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send("text=" + encodeURIComponent(document.getElementsByName("comment_text")[0].value));
        }

        onload = () => {
            loadComments();
        }

    </script>

</head>
<body>
<div class="position">
<jsp:include page="header.jsp"></jsp:include>
    <iframe style="float: right; margin: 20px" frameborder="no" scrolling="no" width="280" height="150" src="https://yandex.ru/time/widget/?geoid=2&lang=ru&layout=horiz&type=analog&face=serif"></iframe>
<b>${sessionScope.username}</b>
<b>activeTab = ${initParam.firstTab}

    <br>
    <br>
    <fmt:setBundle basename="langs"/>
    <fmt:message key="orders"/>
    <br>
    <br>


    <div class="items_container">
        <c:forEach var="order" items="${OrderEntity.getAll()}">
            <c:if test="${order.user eq sessionScope.username}">
                <div class="orders_item">
                    <ul>
                        <li>
                            <b>
                                <fmt:setBundle basename="langs"/>
                                <fmt:message key="kind"/>
                                <c:choose>
                                    <c:when test="${order.delivery}">
                                        <fmt:setBundle basename="langs"/>
                                        <fmt:message key="courrier"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:setBundle basename="langs"/>
                                        <fmt:message key="byThemself"/>
                                    </c:otherwise>
                                </c:choose>
                            </b>
                        </li>
                        <li>
                            <b>
                                <fmt:setBundle basename="langs"/>
                                <fmt:message key="address"/>: ${order.address}
                            </b>
                        </li>
                        <li>
                            <b>
                                <fmt:setBundle basename="langs"/>
                                <fmt:message key="timeOfOrder"/>: ${order.address}:
                                <fmt:formatDate value="${order.date}" type="both"/>
                            </b>
                        </li>
                        <li>
                            <b>
                                <fmt:setBundle basename="langs"/>
                                <fmt:message key="goods"/>:
                            </b>
                            <ul style="list-style: square;">

                                <c:forEach var="orderMapEntry" items="${OrderEntity.decodeCartString(order.cart)}">
                                    <c:if test="${itemsMap.containsKey(orderMapEntry.key)}">
                                        <c:set var="orderItem"
                                               value="${requestScope.itemsMap.get(orderMapEntry.key)}"/>
                                        <li>
                                            <b>
                                                <a href="/item?id=${orderItem.id}">
                                                    <fmt:setBundle basename="${orderItem.id}"/>
                                                    <fmt:message key="robotName"/>
                                                </a> - ${orderMapEntry.value}  <fmt:setBundle basename="langs"/>
                                                <fmt:message key="pieces"/>:
                                            </b>
                                        </li>
                                    </c:if>
                                </c:forEach>

                            </ul>
                        </li>
                    </ul>
                </div>
                <br>
            </c:if>
        </c:forEach>
    </div>

    <fmt:setBundle basename="langs"/>
    <fmt:message key="comments"/>: <br>
    <br>
    <div class="comments_container" style="margin-top: 50px">

    </div>


    <textarea  name="comment_text"></textarea>
    <br>

    <button onclick="postComment()">
        Post comment
    </button>


    </div>


</b>
</div>
</body>
</html>
