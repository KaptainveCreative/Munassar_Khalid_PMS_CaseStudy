<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="../../../pub/css/list.css">


</head>
<body>

<h1>
    Interested in listing your parking spot to our customers? Then go ahead and fill in your information below and we
    will
    take care of the rest

</h1>


<br>

<section class="list">
    <form class="listForm"
          action="/park/ListSubmit"  <%--&lt;%&ndash;style="width: 23rem; align-items: center; justify-content: center;&ndash;%&gt;"--%>>

        <input type="hidden" name="id" id="Id">
        <br>

        <!-- company name input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="zipcodeId">Enter spot nickname</label>
            <input type="text" id="zipcodeId" class="form-control" name="companyName" value="${form.companyName}"/>

            <c:forEach items="${bindingResult.getFieldErrors('companyName')}" var="error">
            <div style="color: red;"> ${error.getDefaultMessage()} </div>
            </c:forEach>

            <!-- Zipcode input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="zipcodeId">Enter the ZIP-Code for your parking spot </label>
                <input type="text" id="zipcodeId" class="form-control" name="zipcode" value="${form.zipcode}"
                       placeholder="e.g. 02155"/>

                <c:forEach items="${bindingResult.getFieldErrors('zipcode')}" var="error">
                    <div style="color: red;"> ${error.getDefaultMessage()} </div>
                </c:forEach>
            </div>


            <!-- price input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="priceId">Enter your fee for 1 hr</label>
                <input type="text" id="priceId" class="form-control" name="price" value="${form.price}"/>


                <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
                    <div style="color: red;"> ${error.getDefaultMessage()} </div>
                </c:forEach>

            </div>

            <!-- Rating input -->

                <div class="form-outline mb-4">
                    <label for="status"> Rating per BBB - can be blank for personal users </label>
                    <select name="rating" id="ratingId">
                        <option></option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>

                </div>
<%--                <div class="form-outline mb-4">--%>
<%--                    <label class="form-label" for="ratingId">Enter your rating per BBP for your business</label>--%>
<%--                    <input type="text" id="ratingId" class="form-control" name="rating" placeholder="1-5" min="1" max="5"--%>
<%--                           maxlength="1"/>--%>


<%--            </div>--%>

            <!-- status input -->
            <div class="form-outline mb-4">
                <label for="status"> Status </label>

                <select name="status" id="status">
                    <option>Available</option>
                    <option>Booked</option>
                </select>

            </div>


            <%--    <!-- quantity input -->--%>
            <%--    <div class="form-outline mb-4">--%>
            <%--&lt;%&ndash;        <label class="form-label" for="quantityId">How many spots do you have to reserve</label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;        <input type="hidden" id="quantityId" class="form-control" name="quantity" value="${form.quantity}"  />&ndash;%&gt;--%>

            <%--&lt;%&ndash;        <c:forEach items="${bindingResult.getFieldErrors('quantity')}" var="error">z&ndash;%&gt;--%>
            <%--&lt;%&ndash;            <div style="color: red;"> ${error.getDefaultMessage()} </div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;        </c:forEach>&ndash;%&gt;--%>

            <%--    </div>--%>


            <!-- state input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="stateId">Enter which state the spot is there for </label>
                <input type="text" id="stateId" class="form-control" name="state" value="${form.state}" maxlength="2"
                       placeholder="e.g. MN"/>

                <c:forEach items="${bindingResult.getFieldErrors('state')}" var="error">
                    <div style="color: red;"> ${error.getDefaultMessage()} </div>
                </c:forEach>
            </div>
            <!-- 2 column grid layout for inline styling -->
            <div class="row mb-4">
                <button type="submit" class="btn btn-primary btn-block">List your spot</button>

            </div>

            <!-- Submit button -->

    </form>

</section>

</body>
</html>


<jsp:include page="../include/footer.jsp"/>