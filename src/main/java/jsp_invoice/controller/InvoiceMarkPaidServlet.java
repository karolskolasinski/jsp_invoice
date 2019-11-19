package jsp_invoice.controller;

import jsp_invoice.model.Invoice;
import jsp_invoice.services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Optional;

@WebServlet("/invoice-mark-paid")
public class InvoiceMarkPaidServlet extends HttpServlet {
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long invoiceToMarkPaid = Long.parseLong(req.getParameter("invoiceId"));
        Optional<Invoice> invoiceOptionalToEdit = invoiceService.getInvoiceById(invoiceToMarkPaid);
        if (invoiceOptionalToEdit.isPresent()) {
            if (invoiceOptionalToEdit.get().getDateOfRelease() == null) {
                System.err.println("first set dateOfRelease");
                resp.sendRedirect("/invoice-list");
            } else if (invoiceOptionalToEdit.get().getDateOfPayment() == null) {
                Invoice invoice = invoiceOptionalToEdit.get();
                invoice.setDateOfPayment(LocalDateTime.now());
                invoiceService.updateInvoice(invoice);
                resp.sendRedirect("/invoice-list");
            } else {
                System.err.println("dateOfPayment is already set");
                resp.sendRedirect("/invoice-list");
            }
        } else {
            resp.sendRedirect("/invoice-list");
        }
    }
}
