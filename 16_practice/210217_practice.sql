-- ���� ȸ������ �ҷ����� ���� ���� + �̸���
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels , memberName asc


 -- å����
 select cateidx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc

select * from cateTBL

-- �ý��� �Լ� ��� ����
select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) �̱����̸�,
      case levels
         when 'A' then '���'
         when 'B' then '�ǹ�'
         when 'C' then '�����'
         when 'D' then '���̾�'
         when 'S' then '������'
         else '��ȸ��'
      end ȸ������,
      mobile,
      upper(email) �̸���
  from memberTBL  
 where levels <> 's'
 order by levels, memberName

 
 
 --����� ���� �Լ���� ����
 select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) as �̱����̸�,
      dbo.ufn_getlevel(levels) as 'ȸ������',
	  mobile,
	  upper(email) as '�̸���'
  from memberTBL
 where levels <> 's'
 order by levels, memberName;

 --å ����, �ý��� �Լ�, ���� �Լ� ����
 SELECT bookidx
      ,cateidx
      ,concat (N'å ����>', bookName) as bookname
      ,author
      ,isnull(interpreter,'(���ھ���)')as '������'
      ,company
      ,format(releasedate,'yyyy�� MM�� dd��')as '������'
      ,ISBN
      ,format (price,'#,#��')as ����
      ,discriptions
      ,regDate
  FROM booksTBL
   
 --å���� ����
SELECT 
  b.bookidx
 ,b.cateidx
 ,b.author
 ,b.interpreter
 ,b.company
FROM dbo.booksTBL as b
  inner join cateTBL as c
  on b.cateidx = c. cateidx;

 --�뿩�� å�� ���� ���� ����
  SELECT r.rentalidx
        ,m.memberName
     -- ,r.memberidx
     -- ,r.bookidx
      ,r.rentalDT
      ,r.returnDT
      ,r.rentalState
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'�뿩��'
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'�ݳ���'
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
  on r.bookidx = b.bookidx
  inner join memberTBL as m
   on r.memberidx =m.memberidx;



 --å�� �� ���� ȸ�� ��ȸ
    SELECT r.rentalidx
        ,m.memberName
     -- ,r.memberidx
     -- ,r.bookidx
     ,b.bookname
	 ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'�뿩��'
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.rentalTBL as r
 left outer join booksTBL as b
  on r.bookidx = b.bookidx
 left outer join memberTBL as m
   on r.memberidx =m.memberidx
   where r.rentalidx is null;

--å �뿩���� ���� �Ҽ� �帣
select c.cateidx
, c.cateName
from cateTBL as c
left outer join booksTBL as b
 on c.cateidx = b.cateidx
