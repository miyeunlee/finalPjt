-- https://recoveryman.tistory.com/181
-- https://blog.ngelmaum.org/entry/lab-note-sql-join-method

select * from study_member where id = 'aaa123' and study_member_status_code in ('LE', 'ME');
select * from review where study_id = "BO00001";

-- -----------------------------------------------------------------------------------------------
-- 스터디
-- -----------------------------------------------------------------------------------------------
select * from study;
select * from member;
select * from review;
select *, datediff(end_date, start_date), timediff(end_time, start_time) from study;


-- 스터디 + 총 리뷰 수, 평균 평점 -- 중복 --> left outer join 으로 바꿀 것
select s.study_id, name, leader_id,
    s.TYPE_CODE, tc.CODE_VALUE_KOREAN TYPE_CODE_KOREAN, 
    s.ONOFF_CODE, oc.CODE_VALUE_KOREAN ONOFF_CODE_KOREAN,
    s.STUDY_STATUS_CODE, ssc.CODE_VALUE_KOREAN STUDY_STATUS_CODE_KOREAN,
    s.LEVEL_CODE, lc.CODE_VALUE_KOREAN LEVEL_CODE_KOREAN,
    start_date, end_date, datediff(end_date, start_date) date_diff, timediff(end_time, start_time) time_diff,
    s.DAY_CODE, dc.CODE_VALUE_KOREAN DAY_CODE_KOREAN, 
    study_count, start_time, end_time, enroll_capacity, enroll_actual, introduction, has_leveltest, disband_date, post_date, review_count, average_score
	from (select * from study ) s left outer join 
    (select study_id, count(*) as review_count, avg(score) as average_score from review r group by study_id) r on s.study_id = r.study_id,
    type_cd tc,
    onoff_cd oc,
    study_status_cd ssc,
    level_cd lc,
    day_cd dc,
    study_member_status_cd smsc
	where s.TYPE_CODE = tc.TYPE_CODE
        and s.ONOFF_CODE = oc.ONOFF_CODE
        and s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE
        and s.LEVEL_CODE = lc.LEVEL_CODE
        and s.DAY_CODE = dc.DAY_CODE;


-- 테스트
select * from study s inner join
    type_cd tc
	on s.TYPE_CODE = tc.TYPE_CODE;

select * from study s
	left outer join type_cd tc
	on s.TYPE_CODE = tc.TYPE_CODE
    left outer join onoff_cd oc
    on s.ONOFF_CODE = oc.ONOFF_CODE
    left outer join study_status_cd ssc
    on s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE
    left outer join level_cd lc
    on s.LEVEL_CODE = lc.LEVEL_CODE
    left outer join day_cd dc
    on s.DAY_CODE = dc.DAY_CODE;
    

-- 스터디 + 총 리뷰 수, 평균 평점	-- left outer join 으로 수정    
select s.*, 
	tc.CODE_VALUE_KOREAN TYPE_CODE_VALUE_KOREAN, 
    oc.CODE_VALUE_KOREAN ONOFF_CODE_VALUE_KOREAN, 
    ssc.CODE_VALUE_KOREAN STUDY_STATUS_CODE_VALUE_KOREAN, 
    lc.CODE_VALUE_KOREAN LEVEL_CODE_VALUE_KOREAN, 
    dc.CODE_VALUE_KOREAN DAY_CODE_VALUE_KOREAN, 
    r.review_count, 
    r.average_score 
    from study s
	left outer join type_cd tc
	on s.TYPE_CODE = tc.TYPE_CODE
	left outer join onoff_cd oc
	on s.ONOFF_CODE = oc.ONOFF_CODE
	left outer join study_status_cd ssc
	on s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE
	left outer join level_cd lc
	on s.LEVEL_CODE = lc.LEVEL_CODE
	left outer join day_cd dc
	on s.DAY_CODE = dc.DAY_CODE
    left outer join (select study_id, count(*) as review_count, round(avg(score),2) as average_score from review r group by study_id) r
    on s.study_id = r.study_id;

-- aaa123 의 활동내역 --> 스터디 상세 표시용
-- select * from study where study_id in (select study_id from study_member where id = 'aaa123' and study_member_status_code in ('LE', 'ME')); -- study_member 의 정보가 필요하므로 x
select * from study_member sm left outer join study s on sm.study_id = s.study_id where sm.id = 'aaa123' and study_member_status_code in ('LE', 'ME');

-- aaa123 의 모든 활동내역 (대기, 탈퇴 포함) --> 마이페이지 표시용
select * from study_member sm left outer join study s on sm.study_id = s.study_id where sm.id = 'aaa123';

-- 





-- -----------------------------------------------------------------------------------------------
-- 활동내역
-- -----------------------------------------------------------------------------------------------
select * from study_member;
select study_id, count(*), avg(score) from review r group by study_id;


-- (select * from study where TYPE_CODE = 'B') s,
        
select sm.study_id, name, id, 
    sm.STUDY_MEMBER_STATUS_CODE, smsc.CODE_VALUE_KOREAN STUDY_MEMBER_STATUS_CODE_KOREAN,
    enroll_date, exit_date, reviewCount, averageScore
	from (select * from study_member where id = 'aaa123' and study_member_status_code in ('LE', 'ME')) sm, 
	(select study_id, count(*) as reviewCount, avg(score) as averageScore from review r group by study_id) r,
    (select * from study where TYPE_CODE = 'B') s,
    type_cd tc,
    onoff_cd oc,
    study_status_cd ssc,
    level_cd lc,
    day_cd dc,
    study_member_status_cd smsc
	where sm.study_id = r.study_id
		and sm.study_id = s.study_id
        and s.TYPE_CODE = tc.TYPE_CODE
        and s.ONOFF_CODE = oc.ONOFF_CODE
        and s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE
        and s.LEVEL_CODE = lc.LEVEL_CODE
        and s.DAY_CODE = dc.DAY_CODE
        and sm.STUDY_MEMBER_STATUS_CODE = smsc.STUDY_MEMBER_STATUS_CODE;


-- 뷰테이블 생성 구문:
	-- create view 뷰테이블명 as (select문);

-- 테스트
create view study_member_view 
	as select sm1.study_id, name, id, TYPE_CODE, ONOFF_CODE, STUDY_STATUS_CODE, LEVEL_CODE, start_date, end_date, DAY_CODE, study_count, start_time, end_time, enroll_capacity, enroll_actual, introduction, has_leveltest, disband_date, post_date, study_interests, STUDY_MEMBER_STATUS_CODE, enroll_date, exit_date, reviewCount, averageScore
	from (select * from study_member where id = 'aaa123' and study_member_status_code in ('LE', 'ME')) sm1, 
	(select study_id, count(*) as reviewCount, avg(score) as averageScore from review r group by study_id) sm2,
    (select * from study where TYPE_CODE = 'B') s
	where sm1.study_id = sm2.study_id
		and sm1.study_id = s.study_id;
        
select * from study_member_view;
-- -----------------------------------------------------------------------------------------------

select * from study where type_code = "B" and study_status_code not in ('C', 'D');