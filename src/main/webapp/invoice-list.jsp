<%@ page import="JSP_invoice.model.Invoice" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="/style.css">
    <title>Invoice List</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>
<table style="width: 100%">
    <tr>
        <th>Id.</th>
        <th>dateOfCreation</th>
        <th>clientName</th>
        <th>ifPaid</th>
        <th>dateOfRelease</th>
        <th>dateOfPayment</th>
        <th>billValue</th>
        <th>product</th>
    </tr>
    <%--notacja JSTL --%>
    <c:forEach var="invoice" items="${requestScope.invoice_list_from_controller_InvoiceListServlet}">
        <tr>
            <td>${invoice.getId()}</td>
            <td>${invoice.getDateOfCreation()}</td>
            <td>${invoice.getClientName()}</td>
            <td>${invoice.isIfPaid()}</td>
            <td>${invoice.getDateOfRelease()}</td>
            <td>${invoice.getDateOfPayment()}</td>
            <td>${invoice.getBillValue()}</td>
            <td>${invoice.getProduct()}</td>
            <td>
                <table>
                    <tr>
                        <td>
                            <a href="/invoice-delete?invoiceId=${invoice.getId()}">Delete</a>
                        </td>
                        <td>
                            <a href="/invoice-edit?invoiceId=${invoice.getId()}">Edit</a>
                        </td>
                        <td>
                            <a href="/invoice-mark-release?invoiceId=${invoice.getId()}">Mark Release</a>
                        </td>
                        <td>
                            <a href="/invoice-mark-paid?invoiceId=${invoice.getId()}">Mark Paid</a>
                        </td>
                        <td>
                            <a href="/product-list?invoiceId=${invoice.getId()}">List products</a>
                        </td>
                        <td>
                            <a href="/product-add?invoiceId=${invoice.getId()}">Add product</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </c:forEach>

    <%--/Odpowiednik - notacja java JSP --%>
    <%--<%--%>
    <%--List<Student> studentList = (List<Student>) request.getAttribute("moja_ukochana_lista");--%>
    <%--for (Student student : studentList) {--%>
    <%--out.print("<tr>");--%>
    <%--out.print("<td>" + student.getId() + "</td>");--%>
    <%--out.print("<td>" + student.getName() + "</td>");--%>
    <%--out.print("<td>" + student.getSurname() + "</td>");--%>
    <%--out.print("<td>" + student.getAge() + "</td>");--%>
    <%--out.print("<td>" + student.isAlive() + "</td>");--%>
    <%--out.print("</tr>");--%>
    <%--}--%>
    <%--%>--%>
</table>
</body>
</html>