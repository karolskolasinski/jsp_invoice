<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="JSP_invoice.model.Invoice" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Invoice List</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="alert alert-primary" role="alert">
                JSTL notation
            </div>
        </div>
    </div>
</div>

<table class="table table-striped">
    <tr>
        <th>Id.</th>
        <th>dateOfCreation</th>
        <th>clientName</th>
        <th>ifPaid</th>
        <th>dateOfRelease</th>
        <th>dateOfPayment</th>
        <th>billValue</th>
        <th>productList</th>
        <th colspan="6">OPIONS</th>
    </tr>
    <%--notacja JSTL --%>
    <c:forEach var="invoice" items="${requestScope.invoice_list_from_controller_InvoiceListServlet}">
        <tr>
            <td>${invoice.getId()}</td>
            <td>${invoice.getDateOfCreation().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm"))}</td>
            <td>${invoice.getClientName()}</td>
            <td>${invoice.isIfPaid()}</td>
            <td>
                <c:if test="${invoice.getDateOfRelease() != null}">
                    ${invoice.getDateOfRelease().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm"))}
                </c:if>
            </td>
            <td>
                <c:if test="${invoice.getDateOfPayment() != null}">
                    ${invoice.getDateOfPayment().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm"))}
                </c:if>
            </td>
            <td>
                <c:if test="${invoice.getBillValue() != null}">
                    ${invoice.getBillValue()}
                </c:if>
            </td>
            <td>
                <c:if test="${invoice.getProductList() != null}">
                    ${invoice.getProductList()}
                </c:if>
            </td>
            <td>
                <a href="/invoice-delete?invoiceId=${invoice.getId()}">Delete</a>
            </td>
            <td>
                <a href="/invoice-edit?invoiceId=${invoice.getId()}">Edit</a>
            </td>
            <td>
                <a href="/invoice-mark-release?invoiceId=${invoice.getId()}">Mark release</a>
            </td>
            <td>
                <a href="/invoice-mark-paid?invoiceId=${invoice.getId()}">Mark paid</a>
            </td>
            <td>
                <a href="/product-list?invoiceId=${invoice.getId()}">List products</a>
            </td>
            <td>
                <a href="/product-add?invoiceId=${invoice.getId()}">Add product</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<hr>
<br>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="alert alert-success" role="alert">
                JSP notation
            </div>
        </div>
    </div>
</div>

<table class="table table-striped">
    <tr>
        <th>Id.</th>
        <th>dateOfCreation</th>
        <th>clientName</th>
        <th>ifPaid</th>
        <th>dateOfRelease</th>
        <th>dateOfPayment</th>
        <th>billValue</th>
        <th>productList</th>
        <th colspan="6">OPIONS</th>
    </tr>
    <%--notacja java JSP --%>
    <%
        List<Invoice> invoiceList = (List<Invoice>) request.getAttribute("invoice_list_from_controller_InvoiceListServlet");
        for (Invoice invoice : invoiceList) {
            out.print("<tr>");
            out.print("<td>" + invoice.getId() + "</td>");
            if (invoice.getDateOfCreation() != null) {
                out.print("<td>" + invoice.getDateOfCreation().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }
            out.print("<td>" + invoice.getClientName() + "</td>");
            out.print("<td>" + invoice.isIfPaid() + "</td>");
            if (invoice.getDateOfRelease() != null) {
                out.print("<td>" + invoice.getDateOfRelease().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }
            if (invoice.getDateOfPayment() != null) {
                out.print("<td>" + invoice.getDateOfPayment().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }
            out.print("<td>" + invoice.getBillValue() + "</td>");
            out.print("<td>" + invoice.getProductList() + "</td>");
            out.println("<td><a href=/invoice-delete?invoiceId=" + invoice.getId() + ">Delete</a></td>");
            out.println("<td><a href=/invoice-edit?invoiceId=" + invoice.getId() + ">Edit</a></td>");
            out.println("<td><a href=/invoice-mark-release?invoiceId=" + invoice.getId() + ">Mark release</a></td>");
            out.println("<td><a href=/invoice-mark-paid?studentId=" + invoice.getId() + ">Mark paid</a></td>");
            out.println("<td><a href=/product-list?studentId=" + invoice.getId() + ">List products</a></td>");
            out.println("<td><a href=/product-add?invoiceId=" + invoice.getId() + ">Add product</a></td>");
            out.print("</tr>");
        }
    %>
</table>

</body>
</html>