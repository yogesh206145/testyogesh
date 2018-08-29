CREATE OR REPLACE PACKAGE BODY icp_prd_gpr_common_sp1 AS
/********************************************************************************************************
    Created By:     IBM
    Creation Date:  02/05/2016
    File Name:      icp_prd_gpr_common_sp1_pkb.sql
    Description:    Package Body for Common GPR package.
    ---
    Change History:
    Date            Version#        Remarks
    ============    =========       =======================================
    02/05/2016      0.1             Initial release.
	16/06/2016      0.2             Renamed from icp_gpr_common_sp1 and
	                                added transform_gpr_p1.
    25/07/2016      0.3             Added condition update_date >= l_delta_date for deletes.
	28/07/2016      0.4             Added check to prevent generation of duplicate RU tags for RU with multiple locales.
	22/08/2-16      0.5             Modified creation of childSKUs.
*********************************************************************************************************/
PROCEDURE segregate_gpr_ms_fn1(p_gpr_list        IN         gpr_tt1,
                               p_delta_date      IN         DATE,
							   p_start_time      IN         DATE,
							   x_add_gpr_list    OUT NOCOPY gpr_tt1,
							   x_delete_gpr_list OUT NOCOPY gpr_tt1,
							   x_ret_code        OUT        VARCHAR2,
							   x_ret_msg         OUT        VARCHAR2)
IS
    j NUMBER := 0;
	k NUMBER := 0;
	l_temp_gpr_list gpr_tt1 := gpr_tt1();
BEGIN
    x_add_gpr_list := gpr_tt1();
	FOR i IN p_gpr_list.FIRST..p_gpr_list.LAST
	LOOP
	    IF ((p_gpr_list(i).valid_from <= p_start_time) AND ((p_gpr_list(i).valid_to > p_start_time) OR (p_gpr_list(i).valid_to IS NULL)) AND (p_gpr_list(i).delete_date IS NULL))
		THEN
		    j := j + 1;
		    x_add_gpr_list.EXTEND;
			x_add_gpr_list(j) := p_gpr_list(i);
		ELSE
		    IF ((p_gpr_list(i).valid_to > p_delta_date) AND (p_gpr_list(i).valid_from <= p_start_time))
			THEN
			    k := k + 1;
			    l_temp_gpr_list.EXTEND;
				l_temp_gpr_list(k) := p_gpr_list(i);
			END IF;
		END IF;
	END LOOP;
	SELECT CAST(MULTISET(
	    SELECT gpr_t.gpr_no,
	           gpr_t.valid_from,
		       gpr_t.valid_to,
		       gpr_t.gpr_name_en,
		       gpr_t.gpr_have_items_yn,
		       gpr_t.gpr_show_sales_yn,
		       gpr_t.register_date,
		       gpr_t.update_date,
		       gpr_t.delete_date,
		       NULL,
		       NULL
        FROM TABLE(l_temp_gpr_list) gpr_t
	    WHERE NOT EXISTS (SELECT 1 
	                      FROM TABLE(x_add_gpr_list) add_gpr
			    		  WHERE add_gpr.gpr_no = gpr_t.gpr_no)
	) AS gpr_tt1) INTO x_delete_gpr_list
	FROM dual;
	x_ret_code := 'S';
	x_ret_msg := 'Success';
EXCEPTION
    WHEN OTHERS THEN
	    x_ret_code := 'E';
	    x_ret_msg := 'Error in Segregate : '||SQLERRM;
END segregate_gpr_ms_fn1;
--=========================================================================================================================================================================
PROCEDURE segregate_gpr_local_fn1(p_gpr_list        IN         gpr_local_tt1,
                                  p_delta_date      IN         DATE,
							      p_start_time      IN         DATE,
							      x_add_gpr_list    OUT NOCOPY gpr_local_tt1,
							      x_delete_gpr_list OUT NOCOPY gpr_local_tt1,
							      x_ret_code        OUT        VARCHAR2,
							      x_ret_msg         OUT        VARCHAR2)
IS
    j NUMBER := 0;
	k NUMBER := 0;
	l_temp_gpr_list gpr_local_tt1 := gpr_local_tt1();
