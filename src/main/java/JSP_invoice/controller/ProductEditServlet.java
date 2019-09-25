package JSP_invoice.controller;

import JSP_invoice.model.Product;
import JSP_invoice.model.TaxType;
import JSP_invoice.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/product-edit")
public class ProductEditServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Long editedProductId = Long.parseLong(req.getParameter("productId_to_edit"));
        String editedProductName = req.getParameter("name");
        double editedProductPrice = Double.parseDouble(req.getParameter("price"));
        TaxType editedProductTaxType = TaxType.valueOf(req.getParameter("taxType"));
        int editedProductStock = Integer.parseInt(req.getParameter("stock"));

        Optional<Product> productToEdit = productService.getProductById(editedProductId);
        if (productToEdit.isPresent()) {
            Product product = productToEdit.get();
            product.setName(editedProductName);
            product.setPrice(editedProductPrice);
            product.setTaxType(editedProductTaxType);
            product.setStock(editedProductStock);
            productService.updateProduct(product);
            resp.sendRedirect("/product-list?invoiceId=" + productToEdit.get().getInvoice().getId());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long productToEditId = Long.parseLong(req.getParameter("productId"));
        Optional<Product> productToEdit = productService.getProductById(productToEditId);
        if (productToEdit.isPresent()) {
            if (productToEdit.get().getInvoice().getDateOfRelease() == null && productToEdit.get().getInvoice().getDateOfPayment() == null) {
                Product product = productToEdit.get();
                req.setAttribute("productId", product.getId());
                req.setAttribute("name", product.getName());
                req.setAttribute("price", product.getPrice());
                req.setAttribute("taxType", product.getTaxType());
                req.setAttribute("stock", product.getStock());
                req.getRequestDispatcher("product-add.jsp").forward(req, resp);
            } else {
                System.err.println("invoice closed");
                resp.sendRedirect("/product-list?invoiceId=" + productToEdit.get().getInvoice().getId());
            }
        } else {
            resp.sendRedirect("/product-list?invoiceId=" + productToEdit.get().getInvoice().getId());
        }
    }
}
