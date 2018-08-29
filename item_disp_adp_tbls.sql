   /********************************************************************************************************
   Created By:     IBM
   Creation Date:  14/03/2016
   File Name:      icp_prd_item_disp_adp_tbls.sql
   Description:    Script for creating IIP staging tables.
   ---
   Change History:
    Date            Version#     Name                   Remarks
   ============    =========    =================      =======================================
    14/03/2016      0.1          IBM         			 Initial release.
	05/05/2016      0.2			 IBM					 Enhancement for Block3.
	06/06/2016		0.3			 IBM					 Enhancement for Block4.
														 Table creation script for the sub-entities also included.
	20/07/2016	   0.4         	 IBM          			 Updations for Block 4 patch release.Retail domain entities added.
    18/08/2016     0.5           IBM                     Updated for Block 5 Release.	
	*********************************************************************************************************/
CREATE TABLE iip_ikea_sku_t
(
    odi_session_id               NUMBER(20) NOT NULL ENABLE,
	sku_id                       VARCHAR2(254 CHAR) NOT NULL ENABLE,
    sku_type                     NUMBER NOT NULL ENABLE,
    product_type_name_default    VARCHAR2(600 CHAR),
    product_name_default         VARCHAR2(254 CHAR),
    product_type_name_prt_def    VARCHAR2(254 CHAR),
    pia_sales_start_date_default DATE,
    pia_sales_end_date_default   DATE,
    unit_code                    VARCHAR2(254 CHAR),
    product_type_no              VARCHAR2(254 CHAR),
    product_name_no              VARCHAR2(254 CHAR),
    assembly_code                VARCHAR2(254 CHAR),
    rec_cust_order_code_default  VARCHAR2(254 CHAR),
    item_measure_ref_imp_default VARCHAR2(256 CHAR),
    item_measure_ref_met_default VARCHAR2(256 CHAR),
    number_of_packages           VARCHAR2(254 CHAR),
    meterware                    VARCHAR2(20 CHAR),
    status_code                  VARCHAR2(254 CHAR),
    presentation_group_code      VARCHAR2(254 CHAR),
    valid_design_text_default    VARCHAR2(254 CHAR),
    price_unit_text_met_default  VARCHAR2(300 CHAR),
    price_unit_text_imp_default  VARCHAR2(300 CHAR),
    price_unit_factor_m_default  NUMBER,
    price_unit_factor_i_default  NUMBER,
    price_unit_value_default     NUMBER,
    price_unit_tag_code_default  NUMBER(1,0),
	product_area 				 VARCHAR2(255 CHAR),
    CONSTRAINT ikea_sku_pk PRIMARY KEY (odi_session_id,sku_id) ENABLE
)
/
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_image_t
(
    odi_session_id      		  NUMBER(20) NOT NULL ENABLE,
	item_no						  VARCHAR2(15 CHAR),
	item_type	                  VARCHAR2(3 CHAR),
	seq_no						  NUMBER,
    image_no			          VARCHAR2(7 CHAR),
	image_type	    		      VARCHAR2(35 CHAR),
	image_desc		    	      VARCHAR2(150 CHAR),
	image_name			          VARCHAR2(300 CHAR),
	image_url		       	      VARCHAR2(300 CHAR),
	image_size	      	          VARCHAR2(2 CHAR),
	image_usage                   VARCHAR2(35 CHAR),
	image_pe_no                   VARCHAR2(30 CHAR),
	image_date_adapt              DATE,
	sort_no                       NUMBER,
	batch_id 					  NUMBER,
	status 						  VARCHAR2(20 CHAR), 
	remarks 				      VARCHAR2(100 CHAR), 
	image_id 					  VARCHAR2 (254 CHAR),
	update_date                   DATE,
	register_date                 DATE,
	delete_date 				  DATE
)
/
------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_del_t
( odi_session_id               NUMBER(20) NOT NULL ENABLE,
  sku_id VARCHAR2(254 CHAR)    NOT NULL ENABLE 
)
/
-------------------------------------------------------------------------
CREATE TABLE iip_ikea_doc_t
(
    odi_session_id NUMBER(20) NOT NULL ENABLE,
    item_no        VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type      VARCHAR2(3 CHAR) NOT NULL ENABLE,
    doc_no         NUMBER NOT NULL ENABLE,
    doc_ver_no     NUMBER NOT NULL ENABLE,
    doc_seq_no     NUMBER NOT NULL ENABLE,
    doc_name       VARCHAR2(4000 CHAR),
    doc_type_no    VARCHAR2(5 CHAR),
    doc_type_name  NUMBER(10,0),
    doc_server     VARCHAR2(120 CHAR),
    doc_path       VARCHAR2(3000 CHAR),
	batch_id 	   NUMBER,
	status 		   VARCHAR2(20 CHAR), 
	remarks 	   VARCHAR2(4000 CHAR),
	doc_usage 	   VARCHAR2(35 CHAR),
    update_date    DATE NOT NULL ENABLE,
    register_date  DATE NOT NULL ENABLE,
    delete_date    DATE
)
/ 
-------------------------------------------------------------------------------
CREATE TABLE iip_ikea_doc_locale_t
(
    odi_session_id NUMBER(20) NOT NULL ENABLE,
    item_no        VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type      VARCHAR2(3 CHAR) NOT NULL ENABLE,
    country_code   VARCHAR2(3 CHAR) NOT NULL ENABLE,
    language_code  VARCHAR2(2 CHAR) NOT NULL ENABLE,
    doc_no         NUMBER NOT NULL ENABLE,
    doc_ver_no     NUMBER NOT NULL ENABLE,
    doc_seq_no     NUMBER NOT NULL ENABLE,
    doc_name       VARCHAR2(4000 CHAR),
    doc_type_no    VARCHAR2(5 CHAR),
    doc_type_name  NUMBER(10,0),
    doc_server     VARCHAR2(120 CHAR),
    doc_path       VARCHAR2(3000 CHAR),
	batch_id 	   NUMBER,
	status 		   VARCHAR2(20 CHAR), 
	remarks 	   VARCHAR2(4000 CHAR),
	doc_usage 	   VARCHAR2(35 CHAR),
    update_date    DATE NOT NULL ENABLE,
    register_date  DATE NOT NULL ENABLE,
    delete_date    DATE
)
/ 
-------------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_xlate_t
(
    odi_session_id             NUMBER(20) NOT NULL ENABLE,
    translation_id             VARCHAR2(254 CHAR) NOT NULL ENABLE,
    product_type_name_part     VARCHAR2(254 CHAR),
    product_name               VARCHAR2(254 CHAR),
    product_type_name          VARCHAR2(1800 CHAR),
    item_measure_ref_imperial  VARCHAR2(256 CHAR),
    item_measure_ref_metric    VARCHAR2(256 CHAR),
    number_of_packages         VARCHAR2(254 CHAR),
    presentation_group_code    VARCHAR2(254 CHAR),
    valid_design_text          VARCHAR2(254 CHAR),
    price_unit_text_metric     VARCHAR2(600 CHAR),
    price_unit_text_imperial   VARCHAR2(600 CHAR),
    price_unit_factor_metric   NUMBER,
    price_unit_factor_imperial NUMBER,
    price_unit_value           NUMBER,
    price_unit_tag_code        NUMBER(1,0),
    CONSTRAINT ikea_sku_xlate_pk PRIMARY KEY (odi_session_id, translation_id) ENABLE
)
/
-------------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_xlate_del_t
( 
  odi_session_id               		NUMBER(20) NOT NULL ENABLE,
  translation_id VARCHAR2(254 CHAR) NOT NULL ENABLE
)
/
---------------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_xru_t
(
    odi_session_id NUMBER(20) NOT NULL ENABLE,
    id             VARCHAR2(254 CHAR) NOT NULL ENABLE,
    retail_unit_id VARCHAR2(40 CHAR),
    pia_sale_start_date DATE,
    pia_sale_end_date DATE,
    rec_cust_order_code VARCHAR2(254 CHAR),
    CONSTRAINT ikea_sku_xru_pk PRIMARY KEY (odi_session_id, id) ENABLE
)
/
------------------------------------------------------------------------------------
CREATE TABLE iip_ikea_sku_xru_del_t
( 
  odi_session_id        NUMBER(20) NOT NULL ENABLE,
  id VARCHAR2(254 CHAR) NOT NULL ENABLE
)
/
------------------------------------------------------------------------------------
CREATE TABLE iip_complementary_t
(
    odi_session_id                  NUMBER NOT NULL ENABLE,
    item_no                         VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                       VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	seq_no                          NUMBER,
    item_no_complementary	     	VARCHAR2(15 CHAR),
    item_type_complementary      	VARCHAR2(50 CHAR),
    complementary_type_no        	VARCHAR2(15 CHAR),              
    complementary_type_name_en   	VARCHAR2(50 CHAR),               	                
    update_date                  	DATE,        	          
    register_date                	DATE,  
    delete_date                  	DATE
)
/
-------------------------------------------------------------------------------------------------
CREATE TABLE iip_customer_material_t
(
    odi_session_id                  NUMBER NOT NULL ENABLE,
    item_no                         VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                       VARCHAR2(3 CHAR)  NOT NULL ENABLE,
    seq_no                          NUMBER,
	material_text_en				VARCHAR2(1000 CHAR),
    material_part_text_en			VARCHAR2(600 CHAR),
    product_type_text_en			VARCHAR2(1800 CHAR),
    sort_no				            NUMBER,
    update_Date			            DATE,
    register_date	                DATE,
    delete_date			            DATE
)
/ 
----------------------------------------------------------------------------------------------------
CREATE TABLE iip_cust_material_local_t
(
    odi_session_id              NUMBER NOT NULL ENABLE,
    item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                   VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	country_Code                VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code               VARCHAR2(2 CHAR) NOT NULL ENABLE,
    seq_No                      NUMBER,
	material_text				VARCHAR2(3000 CHAR),
    material_part_text		    VARCHAR2(1800 CHAR),
    product_type_text		    VARCHAR2(1800 CHAR),
    sort_no				        NUMBER(5),
    update_date				    DATE,
    register_date				DATE,
    delete_date					DATE 
)
/  
--------------------------------------------------------------------------------------------------------
CREATE TABLE iip_people_planet_t
(
    odi_session_id              NUMBER NOT NULL ENABLE,
    item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                   VARCHAR2(3 CHAR)  NOT NULL ENABLE,
    seq_no                      NUMBER,
	people_planet_no	        VARCHAR2(7 CHAR),
    people_planet_text_en       VARCHAR2(254 CHAR),
    people_planet_type_no       VARCHAR2(5 CHAR),              
    product_type_text_en        VARCHAR2(600 CHAR),               	                
    people_planet_type_name_en  VARCHAR2(50 CHAR),        	          
    sort_no                     NUMBER(5),  
    update_date                 DATE,
	register_date               DATE,   
	delete_date                 DATE
)
/  
----------------------------------------------------------------------------------------------------------
CREATE TABLE iip_people_planet_local_t
(
    odi_session_id              NUMBER NOT NULL ENABLE,
    item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                   VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	country_Code                VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code               VARCHAR2(2 CHAR) NOT NULL ENABLE,
    seq_No                      NUMBER,
    people_planet_no	        VARCHAR2(7 CHAR),
    people_planet_text          VARCHAR2(254 CHAR),
    people_planet_type_no       VARCHAR2(5 CHAR),              
    people_planet_type_name_en  VARCHAR2(50 CHAR),               	                
    product_type_name           VARCHAR2(600 CHAR),        	          
    sort_no                     NUMBER(5),  
    update_date                 DATE,
	register_date               DATE,   
	delete_date                 DATE
)
/  
ALTER TABLE iip_people_planet_local_t NOLOGGING
/
------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_pkg_measurement_t
(
    odi_session_id                  		NUMBER NOT NULL ENABLE,
    item_no                         		VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                       		VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	con_pck_no		      					NUMBER(2),
	con_pck_len_met							VARCHAR2(100 CHAR),
	con_pck_len_imp							VARCHAR2(100 CHAR),
	con_pck_wdth_met						VARCHAR2(100 CHAR),
	con_pck_wdth_imp						VARCHAR2(100 CHAR),
	con_pck_hght_met						VARCHAR2(100 CHAR),
	con_pck_hght_imp						VARCHAR2(100 CHAR),
	con_pck_dia_met							VARCHAR2(100 CHAR),
	con_pck_dia_imp							VARCHAR2(100 CHAR),
	con_pck_grs_vol_met						VARCHAR2(100 CHAR),
	con_pck_grs_vol_imp						VARCHAR2(100 CHAR),
	con_pck_grs_wgt_met						VARCHAR2(100 CHAR),
	con_pck_grs_wgt_imp						VARCHAR2(100 CHAR),
	con_pck_net_wgt_met						VARCHAR2(100 CHAR),
	con_pck_net_wgt_imp						VARCHAR2(100 CHAR),
	update_date                             DATE,
	register_date                           DATE,
	delete_date                             DATE
)
/  
----------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_pkg_msrmnt_local_t
(
     odi_session_id               			NUMBER NOT NULL ENABLE,
     item_no                      			VARCHAR2(15 CHAR) NOT NULL ENABLE,
     item_type                    			VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	 country_code                 			VARCHAR2(3 CHAR) NOT NULL ENABLE,
     language_code                			VARCHAR2(2 CHAR) NOT NULL ENABLE,
	 con_pck_no		      					NUMBER(2),
	 con_pck_len_met						VARCHAR2(100 CHAR),
	 con_pck_len_imp						VARCHAR2(100 CHAR),
	 con_pck_wdth_met						VARCHAR2(100 CHAR),
	 con_pck_wdth_imp						VARCHAR2(100 CHAR),
	 con_pck_hght_met						VARCHAR2(100 CHAR),
	 con_pck_hght_imp						VARCHAR2(100 CHAR),
	 con_pck_dia_met					    VARCHAR2(100 CHAR),
	 con_pck_dia_imp						VARCHAR2(100 CHAR),
	 con_pck_grs_vol_met					VARCHAR2(100 CHAR),
	 con_pck_grs_vol_imp					VARCHAR2(100 CHAR),
	 con_pck_grs_wgt_met					VARCHAR2(100 CHAR),
	 con_pck_grs_wgt_imp					VARCHAR2(100 CHAR),
	 con_pck_net_wgt_met					VARCHAR2(100 CHAR),
	 con_pck_net_wgt_imp					VARCHAR2(100 CHAR),
     update_date                  			DATE,
     register_date                			DATE,
     delete_date                  			DATE
)
/	
-------------------------------------------------------------------------------------------------------------------------  
CREATE TABLE iip_country_specific_t
(
    odi_session_id             NUMBER NOT NULL ENABLE,
    item_no                    VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                  VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	country_code               VARCHAR2(3 CHAR) NOT NULL ENABLE,
	item_no_country_specific   VARCHAR2(15 CHAR),
    item_type_country_specific VARCHAR2(3 CHAR) ,
    class_unit_code            VARCHAR2(5 CHAR),              
    class_unit_type            VARCHAR2(3 CHAR),               	                
    sale_start_date            DATE,        	          
    sale_end_date              DATE,  
    update_date                DATE,
	register_date              DATE,
	delete_date                DATE
)
/	
-------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_good_to_know_t
(
    odi_session_id                  NUMBER NOT NULL ENABLE,
    item_no                         VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                       VARCHAR2(3 CHAR)  NOT NULL ENABLE,
    seq_no                          NUMBER ,
    good_to_know_no	                VARCHAR2(105 CHAR),                 
    good_to_know_text_en            VARCHAR2(254 CHAR),
    good_to_know_type_no            VARCHAR2(105 CHAR),             
    good_to_know_type_name_en       VARCHAR2(254 CHAR),              	                
    good_to_know_header_no          VARCHAR2(105 CHAR),     	          
    good_to_know_header_text_en     VARCHAR2(50 CHAR),  
    image_no                        VARCHAR2(7 CHAR),
	image_type                      VARCHAR2(35 CHAR),
	image_size                      VARCHAR2(2 CHAR),
	sort_no                         NUMBER,                 
  	update_date                     DATE,                         
	register_date                   DATE,
    delete_date                     DATE 
)
/  
------------------------------------------------------------------------------------------------
CREATE TABLE iip_good_to_know_local_t
(
    odi_session_id               NUMBER NOT NULL ENABLE,
    item_no                      VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                    VARCHAR2(3 Char)  NOT NULL ENABLE,
    Seq_no                       NUMBER ,
    Country_Code                 VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code                VARCHAR2(2 CHAR) NOT NULL ENABLE,
    good_to_know_no	             VARCHAR2(5 CHAR),
    good_to_know_text            VARCHAR2(762 CHAR),
    good_to_know_type_no         VARCHAR2(15 CHAR),              
    good_to_know_type_name_en    VARCHAR2(105 CHAR),               	                
    good_to_know_header_no       VARCHAR2(5 CHAR),        	          
    good_to_know_header_text     VARCHAR2(150 CHAR),  
    image_no                     VARCHAR2(7 CHAR),
	image_type                   VARCHAR2(35 CHAR),
  	image_size                   VARCHAR2(2 CHAR),
	sort_no                      NUMBER,                 
  	update_date                  DATE,                         
	register_date                DATE,
    delete_date                  DATE 
)
/  
----------------------------------------------------------------------------------------------------------
CREATE TABLE iip_long_benefit_t
(
    odi_session_id              NUMBER NOT NULL ENABLE,
    item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                   VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	Seq_no                       NUMBER ,
    long_bnfit_no		      	VARCHAR2(5 CHAR),
	long_bnfit_sub_nam		    VARCHAR2(100 CHAR),
	long_bnfit_hdr_txt_en		VARCHAR2(450 CHAR),
	long_bnfit_name_en			VARCHAR2(4000 CHAR),
  	long_bnfit_txt_en		    VARCHAR2(4000 CHAR),
   	image_no			  		VARCHAR2(7 CHAR),
	image_type					VARCHAR2(35 CHAR),
  	image_size					VARCHAR2(2 CHAR),
	update_date		            DATE,
    register_date	    	    DATE,
    delete_Date                 DATE
)
/  
------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_long_benefit_local_t
(
    odi_session_id              NUMBER NOT NULL ENABLE,
    item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                   VARCHAR2(3 Char)  NOT NULL Enable,
	Seq_no                      NUMBER ,
    Country_Code                VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code               VARCHAR2(2 CHAR) NOT NULL ENABLE,
    long_bnfit_no		        VARCHAR2(5 CHAR),
	long_bnfit_sub_nam		    VARCHAR2(100 CHAR),
  	long_bnfit_hdr_txt		    VARCHAR2(450 CHAR),
  	long_bnfit_name			  	VARCHAR2(4000 CHAR),
  	long_bnfit_txt			    VARCHAR2(4000 CHAR),
  	image_no			  	    VARCHAR2(7 CHAR),
  	image_type				    VARCHAR2(35 CHAR),
	image_size				    VARCHAR2(2 CHAR),
  	update_date		            DATE,
  	register_date	    	    DATE,
    delete_Date                 DATE 
)
/  
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_price_qual_classfication_t
(
    odi_session_id                NUMBER NOT NULL ENABLE,
    item_no                       VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                     VARCHAR2(3 Char)  NOT NULL Enable,
    price_qual_classfication_no	  VARCHAR2(5 CHAR),
    price_qual_classfication_name VARCHAR2(35 CHAR),
    valid_from                    DATE,              
    valid_to                   	  DATE,               	                
    update_date                   DATE,        	          
    register_date                 DATE,  
    delete_Date                   DATE 
)
/  
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_recommended_sales_price_t
(
    odi_session_id                 NUMBER NOT NULL ENABLE,
    item_no                        VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                      VARCHAR2(3 CHAR)  NOT NULL ENABLE,
    recommended_sales_price        NUMBER(13,2),                         
	currency_code                  VARCHAR2(3 CHAR),
	valid_from                     DATE,
  	valid_to                       DATE,                         
	update_date                    DATE,
	register_date                  DATE,
    delete_date                    DATE 
)
/  
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_care_instruction_t
(
     odi_session_id               NUMBER NOT NULL ENABLE,
     item_no                      VARCHAR2(15 CHAR) NOT NULL ENABLE,
     item_type                    VARCHAR2(3 CHAR)  NOT NULL ENABLE,
     seq_no                       NUMBER,
     care_instr_no                VARCHAR2(5 CHAR),
     care_instr_text_en           VARCHAR2(762 CHAR) ,
     care_instr_header_no         VARCHAR2(5 CHAR),              
     care_instr_header_text_en    VARCHAR2(50 CHAR),               	                
     care_Instr_type_no           VARCHAR2(5 CHAR),        	          
     care_instr_type_name_en      VARCHAR2(255 CHAR) ,  
	 care_instr_text_short_en     VARCHAR2(45 CHAR),
     product_type_text_en         VARCHAR2(600 CHAR),
     image_no                     VARCHAR2(7 CHAR),              
     image_type                   VARCHAR2(35 CHAR),               	                
     image_size                   VARCHAR2(2 CHAR),        	          
     sort_no                      NUMBER(5),      
     update_date                  DATE,
	 register_date                DATE,
	 delete_date                  DATE
)
/  
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_care_instruction_local_t
( 
    odi_session_id                    NUMBER NOT NULL ENABLE,
    item_no                           VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                         VARCHAR2(3 CHAR)  NOT NULL ENABLE,
    country_Code                      VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code                     VARCHAR2(2 CHAR) NOT NULL ENABLE,
    Seq_No                            NUMBER ,
    care_instruction_no	              VARCHAR2(5 CHAR),
    care_instruction_text             VARCHAR2(762 CHAR) ,
    care_instruction_header_no        VARCHAR2(5 CHAR),              
    care_instruction_header_text      VARCHAR2(50 CHAR),               	                
    care_instruction_type_no          VARCHAR2(5 CHAR),        	          
    care_instruction_type_name_en     VARCHAR2(255 CHAR),  
    care_instruction_text_short       VARCHAR2(45 CHAR),
	product_type_text                 VARCHAR2(600 CHAR),
	image_no                          VARCHAR2(7 CHAR),
	image_type                        VARCHAR2(35 CHAR),                 
	image_size                        VARCHAR2(2 CHAR),                         
	sort_no                           NUMBER(5),
	register_date                     DATE,
	update_date                       DATE,                         
	delete_date                       DATE
)
/  	  
---------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_customer_benefit_t
(
    odi_session_id                NUMBER NOT NULL ENABLE,
    item_no                       VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                     VARCHAR2(3 Char)  NOT NULL ENABLE,
	seq_no                        NUMBER ,
    cust_bnfit_no		          VARCHAR2(8 CHAR),
	cust_bnfit_txt_en		      VARCHAR2(762 CHAR),
	cust_bnfit_alt_yn	          VARCHAR2(1 CHAR),
    sort_no		 			      NUMBER,               	                
    update_date                   DATE,        	          
    register_date                 DATE,  
    delete_Date                   DATE 
)
/  	
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_customer_benefit_local_t
(
    odi_session_id                NUMBER NOT NULL ENABLE,
    item_no                       VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                     VARCHAR2(3 CHAR)  NOT NULL ENABLE,
	country_Code                  VARCHAR2(3 Char) NOT NULL ENABLE,
    language_code                 VARCHAR2(2 CHAR) NOT NULL ENABLE,
    seq_no                        NUMBER ,
    cust_bnfit_no		          VARCHAR2(8 CHAR),
    cust_bnfit_txt			      VARCHAR2(762 CHAR),
	cust_bnfit_alt_yn		      VARCHAR2(3 CHAR),
    sort_no		 			      NUMBER,               	                
    update_date                   DATE,        	          
    register_date                 DATE,  
    delete_Date                   DATE 
)
/  	
--------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_valid_design_parts_t
(   odi_session_id           NUMBER NOT NULL ENABLE,
    item_no                  VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                VARCHAR2(3 CHAR) NOT NULL ENABLE,
   master_metadata           VARCHAR2(254 CHAR),
    valid_des_prt_pos		 VARCHAR2(4 CHAR),
	valid_des_prt_key		 VARCHAR2(6 CHAR),
	valid_des_prt_typ		 VARCHAR2(5 CHAR),
	valid_des_prt_txt_en	 VARCHAR2(250 CHAR),
	update_date		         DATE,
	register_date	    	 DATE,
	delete_date	        	 DATE
)
/  
--------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_valid_design_parts_local_t
(   odi_session_id           NUMBER NOT NULL ENABLE,
    item_no                  VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                VARCHAR2(3 CHAR) NOT NULL ENABLE,
	country_code             VARCHAR2(3 CHAR) NOT NULL ENABLE,
    language_code            VARCHAR2(2 CHAR) NOT NULL ENABLE,
   master_metadata           VARCHAR2(254 CHAR),
    valid_des_prt_pos		 VARCHAR2(4 CHAR),
	valid_des_prt_key		 VARCHAR2(6 CHAR),
	valid_des_prt_typ		 VARCHAR2(5 CHAR),
	valid_des_prt_txt	 	 VARCHAR2(250 CHAR),
	update_date		         DATE,
	register_date	    	 DATE,
	delete_date	        	 DATE
)
/  
----------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_measure_t
(   odi_session_id               NUMBER NOT NULL ENABLE,
       item_no                      VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type                    VARCHAR2(3 CHAR) NOT NULL ENABLE,
       seq_no                       NUMBER,
	   itm_msr_typ_no		      	VARCHAR2(5 CHAR),
	   itm_msr_typ_nam_en			VARCHAR2(35 CHAR),
	   itm_msr_typ_nam_sh_en		VARCHAR2(35 CHAR),
	   itm_msr_txt_met			  	VARCHAR2(100 CHAR),
	   itm_msr_txt_met_sh			VARCHAR2(100 CHAR),
	   itm_msr_txt_imp			  	VARCHAR2(100 CHAR),
	   itm_msr_txt_imp_sh			VARCHAR2(100 CHAR),
	   itm_msr_val_unit			    VARCHAR2(35 CHAR),
	   itm_msr_val			  		NUMBER,
	   itm_msr_prc_unit_yn		  	VARCHAR2(1 CHAR),
	   itm_msr_prc_tag_yn		  	VARCHAR2(1 CHAR),
	   msr_sort_no					NUMBER(5),
	   update_date		            DATE,
	   register_date	    	    DATE,
	   delete_date	        	    DATE
)
/  
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_demand_t
(   odi_session_id    NUMBER NOT NULL ENABLE,
       item_no           VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type         VARCHAR2(3 CHAR) NOT NULL ENABLE,
       seq_no            NUMBER NOT NULL ENABLE,
	   demand_no		 VARCHAR2(15 CHAR),
	   demand_name		 VARCHAR2(105 CHAR),
       update_date	     DATE, 
	   register_date     DATE,
	   delete_date		 DATE
)
/  
------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_measure_local_t
(   odi_session_id              NUMBER NOT NULL ENABLE,
       item_no                     VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type                   VARCHAR2(3 CHAR) NOT NULL ENABLE,
	   seq_no                      NUMBER,
	   country_code                VARCHAR2(3 CHAR) NOT NULL ENABLE,
       language_code                VARCHAR2(2 CHAR) NOT NULL ENABLE,
	   itm_msr_typ_no		      	VARCHAR2(5 CHAR),
	   itm_msr_typ_name			    VARCHAR2(35 CHAR),
	   itm_msr_typ_nam_sh			VARCHAR2(35 CHAR),
	   itm_msr_txt_met			  	VARCHAR2(100 CHAR),
	   itm_msr_txt_met_sh			VARCHAR2(100 CHAR),
	   itm_msr_txt_imp			  	VARCHAR2(100 CHAR),
	   itm_msr_txt_imp_sh			VARCHAR2(100 CHAR),
	   itm_msr_val_unit			    VARCHAR2(35 CHAR),
	   itm_msr_val			  		NUMBER,
	   itm_msr_prc_unit_yn		  	VARCHAR2(1 CHAR),
	   itm_msr_prc_tag_yn		  	VARCHAR2(1 CHAR),
	   msr_sort_no					NUMBER(5),
	   update_date		            DATE,
	   register_date	    	    DATE,
	   delete_date	        	    DATE
)
/  
-------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_designer_t
(   odi_session_id    NUMBER NOT NULL ENABLE,
       item_no           VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type         VARCHAR2(3 CHAR) NOT NULL ENABLE,
       seq_no            NUMBER NOT NULL ENABLE, 
	   designer_no	     VARCHAR2(15 CHAR),
       designer_name     VARCHAR2(150 CHAR),
       valid_from		 DATE,
       valid_to		     DATE,
       register_date     DATE,
       update_date	     DATE,
       delete_date		 DATE   
)
/  
----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_technical_info_t
(
	odi_session_id    					NUMBER NOT NULL ENABLE,
    item_no           					VARCHAR2(15 CHAR) NOT NULL ENABLE,
	item_type        				 	VARCHAR2(3 CHAR) NOT NULL ENABLE,
	seq_no            					NUMBER NOT NULL ENABLE,
	technical_info_no				    VARCHAR2(15 CHAR),
    technical_info_text_en		        VARCHAR2(500 CHAR),
	technical_info_seq_no			    NUMBER(2),
	range_no						    VARCHAR2(15 CHAR),
    range_text				            VARCHAR2(150 CHAR),
	heading_no							VARCHAR2(15 CHAR),
	heading_text_en						VARCHAR2(150 CHAR),
	technical_info_legal				VARCHAR2(1 CHAR),
	technical_info_exp_text_en			VARCHAR2(2000 CHAR),
	technical_info_value_met_en			VARCHAR2(150 CHAR),
	technical_info_value_imp_en			VARCHAR2(150 CHAR),
	technical_info_unit_met_en			VARCHAR2(150 CHAR),
	technical_info_unit_imp_en			VARCHAR2(150 CHAR),
	technical_info_txt_met_en			VARCHAR2(300 CHAR),
	technical_info_txt_imp_en			VARCHAR2(300 CHAR),
	technical_info_msr_no				VARCHAR2(300 CHAR),
	technical_info_internal				VARCHAR2(300 CHAR),
    register_date						DATE,
	update_date						    DATE,
    delete_date				            DATE
)
/
---------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_technical_info_local_t
(
	odi_session_id           			NUMBER NOT NULL ENABLE,
    item_no                  			VARCHAR2(15 CHAR) NOT NULL ENABLE,
    item_type                			VARCHAR2(3 CHAR) NOT NULL ENABLE,
	country_code             			VARCHAR2(3 CHAR) NOT NULL ENABLE,
    language_code            			VARCHAR2(2 CHAR) NOT NULL ENABLE,
	seq_no            					NUMBER NOT NULL ENABLE,
	technical_info_no				    VARCHAR2(15 CHAR),
    technical_info_text		            VARCHAR2(500 CHAR),
	technical_info_seq_no			    NUMBER(2),
	range_no						    VARCHAR2(15 CHAR),
    range_text				            VARCHAR2(150 CHAR),
	heading_no							VARCHAR2(15 CHAR),
	heading_text						VARCHAR2(150 CHAR),
	technical_info_legal				VARCHAR2(1 CHAR),
	technical_info_exp_text				VARCHAR2(2000 CHAR),
	technical_info_value_met			VARCHAR2(150 CHAR),
	technical_info_value_imp			VARCHAR2(150 CHAR),
	technical_info_unit_met				VARCHAR2(150 CHAR),
	technical_info_unit_imp				VARCHAR2(150 CHAR),
	technical_info_txt_met				VARCHAR2(300 CHAR),
	technical_info_txt_imp				VARCHAR2(300 CHAR),
	technical_info_msr_no				VARCHAR2(300 CHAR),
	technical_info_internal				VARCHAR2(300 CHAR),
    register_date						DATE,
	update_date						    DATE,
    delete_date				            DATE
)
/
-----------------------------------------Addition of Retail Domain entities----------------------------------------------------
CREATE TABLE iip_retail_fee_t
(   
	   odi_session_id    		   NUMBER NOT NULL ENABLE,
       item_no           		   VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type        		   VARCHAR2(3 CHAR) NOT NULL ENABLE,
	   country_code                VARCHAR2(3 CHAR) NOT NULL ENABLE,
	   class_type				   VARCHAR2(8 CHAR),
	   class_unit_type		       VARCHAR2(3 CHAR),
	   class_unit_code			   VARCHAR2(5 CHAR),
	   fee_type				   	   VARCHAR2(50 CHAR),
	   fee_group_id			   	   VARCHAR2(50 CHAR),		   
	   currency_code			   VARCHAR2(3 CHAR),
	   fee_amount				   NUMBER(15,5),			   
	   valid_from				   DATE,
	   valid_to				   	   DATE,
       update_date				   DATE,
       register_date			   DATE,
       delete_date				   DATE   
)
/
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE iip_retail_sales_steer_ind_t
(   
	   odi_session_id    		   NUMBER NOT NULL ENABLE,
       item_no           		   VARCHAR2(15 CHAR) NOT NULL ENABLE,
	   item_type        		   VARCHAR2(3 CHAR) NOT NULL ENABLE,
	   country_code                VARCHAR2(3 CHAR) NOT NULL ENABLE,
	   class_type		   		   VARCHAR2(8 CHAR),
	   class_unit_type		       VARCHAR2(3 CHAR),
	   class_unit_code			   VARCHAR2(5 CHAR),
	   indicator_type			   VARCHAR2(50 CHAR),
	   indicator_value			   VARCHAR2(50 CHAR),		   
	   valid_from		   		   DATE,
	   valid_to			       	   DATE,			   
       update_date				   DATE,
       register_date			   DATE,
       delete_date				   DATE   
)
/
-----------------------------------------------------------------------------------------------------------------------------------------
