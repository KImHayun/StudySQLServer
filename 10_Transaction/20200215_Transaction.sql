use [sqlDB]

go


BEGIN TRY
      BEGIN TRAN;

INSERT INTO [dbo].[buyTbl]
	([userID]
	,[prodName]
	,[userName]
	,[birthYear]
	,[addr]
	,[mobile1]
	,[mobile2]
	,[height]
	,[mData])

VALUES
	('HKS'
	,'ȫ���'
	,'1990'
	,'�Ѿ�'
	,'011'
	,'10101112'
	,165
	,getdata());


