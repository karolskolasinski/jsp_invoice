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
    <title>Product Add / Edit</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <form action="${requestScope.productId==null ? '/product-add' : '/product-edit'}" method="post">
                <input type="hidden" name="invoiceId_to_add_product" value="${requestScope.invoiceId}">
                <input type="hidden" name="productId_to_edit" value="${requestScope.productId}">

                <div class="form-group">
                    <label>name:</label>
                    <input type="text" name="name" class="form-control" placeholder="Wprowadź nazwę"
                           value="${requestScope.name}">
                </div>

                <div class="form-group">
                    <label>price:</label>
                    <input type="number" name="price" class="form-control" placeholder="Wprowadź cenę netto"
                           value="${requestScope.price}">
                </div>

                <div class="form-group">
                    <label>taxType:</label>
                    <select class="form-control" name="taxType">
                        <c:choose>
                            <c:when test="${requestScope.taxType == 'PRODUCT'}">
                                <option selected value="PRODUCT">Product</option>
                                <option value="SERVICE">Service</option>
                            </c:when>
                            <c:when test="${requestScope.taxType == 'SERVICE'}">
                                <option value="PRODUCT">Product</option>
                                <option selected value="SERVICE">Service</option>
                            </c:when>
                            <c:otherwise>
                                <option selected disabled>--Wybierz--</option>
                                <option value="PRODUCT">Product</option>
                                <option value="SERVICE">Service</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>

                <div class="form-group">
                    <label>stock:</label>
                    <input type="number" name="stock" step="1" class="form-control" placeholder="Wprowadź ilość"
                           value="${requestScope.stock}">
                </div>

                <button type="submit" class="btn btn-primary">Zapisz</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
