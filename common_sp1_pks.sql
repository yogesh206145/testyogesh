CREATE OR REPLACE PACKAGE icp_prd_gpr_common_sp1 AS
/********************************************************************************************************
    Created By:     IBM
    Creation Date:  02/05/2016
    File Name:      icp_prd_gpr_common_sp1_pks.sql
    Description:    Package Specification for Common GPR package.
    ---
    Change History:
    Date            Version#        Remarks
    ============    =========       =======================================
    02/05/2016      0.1             Initial release.
	16/06/2016      0.2             Renamed from icp_gpr_common_sp1 and
	                                added transform_gpr_p1.
    28/07/2016      0.3             Added p_ru_lang_code to pass primary lang_code for RU.
*********************************************************************************************************/
PROCEDURE segregate_gpr_ms_fn1(p_gpr_list        IN         gpr_tt1,
                               p_delta_date      IN         DATE,
							   p_start_time      IN         DATE,
							   x_add_gpr_list    OUT NOCOPY gpr_tt1,
							   x_delete_gpr_list OUT NOCOPY gpr_tt1,
							   x_ret_code        OUT        VARCHAR2,
							   x_ret_msg         OUT        VARCHAR2);
PROCEDURE segregate_gpr_local_fn1(p_gpr_list        IN         gpr_local_tt1,
                                  p_delta_date      IN         DATE,
							      p_start_time      IN         DATE,
							      x_add_gpr_list    OUT NOCOPY gpr_local_tt1,
							      x_delete_gpr_list OUT NOCOPY gpr_local_tt1,
							      x_ret_code        OUT        VARCHAR2,
							      x_ret_msg         OUT        VARCHAR2);
PROCEDURE transform_gpr_p1(p_get_gpr_resp   IN         get_gpr_response_ot1,
                           p_delta_date     IN         DATE,
						   p_ru_lang_code   IN         VARCHAR2,
                           x_import_xml     OUT NOCOPY CLOB,
                           x_remove_xml     OUT NOCOPY CLOB,
                           x_ret_code       OUT        VARCHAR2,
                           x_ret_msg        OUT        VARCHAR2);
END icp_prd_gpr_common_sp1;
/
show errors
