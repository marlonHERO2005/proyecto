-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2023 a las 03:28:47
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `skinstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int NOT NULL,
  `Fecha y Hora` datetime NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Empleados_idEmpleados` int NOT NULL,
  `Servicio_idServicio` int NOT NULL,
  `Clientes_idClientes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre_Cliente` varchar(50) NOT NULL,
  `servicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `fecha`, `hora`, `nombre_Cliente`, `servicio`) VALUES
(1, '2023-08-21', '09:00:00', 'Carlos Mejia', 'Masaje relajante'),
(2, '2023-08-22', '14:00:00', 'Maria Beltrán', 'Hidromasaje'),
(3, '2023-08-24', '09:30:00', 'Marlon Hernández', 'Tratamiento facial-Limpieza'),
(6, '2023-08-29', '10:00:00', 'Graciela Rodríguez', 'Aromaterapia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idClientes` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) NOT NULL,
  `contraseña` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idClientes`, `Nombre`, `Apellido`, `Telefono`, `Correo`, `contraseña`) VALUES
(1, 'Carlos', 'Rodríguez', '3238769054', 'carlosro@gmail.com', ''),
(2, 'Miguel', 'Caicedo', '3158569554', 'miguelca@gmail.com', ''),
(3, 'Maria', 'Carabalí', '3167769067', 'mariaca@gmail.com', ''),
(4, 'Camilo', 'Mejia', '3168906754', 'camilome@gmail.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleados` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Dirección` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Cargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int NOT NULL,
  `Fecha de emision` varchar(45) NOT NULL,
  `Total a pagar` float NOT NULL,
  `Cita_idCita` int NOT NULL,
  `Cita_Empleados_idEmpleados` int NOT NULL,
  `Cita_Servicio_idServicio` int NOT NULL,
  `Cita_Clientes_idClientes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPagos` int NOT NULL,
  `Fecha` varchar(45) NOT NULL,
  `Monto` float NOT NULL,
  `Método de pago` varchar(45) NOT NULL,
  `Factura_idFactura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `ID` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `contraseña` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`ID`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`) VALUES
(1, 'Carlos Daniel', 'Correa Mejia', '', NULL, ''),
(3, 'Ana María', 'Rodríguez Panameño', '', NULL, ''),
(4, 'Marlon', 'Hernandez', 'marlon123@gmail.com', '3156789034', '12345678'),
(5, 'Carlos', 'Mejia', 'carlosmejia12@gmail.com', '3216785430', '09876543'),
(6, ' Marlon', ' Hernandez', 'marlon456@gmail.com', '3156789023', '87654321'),
(7, 'Camila', 'Carabalí', 'camica@gmail.com', '3234568709', '12345678'),
(8, ' Camilo', ' Mejia', 'came456@gmail.com', '3156789023', '87654321'),
(13, 'Graciela', 'Rodrìguez', 'grace123@gmail.com', '3156789034', '12345678'),
(14, 'Camilo', ' Hernandez', 'marlon456@gmail.com', '3156789023', '87654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Precio` float NOT NULL,
  `Duración` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`correo`, `contraseña`) VALUES
('marlon123@gmail.com', '12345678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`,`Empleados_idEmpleados`,`Servicio_idServicio`,`Clientes_idClientes`),
  ADD KEY `fk_Cita_Empleados1_idx` (`Empleados_idEmpleados`),
  ADD KEY `fk_Cita_Servicio1_idx` (`Servicio_idServicio`),
  ADD KEY `fk_Cita_Clientes1_idx` (`Clientes_idClientes`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleados`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`,`Cita_idCita`,`Cita_Empleados_idEmpleados`,`Cita_Servicio_idServicio`,`Cita_Clientes_idClientes`),
  ADD KEY `fk_Factura_Cita1_idx` (`Cita_idCita`,`Cita_Empleados_idEmpleados`,`Cita_Servicio_idServicio`,`Cita_Clientes_idClientes`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPagos`,`Factura_idFactura`),
  ADD KEY `fk_Pagos_Factura1_idx` (`Factura_idFactura`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `fk_Cita_Clientes1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `clientes` (`idClientes`),
  ADD CONSTRAINT `fk_Cita_Empleados1` FOREIGN KEY (`Empleados_idEmpleados`) REFERENCES `empleados` (`idEmpleados`),
  ADD CONSTRAINT `fk_Cita_Servicio1` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Cita1` FOREIGN KEY (`Cita_idCita`,`Cita_Empleados_idEmpleados`,`Cita_Servicio_idServicio`,`Cita_Clientes_idClientes`) REFERENCES `cita` (`idCita`, `Empleados_idEmpleados`, `Servicio_idServicio`, `Clientes_idClientes`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pagos_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
