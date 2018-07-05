<%--
  Created by IntelliJ IDEA.
  User: Computer
  Date: 21.11.2017
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:set var="lang" value="${util:getLang(pageContext.request, pageContext.response)}"/>
<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="edu.etu.web.lang"/>
<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>
<c:if test="${empty sessionScope.purchaces}">
    <c:redirect url="/"/>
</c:if>
<c:if test="${empty sessionScope.username}">
    <c:redirect url="/login"/>
</c:if>

<c:choose>
    <c:when test="${lang eq 'ru'}">
        <c:set var="points" value="${['8 общежитие', 'ЛЭТИ', 'МСГ']}"/>
    </c:when>
    <c:when test="${lang eq 'fr'}">
        <c:set var="points" value="${['ETU 8', 'ELTECH', 'ETU5']}"/>
    </c:when>
    <c:otherwise>
        <c:set var="points" value="${['ETU 8', 'ELTECH', 'ETU5']}"/>
    </c:otherwise>
</c:choose>


<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://api-maps.yandex.ru/2.1/?lang=${lang}" type="text/javascript"></script>
    <link href="/static/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/static/css/slon.css" rel="stylesheet" type="text/css">
    <script>
        function changeLang(lang) {
            window.location.href="?lang=" + lang;
        }
    </script>
    <script>
        let myMap;
        let myPlacemarkCollection;
        let mySearchControl;
        let mySearchResults;
        let deliveryType = "none";
        let courierAddress = "";

        function initMap() {
            myPlacemarkCollection = new ymaps.GeoObjectCollection();
            mySearchResults = new ymaps.GeoObjectCollection();
            mySearchControl = new ymaps.control.SearchControl();


            mySearchControl.events.add('resultselect', e => {
                mySearchControl.getResult(e.get('index')).then(res => {
                    res.balloon.events.add('open', courierBalloonOpenEvent);
                    res.balloon.events.add('close', courierBalloonCloseEvent);
                })
            });

            myPlacemarkCollection.add(
                new ymaps.Placemark(
                    [59.99, 30.31],
                    {
                        iconContent: '${points[0]}',
                        balloonContent: '${points[0]}',
                        myId: '${points[0]}'
                    },
                    {
                        preset: 'islands#blueStretchyIcon'
                    }
                )
            );

            myPlacemarkCollection.add(
                new ymaps.Placemark(
                    [59.97, 30.32],
                    {
                        iconContent: '${points[1]}',
                        balloonContent: '${points[1]}',
                        myId: '${points[1]}'
                    },
                    {
                        preset: 'islands#blueStretchyIcon'
                    }
                )
            );

            myPlacemarkCollection.add(
                new ymaps.Placemark(
                    [59.87, 30.30],
                    {
                        iconContent: '${points[2]}',
                        balloonContent: '${points[2]}',
                        myId: '${points[2]}'
                    },
                    {
                        preset: 'islands#blueStretchyIcon'
                    }
                )
            );

            myPlacemarkCollection.each(geoObj => {
                geoObj.balloon.events.add('open', pickupBalloonOpenEvent);
                geoObj.balloon.events.add('close', pickupBalloonCloseEvent);
            });

            myMap = new ymaps.Map(
                "YMapsID",
                {
                    center: [59.96, 30.18],
                    zoom: 10,
                    type: 'yandex#map',
                    controls: ['typeSelector', 'zoomControl']
                }
            );

            function courierBalloonOpenEvent(e) {
                courierAddress = e.get('target').properties.get('name');
            }

            function pickupBalloonOpenEvent(e) {
                document.getElementById('addresses').value = e.get('target').properties.get('myId');
            }

            function pickupBalloonCloseEvent(e) {
                document.getElementById('addresses').value = "noselect";
            }

            function courierBalloonCloseEvent(e) {
                courierAddress = "";
            }

            myMap.displayCourier = function () {
                if (deliveryType === "courier") {
                    return;
                }

                deliveryType = "courier";

                document.getElementById("addresses").value = "noselect";

                myMap.geoObjects.removeAll();

                hideShopsAddresses();

                myMap.controls.add(mySearchControl);
            };

            myMap.displayPickup = function () {
                if (deliveryType === "pickup") {
                    return;
                }

                deliveryType = "pickup";

                myMap.controls.remove(mySearchControl);

                myMap.geoObjects.add(myPlacemarkCollection);

                showShopsAddresses();
            };

            switch (document.querySelector('input[name="delivery_type"]:checked').value) {
                case "pickup":
                    myMap.displayPickup();
                    break;
                case "courier":
                    myMap.displayCourier();
                    break;
            }
        }

        ymaps.ready(initMap);


        function showShopsAddresses() {
            document.getElementById('delivery_address_form').style.display = 'block';
        }

        function hideShopsAddresses() {
            document.getElementById('delivery_address_form').style.display = 'none';
        }

        function onAddressChange() {
            console.log("onAddressChange");
            let addresses = document.getElementById('addresses');
            let current_address = addresses.value;
            if (current_address === 'noselect') {
                myMap.balloon.close();
            } else {
                myPlacemarkCollection.each(geoObj => {
                    let content = geoObj.properties.get('myId');
                    if (content === current_address) {
                        geoObj.balloon.open();
                    }
                });
            }
        }

        function proceedCheckout() {
            let address;
            switch (deliveryType) {
                case "pickup":
                    let value = document.getElementById('addresses').value;
                    address = value === "noselect" ? false : value;
                    break;
                case "courier":
                    address = courierAddress === "" ? false : courierAddress;
                    break;
            }
            if (address === false) {
                alert('Выбери адрес');
            } else {
                let hr = "/order_finish.jsp?address=" + address + "&delivery=" + (deliveryType === "courier");
                hr = encodeURI(hr);
                window.location.href = hr;
            }
        }
    </script>
</head>
<body>
<div class="position">
    <jsp:include page="/header.jsp"></jsp:include>
<div  class="next_step; buy" style="width: 200px; height: 20px" onclick="proceedCheckout()" >
    <fmt:setBundle basename="langs"/>
    <fmt:message key="buyAll"/>
</div>


<div id="delivery_type_form">
    <h6><fmt:setBundle basename="langs"/>
        <fmt:message key="kind"/></h6>
    <input type="radio" name="delivery_type" value="pickup" checked onclick="myMap.displayPickup()"/>
    <fmt:setBundle basename="langs"/>
    <fmt:message key="byThemself"/>
    <input type="radio" name="delivery_type" value="courier" onclick="myMap.displayCourier()"/>
    <fmt:setBundle basename="langs"/>
    <fmt:message key="courrier"/>
</div>

<div id="delivery_address_form" style="display: none;">
    <h6>
        <fmt:setBundle basename="langs"/>
        <fmt:message key="point"/>
    </h6>
    <select id="addresses" onchange="onAddressChange();">
        <option selected value="noselect"></option>
        <option value="${points[0]}">${points[0]}</option>
        <option value="${points[1]}">${points[1]}</option>
        <option value="${points[2]}">${points[2]}</option>
    </select>
</div>

<br>
<div id="YMapsID" style="width: 1225px; height: 350px"></div>

</div>
</body>
</html>
