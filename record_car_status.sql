drop trigger if exists record_car_status_update;
Create  trigger  record_car_status_update
after  update on x_car_run
for each row  
begin
	if(new.`STATUS` != old.`STATUS`) then
		insert into 
			bi_car_status_record(lpn,`STATUS`,create_time,city_code,order_id,member_id,park_id,date_time,day_time,hour_time,minute_time) 
		values 
			(new.lpn,new.`STATUS`,new.update_time,new.city_code,new.order_id,new.member_id,new.park_id,DATE(NOW()),DAY(NOW()),HOUR(NOW()),MINUTE(NOW()));
	end if;
end;


drop trigger if exists record_car_status_insert;
Create  trigger  record_car_status_insert
after  insert on x_car_run
for each row  
begin
	insert into 
		bi_car_status_record(lpn,`STATUS`,create_time,city_code,order_id,member_id,park_id,date_time,day_time,hour_time,minute_time) 
	values 
		(new.lpn,new.`STATUS`,new.update_time,new.city_code,new.order_id,new.member_id,new.park_id,DATE(NOW()),DAY(NOW()),HOUR(NOW()),MINUTE(NOW())); 
end;

