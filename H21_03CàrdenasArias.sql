USE MASTER;
GO

DROP DATABASE IF EXISTS VGCONF;
CREATE DATABASE VGCONF;
GO

USE VGCONF;
GO

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI int  NOT NULL,
    DEPUBI varchar(100)  NOT NULL,
    PROUBI varchar(100)  NOT NULL,
    DISUBI varchar(100)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
)
GO

-- Table: PARTICIPANTES
CREATE TABLE PARTICIPANTES (
    IDPAR int   NOT NULL IDENTITY(1, 1),
    NOMPAR varchar(40)  NOT NULL,
    APEPAR varchar(40)  NOT NULL,
    DNIPAR char(8)  NOT NULL,
    CELPAR char(9)  NOT NULL,
    DIRPAR varchar(40)  NOT NULL,
    CODUBI int  NOT NULL,
	CERPAR char(2) NOT NULL,
    ESTPAR char(1)  NOT NULL,
    CONSTRAINT PARTICIPANTES_pk PRIMARY KEY  (IDPAR)
)
GO

-- Table: EXPONENTES
CREATE TABLE EXPONENTES (
    IDEXP int   NOT NULL IDENTITY(1, 1),
    NOMEXP varchar(40)  NULL,
    APEEXP varchar(40)  NULL,
    DNIEXP varchar(40)  NULL,
	PAEXP  varchar(40) NOT NULL,
    IDBLO int  NOT NULL,
	TEMEXP varchar(80) NOT NULL,
    ESTEXP char(1)  NULL,
    CONSTRAINT EXPONENTES_pk PRIMARY KEY  (IDEXP)
)
GO

-- Table: BLOQUES
CREATE TABLE BLOQUES (
    IDBLO int NOT NULL IDENTITY(1, 1),
    NOMBLO varchar(40)  NULL,
    ESTBLO char(1)  NULL,
    CONSTRAINT BLOQUE_pk PRIMARY KEY  (IDBLO)
)
GO

-- Table: CONFERENCIA
CREATE TABLE CONFERENCIA (
    IDCON   int   NOT NULL IDENTITY(1, 1),
    IDBLO int  NOT NULL,
    IDPAR int  NOT NULL,
    FECCON date  NULL,
    CONSTRAINT CONFERENCIA_pk PRIMARY KEY  (IDCON)
);

--Relaciones 
-- Reference: CONFERENCIA_BLOQUES (table: CONFERENCIA)
ALTER TABLE CONFERENCIA 
ADD CONSTRAINT PK_CONFERENCIA_BLOQUES
    FOREIGN KEY (IDBLO) REFERENCES BLOQUES (IDBLO);

-- Reference: CONFERENCIA_PARTICIPANTES (table: CONFERENCIA)
ALTER TABLE CONFERENCIA 
ADD CONSTRAINT FK_CONFERENCIA_PARTICIPANTES
    FOREIGN KEY (IDPAR)  REFERENCES PARTICIPANTES (IDPAR);

-- Reference: EXPONTES_BLOQUES (table: EXPONENTES)
ALTER TABLE EXPONENTES 
ADD CONSTRAINT FK_EXPONTES_BLOQUES
    FOREIGN KEY (IDBLO) REFERENCES BLOQUES (IDBLO);

-- Reference: PARTICIPANTES_UBIGEO (table: PARTICIPANTES)
ALTER TABLE PARTICIPANTES 
ADD CONSTRAINT FK_PARTICIPANTES_UBIGEO
    FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- INSERTAR REGISTROS DE UBIGEO
INSERT INTO UBIGEO

(CODUBI, DEPUBI, PROUBI, DISUBI)

VALUES

