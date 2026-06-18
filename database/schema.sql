-- Script base referencial para NUTRIYA
CREATE TABLE roles (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre_rol VARCHAR(50) NOT NULL,
  descripcion VARCHAR(255),
  estado TINYINT DEFAULT 1
);

CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  id_rol INT NOT NULL,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  correo VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  estado TINYINT DEFAULT 1,
  FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE perfiles_nutricionales (
  id_perfil INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  edad INT,
  peso_actual DECIMAL(5,2),
  talla_cm DECIMAL(5,2),
  objetivo VARCHAR(100),
  nivel_actividad VARCHAR(50),
  calorias_meta INT,
  proteinas_meta DECIMAL(6,2),
  carbohidratos_meta DECIMAL(6,2),
  grasas_meta DECIMAL(6,2),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE tipos_comida (
  id_tipo_comida INT AUTO_INCREMENT PRIMARY KEY,
  nombre_tipo VARCHAR(50) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE comidas (
  id_comida INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_tipo_comida INT NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  modo_registro VARCHAR(20),
  descripcion_texto TEXT,
  imagen_url VARCHAR(255),
  observaciones TEXT,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_tipo_comida) REFERENCES tipos_comida(id_tipo_comida)
);

CREATE TABLE analisis_comida (
  id_analisis INT AUTO_INCREMENT PRIMARY KEY,
  id_comida INT NOT NULL,
  calorias INT,
  proteinas_g DECIMAL(6,2),
  carbohidratos_g DECIMAL(6,2),
  grasas_g DECIMAL(6,2),
  alimentos_detectados TEXT,
  confianza_ia DECIMAL(5,2),
  fecha_analisis DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_comida) REFERENCES comidas(id_comida)
);
