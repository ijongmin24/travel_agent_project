insert into SPOT values (SPOT_SEQ.nextval, '蒜山', '岡山県', 35.319053, 133.664199, '00004-33166600001', null, '7170503', '07', '0706001001' );
insert into SPOT values (SPOT_SEQ.nextval, '倉敷美観地区', '岡山県倉敷市中央1丁目', 34.595799, 133.771735, '00004-33166000015', '0864263411', '7100046', '07', '0702003001' );


select * From SPOT;

select * from TRAVEL;

select *
from travel, region
where t_r_no = r_no
  and t_u_id = 'bo';

select *
from COMMENTS P_C, Comments C
where C.C_PARENT_COMMENT(+) = P_C.C_NO;

select * from COMMENTS ;

select *
from COMMENTS
where C_PARENT_COMMENT = 55;

insert into COMMENTS values (COMMENTS_SEQ.nextval, '대댓글 테스트', sysdate, sysdate, 'N', 29, 55,'bo' );