BEGIN
    x_add_gpr_list := gpr_local_tt1();
	FOR i IN p_gpr_list.FIRST..p_gpr_list.LAST
	LOOP
	    IF ((p_gpr_list(i).valid_from <= p_start_time) AND ((p_gpr_list(i).valid_to > p_start_time) OR (p_gpr_list(i).valid_to IS NULL)) AND (p_gpr_list(i).delete_date IS NULL))
		THEN
		    j := j + 1;
		    x_add_gpr_list.EXTEND;
			x_add_gpr_list(j) := p_gpr_list(i);
		ELSE
		    IF ((p_gpr_list(i).valid_to > p_delta_date) AND (p_gpr_list(i).valid_from <= p_start_time))
			THEN
			    k := k + 1;
			    l_temp_gpr_list.EXTEND;
				l_temp_gpr_list(k) := p_gpr_list(i);
			END IF;
		END IF;
	END LOOP;
	SELECT CAST(MULTISET(
	    SELECT gpr_t.gpr_no,
		       gpr_t.cty_code_iso,
			   gpr_t.lang_code_iso,
	           gpr_t.valid_from,
		       gpr_t.valid_to,
		       gpr_t.gpr_name,
		       gpr_t.gpr_have_items_yn,
		       gpr_t.gpr_show_sales_yn,
		       gpr_t.register_date,
		       gpr_t.update_date,
		       gpr_t.delete_date,
		       NULL,
		       NULL
        FROM TABLE(l_temp_gpr_list) gpr_t
	    WHERE NOT EXISTS (SELECT 1 
	                      FROM TABLE(x_add_gpr_list) add_gpr
			    		  WHERE add_gpr.gpr_no = gpr_t.gpr_no)
	) AS gpr_local_tt1) INTO x_delete_gpr_list
	FROM dual;
	x_ret_code := 'S';
	x_ret_msg := 'Success';
EXCEPTION
    WHEN OTHERS THEN
	    x_ret_code := 'E';
	    x_ret_msg := 'Error in Segregate : '||SQLERRM;
END segregate_gpr_local_fn1;
--============================================================================================================================================================================
PROCEDURE transform_gpr_p1(p_get_gpr_resp   IN         get_gpr_response_ot1,
                           p_delta_date     IN         DATE,
						   p_ru_lang_code   IN         VARCHAR2,
                           x_import_xml     OUT NOCOPY CLOB,
                           x_remove_xml     OUT NOCOPY CLOB,
                           x_ret_code       OUT        VARCHAR2,
                           x_ret_msg        OUT        VARCHAR2)
IS
    l_add_gpr_list gpr_tt1;
	l_delete_gpr_list gpr_tt1;
	l_add_gpr_l_list gpr_local_tt1;
	l_delete_gpr_l_list gpr_local_tt1;
	l_valid_item_list gpr_item_tt1;
	l_getitem_req find_item_key_resp_ot1;
	l_getitem_resp get_item_response_ot1;
	l_trans_id NUMBER;
	l_resp_msg resp_msg_tt1;
	l_resp_code VARCHAR2(10 CHAR);
	l_ret_code VARCHAR2(1 CHAR);
	l_ret_msg VARCHAR2(600 CHAR);
	l_msg VARCHAR2(512 CHAR);
	l_delta_date DATE;
	l_item_list item_key_entity_tt1 := item_key_entity_tt1();
	k NUMBER := 0;
