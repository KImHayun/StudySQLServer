/*
select memberID, memberName
from  memberTBL
 where memberID like 'H';
 */

 --select '1';

 use BikeStores;

 select * from sales.customers;

 select * from production.products;

 --DB조회
exec sp_helpdb;

 --Table조회
exec sp_tables @table_type="'table'";

--열이름 조회
exec sp_columns @table_name = 'stocks',
                @table_owner = 'production';