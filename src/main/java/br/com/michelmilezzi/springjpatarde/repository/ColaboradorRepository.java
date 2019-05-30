package br.com.michelmilezzi.springjpatarde.repository;

import br.com.michelmilezzi.springjpatarde.domain.Colaborador;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Repository
public interface ColaboradorRepository extends JpaRepository<Colaborador, Integer> {

    @Query(value = "SELECT c FROM Colaborador c JOIN FETCH c.setor where c.id = :id")
    Colaborador findByColaboradorId(@Param("id") Integer id);


    @Query(value = "SELECT avg(c.salario) FROM Colaborador c")
    BigDecimal mediaSalarial();

    List<Colaborador> findBySetorIsNull();

    @Query("SELECT min(c.dataDeAdmissao) FROM Colaborador c")
    LocalDate buscarDataAdmissaoMaisAntiga();

    List<Colaborador> findByNomeStartingWithIgnoreCase(String prefixo);

    List<Colaborador> findByGerenteIsNull();

    List<Colaborador> findByHoraInicialBefore(LocalTime tempo);

    @Query(value = "SELECT c FROM Colaborador c JOIN FETCH c.advertenciasRecebidas a ORDER BY a.dataDeAdvertencia ASC")
    List<Colaborador> buscaColaboradorEAdvertencias();

}
