BULK INSERT vitimas_raw FROM '/var/opt/mssql/import/vitimas.csv' WITH (FIRSTROW = 2, ROWTERMINATOR = '0x0a');
BULK INSERT vitimas_raw FROM '/var/opt/mssql/import/locais.csv' WITH (FIRSTROW = 2, ROWTERMINATOR = '0x0a');
BULK INSERT vitimas_raw FROM '/var/opt/mssql/import/dosimetria.csv' WITH (FIRSTROW = 2, ROWTERMINATOR = '0x0a');
