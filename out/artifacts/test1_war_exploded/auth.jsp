<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 12.11.2017
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util" %>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<c:if test="${empty paramValues.lang_par}">
    <fmt:setLocale value="ru"/>
</c:if>
<c:if test="${param['lang_par'] eq 'ru'}">
    <fmt:setLocale value="ru"/>
</c:if>
<c:if test="${param['lang_par'] eq 'en'}">
    <fmt:setLocale value="en"/>
</c:if>
<c:if test="${param['lang_par'] eq 'fr'}">
    <fmt:setLocale value="fr"/>
</c:if>
<fmt:setBundle basename="edu.etu.web.lang"/>
<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/static/css/styles.css" type="text/css" rel="stylesheet">
    <link href="/static/css/formStyle.css" type="text/css" rel="stylesheet">
    <title>
        <fmt:setBundle basename="langs"/>
        <fmt:message key="Account"/>
    </title>
    <script>
        function changeLang(lang) {
            window.location.href="?lang=" + lang;
        }
    </script>
</head>
<body>
<div class="position">
<jsp:include page="header.jsp"/>
<section class="container">
    <div class="login">
        <h1>
            <fmt:setBundle basename="langs"/>
            <fmt:message key="Account"/>
        </h1>
        <form method="post" action="j_security_check" name="loginForm">
            <p><input name="j_username" type="text" value="" placeholder= <fmt:setBundle basename="langs"/>
            <fmt:message key="logToForm"/>></p>
            <p><input name="j_password" type="password" value="" placeholder=<fmt:setBundle basename="langs"/>
            <fmt:message key="password"/>></p>
            <p class="submit"><input type="submit" name="commit" value=<fmt:setBundle basename="langs"/>
            <fmt:message key="accept"/>></p>
        </form>
    </div>
</section>
</div>
</body>

</html>
