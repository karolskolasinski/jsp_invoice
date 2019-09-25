<%@ page import="java.util.List" %>
<%@ page import="JSP_invoice.model.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 17.09.2019
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <table class="table table-striped">
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>tax</th>
                    <th>taxType</th>
                    <th>stock</th>
                    <th>invoice</th>
                    <th>OPTIONS</th>
                </tr>
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("product_list_from_controller_ProductListServlet");
                    for (Product product : productList) {
                        out.println("<tr>");
                        out.println("<td>" + product.getId() + "</td>");
                        out.println("<td>" + product.getName() + "</td>");
                        out.println("<td>" + product.getPrice() + "</td>");
                        out.println("<td>" + new DecimalFormat("#.##").format(product.getTax()) + "</td>");
                        out.println("<td>" + product.getTaxType() + "</td>");
                        out.println("<td>" + product.getStock() + "</td>");

                        /*display Invoice details*/
                        if (product.getInvoice() != null) {
                            out.println("<td>" + product.getInvoice() + "</td>");
                        } else {
                            out.println("<td></td>");
                        }

                        /*display editProduct option*/
                        if (product.getInvoice().getDateOfRelease() == null && product.getInvoice().getDateOfPayment() == null) {
                            out.println("<td><a href=/product-edit?productId=" + product.getId() + ">Edit</a></td>");
                        } else {
                            out.println("<td>Invoice closed</td>");
                        }
                        out.println("</tr>");
                    }
                %>
            </table>
        </div>
    </div>
</div>

</body>
</html>
