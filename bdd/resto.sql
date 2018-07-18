DROP DATABASE IF EXISTS resto;
CREATE DATABASE IF NOT EXISTS resto;
USE resto;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFOS';

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ',
                       @@default_storage_engine) as INFO */;
