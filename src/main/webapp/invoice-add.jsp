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
            <form action="${requestScope.invoiceId==null ? '/invoice-add' : '/invoice-edit'}" method="post">
                <input type="hidden" name="invoiceId" value="${requestScope.invoiceId}">
                <div class="form-group">
                    <label>Imię klienta</label>
                    <input type="text" name="clientName" class="form-control" placeholder="Wprowadź imię"
                           value="${requestScope.clientName}">
                </div>
                <div class="form-group">
                    <label>NIP</label>
                    <input type="text" name="clientNIP" class="form-control" placeholder="Wprowadź NIP" maxlength="10"
                           value="${requestScope.clientNIP}">
                </div>
                <div class="form-group">
                    <label>Adres</label>
                    <input type="text" name="clientAddress" class="form-control"
                           placeholder="Wprowadź adres" value="${requestScope.clientAddress}">
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
