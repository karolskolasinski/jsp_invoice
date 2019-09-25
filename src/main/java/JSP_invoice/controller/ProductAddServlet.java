package JSP_invoice.controller;

import JSP_invoice.model.Invoice;
import JSP_invoice.model.TaxType;
import JSP_invoice.services.InvoiceService;
import JSP_invoice.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/product-add")
public class ProductAddServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long invoiceId = Long.parseLong(req.getParameter("invoiceId"));
        req.setAttribute("invoiceId", invoiceId);
        req.getRequestDispatcher("/product-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Long invoiceIdentifier = Long.parseLong(req.getParameter("invoiceId_to_add_product"));
        Optional<Invoice> invoiceOptionalToEdit = invoiceService.getInvoiceById(invoiceIdentifier);
        if (invoiceOptionalToEdit.isPresent()) {
            if (invoiceOptionalToEdit.get().getDateOfRelease() == null && invoiceOptionalToEdit.get().getDateOfPayment() == null) {
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                TaxType taxType = TaxType.valueOf(req.getParameter("taxType"));
                int stock = Integer.parseInt(req.getParameter("stock"));
                Invoice invoice = invoiceOptionalToEdit.get();
                productService.addProduct(name, price, taxType, stock, invoice);
                resp.sendRedirect("/product-list");
            } else {
                resp.sendRedirect("/product-list");
            }
        }
    }
}
