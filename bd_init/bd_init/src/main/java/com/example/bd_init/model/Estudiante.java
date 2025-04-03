//Codigo eleborado por Sergio Daniel Castellanos Rodríguez
package com.example.bd_init.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

@Entity
@Table(name = "estudiante")
@Data
@NoArgsConstructor
public class Estudiante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nombre;
    private String telefono;

    @ManyToOne
    @JoinColumn(name = "profesor_id", nullable = false)
    @JsonIgnoreProperties("estudiantes") // Evita recursión JSON
    private Profesor profesor;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "estudiante_materia",
            joinColumns = @JoinColumn(name = "estudiante_id"),
            inverseJoinColumns = @JoinColumn(name = "materia_id")
    )
    @JsonIgnoreProperties("estudiantes")
    private List<Materia> materias;

    // Relación 1:1 con MedioTransporte
    @OneToOne(mappedBy = "estudiante", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("estudiante")
    private MedioTransporte medioTransporte;
}