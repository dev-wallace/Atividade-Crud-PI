-- Active: 1727134504691@@127.0.0.1@3306
CREATE DATABASE atividade_pi;
USE atividade_pi;

CREATE Table funcionario(
    matricula varchar(15) PRIMARY KEY,
    nome varchar(50) NOT NULL,
    salario double NOT NULL
);
    