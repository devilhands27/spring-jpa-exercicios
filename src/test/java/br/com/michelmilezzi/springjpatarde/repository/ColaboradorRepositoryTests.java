package br.com.michelmilezzi.springjpatarde.repository;

import br.com.michelmilezzi.springjpatarde.domain.Advertencia;
import br.com.michelmilezzi.springjpatarde.domain.Colaborador;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ColaboradorRepositoryTests {

    @Autowired
    private ColaboradorRepository colaboradorRepository;

    @Test
    public void testFindByColaboradorId() {
        Colaborador colaborador = colaboradorRepository.findByColaboradorId(1);
        Assertions.assertThat(colaborador.getNome()).isEqualTo("Trump");
    }

    // 1) Selecione todos os colaboradores mostrando seus respectivos setores.
    @Test
    @Transactional
    public void buscarColaboradorESetor() {

        List<Colaborador> colaboradores = colaboradorRepository.findAll();

        for (Colaborador colaborador : colaboradores) {
            System.out.println(String.format("%s -> %s", colaborador.getNome(), colaborador.getSetor() != null ? colaborador.getSetor().getNome() : "Sem Setor" ));
        }

        Assertions.assertThat(colaboradores.size()).isEqualTo(11);

    }

    // 3) Selecione todos os colaboradores que ainda não estão alocados em setores.
    @Test
    public void buscaColaboradorSemSetor() {
        List<Colaborador> colaboradores = colaboradorRepository.findBySetorIsNull();
        Assertions.assertThat(colaboradores.size()).isEqualTo(1);
        Assertions.assertThat(colaboradores.get(0).getNome()).isEqualTo("Sandoval");
    }

    // 4) Selecione a data de admissão mais antiga de um colaborador.
    @Test
    public void buscaDataDeAdmissaoMaisAntiga() {
        LocalDate dataDeAdmissao = colaboradorRepository.buscarDataAdmissaoMaisAntiga();
        Assertions.assertThat(dataDeAdmissao).isEqualTo(LocalDate.of(1999, 1, 1));
    }

    // 5) Selecione todos os colaboradores que iniciam com a letra 'c'. Faça a busca de modo case insensitive.
    @Test
    public void buscaColaboradoresComONomeComecandoComC() {
        List<Colaborador> colaboradores = colaboradorRepository.findByNomeStartingWithIgnoreCase("c");
        Assertions.assertThat(colaboradores.size()).isEqualTo(2);
    }

    // 6) Selecione todos os colaboradores que não possuem gerente.
    @Test
    public void buscaColaboradorSemGerente() {
        List<Colaborador> colaboradores = colaboradorRepository.findByGerenteIsNull();
        Assertions.assertThat(colaboradores.size()).isEqualTo(4);
    }

    // 7) Selecione todos os colaboradores e o nome de seus respectivos gerentes.
    @Test
    public void buscarColaboradorEONomeDoSeuGerente() {

        List<Colaborador> colaboradores = colaboradorRepository.findAll();

        for (Colaborador colaborador : colaboradores) {
            System.out.println(String.format("%s -> %s", colaborador.getNome(), colaborador.getGerente() != null ? colaborador.getGerente().getNome() : "Sem Gerente" ));
        }

        Assertions.assertThat(colaboradores.size()).isEqualTo(11);

    }

    // 8) Selecione o nome do colaborador e a descrição de sua advertência, ordenados de forma decrescente pela data da advertência.
    @Test
    public void buscarColaboradorEAdvertencia() {

        List<Colaborador> colaboradores = colaboradorRepository.buscaColaboradorEAdvertencias();

        for (Colaborador colaborador : colaboradores) {

            for (Advertencia advertencia : colaborador.getAdvertenciasRecebidas()) {
                System.out.println(String.format("%s -> %s", colaborador.getNome(), advertencia.getDescricao()));
            }

        }

        Assertions.assertThat(colaboradores.size()).isEqualTo(7);

    }


    // 9) Selecione todos os colaboradores que iniciam seu turno antes das 08:00.
    @Test
    public void buscarColaboradorQueIniciaTurnoAntesDas8() {

        List<Colaborador> colaboradores = colaboradorRepository.findByHoraInicialBefore(LocalTime.of(8, 0));

        for (Colaborador colaborador : colaboradores) {
            System.out.println(colaborador.getNome());
        }

        Assertions.assertThat(colaboradores.size()).isEqualTo(10);

    }

    // 10) Selecione a media salarial dos colaboradores por setor
    @Test
    public void mediaSalarialTest() {
        BigDecimal mediaSalarial = colaboradorRepository.mediaSalarial();
        Assertions.assertThat(mediaSalarial).isGreaterThan(BigDecimal.TEN);
    }

}
