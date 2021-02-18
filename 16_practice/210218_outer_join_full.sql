select rentalidx
  --    ,r.memberidx
   --  ,r.bookidx
	--  ,b.bookName

	  , format(r.rentalDT, 'yyyy-MM-dd') as rentalDT
	   , format(r.returnDT, 'yyyy-MM-dd') as rentalDT
	  ,m.membername
      ,r.rentalDT
      ,r.returnDT
      ,r.rentalState
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
 from rentalTBL as r
right outer join memberTBL as m
	on r.memberidx = m.memberidx 
left outer join booksTBL as b
	on r.bookidx = b.bookidx
left outer join cateTBL as c
on c.cateidx = b.cateidx
 
where r.rentalidx is null;

--������ �Է�
insert into booksTBL
(
 cateidx,
 bookname,
  author,
  company,
  releasedate,
  ISBN,
  price
  )

  values
  ( 
  'N0002',
  '�������� ���� ����',
  '��ȳ�',
  '������',
  '2019-10-02',
  '9791135445705',
   12500
  );

 --å���̺� �� å ������, ����, ������� ����
 begin tran;

 select 
  * from booksTBL;

 update booksTBL
	set discriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����.
                        ������ �θ� �Ʒ��� �������̰� ��������� �ڶ�����'
	,regDate = '2021-02-18'
where bookidx = 21;
rollback;
commit;

--ī�װ� �Է�
begin tran;

insert into cateTBL /*(cateidx, cateName)*/ values ('I0001', '��ȭ/����'),
												   ('I0002', '����/ó��'),
												   ('I0003', '�ð�����')
select 
*from cateTBL;

rollback;
commit;

delete from cateTBL where cateidx = 'I0003';

delete from cateTBL where cateidx in ('I0001', 'I0002');
