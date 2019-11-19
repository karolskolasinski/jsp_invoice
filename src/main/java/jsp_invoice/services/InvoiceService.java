package jsp_invoice.services;

import jsp_invoice.database.EntityDao;
import jsp_invoice.model.Invoice;

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

    public void removeInvoiceById(Long invoiceById) {
        entityDao.delete(Invoice.class, invoiceById);
    }

    public Optional<Invoice> getInvoiceById(Long invoiceById) {
        return entityDao.getById(Invoice.class, invoiceById);
    }

    public void updateInvoice(Invoice invoiceEdited) {
        entityDao.saveOrUpdate(invoiceEdited);
    }
}
