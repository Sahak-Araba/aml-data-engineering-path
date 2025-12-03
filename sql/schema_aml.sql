-- =====================================================
-- AML DATA MODEL – VERSION ISAAC ARABA
-- Esquema base para Monitoreo Transaccional (Nivel 1)
-- =====================================================

-- ==========================
-- TABLA: CLIENTES
-- ==========================
CREATE TABLE Clientes (
    id_cliente BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(150) NOT NULL,
    id_regulatorio VARCHAR(25) NOT NULL UNIQUE,
    pais_residencia VARCHAR(60) NOT NULL,
    nivel_riesgo VARCHAR(20) DEFAULT 'LOW',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================
-- TABLA: TRANSACCIONES
-- ==========================
CREATE TABLE Transacciones (
    id_transaccion BIGINT PRIMARY KEY AUTO_INCREMENT,
    cliente_id BIGINT NOT NULL,
    monto_usd DECIMAL(12,2) NOT NULL,
    pais_destino VARCHAR(60),
    canal VARCHAR(40),
    tipo_tx VARCHAR(40),
    timestamp_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente)
);

-- ==========================
-- TABLA: ALERTAS
-- ==========================
CREATE TABLE Alertas (
    id_alerta BIGINT PRIMARY KEY AUTO_INCREMENT,
    transaccion_id BIGINT NOT NULL,
    tipo_alerta VARCHAR(80) NOT NULL,
    score_riesgo FLOAT NOT NULL,
    estado VARCHAR(20) DEFAULT 'PENDIENTE',
    timestamp_alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaccion_id) REFERENCES Transacciones(id_transaccion)
);
