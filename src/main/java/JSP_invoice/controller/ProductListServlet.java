package JSP_invoice.controller;

import JSP_invoice.model.Invoice;
import JSP_invoice.model.Product;
import JSP_invoice.services.InvoiceService;
import JSP_invoice.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/product-list")
public class ProductListServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("invoiceId") != null) {
            Long invoiceId = Long.parseLong(req.getParameter("invoiceId"));
            Optional<Invoice> invoiceOptional = invoiceService.getInvoiceById(invoiceId);
            if (invoiceOptional.isPresent()) {
                Invoice invoice = invoiceOptional.get();
                req.setAttribute("product_list_from_controller_ProductListServlet", invoice.getProductList());
            }
            req.getRequestDispatcher("/product-list.jsp").forward(req, resp);
        } else {
            List<Product> productList = productService.findAll();
            req.setAttribute("product_list_from_controller_ProductListServlet", productList);
            req.getRequestDispatcher("/product-list.jsp").forward(req, resp);
        }
    }
}
