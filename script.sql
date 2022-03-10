--drop table masina;
--drop table motorizare;
--drop table furnizor;
--drop table marca;
--drop table comanda;
--drop table vanzator;
--drop table client;
--drop table adresa;

create table adresa (
adresa_id number(5) 
    constraint ADRESA_adresa_id_PK primary key,
localitate varchar2(30) 
    constraint ADRESA_localitate_NN not null,
strada varchar2(30) 
    constraint ADRESA_strada_NN not null,
numar number(5)
    constraint ADRESA_numar_NN not null,
cod_postal number(6) 
    constraint ADRESA_cod_postal_NN not null);


create table client (
client_id number(5)
    constraint CLIENT_client_id_PK primary key,
adresa_id number(5)
    constraint CLIENT_adresa_id_FK references adresa(adresa_id) on delete set null,
nume varchar2(20)
    constraint CLIENT_nume_NN not null,
prenume varchar2(20)
    constraint CLIENT_prenume_NN not null,
telefon varchar2(10) 
    constraint CLIENT_telefon_NN not null
    constraint CLIENT_telefon_U unique
    constraint CLIENT_telefon_C check (length(telefon) = 10),
email varchar2(30) 
    constraint CLIENT_email_NN not null
    constraint CLIENT_email_U unique
    constraint CLIENT_email_C check (regexp_like(email, '[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]')));
    

create table vanzator (
vanzator_id number(4)
    constraint VANZATOR_vanzator_id_PK primary key,
nume varchar2(20)
    constraint VANZATOR_nume_NN not null,
prenume varchar2(20)
    constraint VANZATOR_prenume_NN not null,
email varchar2(30)
    constraint VANZATOR_email_NN not null
    constraint VANZATOR_email_U unique
    constraint VANZATOR_email_C check (regexp_like(email, '[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]')),
data_angajare date
    constraint VANZATOR_data_NN not null,
salariu number(10, 2)
    constraint VANZATOR_salariu_NN not null);


create table comanda (
comanda_id number(6)
    constraint COMANDA_comanda_id_PK primary key,
client_id number(5)
    constraint COMANDA_client_id_FK references client(client_id) on delete cascade
    constraint COMANDA_client_id_NN not null,
vanzator_id number(4)
    constraint COMANDA_vanzator_id_FK references vanzator(vanzator_id) on delete set null,
data_comanda date
    constraint COMANDA_data_comanda_NN not null,
metoda_plata varchar2(20)
    constraint COMANDA_metoda_plata_NN not null);
    

create table marca (
marca_id number(3)
    constraint MARCA_marca_id_PK primary key,
nume varchar2(20)
    constraint MARCA_nume_NN not null,
tara_origine varchar2(20)
    constraint MARCA_tara_origine_NN not null);
    

create table furnizor (
furnizor_id number(4)
    constraint FURNIZOR_furnizor_id_PK primary key,
nume_companie varchar2(20)
    constraint FURNIZOR_nume_companie_NN not null,
nume_contact varchar2(20)
    constraint FURNIZOR_nume_contact_NN not null,
prenume_contact varchar2(20)
    constraint FURNIZOR_prenume_contact_NN not null,
email_contact varchar2(30)
    constraint FURNIZOR_email_contact_NN not null
    constraint FURNIZOR_email_contact_U unique
    constraint FURNIZOR_email_contact_C check (regexp_like(email_contact, '[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]')));
    

create table motorizare (
motorizare_id number(4)
    constraint MOTORIZARE_motorizare_id_PK primary key,
volum_motor number(5)
    constraint MOTORIZARE_volum_motor_NN not null,
putere number(4)
    constraint MOTORIZARE_putere_NN not null,
cuplu number(4)
    constraint MOTORIZARE_cuplu_NN not null);
    

create table masina (
masina_id number(6)
    constraint MASINA_masina_id_PK primary key,
marca_id number(3)
    constraint MASINA_marca_id_FK references marca(marca_id) on delete cascade
    constraint MASINA_marca_id_NN not null,
comanda_id number(6)
    constraint MASINA_comanda_id_FK references comanda(comanda_id) on delete set null,
furnizor_id number(4)
    constraint MASINA_furnizor_id_FK references furnizor(furnizor_id) on delete cascade
    constraint MASINA_furnizor_id_NN not null,
motorizare_id number(4)
    constraint MASINA_motorizare_id_FK references motorizare(motorizare_id) on delete cascade
    constraint MASINA_motorizare_id_NN not null,
model varchar2(20)
    constraint MASINA_model_NN not null,
an_fabricatie number(4)
    constraint MASINA_an_fabricatie_NN not null,
tip_caroserie varchar2(20)
    constraint MASINA_tip_caroserie_NN not null,
combustibil varchar2(10)
    constraint MASINA_combustibil_NN not null,
culoare varchar2(10)
    constraint MASINA_culoare_NN not null);



insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values (0, 'Ploiesti', 'Salcamilor', 49, 100078);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(1, 'Oradea', 'Aurel Vlaicu', 62, 559511);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(2, 'Targoviste', 'Castanilor', 88, 733220);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(3, 'Botosani', 'Traian', 35, 585576);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(4, 'Focsani', 'Bega', 4, 418009);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(5, 'Lugoj', 'Florilor', 19, 406266);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(6, 'Nasaud', 'Frasinului', 36, 527724);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(7, 'Alexandria', 'Dunarii', 58, 147430);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(8, 'Beclean', 'Invatatorului', 85, 522253);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(9, 'Zarnesti', 'Bradului', 234, 380141);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(10, 'Strehaia', 'Ciresilor', 643, 257534);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(11, 'Sulina', 'Zidarilor', 22, 328707);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(12, 'Orsova', 'Castanilor', 78, 551012);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(13, 'Sibiu', 'Mihai Viteazul', 640, 827651); 

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(14, 'Pitesti', 'Jiului', 11, 184776);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(15, 'Craiova', 'Trandafirului', 34, 198745);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(16, 'Galati', '13 Septembrie', 532, 978354);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(17, 'Braila', 'Scolii', 34, 147341);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(18, 'Alexandria', 'Dunarii', 77, 147430);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(19, 'Alexandria', 'Dunarii', 59, 147430);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(20, 'Sibiu', 'Pinului', 620, 827651); 

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(21, 'Bacau', 'Crizantemelor', 845, 432165);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(22, 'Baia Mare', 'Independentei', 66, 543657);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(23, 'Buzau', 'Monumentului', 646, 895683);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(24, 'Suceava', 'Razboiului', 787, 123456);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(25, 'Suceava', 'Razboiului', 789, 123456);   

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(26, 'Slatina', 'Muncii', 745, 646724);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(27, 'Calarasi', 'Patriei', 75, 647632);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(28, 'Giurgiu', 'Rulmentului', 61, 546534);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(29, 'Alba Iulia', 'Lalelelor', 6, 342245);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(30, 'Deva', 'Muntelui', 1293, 876867);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(31, 'Zalau', 'Fantanei', 33, 878767);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(32, 'Bucuresti', 'Coresi', 555, 786868);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(33, 'Bucuresti', '16 Februarie', 155, 786866);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(34, 'Bucuresti', '16 Februarie', 157, 786866);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(35, 'Bucuresti', '16 Februarie', 455, 786966);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(36, 'Craiova', 'Trandafirului', 14, 198745);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(37, 'Craiova', 'Academiei', 34, 298745);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(38, 'Mangalia', 'Soarelui', 98, 323454);

insert into adresa (adresa_id, localitate, strada, numar, cod_postal)
values(39, 'Dej', 'Podului', 33, 123423);

