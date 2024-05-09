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
add foreign key (preco_variado) references Atividades(preco_variado);

alter table Atividades
add foreign key (id_cliente) references Cliente(id_cliente);

alter table Atividades
add foreign key (id_endereco) references Endereco(id_endereco);

alter table Produto
add foreign key (preco_variado) references Atividades(preco_variado);

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

insert into Atividades (preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (132.58, to_date('10:31:57','HH24:MI:SS'), 'Bairro Industrial', 'Frio', 2, 'Ba', 877, 811);
insert into Atividades (preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (174.60, to_date('15:49:26','HH24:MI:SS'), 'Bairro Santos Dumont', 'Calor', 3, 'Ba', 136, 734);
insert into Atividades (preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (303.99, to_date('05:43:49','HH24:MI:SS'), 'Bairro Santo Meu', 'Ameno', 22, 'Al', 144, 764);
insert into Atividades (preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (467.54, to_date('08:41:53','HH24:MI:SS'), 'Parque Pinheiros', 'Chuva', 10, 'Me', 642, 116);
insert into Atividades (preco_variado, horario_atual, localizacao_atual, clima_atual, qntd_procura, demanda_produto, id_cliente, id_endereco) values (458.97, to_date('09:29:48','HH24:MI:SS'), 'Jardim das Margaridas', 'Calor', 11,'Me', 993, 344);

insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, preco_variado) values (625, 'Tenis Casual', 'Para ser utilizado em diversas situações', 'Kolosh', 139.99, 132.58);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, preco_variado) values (830, 'Tenis Cano Alto', 'Para ser utilizado em diversas situações', 'AllStar', 269.90, 174.60);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, preco_variado) values (953, 'Tenis Esportivo', 'Para praticar esportes', 'Nike', 250.99, 303.99);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, preco_variado) values (182, 'Tenis Plataforma', 'Para deixar a pessoa mais alta', 'Puma', 450.99, 467.54);
insert into Produto (id_prod, nm_prod, desc_prod, marca_prod, preco_fixo, preco_variado) values (644, 'Tenis Chunky Sneakers', 'Para ser diferente', 'Adidas', 479.99, 458.97);

insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, preco_variado, id_cliente, id_prod) values (862, 'Tenis Casual', 3, 397.74, 'Tamanho 37, 38 e 39', 811, 132.58, 877, 625);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, preco_variado, id_cliente, id_prod) values (598, 'Tenis Cano Alto', 4, 698.40, 'Todos tamanho 34', 734, 174.60, 136, 830);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, preco_variado, id_cliente, id_prod) values (187, 'Tenis Esportivo', 1, 303.99, 'Tamanho 35',764, 303.99, 144, 953);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, preco_variado, id_cliente, id_prod) values (216, 'Tenis Plataforma', 7, 322.78, 'Tam 34, 35, 37, 37, 38, 39, 40', 116, 467.54, 642, 182);
insert into Compra (id_compra, nm_prod, qntd_prod, valor_compra, especificacao_prod, id_endereco, preco_variado, id_cliente, id_prod) values (560, 'Tenis Chunky Sneakers', 1, 458.97, 'Tamanho 36', 344, 458.97, 993, 644);

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