('150101','LIMA','LIMA','LIMA'),
('150102','LIMA','LIMA','ANCON'),
('150103','LIMA','LIMA','ATE'),
('150104','LIMA','LIMA','BARRANCO'),
('150105','LIMA','LIMA','BRENA'),
('150106','LIMA','LIMA','CARABAYLLO'),
('150107','LIMA','LIMA','CHACLACAYO'),
('150108','LIMA','LIMA','CHORRILLOS'),
('150109','LIMA','LIMA','CIENEGUILLA'),
('150110','LIMA','LIMA','COMAS'),
('150111','LIMA','LIMA','EL AGUSTINO'),
('150112','LIMA','LIMA','INDEPENDENCIA'),
('150113','LIMA','LIMA','JESUS MARIA'),
('150114','LIMA','LIMA','LA MOLINA'),
('150115','LIMA','LIMA','LA VICTORIA'),
('150116','LIMA','LIMA','LINCE'),
('150117','LIMA','LIMA','LOS OLIVOS'),
('150118','LIMA','LIMA','LURIGANCHO'),
('150119','LIMA','LIMA','LURIN'),
('150120','LIMA','LIMA','MAGDALENA DEL MAR'),
('150121','LIMA','LIMA','MAGDALENA VIEJA'),
('150122','LIMA','LIMA','MIRAFLORES'),
('150123','LIMA','LIMA','PACHACAMAC'),
('150124','LIMA','LIMA','PUCUSANA'),
('150125','LIMA','LIMA','PUENTE PIEDRA'),
('150126','LIMA','LIMA','PUNTA HERMOSA'),
('150127','LIMA','LIMA','PUNTA NEGRA'),
('150128','LIMA','LIMA','RIMAC'),
('150129','LIMA','LIMA','SAN BARTOLO'),
('150130','LIMA','LIMA','SAN BORJA'),
('150131','LIMA','LIMA','SAN ISIDRO'),
('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),
('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),
('150134','LIMA','LIMA','SAN LUIS'),
('150135','LIMA','LIMA','SAN MARTIN DE PORRES'),
('150136','LIMA','LIMA','SAN MIGUEL'),
('150137','LIMA','LIMA','SANTA ANITA'),
('150138','LIMA','LIMA','SANTA MARIA DEL MAR'),
('150139','LIMA','LIMA','SANTA ROSA'),
('150140','LIMA','LIMA','SANTIAGO DE SURCO'),
('150141','LIMA','LIMA','SURQUILLO'),
('150142','LIMA','LIMA','VILLA EL SALVADOR'),
('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),
('150201','LIMA','BARRANCA','BARRANCA'),
('150202','LIMA','BARRANCA','PARAMONGA'),
('150203','LIMA','BARRANCA','PATIVILCA'),
('150204','LIMA','BARRANCA','SUPE'),
('150205','LIMA','BARRANCA','SUPE PUERTO'),
('150301','LIMA','CAJATAMBO','CAJATAMBO'),
('150302','LIMA','CAJATAMBO','COPA'),
('150303','LIMA','CAJATAMBO','GORGOR'),
('150304','LIMA','CAJATAMBO','HUANCAPON'),
('150305','LIMA','CAJATAMBO','MANAS'),
('150401','LIMA','CANTA','CANTA'),
('150402','LIMA','CANTA','ARAHUAY'),
('150403','LIMA','CANTA','HUAMANTANGA'),
('150404','LIMA','CANTA','HUAROS'),
('150405','LIMA','CANTA','LACHAQUI'),
('150406','LIMA','CANTA','SAN BUENAVENTURA'),
('150407','LIMA','CANTA','SANTA ROSA DE QUIVES'),
('150501','LIMA','CANETE','SAN VICENTE DE CANETE'),
('150502','LIMA','CANETE','ASIA'),
('150503','LIMA','CANETE','CALANGO'),
('150504','LIMA','CANETE','CERRO AZUL'),
('150505','LIMA','CANETE','CHILCA'),
('150506','LIMA','CANETE','COAYLLO'),
('150507','LIMA','CANETE','IMPERIAL'),
('150508','LIMA','CANETE','LUNAHUANA'),
('150509','LIMA','CANETE','MALA'),
('150510','LIMA','CANETE','NUEVO IMPERIAL'),
('150511','LIMA','CANETE','PACARAN'),
('150512','LIMA','CANETE','QUILMANA'),
('150513','LIMA','CANETE','SAN ANTONIO'),
('150514','LIMA','CANETE','SAN LUIS'),
('150515','LIMA','CANETE','SANTA CRUZ DE FLORES'),
('150516','LIMA','CANETE','ZUNIGA'),
('150601','LIMA','HUARAL','HUARAL'),
('150602','LIMA','HUARAL','ATAVILLOS ALTO'),
('150603','LIMA','HUARAL','ATAVILLOS BAJO'),
('150604','LIMA','HUARAL','AUCALLAMA'),
('150605','LIMA','HUARAL','CHANCAY'),
('150606','LIMA','HUARAL','IHUARI'),
('150607','LIMA','HUARAL','LAMPIAN'),
('150608','LIMA','HUARAL','PACARAOS'),
('150609','LIMA','HUARAL','SAN MIGUEL DE ACOS'),
('150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),
('150611','LIMA','HUARAL','SUMBILCA'),
('150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),
('150701','LIMA','HUAROCHIRI','MATUCANA'),
('150702','LIMA','HUAROCHIRI','ANTIOQUIA'),
('150703','LIMA','HUAROCHIRI','CALLAHUANCA'),
('150704','LIMA','HUAROCHIRI','CARAMPOMA'),
('150705','LIMA','HUAROCHIRI','CHICLA'),
('150706','LIMA','HUAROCHIRI','CUENCA'),
('150707','LIMA','HUAROCHIRI','HUACHUPAMPA'),
('150708','LIMA','HUAROCHIRI','HUANZA'),
('150709','LIMA','HUAROCHIRI','HUAROCHIRI'),
('150710','LIMA','HUAROCHIRI','LAHUAYTAMBO'),
('150711','LIMA','HUAROCHIRI','LANGA'),
('150712','LIMA','HUAROCHIRI','LARAOS'),
('150713','LIMA','HUAROCHIRI','MARIATANA'),
('150714','LIMA','HUAROCHIRI','RICARDO PALMA'),
('150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),
('150716','LIMA','HUAROCHIRI','SAN ANTONIO'),
('150717','LIMA','HUAROCHIRI','SAN BARTOLOME'),
('150718','LIMA','HUAROCHIRI','SAN DAMIAN'),
('150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),
('150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),
('150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),
('150722','LIMA','HUAROCHIRI','SAN MATEO'),
('150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),
('150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),
('150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),
('150726','LIMA','HUAROCHIRI','SANGALLAYA'),
('150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),
('150728','LIMA','HUAROCHIRI','SANTA EULALIA'),
('150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),
('150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),
('150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),
('150732','LIMA','HUAROCHIRI','SURCO'),
('150801','LIMA','HUAURA','HUACHO'),
('150802','LIMA','HUAURA','AMBAR'),
('150803','LIMA','HUAURA','CALETA DE CARQUIN'),
('150804','LIMA','HUAURA','CHECRAS'),
('150805','LIMA','HUAURA','HUALMAY'),
('150806','LIMA','HUAURA','HUAURA'),
('150807','LIMA','HUAURA','LEONCIO PRADO'),
('150808','LIMA','HUAURA','PACCHO'),
('150809','LIMA','HUAURA','SANTA LEONOR'),
('150810','LIMA','HUAURA','SANTA MARIA'),
('150811','LIMA','HUAURA','SAYAN'),
('150812','LIMA','HUAURA','VEGUETA'),
('150901','LIMA','OYON','OYON'),
('150902','LIMA','OYON','ANDAJES'),
('150903','LIMA','OYON','CAUJUL'),
('150904','LIMA','OYON','COCHAMARCA'),
('150905','LIMA','OYON','NAVAN'),
('150906','LIMA','OYON','PACHANGARA'),
('151001','LIMA','YAUYOS','YAUYOS'),
('151002','LIMA','YAUYOS','ALIS'),
('151003','LIMA','YAUYOS','AYAUCA'),
('151004','LIMA','YAUYOS','AYAVIRI'),
('151005','LIMA','YAUYOS','AZANGARO'),
('151006','LIMA','YAUYOS','CACRA'),
('151007','LIMA','YAUYOS','CARANIA'),
('151008','LIMA','YAUYOS','CATAHUASI'),
('151009','LIMA','YAUYOS','CHOCOS'),
('151010','LIMA','YAUYOS','COCHAS'),
('151011','LIMA','YAUYOS','COLONIA'),
('151012','LIMA','YAUYOS','HONGOS'),
('151013','LIMA','YAUYOS','HUAMPARA'),
('151014','LIMA','YAUYOS','HUANCAYA'),
('151015','LIMA','YAUYOS','HUANGASCAR'),
('151016','LIMA','YAUYOS','HUANTAN'),
('151017','LIMA','YAUYOS','HUANEC'),
('151018','LIMA','YAUYOS','LARAOS'),
('151019','LIMA','YAUYOS','LINCHA'),
('151020','LIMA','YAUYOS','MADEAN'),
('151021','LIMA','YAUYOS','MIRAFLORES'),
('151022','LIMA','YAUYOS','OMAS'),
('151023','LIMA','YAUYOS','PUTINZA'),
('151024','LIMA','YAUYOS','QUINCHES'),
('151025','LIMA','YAUYOS','QUINOCAY'),
('151026','LIMA','YAUYOS','SAN JOAQUIN'),
('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS'),
('151028','LIMA','YAUYOS','TANTA'),
('151029','LIMA','YAUYOS','TAURIPAMPA'),
('151030','LIMA','YAUYOS','TOMAS'),
('151031','LIMA','YAUYOS','TUPE'),
('151032','LIMA','YAUYOS','VINAC'),
('151033','LIMA','YAUYOS','VITIS');
GO

-- INSERTAR REGISTROS DE PARTICIPANTES
INSERT INTO PARTICIPANTES

(NOMPAR, APEPAR, DNIPAR, CELPAR, DIRPAR, CODUBI, CERPAR, ESTPAR)

VALUES
('MARIANA', 'CANDELA DARCORT', '15553425', '985153732', 'Urb:Vigen del Rosario', '151021', 'NO', 'A'),
('CARLOS', 'ROJAS YMAN', '15122538', '956253628', 'Urb:Carmelo', '151029', 'SI', 'A'),
('GIANCARLO', 'SOLEDAD MAMANI', '15935376', '993892787', 'Urb:Santa Rosa', '151032', 'NO', 'A'),
('ALESSANDRO', 'VIVAS PAUCAR', '15636366', '996473638', 'Urb:Los Portales', '150901', 'SI', 'A'),
('BRIANA', ' CHUMPITAZ CANDELA', '15242625', '973152488', 'Urb:Pachacamac', '150107', 'SI', 'A'),
('GERSON', 'CONDORI SUARÈZ', '15762535', '953736674', 'Urb:Santa Monica', '150108', 'SI', 'A')
GO

-- INSERTAR REGISTROS DE LOS BLOSQUES
INSERT INTO BLOQUES
	(NOMBLO, ESTBLO)
VALUES
	('CIBERSEGURIDAD', 'A'),
	('TRANSFORMACIÒN DIGITAL', 'A'),
	('DESARROLLO DE SOFTWARE PROFESIONAL', 'A')
GO


-- INSERTAR REGISTROS DE EXPONENTES
INSERT INTO EXPONENTES

(NOMEXP, APEEXP, DNIEXP, PAEXP, IDBLO, TEMPON, ESTEXP)

VALUES
	('SAUL', 'CORDOVA GARCIA', '15625322', 'ESPAÑA', '1', 'Trabajo remoto', 'A'),
	('ANEL', 'GONSALES NEYRA', '15727327', 'JAPON', '1','Servicios financieros', 'A'),
	('VANIA', 'PALOMINO CÀRDENAS', '15723723', 'ESTADO UNIDOS',  '2', 'Nueva generación de IoT', 'A' ),
	('JULIA', 'FLORES CERROR', '15392838', 'ARGENTINA', '2', 'Innovación enfocada', 'A'),
	('ERBERT', 'CASAS RODRIGUEZ', '15512162', 'ESPAÑA',  '3', 'Algoritmo', 'A'),
	('LUIS', 'GARCIA BERROCAL', '15243395', 'MEXICO',  '3', 'Programacion Java', 'A')
GO


-- Configurando el ingreso formato de fecha: d�a/mes/a�o
SET DATEFORMAT dmy
GO

-- INSERTAR REGISTROS DE CONFERENCIAS
INSERT INTO CONFERENCIA
	(FECCON, IDBLO, IDPAR)
VALUES
	('05-08-21', '1', '1'),
	('04-08-21', '1', '2'),
	('05-08-21', '2', '3'),
	('04-08-21', '2', '4'),
	('05-08-21', '3', '5'),
	('06-08-21', '3', '6')
GO

/* Vista de la Cantidad de Participantes por Conferencia*/
CREATE VIEW vCantPar
AS
SELECT
    FECCON AS 'Fecha de Conferencia ',
    COUNT(FECCON) AS 'Total'
FROM
    CONFERENCIA
GROUP BY FECCON
GO

SELECT * FROM vCantPar
GO

-- Listando todos los participantes que requieren del certifica
CREATE VIEW vPartCert
AS
SELECT *
FROM PARTICIPANTEs
WHERE CERPAR = 'SI'
AND ESTPAR = 'A'
GO

SELECT * FROM vPartCert
GO


-- Listar a los participantes y los bloques que elegido en la conferencia 

CREATE VIEW vBloquesParticipantes
AS
SELECT
	CONCAT(P.NOMPAR, ',', P.APEPAR) AS 'Participante',
	P.DNIPAR AS 'DNI del Participante',
	B.NOMBLO AS 'Bloques',
	C.FECCON AS 'Fecha de la Conferencia'
FROM CONFERENCIA AS C
INNER JOIN PARTICIPANTES AS P
ON C.IDPAR = P.IDPAR
INNER JOIN BLOQUES AS B
ON C.IDBLO = B.IDBLO
WHERE P.ESTPAR = 'A'
GO

SELECT * FROM vBloquesParticipantes
GO

/* Proceso de almacenamiento para Ingresar Participantes y que no haya duplicado el DNI */
CREATE PROCEDURE spInsertParticipantes
    (
        @nombrePar      VARCHAR(40),
        @apellidoPar    VARCHAR(40),
        @dniPar         CHAR(8),
		@celularPar		CHAR(9),
		@direccionPar	VARCHAR(40),
		@codigoubigeo   INT,
		@certificadoPar	CHAR(2),
		@estadoPar		CHAR(1)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
        begin tran;
            IF(SELECT COUNT(*) FROM dbo.PARTICIPANTES AS P WHERE P.DNIPAR = @dniPar) = 1
                ROLLBACK TRAN;
            ELSE
                INSERT INTO dbo.PARTICIPANTES
                    (NOMPAR, APEPAR, DNIPAR, CELPAR, DIRPAR, CODUBI, CERPAR, ESTPAR)
                VALUES
                    (@nombrePar, @apellidoPar, @dniPar, @celularPar, @direccionPar, @codigoubigeo, @certificadoPar, @estadoPar)
        COMMIT TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'El participantes existente.' AS 'ALERTA'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END
GO
