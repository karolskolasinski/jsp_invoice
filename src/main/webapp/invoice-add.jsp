<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 17.09.2019
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Invoice Add</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <form action="${requestScope.studentId==null ? '/student-add' : '/student-edit'}" method="post">
                <input type="hidden" name="student_id" value="${requestScope.studentId}">
                <div class="form-group">
                    <label>Imię</label>
                    <input type="text" name="student_name" class="form-control" placeholder="Wprowadź imię"
                           value="${requestScope.studentName}">
                </div>
                <div class="form-group">
                    <label>Nazwisko</label>
                    <input type="text" name="student_last_name" class="form-control" placeholder="Wprowadź nazwisko"
                           value="${requestScope.studentSurname}">
                </div>
                <div class="form-group">
                    <label>Wiek</label>
                    <input type="number" name="student_age" min="1" max="99" class="form-control"
                           placeholder="Wprowadź wiek" value="${requestScope.studentAge}">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" name="student_is_alive"
                           class="form-check-input" ${requestScope.studentIsAlive==true ? 'checked' : ''}>
                    <label class="form-check-label">Is alive</label>
                </div>
                <button type="submit" class="btn btn-primary">Zapisz</button>
                <%--//lub:
                <input type="submit">--%>
            </form>
        </div>
    </div>
</div>

</body>
</html>
