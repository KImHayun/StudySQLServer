USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 ���� 2:11:54 ******/
create or alter   procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output -- ���Ϲ��� �Ű�����(�Ķ����)
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); -- testTBL�� ���� identity�� ����
go


declare @pout int;
exec usp_users4 '���ο� �ؽ�Ʈ', @pout output;

print concat('���� �Էµ� ���� ==> ', @pout);
select @pout as '���簪';