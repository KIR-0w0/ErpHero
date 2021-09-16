select
			es.estimate_code as code,
			es.estimate_date as estimateDate,
			es.estimate_vender_code as venderCode,
			es.estimate_mgr_code as mgrCode,
			es.estimate_req_name as reqName,
			es.estimate_wp_code as wpCode,
			es.estimate_dept_code as deptCode,
			es.estimate_mng_type as,
			(select
				emp.emp_name
			from hero_estimates es, hero_employees emp
			where es.estimate_mgr_code = emp.emp_code) as empName,
			(select
				wp.workplace_name
			from hero_estimates es, hero_workplaces wp
			where es.estimate_wp_code = wp.workplace_code) as wpName,
			ve.vender_name as venderName

		from HERO_ESTIMATES ES, HERO_VENDERS VE, hero_employees emp, hero_workplaces wp
		 /*<where>
			<if test="wpCode != null">
				es.estimate_wp_code = #{wpCode}
			</if>
			<if test="empCode != null">
				and es.estimate_mgr_code = #{empCode}
			</if>
			<if test="deptCode != null">
				and es.estimate_dept_code = #{deptCode}
			</if>
			and 
		</where>*/ 
		where
            ve.vender_code = es.estimate_vender_code