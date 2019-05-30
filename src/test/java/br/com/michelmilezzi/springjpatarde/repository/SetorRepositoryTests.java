package br.com.michelmilezzi.springjpatarde.repository;

import br.com.michelmilezzi.springjpatarde.model.MediaSalarial;
import br.com.michelmilezzi.springjpatarde.domain.Setor;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SetorRepositoryTests {

    @Autowired
    private SetorRepository setorRepository;

    @Test
    public void findAllTests() {
        List<Setor> setores = setorRepository.findAll();
        for (Setor setor : setores) {
            System.out.println("Setor: " + setor.getNome());
        }
    }

    // 2) Selecione todos os setores que ainda não possuem colaboradores.
    @Test
    public void buscarSetoresQueNaoPossuemColaboradoresTest() {
        List<Setor> setores = setorRepository.buscarSetoresQueNaoPossuemColaboradores();
        Assertions.assertThat(setores.size()).isEqualTo(1);
        Assertions.assertThat(setores.get(0).getNome()).isEqualTo("Aspones");
    }

    @Test
    public void mediaSalarialDoSetor1Test() {
        MediaSalarial media = setorRepository.calcularMediaSalarial(1);
        Assertions.assertThat(media.getMediaSalarial()).isGreaterThan(10D);
    }

}
