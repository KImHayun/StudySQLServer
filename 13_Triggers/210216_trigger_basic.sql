use sqlDB;
go

create or alter trigger trg_tesTBL
on testTBL
after insert, delete, update  --����, ���� �� �� Ʈ���� �߻�
as

print '�� Ʈ���� �߻�';
  
  insert into testTBL Values ('BTS');
  select * from testTBL where txt ='exo';
  update testTBL set txt ='exo new!' where id = 4;
  delete testTBl where  id = 3;
