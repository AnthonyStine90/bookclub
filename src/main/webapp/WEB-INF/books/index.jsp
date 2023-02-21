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
        <h1>Welcome, ${userName}</h1>
        <a href="/logout">logout</a>
      </div>
      <div class="container d-flex justify-content-between mt-3">
        <h3>Book's from everyone's shelves:</h3>
        <a href="/books/new">+ Add a book to my shelf!</a>
      </div>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Title</th>
            <th scope="col">Author Name</th>
            <th scope="col">Posted By</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="book" items="${books}">
          <tr class="table-active">
            <td><a href="/books/${book.id}">${book.title}</a></td>
            <td>${book.author}</td>
            <!-- since book has a relationship with it's user, we can call the user and userName through our book-->
            <td>${book.user.userName}</td>
            <td>
              <c:choose>
                <c:when test="${userID == book.user.id}">
                  <a href="/books/${book.id}/edit"><input type="submit" value="Edit"></a>
                  <form action="/books/${book.id}/delete" method="post">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="Delete">
              </form>
              </c:when>
              </c:choose>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
