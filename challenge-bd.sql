-----Turma 2TDSPF
---Douglas Magalhães de Araujo - 552008
---Gustavo Argûello Bertacci - 551304
---Luiz Fillipe Farias - 99519
---Rafaella Monique do Carmo Bastos - 552425


---Apagando as tabelas
drop table Cliente cascade constraints;
drop table Compra cascade constraints;
drop table Endereco cascade constraints;
drop table Atividades cascade constraints;
drop table Produto cascade constraints;

---Criação das tabelas
create table Cliente (
    id_cliente char(3) primary key,
    nm_clie varchar(50) not null,
    cpf_clie char(11) unique not null,
    senha_clie varchar(50) not null,
    id_endereco char(3) 
);

create table Compra (
    id_compra char(3) primary key,
    nm_prod varchar(50) not null,
    qntd_prod number(3) not null,
    valor_compra number(8,2) not null,
    especificacao_prod varchar(30) not null,
    id_endereco char(3), 
    id_atividades char(3), 
    id_cliente char(3), 
    id_prod char(3) 
);

create table Endereco (
    id_endereco char(3) primary key,
    cep_endereco char(8) not null,
    rua_endereco varchar(50) not null,
    num_endereco varchar(20) not null,
    bairro_endereco varchar(50) not null,
    cidade_endereco varchar(50) not null,
    estado_endereco char(2) not null,
    pais char(3) not null
); 

create table Atividades (
    id_atividades char(3) primary key,
    preco_variado number(8,2),
    horario_atual date,
    localizacao_atual varchar(50),
    clima_atual varchar(20),
    qntd_procura number(10) not null,
    demanda_produto char(2) not null,
    id_cliente char(3),
    id_endereco char(3) 
);

create table Produto (
    id_prod char(3) primary key,
    nm_prod varchar(50) not null,
    desc_prod varchar(50) not null,
    marca_prod varchar(15) not null,
    preco_fixo number(8,2) not null,
    id_atividades char(3)
);

---Inserção das chaves estrangeiras
alter table Cliente
add foreign key (id_endereco) references Endereco(id_endereco);

alter table Compra
add foreign key (id_endereco) references Endereco(id_endereco);

alter table Compra
add foreign key (id_cliente) references Cliente(id_cliente);

alter table Compra
add foreign key (id_prod) references Produto(id_prod);

alter table Compra
add foreign key (id_atividades) references Atividades(id_atividades);

alter table Atividades
add foreign key (id_cliente) references Cliente(id_cliente);

alter table Atividades
add foreign key (id_endereco) references Endereco(id_endereco);

alter table Produto
add foreign key (id_atividades) references Atividades(id_atividades);

---Função para validar entrada de dados
CREATE OR REPLACE FUNCTION ValidarSenha(senha_clie IN varchar2)
RETURN NUMBER
AS
    valido NUMBER := 0;
BEGIN
    IF senha_clie IS NOT NULL AND LENGTH(senha_clie) BETWEEN 8 AND 50 AND
       REGEXP_LIKE(senha_clie, '[0-9]') AND REGEXP_LIKE(senha_clie, '[A-Z]') AND REGEXP_LIKE(senha_clie, '[a-z]')
    THEN 
        valido := 1;
    END IF;
       
    RETURN valido;
END;
/

    
CREATE OR REPLACE FUNCTION ValidarCpf(cpf_clie IN varchar2)
RETURN NUMBER
AS
    valido NUMBER := 0;
BEGIN
    IF cpf_clie IS NOT NULL AND LENGTH(cpf_clie) = 11 AND
        REGEXP_LIKE(cpf_clie, '^\d{11}$')
    THEN
        valido := 1;
    END IF;
    
    RETURN valido;
END;
/

---Inserção de dados nas tabelas
insert into Endereco (id_endereco, cep_endereco, rua_endereco, num_endereco, bairro_endereco, cidade_endereco, estado_endereco, pais) values (811, 49065220, 'Rua Conego Serapiao Machado', 5, 'Bairro industrial', 'Aracaju', 'SE', 'Bra');
insert into Endereco (id_endereco, cep_endereco, rua_endereco, num_endereco, bairro_endereco, cidade_endereco, estado_endereco, pais) values (734, 45208190, 'Rua acampamento velho', 10, 'Bairro Jequiezinho', 'Jequie', 'BA', 'Bra');
insert into Endereco (id_endereco, cep_endereco, rua_endereco, num_endereco, bairro_endereco, cidade_endereco, estado_endereco, pais) values (764, 77064114, 'Rua SF', 15, 'Bairro Setor Santa Fé', 'Palmas', 'TO', 'Bra');
insert into Endereco (id_endereco, cep_endereco, rua_endereco, num_endereco, bairro_endereco, cidade_endereco, estado_endereco, pais) values (116, 79841510, 'Rua Venezuela', 20, 'Parque das Nações', 'Dourado', 'MS', 'Bra');
insert into Endereco (id_endereco, cep_endereco, rua_endereco, num_endereco, bairro_endereco, cidade_endereco, estado_endereco, pais) values (344, 58068183, 'Rua José Pereira de Lima Filho', 25, 'Bairro Gramame', 'Joao Pessoa', 'PB', 'BRA');

