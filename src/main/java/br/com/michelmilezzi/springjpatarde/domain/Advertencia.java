package br.com.michelmilezzi.springjpatarde.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
public class Advertencia {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "advertencia_gen")
    @SequenceGenerator(name = "advertencia_gen", sequenceName = "advertencia_id_seq", allocationSize = -1)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "colaborador_id", referencedColumnName = "id")
    private Colaborador colaborador;

    @ManyToOne
    @JoinColumn(name = "gerente_id", referencedColumnName = "id")
    private Colaborador gerente;

    private String descricao;

    @Column(name = "data_advertencia")
    private LocalDate dataDeAdvertencia;

}
