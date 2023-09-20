@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Defnition for Customer data'

define root view entity ZDD_CUSTOMER
  as select from ztab_customers


------------this approach is not Using----------------------------


--composition [0..*] of ZDD_CUST_SALESAREA  as _zdd_sale
--composition [0..*] of ZDD_CUST_COMMENT    as _zdd_comments

    -- association [1..*] to ZDD_CUST_SALESAREA as _sale_area on $projection.zcustomer_num = _sale_area.zcustomer_num
    --  association [1..*] to ZDD_CUST_COMMENT as _comments on $projection.zcustomer_num = _comments.zcustomer_num
   -- composition [1..1] of ZDD_CUST_SALESAREA as _zdd_sale
  -- composition [1..1] of ZDD_CUST_COMMENT   as _zdd_comments
  -- association [1..*] to ZDD_CUST_SALESAREA as _sale_area on $projection.zcustomer_num = _sale_area.zcustomer_num
  
  
  association [1..*] to ZDD_CUST_COMMENTS   as _comments  on $projection.zcustomer_num = _comments.zcustomer_num
  association [1..*] to ZDD_CUST_SALESAREAS as _salesarea on $projection.zcustomer_num = _salesarea.zcustomer_num

  association [1..*] to ZCDS_CREDIT_MGT     as _credit    on $projection.zcustomer_num = _credit.zcustomer_num
{
  key  zcustomer_num,
  --key  zsales_orgnization,
       zbusiness_unit_name,
       ztype_of_customer,
       zvertical,
       ztype_of_entity,
       zline_business_type,
       zcustomer_legal_name,
       zrequest_no,
       zcustomer_group,
       zadd_sites,
       zyear_of_establishment,
       zcustomer_internal_rating,
       zcustomer_type,
       zclass,
       zchannel_group,
       zchannel,
       zsub_channel,
       zcountry,
       zaddress_line_1,
       zaddress_line_2,
       zalternate_address,
       zcity,
       zstate,
       zpo_box_no_pin_code,
       zprovins,
       zfirst_name,
       zlast_name,
       zdesignation,
       zemail_id,
       zoffice_phone_number,
       zmobile_number,
       zvat_gst_number,
       zattachment,
       zlicense_type,
       zvalid_from,
       zvalid_to,
       zimport_license_number,
       zsource_of_inquiry,
       zcompany_identity_by_pass,
       zcertifications_of_incorporati,
       zmemorandum_articles_of_associ,
       zsponsors_passport,
       zcommercial_license,
       zattachments_with_signature,
       zroute_audit_is_performed,
       zroute_code,
       zgeo_code,
       zlatitude,
       zlongitude,
       zcredit_limit_currency,
       zbackgrond_of_customer,
       zrationable_for_trading,
       zmonthly_physical_buy_volume,
       zmonthly_physical_sell_volume,
       zmonthly_paper_volume,
       zstoploss_mt_if_any,
       zgross_average_gc_or_av_gc_mt,
       zavg_gc_mt_or_gc,
       zinco_term,
       zcredit_limit_type,
       zcredit_limit_type_currency,
       zopen_clean_credit_amount,
       zcad_amount,
       zpoc_in_hand_amount,
       zundated_or_security_deposit_c,
       zcri,
       zcri_amount,
       zcri_insurer_amount,
       zuncfrmd_lc_nonapvd_bnkname,
       zuncfrmd_lc_nonapvd_bnkamt,
       ztotal_secured_limit,
       ztotal_unsecured_limit,
       ztotal_credit_amount,
       zin_functional_currency,
       zdate,
       zmaximum_credit_days,
       zcash_collection,
       ztransit_time,
       ztotal_credit_days,
       zproxima,
       zpayment_terms,
       zbu_name,
       zbu_code,
       zsite_name,
       zprty_site_no,
       zcredit_limit,
       zbalance_amt,
       ztot_site_lvl_cl,
       ztot_credit_limit,
       zfinancial_statement,
       zd_and_b_report,
       zbank_statement_references,
       zlast_12_stmnt_accts,
       zyear_of_financial,
       zrevenue_net_profit_crncy,
       zrevenue_turnover,
       znetprofit,
       zcountry2,
       zcountry_rating,
       zd_and_b_rating,
       ztrail_date,
       ztrail_user,
       ztrail_role,
       ztrail_status,
       ztrail_tot_cl_approved,
       ztrailmax_credit_days,
       ztrail_version,
       ztrail_remarks,
       zchangerequestid,
       zdescription,
       zpriority,
       zduedate,
       zreason,
       zstatus,
       zcurrentworkitem,
       zchangedby,
       zchangedon,
       zfinalizedon,
       zfinalizedby,
       znote,
       zfile_link,
       zbusiness_partner_id_grouping,
       zbusiness_partner_id,
       // zbusiness_grouping,
       zsalutation,
       zsearch_term1,
       zpostal_code_city,
       zpostal_code,
       zlanguage,
       ztransportation_zone,
       zpo_box_without_number,
       zcompany_postal_code,
       zlegalform,
       zdate_founded,
       zliquidationdate,
       // ztelephone_country_number_exte,
       ztele_number,
       ztele_country,
       ztele_extension,
       // zmobile_country_number,
       zmobile_country,
       //zfax_country_number_extension,
       zfax_country,
       zfax_number,
       zfax_extension,
       zwebsite,
       zbprole_flcu00,
       zbprole_ukm000,
       zbp_role_flcu01,
       zaddress_version,
       ztitle,
       zsearch_term,
       // zstreet_house_number,
       zstreet,
       zhouse_number,
       zaddress_type,

       zstandard_usage,
       zidentification_type,
       zidentification_number,
       zresonsible_institute,
       zentry_date,
       ztax_number_category,
       ztax_description,
       ztax_number,
       zindustry,
       zindustry_description,
       zstandard_industry,
       zcompany_code,
       zreconciliation_account,
       zhead_office,
       zauthorization_group,
       zvalue_adjustment,
       zsort_key,
       zplanning_group,
       zrelease_group,
       zinterest_indicator,
       zinterest_calculation_frequenc,
       zlast_key_date,
       zlast_interestringn,
       zprevious_account_number,
       zbuying_group,
       zpersonnel_number,
       zterms_of_payment,
       zcredi_memo_payment_terms,
       zb_charges_payment_term,
       --ze_charges_payment_term,
       zcheck_cashing_time,
       ztolerance_group,
       zknow_leave,
       znegotiated_leave,
       zar_pledging_indicator,
       zpayment_history_record,
       zpayment_method,
       zalternative_payer,
       @Semantics.amount.currencyCode:'zcurrency'
       zbill_of_exchangelimit,
       zpayment_method_supplement,
       znext_payee,
       zlockbox,
       zpayment_block,
       zhouse_bank,
       zindividual_payment,
       zpayment_advice_by_edi,
       zreason_code_conversion,
       zselection_rule,
       zpolicy_number,
       @Semantics.amount.currencyCode:'zcurrency'
       zamount_insured,
       zlead_months,
       zinstitute_number,
       zdeductible,
       zaccounting_clerk,
       zaccount_with_number,
       zaccount_memo,
       zclerk_at_customer,
       zclerks_telephone_number,
       zaccount_statement,
       zcollective_invoice_variant,
       zlocal_processing,
       zclerks_internet_address,
       zclerks_fax_number,
       zgrouping_key,
       zdunning_area,
       zdunning_area_description,
       zwith_holding_tax_type,
       zwith_holding_tax_type_descrip,
       zcustomer_with_ci,
       zsales,
       zlegal_deparment,
       zcustomer_w_o_ci,
       zaccounting,

//       zdistribution_channel,
//       zdivision,
//       zsales_district,
//       zsales_office,
//       zsales_group,
//       zabc_class,
//       zaccount_at_customer,
//       zswitch_off_rounding,
//       zorderprobability,
//       zitemproposal,
//       zunit_of_measure_group,
//       zexchange_rate_type,
//       zpp_customer_procedure,
//       zprice_group,
//       zpricelist,
//       zprice_procedured_term,
//       zcustomer_statistics_group,
//       zagency_business,
//       zdocument_index_active,
//       zdelivery_priority,
//       zshipping_conditions,
//       zdelivery_plant,
//       zorder_combination,
//       zrelevant_pod,
//       zpod_timeframe,
//       zcomplete_delivery,
//       zmaximum_number_of_part_delive,
//       zpartial_delivery_per_item,
//       zunlimited_tolerance,
//       zunder_delivery_tolerance,
//       zover_delivery_tolerance,
//       zmanual_invoice_maintenance,
//       zrebate,
//       zpricing,
//       zinvoicing_dates,
//       zinvoicing_list_dates,
//       zinco_location1,
//       zcredit_control_area,
//       zpayment_gurantee_procedure,
//       zsettlement_group,
//       zaccount_assignment_group,
//       zcustomer_group1,
//       zcustomer_group2,
//       zcustomer_group3,
//       zcustomer_group4,
//       zcustomer_group5,
//       zship_to_buyer,
//       zship_to_payer,
//       zbill_to_buyer,
//       zbill_to_payer,
//       zonly_ship_to,
//       zsales_person,
//       zagent,
//       ztaxcategory,
//       ztax_classification,
//       ztax_category2,
//       ztax_classification2,
       ztrading_partner,
       
-----Removed Credit Fields From ZTAB_CUSTOMER Table---------
//       zrule,
//       zrisk_class,
//       zcheck_rule,
//       zlimit_define,
//       @Semantics.amount.currencyCode:'zcurrency'
//       zlimit,
//       zvalidity_to,
//       zcredit_segment,
//       zrelationship_to_bp,
       @Semantics.user.createdBy: true
       zcreated_by,
       @Semantics.systemDateTime.createdAt: true
       zcreated_date,
       @Semantics.user.lastChangedBy: true
       zupdated_by,
       @Semantics.systemDateTime.lastChangedAt: true
       zupdated_date,
       zrequest_type,
       zassigned_to,
       zrequest_status,
       zmdg_status,
       zinitiator_name,
       zid,
       zbankcountry,
       zbankkey,
       zbankname,
       zbankaccount,
       zaccountname,
       zcurrency,
       zregion,
       zpobox,
       zpo_box_postal_code,
       ------ Newly added CLAP 1.0 Fields---------------

       zsub_area,
       zemirate,
       zvat_gstno_attachment,
       zlicense_no,
       zlicense_attachment,
       zimport_license_no_atachmnt,
       zpartnership_identity_by_pass,
       zpartnership_deed,
       zownership_identity_by_pass,
       zpassport_copy,
       zvalid_passport_date,
       zvisa_copy,
       zvisa_valid_date,
       znational_id_card,
       zdoc_auth_by_chr_cmc,
       zkyc_atch_with_sign,
       zbusiness_propsal,
       zbusiness_propsal_attach,
       zb_d_credit_rating,
       zgenerate_sites,
       zpaste_in_all,
       zirr_bank_guarantee_name,
       zirr_bank_guarantee_amt,
       zlc_issuance_bankcountry,
       zlc_issuance_bank,
       zlc_issuance_amount,
       zproposed_bckgrnd_customer,
       zproposed_business_proposal,
       zproposed_busi_proposal_attach,
       zannual_volume,
       zannual_proposed_volume,
       zannual_variance_in_volume,
       zannual_actual_volume,
       zannual_propsed_value,
       zannual_variance_in_amount2,
       zannual_actual_turnover,
       zmonthly_actual_sales_volume,
       zmonthly_variance_in_amount1,
       zmonthly_actual_volume,
       zmonthly_actual_sales_value,
       zmonthly_variance_in_amount2,
       zmonthly_actual_turnover,
       zmonthly_sales_volume,
       zmonthly_sales_volume_unit,
       zmonthly_sales_currency,
       zmonthly_sales_value,
       zgc_proposed_avg_gc_mt_or_gc,
       zgc_variance_in_amount,
       zgc_actual_gc_earned,
       zgc_proposed_inco_term,
       zod_cust_debtors_bal_lastmonth,
       zod_overdue_if_any,
       zod_prov_for_doubtful_debt,
       zod_cheque_bounce,
       zod_cases_of_delayed_payts,
       zod_max_delay,
       zod_attach_of_statement,
       zlc_confirming_bank_country,
       zlc_confirming_bank,
       zlc_confirming_amount,
       zcri_insurer,
       zcri_buyerid,
       zcri_approval_mail_attach,
       zclassa_name_of_the_company,
       zclassa_customer_amount,
       zcash_deposit_adv_amount,
       zavalization_draft_bank_name,
       zavalization_draft_amount,
       zdebtors_bal_of_cust_last,
       zoverdue_if_any,
       zprovision_created_if_any,
       zno_of_times_cust_def_payterm,
       zif_cri_reduced_in_last_12_mnt,
       zcust_assessment_other_factors,
       zproposed_credit_limit_type,
       zibg_proposed_bank_name,
       zibg_proposed_amount,
       zibg_variance_in_amount,
       zilcab_proposed_lc_iss_bank,
       zilcab_proposed_amount,
       zilcab_variance_in_amount,
       ziclc_proposed_lc_confirm_bank,
       ziclc_proposed_amount,
       ziclc_variance_in_amount,
       zcri_proposed_insurer,
       zcri_proposed_amount,
       zcri_variance_in_amount,
       zcri_proposed_cri_buyer_id,
       zcri_proposed_appr_mail_attach,
       zcorp_classa_prop_name_of_comp,
       zcorp_classa_proposed_amount,
       zcorp_variance_in_amount,
       zcashdep_adv_proposed_amount,
       zcashdep_adv_variance_amount,
       zavalization_proposed_bankname,
       zavalization_proposed_amount,
       zavalization_var_in_amount,
       ztot_cl_proposed_tot_securedcl,
       ztot_cl_variance_in_amount,
       ztot_cl_proposed_tot_unsec_cl,
       ztot_cl_variance_in_amount2,
       ztot_cl_proposed_credit_amount,
       ztot_cl_variance_in_amount3,
       zcl_validity_proposed_date,
       zpaytterm_proposed_maxcreditdy,
       zpaytterm_proposed_paymentterm,
       zprocess,
       zannual_unit,
       zannual_value,
       zannual_currency,





       zopen_clean_credit_proamount,
       zopen_clean_credit_varamount,
       zcad_pro_amount,
       zcad_var_amount,
       zpdc_in_hand_pro_amount,
       zpdc_in_hand_amount,
       zpdc_in_hand_var_amount,
       zundated_or_secdepchck_amount,
       zundated_or_secdepchck_proamt,
       zundated_or_secdepchck_varamt,



       zuncfrmd_lc_nonapvd_pro_bank,
       zuncfrmd_lc_nonapvd_pro_amt,
       zuncfrmd_lc_nonapvd_var_amt,
       zpro_total_secured_limit,
       zvar_total_secured_limit_amt,
       zpro_total_unsecured_limit,
       zvar_total_unsecured_limit_amt,
       zpro_credit_amount,
       zvar_credit_amount,
       zproposed_date,
       zpro_payment_terms,
       zpro_max_credit_days,

       --------Calculations fields--------

       //  zlc_confirming_amount - ziclc_proposed_amount            as ziclc_variance_in_amount,

       //  zirr_bank_guarantee_amt + zlc_issuance_amount + zlc_confirming_amount + zcri_amount + zclassa_customer_amount
       //   + zcash_deposit_adv_amount + zavalization_draft_amount as ztotal_secured_limit,

       // zannual_propsed_value - zannual_actual_turnover          as zannual_variance_in_amount1,

       //zmonthly_actual_sales_volume - zmonthly_actual_turnover  as zmonthly_variance_in_amount1,

       -- zavg_gc_mt_or_gc - zgc_proposed_avg_gc_mt_or_gc as  zgc_variance_in_amount_calc,

       --zlc_confirming_amount - ziclc_proposed_amount  as ziclc_variance_in_amount_calc,



       --Credit Segment related fields

//       zcredit_control_area_desc,
       
-----Removed Credit Fields From ZTAB_CUSTOMER Table---------       
//       zcredit_segment_desc,
//       zblockedincm,
//       zspecialattention,
//       zblock_reason,
//       zcredit_exposure,
//       zutiliation_ptg,
//       zresubmission_on,
//       zinfo_category,
//       zdunning_level,
//       zdunning_amt,
//       zdunning_doc,
//       zdunning_not,
//       zdata_outdated,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zoldest_open_amount,
//       znet_due_date,
//       zdays_in_arrears,
//       zoldest_open_doc,
//       zpayment_on,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zlast_payment_amount,
//       zlast_payment_doc,
//       zdso,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zdso_amount,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zwo_cash_discount,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zwith_cash_discount,
//       @Semantics.amount.currencyCode : 'zcurrency'
//       zmax_sales,
//       zwo_cash_days_in_arrears,
//       zwith_cash_days_in_arrears,
//       sales
//       collection_amount



       --newly added fields
       zint_first_name,
       zint_last_name,
       zcust_valid_to,
       zdun_grouping_key,
       zsales_country,
       zregion2,
       zcustomer_id,
       zaddress,
       zbusiness_partner_grouping,
       zint_street,
       zint_city,
       zint_house_number,
       zpo_box,
       zlegal_entity,
       zun_cri_proposed_amount,
       zun_cri_proposed_insurer,
       zun_cri_variance_in_amount,
       zlink,
       zfile,
       zint_title,
       zmdg_request,
       zmdg_bp_id,
        zlicense_validfrom,             
  zlicense_validto,
  is_active,
cast('Akshay Pattar' as abap.char(70) ) as Initiator_name,
cast('t_apattar@Iffco.com' as abap.char(70) ) as Initiator_email,


cast('Akshay Pattar' as abap.char(70) ) as datasteward_name,
cast('t_apattar@Iffco.com' as abap.char(70) ) as datasteward_email,
zcentral_block,
zwf_instance_id,
zrequestor_role,


       //_association_name // Make association public
       
-------required if Composition approach is used -------------      
       --_zdd_sale,
       --_zdd_comments,
       //_sale_area
       //       _comments.zcomment,
       _comments,
       _salesarea,
       _credit



}
