package JSP_invoice.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Invoice implements IBaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @CreationTimestamp
    @Column()
    private LocalDateTime dateOfCreation;

    @Column(nullable = false)
    private String clientName;

    @Column(length = 10)
    private String clientNIP;

    @Column
    private String clientAddress;

    @Column(nullable = false, columnDefinition = "tinyint default 0")
    private boolean ifPaid;

    private LocalDateTime dateOfRelease;
    private LocalDateTime dateOfPayment;

    @Formula(value = "(SELECT SUM(p.price * p.stock) from product p where p.invoice_id = id)")
    private Double billValue;

    @OneToMany(mappedBy = "invoice", fetch = FetchType.EAGER)
//    @JoinColumn(name = "invoice_id")
    private List<Product> productList;

    public Invoice(String clientName, String clientNIP, String clientAddress) {
        this.clientName = clientName;
        this.clientNIP = clientNIP;
        this.clientAddress = clientAddress;
    }
}
