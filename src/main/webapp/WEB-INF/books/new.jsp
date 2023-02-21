<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="
    <c:url value="/resources/css/sketchy.css" />
    " rel="stylesheet">
    <title>Book Share</title>
  </head>
  <body>
    
    <div class="container d-flex justify-content-between mt-3">
      <h1>Add a Book to Your Shelf!</h1>
      <a href="/books">back to the shelves</a>
    </div>

    <div class="container">
      <form:form action="/books" method="post" modelAttribute="book">
        <form:hidden path="user" value="${userID}"></form:hidden>
        <div class="form-group">
          <div class="form-group">
            <div>
              <form:errors path="title" class="text-danger"></form:errors>
            </div>     
            <div>
              <form:errors path="author" class="text-danger"></form:errors>
            </div> 
            <div>
              <form:errors path="myThoughts" class="text-danger"></form:errors>
            </div>   
            <form:label path="title" class="form-label mt-4"
            >Title:</form:label            >
            
            <form:input path="title" class="form-control"></form:input>
          </div>
        <div class="form-group">
          <div class="form-group">
            <form:label path="author" class="form-label mt-4"
            >Author:</form:label
            >
            <form:input path="author" class="form-control"></form:input>
          </div>
        <div class="form-group">
          <div class="form-group">
            <form:label path="myThoughts" class="form-label mt-4"
            >My Thoughts:</form:label
            >
            <form:textarea path="myThoughts" class="form-control"></form:textarea>
          </div>
          <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-secondary mt-3">Submit</button>
          </div>
      </form:form>
    </div>
  </body>
</html>
