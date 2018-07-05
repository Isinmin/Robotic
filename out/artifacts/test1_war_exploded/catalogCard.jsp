<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 22.10.2017
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>missingValue</title>
    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="http://s009.radikal.ru/i308/1710/91/b226e96e261d.jpg" type="image/png">
    <link href="style.css" rel="stylesheet"/>
    <script src="function.js"></script>
</head>
<body onload="defaultClick()">
<div class="position">
    <div class="tabsBlock">
        <div id="description" class="tabNotChecked" onclick="displayWindow(this);checkTab(this)">missingValue</div>
        <div id="characteristic" class="tabNotChecked" onclick="displayWindow(this);checkTab(this)">missingValue        </div>
        <div id="reports" class="tabNotChecked" onclick="displayWindow(this);checkTab(this)">missingValue</div>
        <div class="lang">
            <a  href="?language=ru"> <img title="RU" alt="RU" class="langIcon" src="/static/langPic/russ.png"> </a>
            <a  href="?language=en"> <img title="EN" alt="EN"class=" langIcon" src="/static/langPic/eng.png"> </a>
            <a  href="?language=fr"> <img title="FR" alt="FR" class="langIcon" src="/static/langPic/fr.png"></a>
        </div>
    </div>

    <div class="window">


        <div id="descriptionWindow" class="displayWin">


            <img class="photocard" src="static/new_71086377_l_928.jpeg">
            <div class="cardText">
                <h1>missingValue</h1>
                <p>
                    missingValue
                </p>
                <p>
                    <b>missingValue</b>missingValue<br>
                    <b>missingValue</b>missingValue<br>
                    <b>missingValue</b>missingValue<br>
                    <b>missingValue</b>missingValue<br>
                    <b>missingValue</b>missingValue<br>
                </p>
            </div>

            <div class="buyItem">
                <h5>missingValue</h5>
                <a href="#" class="btn red">missingValue</a>
            </div>
        </div>
        <div id="characteristicWindow" class="displayWin">
            <div class="textOnly">

                <p>
                <h1>missingValue</h1>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                </p>

                <p>
                <h1>missingValue</h1>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                <b>missingValue</b>missingValue<br>
                </p>
            </div>

        </div>
        <div id="reportsWindow" class="displayWin">
            <div class="comment">
                <h6>Анечка</h6>
                Хорошая соковыжималка, работает отлично, выжимает быстро. Купила такую же своей сестре.
            </div>
            <div class="comment">
                <h6>Иван</h6>
                Береёзовый не выжимает
            </div>
            <div class="comment">
                <h6>Колян2000</h6>
            </div>
            <div class="comment">
                <h6>healthy</h6>
                AWESOME!
            </div>
            <div class="comment">
                <h6>Vladislav</h6>
                Не очень роший аппарат 9/10
            </div>

        </div>

    </div>

</div>
</body></html>