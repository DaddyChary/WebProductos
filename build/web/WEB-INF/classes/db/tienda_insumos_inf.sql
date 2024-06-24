DROP DATABASE IF EXISTS productos_web;

CREATE DATABASE IF NOT EXISTS productos_web;

USE productos_web;

CREATE TABLE IF NOT EXISTS productos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio int NOT NULL
);

CREATE TABLE IF NOT EXISTS usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL, 
    password VARCHAR(50) NOT NULL,
    tipo_usuario int NOT NULL
);