insert into Cliente (id_cliente, nm_clie, cpf_clie, senha_clie, id_endereco) values (877, 'Lorenzo Giovanni Calebe Ferreira', 26019118088, 'MPRFuQYLWSfN0iU', 811);
insert into Cliente (id_cliente, nm_clie, cpf_clie, senha_clie, id_endereco) values (136, 'Eduardo Bruno Leandro Gonçalves', 84214739051, 'L6WneERuzRiEtko', 734);
insert into Cliente (id_cliente, nm_clie, cpf_clie, senha_clie, id_endereco) values (144, 'Matheus Luan Fogaça', 55533248072, 'RMEzoAw3OlOgDri', 764);
insert into Cliente (id_cliente, nm_clie, cpf_clie, senha_clie, id_endereco) values (642, 'Pedro Henrique Márcio Costa', 28175653043, 's8histwMgcK7TLA', 116);
insert into Cliente (id_cliente, nm_clie, cpf_clie, senha_clie, id_endereco) values (993, 'Benedita Simone Melissa da Cunha', 42869783035, '6hYQnI0A7dBmJO8', 344);

insert into Atividades (id_atividades, preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (435, 132.58, to_date('10:31:57','HH24:MI:SS'), 'Bairro Industrial', 'Frio', 2, 'Ba', 877, 811);
insert into Atividades (id_atividades, preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (493, 174.60, to_date('15:49:26','HH24:MI:SS'), 'Bairro Santos Dumont', 'Calor', 3, 'Ba', 136, 734);
insert into Atividades (id_atividades, preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (807, 303.99, to_date('05:43:49','HH24:MI:SS'), 'Bairro Santo Meu', 'Ameno', 22, 'Al', 144, 764);
insert into Atividades (id_atividades, preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (932, 467.54, to_date('08:41:53','HH24:MI:SS'), 'Parque Pinheiros', 'Chuva', 10, 'Me', 642, 116);
insert into Atividades (id_atividades, preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (108, 458.97, to_date('09:29:48','HH24:MI:SS'), 'Jardim das Margaridas', 'Calor', 11,'Me', 993, 344);

insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades) values (625, 'Tenis Casual', 'Para ser utilizado em diversas situações', 'Kolosh', 139.99, 435);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades) values (830, 'Tenis Cano Alto', 'Para ser utilizado em diversas situações', 'AllStar', 269.90, 493);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades) values (953, 'Tenis Esportivo', 'Para praticar esportes', 'Nike', 250.99, 807);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades) values (182, 'Tenis Plataforma', 'Para deixar a pessoa mais alta', 'Puma', 450.99, 932);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades) values (644, 'Tenis Chunky Sneakers', 'Para ser diferente', 'Adidas', 479.99, 108);

insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, id_atividades, id_cliente, id_prod) values (862, 'Tenis Casual', 3, 397.74, 'Tamanho 37, 38 e 39', 811, 435, 877, 625);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, id_atividades, id_cliente, id_prod) values (598, 'Tenis Cano Alto', 4, 698.40, 'Todos tamanho 34', 734, 493, 136, 830);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, id_atividades, id_cliente, id_prod) values (187, 'Tenis Esportivo', 1, 303.99, 'Tamanho 35',764, 807, 144, 953);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, id_atividades, id_cliente, id_prod) values (216, 'Tenis Plataforma', 7, 322.78, 'Tam 34, 35, 37, 37, 38, 39, 40', 116, 932, 642, 182);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, id_atividades, id_cliente, id_prod) values (560, 'Tenis Chunky Sneakers', 1, 458.97, 'Tamanho 36', 344, 108, 993, 644);

