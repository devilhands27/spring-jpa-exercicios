package br.com.michelmilezzi.springjpatarde.repository;

import br.com.michelmilezzi.springjpatarde.model.MediaSalarial;
import br.com.michelmilezzi.springjpatarde.domain.Setor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SetorRepository extends JpaRepository<Setor, Integer> {

    @Query("SELECT new br.com.michelmilezzi.springjpatarde.model.MediaSalarial(s, avg(c.salario)) FROM Setor s JOIN s.colaboradores c WHERE s.id = :id GROUP BY s")
    MediaSalarial calcularMediaSalarial(@Param("id") Integer id);

    @Query("SELECT s FROM Setor s LEFT JOIN s.colaboradores c WHERE c IS NULL")
    List<Setor> buscarSetoresQueNaoPossuemColaboradores();
//    SELECT s.* FROM setor s  LEFT JOIN colaborador c ON (c.setor_id = s.id) WHERE c.id IS NULL;

}