BEGIN
    IF p_delta_date = TO_DATE('01-01-1970','DD-MM-YYYY')
	THEN
	    l_delta_date := SYSDATE;
	ELSE
	    l_delta_date := p_delta_date;
	END IF;
    IF (p_get_gpr_resp.globalisation_context.gbl_ctx_lvl = 'Global')
	THEN
	    icp_prd_gpr_common_sp1.segregate_gpr_ms_fn1(p_gpr_list        =>  p_get_gpr_resp.gpr_list,
                                                    p_delta_date      =>  l_delta_date,
							                        p_start_time      =>  SYSDATE,
							                        x_add_gpr_list    =>  l_add_gpr_list,
							                        x_delete_gpr_list =>  l_delete_gpr_list,
							                        x_ret_code        =>  l_ret_code,
							                        x_ret_msg         =>  l_ret_msg);
		IF (l_ret_code = 'S')
		THEN
		    IF (l_add_gpr_list.EXISTS(1))
		    THEN
		        FOR i IN l_add_gpr_list.FIRST..l_add_gpr_list.LAST
		        LOOP
			        IF (l_add_gpr_list(i).gpr_item_list.EXISTS(1))
			        THEN
			            FOR j IN l_add_gpr_list(i).gpr_item_list.FIRST..l_add_gpr_list(i).gpr_item_list.LAST
			            LOOP
			                k := k + 1;
				            l_item_list.EXTEND;
				            l_item_list(k) := item_key_entity_ot1(l_add_gpr_list(i).gpr_item_list(j).item_no, l_add_gpr_list(i).gpr_item_list(j).item_type, entity_tt1(entity_ot1('Attribute')));
			            END LOOP;
			        END IF;
		        END LOOP;
		    END IF;
			IF (l_item_list.EXISTS(1))
			THEN
			    l_getitem_req := find_item_key_resp_ot1(gbl_ctx_fi_ot1('Global',NULL,NULL,NULL,NULL,NULL,NULL),NULL,l_item_list);
			    ds_get_item_sp1.get_item_p1(p_get_item_request  => l_getitem_req,
                                            x_get_item_response => l_getitem_resp,
					                        x_trans_id          => l_trans_id,
					                        x_resp_msg          => l_resp_msg,
					                        x_resp_code         => l_resp_code);
				FOR i IN l_resp_msg.FIRST .. l_resp_msg.LAST
                LOOP
				    l_msg := SUBSTR(l_msg || l_resp_msg(i).response_msg, 1, 512);
                END LOOP;
				IF (l_resp_code IN ('IIPGI-001','IIPGI-ORA'))
				THEN
				    raise_application_error(-20010, 'Error in GET_ITEM:'||l_msg);
				END IF;
				SELECT CAST(MULTISET(
				    SELECT item_t.item_no,
					       item_t.item_type,
						   NULL,
						   NULL,
						   NULL,
						   NULL,
						   NULL
					FROM TABLE(l_getitem_resp.item_list_container.item_list) item_t
					WHERE item_t.attribute.sale_start_date_global IS NOT NULL
	                AND ((item_t.attribute.sale_end_date_global > l_delta_date) OR (item_t.attribute.sale_end_date_global IS NULL))
	                AND item_t.item_state='Saleable'
	                AND item_t.delete_date IS NULL
	                AND item_t.attribute.delete_date IS NULL
				) AS gpr_item_tt1) INTO l_valid_item_list
				FROM dual;
			END IF;
			SELECT (
			   (SELECT XMLAGG(XMLELEMENT("add-item", XMLATTRIBUTES('GPR' AS "item-descriptor", 'GPR'||gpr_t.gpr_no AS "id"),
			                  CASE WHEN (EXISTS (SELECT 1 FROM TABLE(gpr_t.gpr_item_list)))
							  THEN
			                      XMLELEMENT("set-property", XMLATTRIBUTES('childSKUs' AS "name"), XMLCDATA((SELECT RTRIM(XMLAGG(XMLELEMENT(e,item_t.item_type||item_t.item_no,',').EXTRACT('//text()')).GETCLOBVAL(), ',')
								                                                                             --LISTAGG(item_t.item_type||item_t.item_no, ',') WITHIN GROUP (ORDER BY item_t.sort_no)
				                                                                                             FROM TABLE(gpr_t.gpr_item_list) item_t
					    				        		            									     WHERE item_t.delete_date IS NULL
																										     AND EXISTS (SELECT 1 
																										                 FROM TABLE(l_valid_item_list) valid_item_t
																											             WHERE valid_item_t.item_no = item_t.item_no
																													     AND valid_item_t.item_type = item_t.item_type))))
							  END,
			                      XMLELEMENT("set-property", XMLATTRIBUTES('displayNameDefault' AS "name"), XMLCDATA(gpr_t.gpr_name_en)))).GETCLOBVAL() response_xml
			    FROM TABLE(l_add_gpr_list) gpr_t)
			    ||
			   (SELECT XMLAGG(XMLELEMENT("add-item", XMLATTRIBUTES('GPR' AS "item-descriptor", 'GPR'||del_gpr_t.gpr_no AS "id"),
			                      XMLELEMENT("set-property", XMLATTRIBUTES('displayNameDefault' AS "name"), XMLCDATA(del_gpr_t.gpr_name_en)),
							      XMLELEMENT("set-property", XMLATTRIBUTES('endDate' AS "name"), XMLCDATA(TO_CHAR(NVL(del_gpr_t.delete_date, SYSDATE),'MM/DD/YYYY HH24:MI:SS'))))).GETCLOBVAL() response_xml
			    FROM TABLE(l_delete_gpr_list) del_gpr_t
				WHERE del_gpr_t.update_date >= l_delta_date)
			) INTO x_import_xml
			FROM dual;
		ELSIF (l_ret_code = 'E')
		THEN
		    raise_application_error(-20010, l_ret_msg);
		END IF;
	ELSIF (p_get_gpr_resp.globalisation_context.gbl_ctx_lvl = 'Locale')
	THEN
	    icp_prd_gpr_common_sp1.segregate_gpr_local_fn1(p_gpr_list        =>  p_get_gpr_resp.gpr_local_list,
                                                       p_delta_date      =>  l_delta_date,
							                           p_start_time      =>  SYSDATE,
							                           x_add_gpr_list    =>  l_add_gpr_l_list,
							                           x_delete_gpr_list =>  l_delete_gpr_l_list,
							                           x_ret_code        =>  l_ret_code,
							                           x_ret_msg         =>  l_ret_msg);
        IF (l_ret_code = 'S')
		THEN
	        SELECT (
		       (SELECT XMLAGG(XMLELEMENT("add-item", XMLATTRIBUTES('productRetailUnit' AS "item-descriptor", 'GPR_'||gpr_l_t.gpr_no||'_'||gpr_l_t.cty_code_iso AS "id"),
			                      XMLELEMENT("set-property", XMLATTRIBUTES('retailUnitId' AS "name"), XMLCDATA(gpr_l_t.cty_code_iso)),
								  XMLELEMENT("set-property", XMLATTRIBUTES('product' AS "name"), XMLCDATA(gpr_l_t.cty_code_iso||'=GPR'||gpr_l_t.gpr_no)))).GETCLOBVAL() response_xml
		        FROM TABLE(l_add_gpr_l_list) gpr_l_t
				WHERE gpr_l_t.lang_code_iso = p_ru_lang_code)    --added to prevent generation of duplicate tags for RU with multiple locales
				||
			   (SELECT XMLAGG(XMLELEMENT("add-item", XMLATTRIBUTES('productTranslation' AS "item-descriptor", 'trans1_'||gpr_l_t.lang_code_iso||'_'||gpr_l_t.cty_code_iso||'_GPRprod'||gpr_l_t.gpr_no AS "id"),
			                      XMLELEMENT("set-property", XMLATTRIBUTES('displayName' AS "name"), XMLCDATA(gpr_l_t.gpr_name)),
								  XMLELEMENT("set-property", XMLATTRIBUTES('locale' AS "name"), XMLCDATA(gpr_l_t.lang_code_iso||'_'||gpr_l_t.cty_code_iso)),
								  XMLELEMENT("set-property", XMLATTRIBUTES('product' AS "name"), XMLCDATA(gpr_l_t.lang_code_iso||'_'||gpr_l_t.cty_code_iso||'=GPR'||gpr_l_t.gpr_no)))).GETCLOBVAL() response_xml
		        FROM TABLE(l_add_gpr_l_list) gpr_l_t)
		    ) INTO x_import_xml
		    FROM dual;
			SELECT (
			   (SELECT XMLAGG(XMLELEMENT("remove-item", XMLATTRIBUTES('productRetailUnit' AS "item-descriptor", 'GPR_'||del_gpr_l_t.gpr_no||'_'||del_gpr_l_t.cty_code_iso AS "id"))).GETCLOBVAL() response_xml
			    FROM TABLE(l_delete_gpr_l_list) del_gpr_l_t
				WHERE del_gpr_l_t.update_date >= l_delta_date
				AND del_gpr_l_t.lang_code_iso = p_ru_lang_code)     --added to prevent generation of duplicate tags for RU with multiple locales
				||
			   (SELECT XMLAGG(XMLELEMENT("remove-item", XMLATTRIBUTES('productTranslation' AS "item-descriptor", 'trans1_'||del_gpr_l_t.lang_code_iso||'_'||del_gpr_l_t.cty_code_iso||'_GPRprod'||del_gpr_l_t.gpr_no AS "id"))).GETCLOBVAL() response_xml
			    FROM TABLE(l_delete_gpr_l_list) del_gpr_l_t
				WHERE del_gpr_l_t.update_date >= l_delta_date)
			) INTO x_remove_xml
			FROM dual;
		ELSIF (l_ret_code = 'E')
		THEN
		    raise_application_error(-20010, l_ret_msg);
		END IF;
	END IF;
--
    x_ret_code := 'S';
    x_ret_msg := 'Success';
EXCEPTION
    WHEN OTHERS THEN
	    x_ret_code := 'E';
	    x_ret_msg := 'Error in XFORM_GPR : '||SQLERRM;
END transform_gpr_p1;
--
END icp_prd_gpr_common_sp1;
/
show errors
