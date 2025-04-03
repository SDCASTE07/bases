//Codigo eleborado por Sergio Daniel Castellanos Rodríguez
package com.example.bd_init.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Representa un equipo deportivo al que pueden pertenecer múltiples estudiantes.
 * Relación N:M con Estudiante mediante tabla intermedia.
 * @author [Sergio Daniel Castellanos Rodriguez]
 * @see <a href="https://docs.jboss.org/hibernate/orm/6.4/userguide/html_single/Hibernate_User_Guide.html#associations-many-to-many">Hibernate Docs</a>
 */
@Entity
@Table(name = "equipo_deportivo")
@Data
@NoArgsConstructor
public class EquipoDeportivo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String nombre;

    @ManyToMany
    @JoinTable(
            name = "estudiante_equipo",
            joinColumns = @JoinColumn(name = "equipo_id"),
            inverseJoinColumns = @JoinColumn(name = "estudiante_id")
    )
    @JsonIgnoreProperties("equipos") // Evita recursión en JSON
    private List<Estudiante> miembros;
}
