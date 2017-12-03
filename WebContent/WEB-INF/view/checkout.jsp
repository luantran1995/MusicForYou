
  <%@page import="nashtech.luantran.musicstore.controller.AdminController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- MaCarouselin CSS -->
<link href="<c:url value="/css/carousel.css" />"rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">


<div  class="container">
<h2>Address And Payment</h2>
  <fieldset>
        <h1>Shipping Information</h1>
      </fieldset>
        
 <form:form method="POST" commandName="cart" action="${pageContext.request.contextPath}/cart/checkout/submit">
      
        <div class="editor-field">
            <input  class="form-control"  type="text" placeholder="GrandTotal" value="${cart.grandTotal}" disabled />
        </div>
        <div class="editor-field">
                    <form:input  class="form-control" type="text"  path="name" placeholder="Name" />
        </div>
         <div class="editor-field">
                    <form:input  class="form-control" type="text"  path="phone" placeholder="Phone" />
        
        </div>
         <div class="editor-field">
                    <form:input   class="form-control" type="text"  path="address" placeholder="Address" />
        </div>
        
    <input  class="form-control"  type="submit" value="Submit Order" />
    </form:form>
    
   
</div>
  