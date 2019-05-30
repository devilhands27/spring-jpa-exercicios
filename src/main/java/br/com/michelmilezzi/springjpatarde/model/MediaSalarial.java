package br.com.michelmilezzi.springjpatarde.model;

import br.com.michelmilezzi.springjpatarde.domain.Setor;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MediaSalarial {

    private Setor setor;
    private Double mediaSalarial;

}
