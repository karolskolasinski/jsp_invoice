package JSP_invoice.controller;

import JSP_invoice.services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/invoice-add")
public class InvoiceAddServlet extends HttpServlet {
    private final InvoiceService invoiceService = new InvoiceService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/invoice-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String clientName = req.getParameter("clientName");
        String clientNIP = req.getParameter("clientNIP");
        String clientAddress = req.getParameter("clientAddress");

        invoiceService.addInvoice(clientName, clientNIP, clientAddress);

        resp.sendRedirect("/invoice-list");
    }
}