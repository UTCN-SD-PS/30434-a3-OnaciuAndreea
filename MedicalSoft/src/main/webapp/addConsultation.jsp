<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>

	<div class="container">
		<h2>Welcome, ${pageContext.request.userPrincipal.name} !</h2>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextPath}">MedicalSoft</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/secretary">Add patient</a></li>
					<li ><a href="${contextPath}/editPatient">Edit patient info</a></li>
					<li class="active"><a href="${contextPath}/addConsultation">Add consultation</a></li>
					<li><a href="${contextPath}/editConsultation">Edit consultation</a></li>
					<li><a href="${contextPath}/deleteConsultation">Delete consultation</a></li>
					<li><a href="${contextPath}/seeConsultation">See consultations</a></li>
					<li><a href="${contextPath}/notifyDoctor">Notify doctor</a></li>
				</ul>
				<a href="${contextPath}/login">
					<button class="btn btn-danger navbar-btn">Log out</button>
				</a>
			</div>
		</nav>
		<div class="container">
	    <form:form method="POST" modelAttribute="editPatient"  class="form-signin" >  
	     <p>Insert cnp: </p>
	    <spring:bind path="cnp">
            <div class="form-group ${status.error ? 'has-error' : ''}">       
    	<form:input  type="text" path="cnp" class="form-control" placeholder="CNP" value="${editPatient.getCnp()}"
                   autofocus="true"></form:input>  
                   <form:errors path="cnp"></form:errors>
             <h2><span style="color:red" >${error}</span></h2>      
            </div>
        </spring:bind> 
        <input type="hidden" name="name" class="form-control" value=""
							placeholder="Name" autofocus="true"/>				
		<input type="hidden" name="idcn" class="form-control" value=""
						placeholder="Identity card number"/>
		<input name="dateOfBirth" type="hidden" class="form-control" value="2017-02-02"
					placeholder="dateOfBirth" autofocus="true" />
		<input name="address" type="hidden" class="form-control"  value=""
					placeholder="Address" autofocus="true" />	
		 <p></p>
		 	     
	     <p>Please select specialization for doctor: </p>
					
	     <select name="type" class="form-control">
				<c:forEach var="employee" items="${specialization}" >
					<option value="${ employee.toString()}">${ employee.toString()}</option>							
    					</c:forEach>
		</select>
         <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
         </form:form>	
		
		
		
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
