/* 1�� */
--ȸ������ �ҷ�����
select Email, Mobile, Names, Addr, Levels, userID, passwords, lastLoginDT, loginIpAddr
 from membertbl
 order by levels , Names;
  
 -- å ����, �ý��� �Լ�, ���� �Լ� ����
 SELECT idx
     , concat(N'', Names) as Names
     , author
     , format(releaseDate, 'yyyy�� MM�� dd��') as '������'
     , format(price, '#,#��') as ����
  FROM bookstbl;
-----------------------------------------------------------------------------------------------------------------
/* 2�� */
  -- �ý��� �Լ���� ����
 select names,
       concat(right(Names, 2), ', ', left(Names, 1)) as '�̱����̸�', 
	   levels,
	   mobile, 
	   addr,
	   upper(email) as '�̸���'
  from memberTBL
 order by names; /*�̸�������*/
 
 --å ����
 select idx
 ,names
 ,author
 ,releasedate
 ,isbn
 ,price
 from bookstbl
 order by idx desc; /*å �̸� ����*/
 -----------------------------------------------------------------------------------------------------------------
 /* 3�� */
 -- å���� ����
 select idx 
 ,c.division /* �帣 ��ȣ */
 ,c.names /* �帣 �̸� */
 ,b.names
 ,b.author
   from dbo.bookstbl as b
 inner join divtbl as c
    on b.division = c.division;


-- å�� �Ⱥ��� ȸ�� ��ȸ
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate 
  from membertbl m
  left outer join rentaltbl r
    on m.Idx = r.memberIdx where r.rentalDate is null
 -----------------------------------------------------------------------------------------------------------------
 /* 4�� */
 --å �帣 �߰�
begin tran
insert into divtbl 
values ('I0002', '�ڱⰳ�߼�')									   
select *from divtbl
rollback
commit

--ȸ�� ���� ����
begin tran	
	update membertbl
	   set addr='�λ�� �ؿ�뱸'
	     , mobile='010-6683-7732'
     where names = '�����'
select * from membertbl
rollback
commit
-----------------------------------------------------------------------------------------------------------------
 /* 5�� */
--�հ�
select d.names
     , sum(b.price) ���հ�ݾ�
  from divtbl d
 right outer join bookstbl b
    on d.division = b.division 
 group by rollup(d.names) 


