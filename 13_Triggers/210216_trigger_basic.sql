use sqlDB;
go

create or alter trigger trg_tesTBL
on testTBL
after insert, delete, update  --삭제, 수정 할 때 트리거 발생
as

print '새 트리거 발생';
  
  insert into testTBL Values ('BTS');
  select * from testTBL where txt ='exo';
  update testTBL set txt ='exo new!' where id = 4;
  delete testTBl where  id = 3;
