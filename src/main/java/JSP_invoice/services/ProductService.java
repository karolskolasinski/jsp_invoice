package JSP_invoice.services;

import JSP_invoice.database.EntityDao;
import JSP_invoice.model.Invoice;
import JSP_invoice.model.Product;
import JSP_invoice.model.TaxType;

import java.util.List;

public class ProductService {
    private EntityDao entityDao = new EntityDao();

    public ProductService() {
    }

    public List<Product> findAll() {
        return entityDao.getAll(Product.class);
    }

    public void addProduct(String name, double price, TaxType taxType, int stock, Invoice invoice) {
        Product product = new Product(name, price, taxType, stock);
        product.setInvoice(invoice);
        entityDao.saveOrUpdate(product);
    }
}
