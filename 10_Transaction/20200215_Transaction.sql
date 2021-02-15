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
	,'È«±æ¼ø'
	,'1990'
	,'ÇÑ¾ç'
	,'011'
	,'10101112'
	,165
	,getdata());


