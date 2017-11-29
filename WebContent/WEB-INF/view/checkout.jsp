
  <%@page import="nashtech.luantran.musicstore.controller.AdminController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<h2>Address And Payment</h2>
    <fieldset>
        <h1>Shipping Information</h1>

    </fieldset>
    <form:form method="POST" commandName="cart" action="${pageContext.request.contextPath}/cart/submit">
    <fieldset>
      
        <div class="editor-field">
            <input type="text" placeholder="GrandTotal" value="${cart.grandTotal}" disabled/>
        </div>
        <div class="editor-field">
                    <form:input type="text"  path="name" placeholder="Name" />
        
        </div>
         <div class="editor-field">
                    <form:input type="text"  path="phone" placeholder="Phone" />
        
        </div>
         <div class="editor-field">
                    <form:input type="text"  path="address" placeholder="Address" />
        
        </div>
    </fieldset>
    
    <input  type="submit" value="Submit Order" />
    </form:form>