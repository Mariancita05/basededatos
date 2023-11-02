INSERT INTO usuario (id, nombre, apellido, dni, fecha_de_nacimiento, domicilio, email, contraseña, certificado, curso)
VALUES (1, "Franco", "Rossi", 40457844, "1997-11-29", "plaza gc", "franrossi@fran.com", "contraseña", 1, "Base de datos");

UPDATE usuario
SET nombre = "Harry"
WHERE id = 1;

DELETE FROM usuario WHERE id=1;