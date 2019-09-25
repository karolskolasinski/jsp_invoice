package JSP_invoice.controller;

import JSP_invoice.model.Invoice;
import JSP_invoice.services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/invoice-edit")
public class InvoiceEditServlet extends HttpServlet {
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Long editedInvoiceId = Long.parseLong(req.getParameter("invoiceId"));
        String editedClientName = req.getParameter("clientName");
        String editedClientNIP = req.getParameter("clientNIP");
        String editedClientAddress = req.getParameter("clientAddress");

        Optional<Invoice> invoiceToEdit = invoiceService.getInvoiceById(editedInvoiceId);
        if (invoiceToEdit.isPresent()) {
            Invoice invoice = invoiceToEdit.get();
            invoice.setClientName(editedClientName);
            invoice.setClientNIP(editedClientNIP);
            invoice.setClientAddress(editedClientAddress);
            invoiceService.updateInvoice(invoice);
            resp.sendRedirect("/invoice-list");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long invoiceToEditId = Long.parseLong(req.getParameter("invoiceId"));
        Optional<Invoice> invoiceToEdit = invoiceService.getInvoiceById(invoiceToEditId);
        if (invoiceToEdit.isPresent()) {
            Invoice invoice = invoiceToEdit.get();
            req.setAttribute("invoiceId", invoice.getId());
            req.setAttribute("clientName", invoice.getClientName());
            req.setAttribute("clientNIP", invoice.getClientNIP());
            req.setAttribute("clientAddress", invoice.getClientAddress());
            req.getRequestDispatcher("invoice-add.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/invoice-list");
        }
    }
}
