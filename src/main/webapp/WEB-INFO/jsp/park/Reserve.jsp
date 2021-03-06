<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="../../../pub/css/reserve.css">

</head>


<body>


<c:if test="${!hideForm}">

<form action="/park/Reserve/${parkingSpotId}" method="post">


    <!-- time and date-->
    <div class="row mb-4">
        <label class="label" class="form-label" for="dateId">Pick the date and time </label>
        <br>
        <input type="datetime-local" id="dateId" class="form-control" name="date" <%--value="${form.zipcode}"--%>
               placeholder="e.g. 02155" maxlength="5"/>

    </div>

    <button type="submit">Reserve</button>


</form>

</c:if>


<h1> Your Current Reservations</h1>


<table class="table">
    <tr scope="row">


        <th>Parking Spot Owner</th>
        <th>Customer Name</th>
        <th>Charge</th>
        <th>Scheduled date</th>
        <th>Zipcode</th>
        <th>State</th>


    </tr>

    <c:forEach items="${reservationList}" var="reserve">
        <tr class="results" scope="row">

            <td>${reserve.parkingspot.company.companyName}</td>
            <td>${reserve.user.firstName} ${reserve.user.lastName} </td>

            <td>${reserve.parkingspot.price} </td>

            <td>${reserve.date}</td>
            <td>${reserve.zipcode}</td>
            <td>${reserve.parkingspot.state}</td>

        </tr>

    </c:forEach>

</table>


<jsp:include page="../include/footer.jsp"/>