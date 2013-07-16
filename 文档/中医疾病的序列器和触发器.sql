create sequence seq_C_JiB
/
create or replace trigger C_JiB_insert
	before
	insert
	on C_JiB
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_JiB.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhenH
/
create or replace trigger C_ZhenH_insert
	before
	insert
	on C_ZhenH
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhenH.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhongYBY
/
create or replace trigger C_ZhongYBY_insert
	before
	insert
	on C_ZhongYBY
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhongYBY.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_XiYBY
/
create or replace trigger C_XiYBY_insert
	before
	insert
	on C_XiYBY
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_XiYBY.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhongYBJ
/
create or replace trigger C_ZhongYBJ_insert
	before
	insert
	on C_ZhongYBJ
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhongYBJ.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/ 
create sequence seq_C_XiYBJ
/
create or replace trigger C_XiYBJ_insert
	before
	insert
	on C_XiYBJ
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_XiYBJ.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/           
create sequence seq_C_ZhenDBZ
/
create or replace trigger C_ZhenDBZ_insert
	before
	insert
	on C_ZhenDBZ
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhenDBZ.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhenDFF
/
create or replace trigger C_ZhenDFF_insert
	before
	insert
	on C_ZhenDFF
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhenDFF.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/      
create sequence seq_C_KangF
/
create or replace trigger C_KangF_insert
	before
	insert
	on C_KangF
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_KangF.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/   
create sequence seq_C_YuF
/
create or replace trigger C_YuF_insert
	before
	insert
	on C_YuF
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_YuF.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/     
create sequence seq_C_YuH
/
create or replace trigger C_YuH_insert
	before
	insert
	on C_YuH
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_YuH.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/     
create sequence seq_C_LiaoX
/
create or replace trigger C_LiaoX_insert
	before
	insert
	on C_LiaoX
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_LiaoX.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/    
create sequence seq_C_LiaoXBZ
/
create or replace trigger C_LiaoXBZ_insert
	before
	insert
	on C_LiaoXBZ
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_LiaoXBZ.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/      
create sequence seq_C_ZhongYZL
/
create or replace trigger C_ZhongYZL_insert
	before
	insert
	on C_ZhongYZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhongYZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/          
create sequence seq_C_AnMZL
/
create or replace trigger C_AnMZL_insert
	before
	insert
	on C_AnMZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_AnMZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhengGZL
/
create or replace trigger C_ZhengGZL_insert
	before
	insert
	on C_ZhengGZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhengGZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ZhenJZL
/
create or replace trigger C_ZhenJZL_insert
	before
	insert
	on C_ZhenJZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ZhenJZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_XiYZL
/
create or replace trigger C_XiYZL_insert
	before
	insert
	on C_XiYZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_XiYZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_QiTZL
/
create or replace trigger C_QiTZL_insert
	before
	insert
	on C_QiTZL
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_QiTZL.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/
create sequence seq_C_ChuC
/
create or replace trigger C_ChuC_insert
	before
	insert
	on C_ChuC
	for each row
	when (new.id=-1)

	declare
		v_id number(38);

	begin
		select seq_C_ChuC.nextval into v_id from dual;
		:new.id:=v_id;
	end
;
/