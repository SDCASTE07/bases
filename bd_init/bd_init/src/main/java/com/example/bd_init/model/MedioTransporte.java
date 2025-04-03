//Codigo eleborado por Sergio Daniel Castellanos Rodríguez
package com.example.bd_init.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Modela el medio de transporte personal de un estudiante.
 * @author [Sergio Daniel Castellanos Rodiguez]
 * @see <a href="https://www.baeldung.com/jpa-one-to-one">Baeldung 1:1 Guide</a>
 */
@Entity
@Table(name = "medio_transporte")
@Data
@NoArgsConstructor
public class MedioTransporte {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String tipo; // Ej: "Bicicleta", "Automóvil"

    @OneToOne
    @JoinColumn(name = "estudiante_id", unique = true)
    @JsonIgnoreProperties("medioTransporte")
    private Estudiante estudiante;
}