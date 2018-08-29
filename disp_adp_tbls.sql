/********************************************************************************************************
Created By:     IBM
Creation Date:  05/02/2016
File Name:      icp_prd_get_gpr_display_tables.sql
Description:    Script for creating Get GPR Display tables.
---
Change History:
Date            Version#    Remarks
============    =========    =======================================
 05/02/2016      0.1         Initial release for Block3.
 29/07/2016      0.2         Refactored for new selection criteria model.
 19/08/2016      0.3         Included iip_ikea_gpr_del_l_t.
*********************************************************************************************************/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_sku_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_sku_l_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_val_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_val_l_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_l_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_gpr_del_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_gpr_del_l_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_sku_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_sku_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_val_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_val_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Dropping Table iip_ikea_sel_cri_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
DROP TABLE iip_ikea_sel_cri_t CASCADE CONSTRAINTS
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_gpr_del_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_gpr_del_t
  (
    odi_session_id           NUMBER(20),
    gpr_no					 VARCHAR2(15 CHAR) NOT NULL ENABLE
  ) 
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_t
  (
    odi_session_id           NUMBER(20),
    gpr_no					 VARCHAR2(15 CHAR) NOT NULL ENABLE,
	gpr_sel_cri_no			 VARCHAR2(10 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_name_en		 VARCHAR2(150 CHAR),
	seq_no					 NUMBER NOT NULL ENABLE,
	delete_date				 DATE
  )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_val_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_val_t
  (
    odi_session_id            NUMBER(20),
    gpr_no					  VARCHAR2(15 CHAR) NOT NULL ENABLE,
	gpr_sel_cri_no			  VARCHAR2(10 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_value_en	  VARCHAR2(1000 CHAR),
	seq_no					  NUMBER NOT NULL ENABLE,
    delete_date				  DATE
   )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_sku_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_sku_t 
  (
    odi_session_id              NUMBER(20),
	gpr_no					    VARCHAR2(15 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_no				VARCHAR2(10 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_value_en		VARCHAR2(1000 CHAR),
	val_seq_no					NUMBER NOT NULL ENABLE,
    item_no						VARCHAR2(15 CHAR),
    item_type					VARCHAR2(3 CHAR),
    delete_date					DATE
   )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_gpr_del_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_gpr_del_l_t
  (
    odi_session_id           NUMBER(20),
	gpr_no					 VARCHAR2(15 CHAR) NOT NULL ENABLE,
    cty_code_iso			 VARCHAR2(3 CHAR),
	lang_code_iso			 VARCHAR2(2 CHAR)
  )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_l_t
  (
    odi_session_id           NUMBER(20),
	gpr_no					 VARCHAR2(15 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_no			 VARCHAR2(10 CHAR) NOT NULL ENABLE,
	gpr_sel_cri_name		 VARCHAR2(150 CHAR),
	seq_no                   NUMBER NOT NULL ENABLE,
	cty_code_iso			 VARCHAR2(3 CHAR),
	lang_code_iso			 VARCHAR2(2 CHAR),
	delete_date			     DATE
  )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_val_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_val_l_t
  (
    odi_session_id           NUMBER(20),
	gpr_no					 VARCHAR2(15 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_no			 VARCHAR2(10 CHAR) NOT NULL ENABLE,
	gpr_sel_cri_value	     VARCHAR2(1000 CHAR),
	seq_no                   NUMBER NOT NULL ENABLE,
	cty_code_iso			 VARCHAR2(3 CHAR),
	lang_code_iso			 VARCHAR2(2 CHAR),
	delete_date			     DATE
  )
/
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROMPT  "Creating Table iip_ikea_sel_cri_sku_l_t"
PROMPT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
CREATE TABLE iip_ikea_sel_cri_sku_l_t 
  (
    odi_session_id              NUMBER(20),
	gpr_no					    VARCHAR2(15 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_no				VARCHAR2(10 CHAR) NOT NULL ENABLE,
    gpr_sel_cri_value   		VARCHAR2(1000 CHAR),
	val_seq_no					NUMBER NOT NULL ENABLE,
	cty_code_iso			    VARCHAR2(3 CHAR),
	lang_code_iso			    VARCHAR2(2 CHAR),
    item_no						VARCHAR2(15 CHAR),
    item_type					VARCHAR2(3 CHAR),
    delete_date					DATE
   )
/
