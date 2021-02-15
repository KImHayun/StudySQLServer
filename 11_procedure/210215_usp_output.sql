USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:54 ******/
create or alter   procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output -- 리턴받은 매개변수(파라미터)
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); -- testTBL의 현재 identity값 리턴
go


declare @pout int;
exec usp_users4 '새로운 텍스트', @pout output;

print concat('현재 입력된 값은 ==> ', @pout);
select @pout as '현재값';