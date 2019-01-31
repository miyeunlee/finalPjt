-- https://recoveryman.tistory.com/181

select * from study_member where id = 'aaa123' and study_member_status_code in ('LE', 'ME');
select * from review where study_id = "BO00001";

-- -----------------------------------------------------------------------------------------------
-- 스터디
-- -----------------------------------------------------------------------------------------------
select * from study;
select * from member;
select * from review;
select *, datediff(end_date, start_date), timediff(end_time, start_time) from study;

select * from study s, type_cd tc, study_status_cd ssc, onoff_cd oc, level_cd lc, day_cd dc
	where s.TYPE_CODE = tc.TYPE_CODE, 
    s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE, 
    s.ONOFF_CODE = oc.ONOFF_CODE, 
    s.LEVEL_CODE = lc.LEVEL_CODE, 
    s.DAY_CODE = dc.DAY_CODE;


-- -----------------------------------------------------------------------------------------------
-- 활동내역
-- -----------------------------------------------------------------------------------------------
select * from study_member;
select study_id, count(*), avg(score) from review r group by study_id;

select s.study_id, name, 
    s.TYPE_CODE, tc.CODE_VALUE_KOREAN TYPE_CODE_KOREAN, 
    s.ONOFF_CODE, oc.CODE_VALUE_KOREAN ONOFF_CODE_KOREAN,
    s.STUDY_STATUS_CODE, ssc.CODE_VALUE_KOREAN STUDY_STATUS_CODE_KOREAN,
    s.LEVEL_CODE, lc.CODE_VALUE_KOREAN LEVEL_CODE_KOREAN,
    start_date, end_date, 
    s.DAY_CODE, dc.CODE_VALUE_KOREAN DAY_CODE_KOREAN, 
    study_count, start_time, end_time, enroll_capacity, enroll_actual, introduction, has_leveltest, disband_date, post_date
	from (select study_id, count(*) as reviewCount, avg(score) as averageScore from review r group by study_id) r,
    (select * from study where TYPE_CODE = 'B') s,
    type_cd tc,
    onoff_cd oc,
    study_status_cd ssc,
    level_cd lc,
    day_cd dc,
    study_member_status_cd smsc
	where s.study_id = r.study_id
        and s.TYPE_CODE = tc.TYPE_CODE
        and s.ONOFF_CODE = oc.ONOFF_CODE
        and s.STUDY_STATUS_CODE = ssc.STUDY_STATUS_CODE
        and s.LEVEL_CODE = lc.LEVEL_CODE
        and s.DAY_CODE = dc.DAY_CODE;
        
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