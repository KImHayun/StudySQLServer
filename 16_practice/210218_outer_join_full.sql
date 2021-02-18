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
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
 from rentalTBL as r
right outer join memberTBL as m
	on r.memberidx = m.memberidx 
left outer join booksTBL as b
	on r.bookidx = b.bookidx
left outer join cateTBL as c
on c.cateidx = b.cateidx
 
where r.rentalidx is null;

--데이터 입력
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
  '순수하지 않은 감각',
  '요안나',
  '로코코',
  '2019-10-02',
  '9791135445705',
   12500
  );

 --책테이블 위 책 정보중, 설명, 등록일자 수정
 begin tran;

 select 
  * from booksTBL;

 update booksTBL
	set discriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.
                        교육자 부모 아래서 보수적이고 모범적으로 자랐지만'
	,regDate = '2021-02-18'
where bookidx = 21;
rollback;
commit;

--카테고리 입력
begin tran;

insert into cateTBL /*(cateidx, cateName)*/ values ('I0001', '대화/협상'),
												   ('I0002', '성공/처세'),
												   ('I0003', '시간관리')
select 
*from cateTBL;

rollback;
commit;

delete from cateTBL where cateidx = 'I0003';

delete from cateTBL where cateidx in ('I0001', 'I0002');
