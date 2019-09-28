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

<table class="table table-hover">
    <tr>
        <th>Id.</th>
        <th>dateOfCreation</th>
        <th>clientName</th>
        <th>ifPaid</th>
        <th>dateOfRelease</th>
        <th>dateOfPayment</th>
        <th>billValue</th>
        <th style="width: 22%">productList</th>
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
                <a class="btn btn-outline-danger" role="button" href="/invoice-delete?invoiceId=${invoice.getId()}">Delete</a>
            </td>
            <td>
                <a class="btn btn-outline-success" role="button" href="/invoice-edit?invoiceId=${invoice.getId()}">Edit</a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${invoice.getDateOfRelease() == null}">
                        <a class="btn btn-outline-warning" role="button"
                           href="/invoice-mark-release?invoiceId=${invoice.getId()}">Mark release</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-outline-warning disabled" role="button">Marked</a>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${invoice.getDateOfPayment() == null}">
                        <a class="btn btn-outline-warning" role="button" href="/invoice-mark-paid?invoiceId=${invoice.getId()}">Mark
                            paid</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-outline-warning disabled" role="button">Marked</a>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a class="btn btn-outline-info" role="button" href="/product-list?invoiceId=${invoice.getId()}">List
                    products</a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${invoice.getDateOfRelease() == null}">
                        <a class="btn btn-outline-success" role="button" href="/product-add?invoiceId=${invoice.getId()}">Add
                            product</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-outline-success disabled" role="button">Released</a>
                    </c:otherwise>
                </c:choose>
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
        <th style="width: 22%">productList</th>
        <th colspan="6">OPIONS</th>
    </tr>
    <%--notacja java JSP --%>
    <%
        List<Invoice> invoiceList = (List<Invoice>) request.getAttribute("invoice_list_from_controller_InvoiceListServlet");
        for (Invoice invoice : invoiceList) {
            out.print("<tr>");
            out.print("<td>" + invoice.getId() + "</td>");

            /*display DateOfCreation*/
            if (invoice.getDateOfCreation() != null) {
                out.print("<td>" + invoice.getDateOfCreation().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }

            out.print("<td>" + invoice.getClientName() + "</td>");
            out.print("<td>" + invoice.isIfPaid() + "</td>");

            /*display DateOfRelease*/
            if (invoice.getDateOfRelease() != null) {
                out.print("<td>" + invoice.getDateOfRelease().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }

            /*display DateOfPayment*/
            if (invoice.getDateOfPayment() != null) {
                out.print("<td>" + invoice.getDateOfPayment().format(DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm")) + "</td>");
            } else {
                out.print("<td></td>");
            }

            out.print("<td>" + invoice.getBillValue() + "</td>");
            out.print("<td>" + invoice.getProductList() + "</td>");
            out.println("<td><a class=\"btn btn-outline-danger\" role=\"button\" href=\"/invoice-delete?invoiceId=" + invoice.getId() + "\">Delete</a></td>");
            out.println("<td><a class=\"btn btn-outline-success\" role=\"button\"href=\"/invoice-edit?invoiceId=" + invoice.getId() + "\">Edit</a></td>");

            /*display mark DateOfRelease option*/
            if (invoice.getDateOfRelease() == null) {
                out.println("<td><a class=\"btn btn-outline-warning\" role=\"button\" href=\"/invoice-mark-release?invoiceId=" + invoice.getId() + "\">Mark release</a></td>");
            } else {
                out.print("<td><a class=\"btn btn-outline-warning disabled\" role=\"button\">Marked</a></td>");
            }

            /*display mark DateOfPayment option*/
            if (invoice.getDateOfPayment() == null) {
                out.println("<td><a class=\"btn btn-outline-warning\" role=\"button\" href=\"/invoice-mark-paid?invoiceId=" + invoice.getId() + "\">Mark paid</a></td>");
            } else {
                out.print("<td><a class=\"btn btn-outline-warning disabled\" role=\"button\">Marked</a></td>");

            }

            out.println("<td><a class=\"btn btn-outline-info\" role=\"button\" href=\"/product-list?invoiceId=" + invoice.getId() + "\">List products</a></td>");

            /*display addProduct option*/
            if (invoice.getDateOfRelease() == null) {
                out.println("<td><a class=\"btn btn-outline-success\" role=\"button\" href=\"/product-add?invoiceId=" + invoice.getId() + "\">Add product</a></td>");
            } else {
                out.print("<td><a class=\"btn btn-outline-success disabled\" role=\"button\">Released</a></td>");
            }

            out.print("</tr>");
        }
    %>
</table>

</body>
</html>