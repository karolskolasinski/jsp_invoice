package JSP_invoice.controller;

import JSP_invoice.services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/invoice-delete")
public class InvoiceDeleteServlet extends HttpServlet {
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long invoiceToRemoveId = Long.parseLong(req.getParameter("invoiceId"));
        invoiceService.removeInvoiceById(invoiceToRemoveId);
        resp.sendRedirect("invoice-list");
    }
}
