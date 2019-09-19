package JSP_invoice.controller;

import JSP_invoice.model.Invoice;
import JSP_invoice.services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/invoice-list")
public class InvoiceListServlet extends HttpServlet {
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Invoice> invoiceList = invoiceService.findAll();
        req.setAttribute("invoice_list_from_controller_InvoiceListServlet", invoiceList);

        req.getRequestDispatcher("/invoice-list.jsp").forward(req, resp);
    }
}