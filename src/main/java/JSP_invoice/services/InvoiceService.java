package JSP_invoice.services;

import JSP_invoice.database.EntityDao;
import JSP_invoice.model.Invoice;

import java.util.List;
import java.util.Optional;

public class InvoiceService {
    private EntityDao entityDao = new EntityDao();

    public InvoiceService() {
    }

    public List<Invoice> findAll() {
        return entityDao.getAll(Invoice.class);
    }

    public void addInvoice(String clientName, String clientNIP, String clientAddress) {
        entityDao.saveOrUpdate(new Invoice(clientName, clientNIP, clientAddress));
    }

    public void removeStudentById(Long invoiceById) {
        entityDao.delete(Invoice.class, invoiceById);
    }

    public Optional<Invoice> getStudentById(Long invoiceById) {
        return entityDao.getById(Invoice.class, invoiceById);
    }

    public void update(Invoice studentEdited) {
        entityDao.saveOrUpdate(studentEdited);
    }
}