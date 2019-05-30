--2)
SELECT * FROM colaborador c JOIN setor s ON (c.setor_id = s.id);

--3)
SELECT s.* FROM colaborador c RIGHT JOIN setor s ON (c.setor_id = s.id) WHERE c.id IS NULL;

--4)
SELECT * FROM colaborador c WHERE c.setor_id IS NULL;

--5)
select * from colaborador ORDER BY data_admissao ASC LIMIT 5;

--6)
select min(data_admissao) from colaborador;

--7)
SELECT s.nome as nome_setor, c.nome AS nome_colaborador FROM colaborador c CROSS JOIN setor s;

--8)
SELECT sum(saldo), colaborador_id FROM relogio_ponto where data_apontamento BETWEEN '2019-05-01' AND '2019-05-31' GROUP BY colaborador_id order by 1 asc limit 1;

--9)
alter table relogio_ponto ADD UNIQUE(colaborador_id, data_apontamento);

--10)
ALTER TABLE colaborador ADD COLUMN salario NUMERIC(16,4) NOT NULL DEFAULT 0;

--11)
INSERT INTO setor VALUES (1, 'Desenvolvimento') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;

--12)
SELECT COUNT(*), colaborador_id FROM advertencia WHERE data_advertencia BETWEEN '2019-01-01' AND '2019-12-31' group by colaborador_id order by 1 desc limit 1

--13)
SELECT 
	s.nome 
FROM 
	colaborador c 
	JOIN setor s ON (s.id = c.setor_id)
WHERE 
	c.id IN (
		SELECT colaborador_id FROM advertencia WHERE data_advertencia BETWEEN '2019-01-01' AND '2019-12-31' group by colaborador_id order by COUNT(*) desc limit 1
	) 

--14)
ALTER TABLE colaborador ADD CHECK (salario > 0);

--15)
SELECT * FROM colaborador c FULL JOIN setor s ON (c.setor_id = s.id) WHERE c.id IS NULL OR s.id IS NULL;

--16
select * from colaborador WHERE nome ILIKE 'c%';

--17)
select * from colaborador where gerente_id is null;

--18)
select *, g.nome AS nome_gerente from colaborador c JOIN colaborador g ON (c.gerente_id = g.id);

--19)
select count(*), data_advertencia from advertencia group by data_advertencia order by 1 desc limit 1;

--20)
select c.nome, a.descricao from advertencia a JOIN colaborador c ON (a.colaborador_id = c.id) order by data_advertencia desc;

--21)
select * from colaborador where hora_inicial < '08:00:00';
