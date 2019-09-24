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
        String clientName = req.getParameter("clientName");
        String clientNIP = req.getParameter("clientNIP");
        String clientAddress = req.getParameter("clientAddress");
        Invoice invoiceEdited = new Invoice(editedInvoiceId, clientName, clientNIP, clientAddress);
        invoiceService.update(invoiceEdited);
        resp.sendRedirect("/invoice-list");
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
            resp.sendRedirect("invoice-list");
        }
    }
}