--- Primeiro bloco anônimo
set serveroutput on
BEGIN
    FOR c IN (SELECT cl.nm_clie, COUNT(co.id_compra) AS total_compras
              FROM Cliente cl
              JOIN Compra co ON cl.id_cliente = co.id_cliente
              GROUP BY cl.nm_clie
              ORDER BY total_compras DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || c.nm_clie || ' - Total de Compras: ' || c.total_compras);
    END LOOP;


    FOR p IN (SELECT pr.nm_prod, SUM(co.qntd_prod) AS total_vendido
              FROM Produto pr
              JOIN Compra co ON pr.id_prod = co.id_prod
              GROUP BY pr.nm_prod
              ORDER BY total_vendido DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || p.nm_prod || ' - Total Vendido: ' || p.total_vendido);
    END LOOP;


    FOR a IN (SELECT at.localizacao_atual, COUNT(at.id_cliente) AS total_clientes
              FROM Atividades at
              GROUP BY at.localizacao_atual
              ORDER BY total_clientes DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Localização Atual: ' || a.localizacao_atual || ' - Total Clientes: ' || a.total_clientes);
    END LOOP;
END;
/

--- Segundo bloco anônimo 
set serveroutput on
BEGIN
    FOR c IN (SELECT cl.nm_clie, MAX(cl.cpf_clie) AS cpf_clie
              FROM Cliente cl
              JOIN Compra co ON cl.id_cliente = co.id_cliente
              GROUP BY cl.nm_clie
              HAVING COUNT(co.id_compra) > 0)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || c.nm_clie || ' - CPF: ' || c.cpf_clie);
    END LOOP;


    FOR p IN (SELECT pr.nm_prod, AVG(co.valor_compra) AS media_compra
              FROM Produto pr
              JOIN Compra co ON pr.id_prod = co.id_prod
              GROUP BY pr.nm_prod
              ORDER BY media_compra DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || p.nm_prod || ' - Média de Compra: ' || p.media_compra);
    END LOOP;
    
    
    FOR a IN (SELECT at.clima_atual, SUM(at.qntd_procura) AS total_procura
              FROM Atividades at
              GROUP BY at.clima_atual
              ORDER BY total_procura DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Clima Atual: ' || a.clima_atual || ' - Total Procura: ' || a.total_procura);
    END LOOP;
END;
/

---Procedure de insert
CREATE OR REPLACE PROCEDURE InserirProduto
(id_prod IN CHAR, nm_prod IN VARCHAR, desc_prod IN VARCHAR, marca_prod IN VARCHAR, preco_fixo IN NUMBER, id_atividades CHAR)
AS
BEGIN
    INSERT INTO PRODUTO(id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, id_atividades)
    VALUES(151, 'Tênis Casual', 'Para ser utilizado em diversas situações', 'Vizzano', 170.99, 830);
END;
/

---Procedure de delete
CREATE OR REPLACE PROCEDURE ExcluirProduto
(p_id_prod IN varchar2)
IS
BEGIN
    DELETE FROM Produto p
        WHERE p.id_prod = p_id_prod;
    dbms_output.put_line('ID ' || p_id_prod || CASE WHEN sql%rowcount = 0 THEN ' não ' END || ' deletado');
END;
/

---Procedure para imprimir um relatório dos clientes que fizeram alguma compra no sistema
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE RelatorioCompras AS
    CURSOR c_relatorio IS
        SELECT 
            c.nm_clie AS NomeCliente,
            c.cpf_clie AS CPF,
            COUNT(comp.id_compra) AS TotalCompras,
            SUM(comp.valor_compra) AS TotalGasto
        FROM 
            Cliente c
        INNER JOIN 
            Compra comp ON c.id_cliente = comp.id_cliente
        WHERE 
            comp.qntd_prod > 1
        GROUP BY 
            c.nm_clie, c.cpf_clie
        ORDER BY 
            SUM(comp.valor_compra) DESC;
    
    r_relatorio c_relatorio%ROWTYPE;
BEGIN
    dbms_output.put_line('Relatório de Compras');
    dbms_output.put_line('--------------------');

    OPEN c_relatorio;
    LOOP
        FETCH c_relatorio INTO r_relatorio;
        EXIT WHEN c_relatorio%NOTFOUND;

        dbms_output.put_line('Nome do cliente: ' || r_relatorio.NomeCliente);
        dbms_output.put_line('CPF: ' || r_relatorio.CPF);
        dbms_output.put_line('Total de compras: ' || r_relatorio.TotalCompras);
        dbms_output.put_line('Total gasto: ' || r_relatorio.TotalGasto);
        dbms_output.put_line('--------------------');
    END LOOP;
    CLOSE c_relatorio;
END;
/

BEGIN
    RelatorioCompras;
END;
/
