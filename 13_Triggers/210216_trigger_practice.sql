use sqlDB;
go

create or alter trigger trg_backupUserTBL
on userTBL
after update, delete

