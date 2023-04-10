package main.java.com.nixsolution.semenov.models;

import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Role")
public class Role {

    public Role(){}
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_role", nullable = false)
    private Long id_role;

    @Column(name = "name")
    private String name;
}
