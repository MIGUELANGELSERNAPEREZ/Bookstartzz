use bookstartzz;

select * from libros;



CREATE TABLE `users` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `ApellidoP` varchar(30) NOT NULL,
  `ApellidoM` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `contrasena` varchar(80) NOT NULL,
  `tipo` enum('user','admin') DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `tarjeta` varchar(20) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `tarjeta` (`tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `pedidos_libros` (
  `idPedidos` int(11) NOT NULL,
  `idLibros` int(11) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`,`idLibros`),
  KEY `idLibros` (`idLibros`),
  CONSTRAINT `pedidos_libros_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`idPedido`),
  CONSTRAINT `pedidos_libros_ibfk_2` FOREIGN KEY (`idLibros`) REFERENCES `libros` (`idLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `formato` enum('fisico','digital') NOT NULL,
  `fechaCompra` date NOT NULL,
  `estatusPedido` enum('preparado','envidado','entregado') NOT NULL,
  `titulosAdquiridos` mediumtext NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_users_Pedidos` (`idUsuario`),
  CONSTRAINT `fk_users_Pedidos` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `libros_categorias` (
  `idLibros` int(11) NOT NULL,
  `idCategorias` int(11) NOT NULL,
  PRIMARY KEY (`idLibros`,`idCategorias`),
  KEY `idCategorias` (`idCategorias`),
  CONSTRAINT `libros_categorias_ibfk_1` FOREIGN KEY (`idLibros`) REFERENCES `libros` (`idLibro`),
  CONSTRAINT `libros_categorias_ibfk_2` FOREIGN KEY (`idCategorias`) REFERENCES `categorias` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `editorial` varchar(30) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `fechaPublicacion` date NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `numeroPaginas` int(11) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `visitas` int(11) DEFAULT NULL,
  `clasificacion` enum('Niños','Adolecentes','Adultos') DEFAULT NULL,
  PRIMARY KEY (`idLibro`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cuenta` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idNombre` varchar(20) NOT NULL,
  `idLibro` int(11) NOT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `fk_users_Cuenta` (`idUsuario`),
  KEY `fk_Libro_Cuenta` (`idLibro`),
  CONSTRAINT `fk_Libro_Cuenta` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  CONSTRAINT `fk_users_Cuenta` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `bookstartzz`.`users`
(`Nombre`,
`ApellidoP`,
`ApellidoM`,
`Email`,
`contrasena`,
`tipo`,
`usuario`,
`telefono`,
`tarjeta`)
VALUES
('Miguel Angel',
'Serna',
'Perez',
'serna@gmail.com',
sha1('123'),
2,'Serna',
'4454622515',
'serna10cashbancoBBVA');

INSERT INTO `bookstartzz`.`users`
(`Nombre`,
`ApellidoP`,
`ApellidoM`,
`Email`,
`contrasena`,
`tipo`,
`usuario`,
`telefono`,
`tarjeta`)
VALUES
('oswaldo',
'profe',
'tarea',
'oswaldo@gmail.com',
sha1('123'),
1,'Serna',
'4454622515',
'oswal10cashbancoBBVA');


