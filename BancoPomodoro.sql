create database pomodoro;
use pomodoro;

create table tbMotorista(
	idMotorista int primary key auto_increment,
    nomeMotorita varchar(45),
    sobreNomeMotorista varchar(45)
);
create table tbCaminhao(
	idCaminhao int primary key auto_increment,
    marcaCaminhao varchar(30),
    tipoCaminhao varchar(22), constraint chkTipoCaminhao check (tipoCaminhao in("3/4", "Toco", "Truck","Carreta Simples", "Carreta Eixo Extendido")),
    fkIdMotorista int, foreign key (fkIdMotorista) references tbMotorista(idMotorista)
);
create table tbSensor(
	idSensor int primary key auto_increment,
    tipoSensor char(11), constraint chkTipoSensor check (tipoSensor in("Temperatura", "Umidade")),
    fkIdCaminhao int, foreign key (fkIdCaminhao) references tbCaminhao(idCaminhao)
);
create table tbEntradaSensor(
	idCapturaSensor int primary key auto_increment,
    valorSensor float,
    fkIdSensor int, foreign key (EntradaSensor) references tbSensor(idSensor)
);
create table tbTrajeto(
	idTrajeto int primary key auto_increment,
    distancia float,
    fkIdCaminhao int, foreign key (Trajeto) references tbCaminhao(idCaminhao)
);
create table tbUsuario(
	idUsuario int primary key auto_increment,
    nomeUsuario varchar(45),
    sobreNomeUsuario varchar(45),
    cnpjUsuario char(14),
    tipoUsuario char(30), constraint chkUser check (tipoUsuario in("Autonomo", "Empresa"))
);

create table tbTomate(
	idTomate int primary key auto_increment,
    unidadeTomate int,
	fkIdUsuario int, foreign key (fkIdUsuario) references tbUsuario(idUsuario),
    fkidTrajeto int, foreign key (fkidTrajeto) references tbTrajeto(idTrajeto)
);
create table tbEndereco(
	idEndereco int primary key auto_increment,
    bairro varchar(45),
    cidade varchar(45),
    numero varchar(10),
    complemento varchar(25),
    endereco varchar(60),
    fkIdUsuario int, foreign key (fkIdUsuario) references tbUsuario(idUsuario)
);