----------

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(0, 7, 'Brinceanu', 'Andi', '0767429269', 'andimadalin@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(1, 0, 'Nistor', 'Andrei', '0746786543', 'andrei1@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(2, 3, 'Stanciu', 'Bogdan', '0727891234', 'bst@yahoo.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(3, 3, 'Stanciu', 'Daniela', '0726785462', 'danielas@yahoo.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(4, 8, 'Diaconescu', 'Alfred', '0735987634', 'diacalf@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(5, 2, 'Iancu', 'Igor', '0715679872', 'igor21@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(6, null, 'Constantin', 'Horia', '0751238542' , 'horia44@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(7, 1, 'Dragan', 'Maria', '0741008802', 'drg@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(8, 4, 'Dumitrescu', 'Alina', '0747298294', 'alndm@yahoo.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(9, 5, 'Bintea', 'Sorin', '0720022378', 'bntsorin@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(10, 6, 'Nitu', 'Codrin', '0722347682', 'cdrn@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(11, 9, 'Matasaru', 'Doina', '0722249496', 'doinam3@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(12, 10, 'Mateescu', 'Bigdan', '0744634858', 'bgdm2@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(13, 11, 'Ionita', 'Victor', '0745062367', 'vctr@yahoo.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(14, 12, 'Birsan', 'Stefan', '0724217990', 'stefanbr2@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(15, 13, 'Birsan', 'Stefania', '0734217990', 'stefaniabr@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(16, 14, 'Baros', 'Stefan', '0724245990', 'stebaros2@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(17, 15, 'Cirsan', 'Stefan', '0724217930', 'stefancr2@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(18, 16, 'Birjaru', 'Andrei', '0724217770', 'andreibr@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(19, 17, 'Dumitrescu', 'Alin', '0727298294', 'alndum@yahoo.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(20, 18, 'Patrascu', 'Marian', '0761507668', 'patra@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(21, 19, 'Burtea', 'Daniel', '0765433452', 'burteadan@htm.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(22, 20, 'Ionescu', 'Iulian', '0729875439', 'ionescuil@yahoo.es');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(23, 21, 'Tiu', 'Bianca', '0726785439', 'tiubianca@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(24, 22, 'Mitroi', 'Cristina', '0726788765', 'mtr@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(25, 23, 'Ion', 'Bianca', '0789328762', 'ionbb@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(26, 24, 'Toma', 'Alexandra', '0763219872', 'tomaal@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(27, 25, 'Coanda', 'Ionela', '0739702310', 'coandai@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(28, 26, 'Popa', 'Andreea', '0762316253', 'popaa@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(29, 27, 'Soare', 'Daniel', '0763496732', 'soaredd@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(30, 28, 'Cercel', 'Cristian', '0763214321', 'cercel43@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(31, 29, 'Cioaca', 'Lucian', '0756664443', 'cioacaluci@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(32, 30, 'Capra', 'Elena', '0768888888', 'eli@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(33, 31, 'Lupu', 'Stefan', '0772317893', 'wolf@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(34, 32, 'Dima', 'Ionut', '0767574221', 'dimai1@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(35, 33, 'Nazario', 'Josh', '0762345431', 'nazariojh@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(36, 34, 'Andreescu', 'Andrei', '0762532678', 'andsad@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(37, 35, 'Stoica', 'Gabriel', '0736663329', 'stoicagbr@outlook.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(38, 36, 'Geanta', 'Gabriel', '0765325872', 'geantag22@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(39, 37, 'Stoican', 'Mihai', '0765237892', 'stoicanm@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(40, 38, 'Preda', 'Augustin', '0736782314', 'predaaug@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(41, 39, 'Dobre', 'Teodor', '0763217542', 'dobreth1@gmail.com');

insert into client(client_id, adresa_id, nume, prenume, telefon, email)
values(42, null, 'Magureanu', 'Roxana', '0763528721', 'roxmag1@gmail.com');


----------------

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(0, 'Sirbu', 'Cezar', 'cezsrb@gmail.com', '15 July 2003', 3700);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(1, 'Rusu', 'Adrian', 'adrrusu@yahoo.com', '3 December 2004', 3200);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(2, 'Necula', 'Matei', 'matein1@gmail.com', '7 March 2008', 3000);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(3, 'Marcu', 'Emil', 'emilm@outlook.com', '12 September 2005', 3900);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(4, 'Dragomir', 'Florin', 'florindr7@yahoo.com', '10 October 1999', 4000);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(5, 'Vlaicu', 'Andrei', 'vlaicuandrei@gmail.com', '11 November 1998', 3300);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(6, 'Toma', 'George', 'georgetoma@yahoo.com', '10 January 2000', 3100);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(7, 'Ionescu', 'Marius', 'mariusionescu@gmail.com', '22 September 2002', 2900);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(8, 'Florea', 'Stefan', 'stefanflorea@gmail.com', '15 February 2003', 2700);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(9, 'Mihailescu', 'Mihai', 'mihai231@gmail.com', '22 April 2003', 2390);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(10, 'Ifrim', 'Daniel', 'danielif@gmail.com', '21 August 2000', 3200);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(11, 'Albu', 'Marius', 'albumrs@gmail.com', '22 November 1998', 3900);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(12, 'Dragos', 'Eugen', 'dragose@gmail.com', '29 May 2005', 3000);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(13, 'Constantin', 'Iulian', 'constil@gmail.com', '12 May 2001', 3360);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(14, 'Mocanu', 'Valeriu', 'valmocanu@gmail.com', '22 November 2005', 3500);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(15, 'Florea', 'Daniela', 'danielafl@gmail.com', '14 May 2007', 3000); 

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(16, 'Munteanu', 'Dorin', 'dorinm@yahoo.com', '11 January 2001', 3400);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(17, 'Stan', 'Nicolae', 'stn@gmail.com', '10 October 1997', 3300);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(18, 'Negoita', 'Vlad', 'vladnegoita@gmail.com', '11 November 2002', 3500);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(19, 'Diaconu', 'Laurentiu', 'laurentiud@gmail.com', '30 May 2005', 4600);

insert into vanzator(vanzator_id, nume, prenume, email, data_angajare, salariu)
values(20, 'Dumitrescu', 'Catalin', 'catalindumitrescu@gmail.com', '10 September 2020', 3000);


-----------

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(0, 3, 10, '30 August 2000', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(1, 2, 14, '10 May 2019', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(2, 4, 12, '15 October 2006', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(3, 7, 10, '30 August 2003', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(4, 3, 14, '22 November 2006', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(5, 1, null, '11 November 2020', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(6, 5, 5, '19 November 2001', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(7, 6, 5, '19 November 2001', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(8, 7, 5, '19 November 2001', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(9, 8, 5, '20 May 2002', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(10, 9, 11, '25 September 2002', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(11, 13, 0, '19 July 2003', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(12, 11, 1, '7 December 2005', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(13, 10, 2, '14 March 2010', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(14, 12, 4, '10 October 2005', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(15, 14, 6, '10 January 2009', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(16, 15, 3, '12 September 2006', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(17, 15, 5, '21 May 2007', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(18, 16, 7, '29 September 2010', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(19, 17, 8, '15 February 2004', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(20, 20, 9, '22 April 2005', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(21, 18, 13, '12 June 2006', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(22, 21, 15, '14 May 2017', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(23, 19, 16, '11 January 2013', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(24, 22, 17, '10 October 1999', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(25, 23, 18, '11 November 2010', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(26, 24, 19, '30 May 2015', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(27, 25, 4, '28 June 2011', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(28, 25, 4, '23 June 2012', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(29, 26, 7, '11 August 2013', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(30, 30, 11, '30 May 2015', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(31, 31, 12, '30 May 2015', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(32, 27, 3, '10 October 2010', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(33, 28, 3, '10 October 2010', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(34, 29, 3, '10 October 2010', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(35, 32, 10, '21 February 2014', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(36, 33, 12, '21 February 2014', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(37, 34, 12, '21 February 2014', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(38, 35, 2, '15 January 2011', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(39, 36, 17, '26 November 2016', 'transfer bancar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(40, 37, 9, '23 June 2012', 'numerar');

insert into comanda(comanda_id, client_id, vanzator_id, data_comanda, metoda_plata)
values(41, 38, 9, '13 May 2009', 'transfer bancar');

--------------

insert into marca(marca_id, nume, tara_origine)
values(0, 'Audi', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(1, 'skoda', 'Cehia');

insert into marca(marca_id, nume, tara_origine)
values(2, 'Volkswagen', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(3, 'Seat', 'Spania');

insert into marca(marca_id, nume, tara_origine)
values(4, 'Porsche', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(5, 'Mercedes-Benz', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(6, 'Smart', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(7, 'Dacia', 'Romania');

insert into marca(marca_id, nume, tara_origine)
values(8, 'Renault', 'Franta');

insert into marca(marca_id, nume, tara_origine)
values(9, 'Bmw', 'Germania');

insert into marca(marca_id, nume, tara_origine)
values(10, 'Mini', 'Anglia');

insert into marca(marca_id, nume, tara_origine)
values(11, 'Rolls-Royce', 'Anglia');

insert into marca(marca_id, nume, tara_origine)
values(12, 'Peugeot', 'Franta');

insert into marca(marca_id, nume, tara_origine)
values(13, 'Lexus', 'Japonia');

insert into marca(marca_id, nume, tara_origine)
values(14, 'Toyota', 'Japonia');

insert into marca(marca_id, nume, tara_origine)
values(15, 'Hyundai', 'Coreea de Sud');

insert into marca(marca_id, nume, tara_origine)
values(16, 'Kia', 'Coreea de Sud');

-------
insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(0, 'Volkswagen Group',  'Schubert', 'Immanuel', 'immanuelschubert@volks.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(1, 'Daimler', 'Weimann', 'Ulbrecht', 'weimannulb@daimler.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(2, 'Renault Group', 'Lance', 'Albert', 'lancealbert@ren.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(3, 'BMW', 'Schmidt', 'Wilfried', 'wilfriedschmidt@bmw.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(4, 'Groupe PSA', 'Paul', 'Sacha', 'sachapaul@psa.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(5, 'Toyota', 'Rikuo', 'Hane', 'rikuohane@toyota.com');

insert into furnizor(furnizor_id, nume_companie, nume_contact, prenume_contact, email_contact)
values(6, 'Hyundai Motor Group', 'Seok', 'Tae', 'seoktae@hyundai.com');

------

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(0, 2000, 120, 360);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(1, 2000, 130, 380);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(2, 1600, 102, 160);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(3, 3000, 340, 600);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(4, 2500, 230, 460);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(5, 1900, 98, 200);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(6, 1900, 122, 270);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(7, 3500, 420, 660);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(8, 2200, 270, 350);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(9, 3000, 290, 500);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(10, 1400, 88, 140);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(11, 1200, 102, 170);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(12, 1000, 65, 120);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(13, 1500, 80, 200);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(14, 1200, 75, 130);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(15, 2500, 280, 480);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(16, 1100, 105, 170);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(17, 6800, 571, 900);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(18, 1800, 160, 200);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(19, 1600, 123, 190);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(20, 2000, 150, 220);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(21, 1100, 80, 140);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(22, 1100, 90, 160);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(23, 1400, 95, 170);

insert into motorizare(motorizare_id, volum_motor, putere, cuplu)
values(24, 2000, 150, 260);

-----------

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(0, 5, 2, 1, 8, 'C Class', 2005, 'sedan', 'benzina', 'albastru'); 

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(1, 5, 2, 1, 9, 'C Class', 2005, 'sedan', 'benzina', 'rosu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(2, 4, 4, 0, 3, 'Cayenne', 2004, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(3, 0, 8, 0, 1, 'A4', '2000', 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(4, 7, null, 2, 11, 'Logan', '2020', 'sedan', 'benzina', 'argintiu'); 

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(5, 1, 1, 0, 0, 'Octavia', 2017, 'sedan', 'motorina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(6, 0, 0, 0, 3, 'A3', 1999, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(7, 2, 3, 0, 5, 'Passat', 2002, 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(8, 3, 5, 0, 2, 'Ibiza', 2018, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(9, 6, 6, 1, 12, 'Fortwo', 2000, 'hatchback', 'benzina', 'roz');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(10, 8, 7, 2, 10, 'Megane', 2000, 'break', 'benzina', 'violet');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(11, 9, 9, 3, 9, 'Seria 3', 2001, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(12, 10, 11, 3, 16, 'Clubman', 2002, 'hatchback', 'benzina', 'rosu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(13, 13, 10, 5, 24, 'LX', 2001, 'sedan', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(14, 14, 12, 5, 24, 'Corolla', 2004, 'sedan', 'benzina', 'albastru');  

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(15, 14, 12, 5, 24, 'Avensis', 2003, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(16, 14, 12, 5, 24, 'Prius', 2004, 'hatchback', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(17, 15, 13, 6, 23, 'i10', 2009, 'hatchback', 'benzina', 'rosu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(18, 16, 14, 6, 21, 'Forte', 2004, 'hatchback', 'motorina', 'roz');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(19, 0, 15, 0, 3, 'Q5', 2008, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(20, 0, 16, 0, 3, 'Q7', 2005, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(21, 0, 17, 0, 4, 'A5', 2008, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(22, 0, 18, 0, 4, 'A6', 2009, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(23, 1, 19, 0, 2, 'Fabia', 2003, 'hatchback', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(24, 1, 19, 0, 2, 'Fabia', 2003, 'hatchback', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(25, 1, 20, 0, 2, 'Fabia', 2004, 'hatchback', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(26, 1, 21, 0, 3, 'Rapid', 2005, 'sedan', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(27, 1, 22, 0, 3, 'Rapid', 2015, 'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(28, 1, 23, 0, 4, 'Superb', 2012, 'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(29, 1, 24, 0, 4, 'Octavia', 1998, 'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(30, 2, 25, 0, 10, 'Golf', 2009, 'hatchback', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(31, 2, 26, 0, 11, 'Golf', 2014, 'hatchback', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(32, 2, 27, 0, 10, 'Polo', 2010, 'hatchback', 'motorina', 'roz');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(33, 2, 28, 0, 10, 'Polo', 2011, 'hatchback', 'motorina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(34, 3, 28, 0, 10, 'Leon', 2011, 'sedan', 'motorina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(35, 3, 29, 0, 9, 'Ibiza', 2012, 'sedan', 'motorina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(36, 4, 30, 0, 7, 'Macan', 2014, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(37, 4, 31, 1, 7, 'GLA', 2014, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(38, 7, 32, 2, 19, 'Duster', 2014, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(39, 9, 33, 3, 7, 'X5', 2009, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(40, 14, 34, 5, 24, 'Corolla', 2013, 'sedan', 'motorina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(41, 14, 35, 5, 21, 'Corolla', 2010, 'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(42, 15, 36, 6, 18, 'Elantra', 2013, 'hatchback', 'motorina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(43, 16, 37, 6, 12, 'K3', 2012, 'sedan', 'motorina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(44, 16, 38, 6, 12, 'Forte', 2010, 'hatchback', 'motorina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(45, 13, 39, 5, 17, 'LS', 2015,  'sedan', 'benzina', 'galben');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(46, 13, 39, 5, 17, 'LS', 2014,  'sedan', 'benzina', 'galben');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(47, 13, 40, 5, 17, 'LX', 2011,  'sedan', 'benzina', 'rosu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(48, 13, 41, 5, 16, 'LX', 2018,  'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(49, 11, null, 3, 17, 'Phantom', 2020, 'limuzina', 'benzina', 'auriu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(50, 11, null, 3, 17, 'Cullinan', 2020, 'limuzina', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(51, 0, null, 0, 3, 'A3', 2019, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(52, 1, null, 0, 0, 'Octavia', 2019, 'sedan', 'motorina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(53, 0, null, 0, 3, 'A3', 2020, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(54, 2, null, 0, 5, 'Passat', 2020, 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(55, 3, null, 0, 2, 'Ibiza', 2019, 'sedan', 'benzina', 'albastru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(56, 6, null, 1, 12, 'Fortwo', 2019, 'hatchback', 'benzina', 'roz');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(57, 8, null, 2, 10, 'Megane', 2020, 'break', 'benzina', 'violet');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(58, 9, null, 3, 9, 'Seria 3', 2021, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(59, 0, null, 0, 3, 'Q5', 2019, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(60, 0, null, 0, 3, 'Q7', 2005, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(61, 0, null, 0, 20, 'A5', 2018, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(62, 0, null, 0, 15, 'A6', 2019, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(63, 1, null, 0, 13, 'Fabia', 2020, 'hatchback', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(64, 6, null, 1, 14, 'Fortwo', 2020, 'hatchback', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(65, 7, null, 2, 6, 'Logan', '2020', 'sedan', 'benzina', 'argintiu'); 

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(66, 7, null, 2, 22, 'Sandero', '2020', 'hatchback', 'benzina', 'argintiu'); 

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(67, 2, null, 0, 18, 'Passat', 2020, 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(68, 2, null, 0, 19, 'Passat', 2020, 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(69, 2, null, 0, 14, 'Passat', 2021, 'sedan', 'benzina', 'alb');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(70, 9, null, 3, 9, 'Seria 3', 2019, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(71, 9, null, 3, 7, 'Seria 3', 2020, 'sedan', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(72, 9, null, 3, 15, 'Seria 5', 2020, 'sedan', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(73, 5, null, 1, 8, 'C Class', 2019, 'sedan', 'benzina', 'albastru'); 

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(74, 5, null, 1, 9, 'E Class', 2021, 'sedan', 'benzina', 'rosu');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(75, 4, null, 0, 3, 'Cayenne', 2020, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(76, 0, null, 0, 1, 'A4', 2020, 'break', 'motorina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(77, 7, null, 2, 19, 'Duster', 2019, 'SUV', 'benzina', 'negru');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(78, 9, null, 3, 7, 'X5', 2020, 'SUV', 'benzina', 'verde');

insert into masina(masina_id, marca_id, comanda_id, furnizor_id, motorizare_id, model, an_fabricatie, tip_caroserie, combustibil, culoare)
values(79, 14, null, 5, 24, 'Corolla', 2021, 'sedan', 'motorina', 'albastru');

commit;
