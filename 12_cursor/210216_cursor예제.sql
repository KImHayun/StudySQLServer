use sqlDB;
go

declare cur_userTbl cursor global 
	for select height from usertbl;

	open cur_usertbl

	declare @userName nchar(8); --ȸ���̸�
	declare @height smallint; --ȸ���� Ű ��� ����
	declare @cnt int = 0; --ȸ����(���� ���)
	declare @totalHeight int = 0; --ȸ�� Ű�� �հ� ����
	
	fetch next from cur_usertbl into @height; --Ŀ���� �о @height ������ �Ҵ�
	
	close cur_usertbl;

	--�ݺ��� ����

	while @@FETCH_STATUS = 0 
	begin
	
		set @cnt += 1;
		set @totalHeight += height;
		fetch next from cur_usertbl into @height;
	end

	print concat ('ȸ�� Ű ��� => ', @totalHeight / @cnt);


	close cur_usertbl;
	deallocate cur_usertbl;
