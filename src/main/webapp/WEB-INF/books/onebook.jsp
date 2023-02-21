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
    <title>Login and Registration</title>
  </head>
  <body>
    <div class="container">
      <div class="container d-flex justify-content-between mt-3">
        <h1>${book.title}</h1>
        <a href="/books">back to the shelves</a>
      </div>

      <div class="card bg-light mb-3 mt-4" style="max-width: 20rem">
        
        <div class="card-header">
        <c:choose>
          <c:when test="${userID == book.user.id}">
            You
          </c:when>
          <c:otherwise>
            ${userName}
          </c:otherwise>
        </c:choose>
        read ${book.title} by ${book.author}</div>
        <div class="card-body">
          <h4 class="card-title">Here are 
          <c:choose>
            <c:when test="${userID == book.user.id}">
              your
            </c:when>
            <c:otherwise>
              ${userName}
            </c:otherwise>
            </c:choose>
            
            thoughts</h4>
          <p class="card-text">${book.myThoughts}</p>
        </div>
      </div>
      <div class="container d-flex">
        <c:choose>
          <c:when test="${userID == book.user.id}">
        <a href="/books/${book.id}/edit"><button class="btn btn-warning">Edit</button></a>
        <form action="/books/${book.id}/delete" method="post">
          <input type="hidden" name="_method" value="delete">
          <button class="btn btn-danger">Delete</button>
        </form>
          </c:when>
        </c:choose>
      </div>
    </div>
  </body>
</html>
