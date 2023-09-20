@AbapCatalog.sqlViewName: 'ZCLAPKPIS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for KPIs Reporting'
@Analytics.dataCategory: #CUBE
define view ZDD_CLAP_REPORTING

    with parameters  
    
    from_Date : abap.dats,
    to_date : abap.dats
as select from ztab_clap1 {  

// data Extract Clap 
key zcustomer_num as ZcustomerNum
//key zrequest_no as ZrequestNo,
//key zbusiness_unit_name as ZbusinessUnitName,
//key ztype_of_customer as ZtypeOfCustomer,
//key zvertical as Zvertical,
//key ztype_of_entity as ZtypeOfEntity,
//key zline_business_type as ZlineBusinessType,
//key zcustomer_legal_name as ZcustomerLegalName,
//$parameters.from_Date as FromDate,
//$parameters.to_date as Todate,
//zcustomer_group as ZcustomerGroup,
//zadd_sites as ZaddSites,
//zyear_of_establishment as ZyearOfEstablishment,
//zcustomer_internal_rating as ZcustomerInternalRating,
//zcustomer_type as ZcustomerType,
//zclass as Zclass,
//zchannel_group as ZchannelGroup,
//zchannel as Zchannel,
//zsub_channel as ZsubChannel,
//zcountry as Zcountry,
//zaddress_line_1 as ZaddressLine1,
//zaddress_line_2 as ZaddressLine2,
//zalternate_address as ZalternateAddress,
//zcity as Zcity,
//zstate as Zstate,
//zpo_box_no_pin_code as ZpoBoxNoPinCode,
//zprovins as Zprovins,
//zfirst_name as ZfirstName,
//zlast_name as ZlastName,
//zdesignation as Zdesignation,
//zemail_id as ZemailId,
//zoffice_phone_number as ZofficePhoneNumber,
//zmobile_number as ZmobileNumber,
//zvat_gst_number as ZvatGstNumber,
//zattachment as Zattachment,
//zlicense_type as ZlicenseType,
//zvalid_from as ZvalidFrom,
//zvalid_to as ZvalidTo,
//zimport_license_number as ZimportLicenseNumber,
//zsource_of_inquiry as ZsourceOfInquiry,
//zcompany_identity_by_pass as ZcompanyIdentityByPass,
//zcertifications_of_incorporati as ZcertificationsOfIncorporati,
//zmemorandum_articles_of_associ as ZmemorandumArticlesOfAssoci,
//zsponsors_passport as ZsponsorsPassport,
//zcommercial_license as ZcommercialLicense,
//zattachments_with_signature as ZattachmentsWithSignature,
//zroute_audit_is_performed as ZrouteAuditIsPerformed,
//zroute_code as ZrouteCode,
//zgeo_code as ZgeoCode,
//zlatitude as Zlatitude,
//zlongitude as Zlongitude,
//zcredit_limit_currency as ZcreditLimitCurrency,
//zbackgrond_of_customer as ZbackgrondOfCustomer,
//zrationable_for_trading as ZrationableForTrading,
//zmonthly_physical_buy_volume as ZmonthlyPhysicalBuyVolume,
//zmonthly_physical_sell_volume as ZmonthlyPhysicalSellVolume,
//zmonthly_paper_volume as ZmonthlyPaperVolume,
//zstoploss_mt_if_any as ZstoplossMtIfAny,
//zgross_average_gc_or_av_gc_mt as ZgrossAverageGcOrAvGcMt,
//zavg_gc_mt_or_gc as ZavgGcMtOrGc,
//zinco_term as ZincoTerm,
//zcredit_limit_type as ZcreditLimitType,
//zcredit_limit_type_currency as ZcreditLimitTypeCurrency,
//zopen_clean_credit_amount as ZopenCleanCreditAmount,
//zcad_amount as ZcadAmount,
//zpoc_in_hand_amount as ZpocInHandAmount,
//zundated_or_security_deposit_c as ZundatedOrSecurityDepositC,
//zcri as Zcri,
//zcri_amount as ZcriAmount,
//zcri_insurer_amount as ZcriInsurerAmount,
//zuncfrmd_lc_nonapvd_bnkname as ZuncfrmdLcNonapvdBnkname,
//zuncfrmd_lc_nonapvd_bnkamt as ZuncfrmdLcNonapvdBnkamt,
//ztotal_secured_limit as ZtotalSecuredLimit,
//ztotal_unsecured_limit as ZtotalUnsecuredLimit,
//ztotal_credit_amount as ZtotalCreditAmount,
//zin_functional_currency as ZinFunctionalCurrency,
//zdate as Zdate,
//zmaximum_credit_days as ZmaximumCreditDays,
//zcash_collection as ZcashCollection,
//ztransit_time as ZtransitTime,
//ztotal_credit_days as ZtotalCreditDays,
//zproxima as Zproxima,
//zpayment_terms as ZpaymentTerms,
//zbu_name as ZbuName,
//zbu_code as ZbuCode,
//zsite_name as ZsiteName,
//zprty_site_no as ZprtySiteNo,
//zcredit_limit as ZcreditLimit,
//zbalance_amt as ZbalanceAmt,
//ztot_site_lvl_cl as ZtotSiteLvlCl,
//ztot_credit_limit as ZtotCreditLimit,
//zfinancial_statement as ZfinancialStatement,
//zd_and_b_report as ZdAndBReport,
//zbank_statement_references as ZbankStatementReferences,
//zlast_12_stmnt_accts as Zlast12StmntAccts,
//zyear_of_financial as ZyearOfFinancial,
//zrevenue_net_profit_crncy as ZrevenueNetProfitCrncy,
//zrevenue_turnover as ZrevenueTurnover,
//znetprofit as Znetprofit,
//zcountry2 as Zcountry2,
//zcountry_rating as ZcountryRating,
//zd_and_b_rating as ZdAndBRating,
//ztrail_date as ZtrailDate,
//ztrail_user as ZtrailUser,
//ztrail_role as ZtrailRole,
//ztrail_status as ZtrailStatus,
//ztrail_tot_cl_approved as ZtrailTotClApproved,
//ztrailmax_credit_days as ZtrailmaxCreditDays,
//ztrail_version as ZtrailVersion,
//ztrail_remarks as ZtrailRemarks,
//zchangerequestid as Zchangerequestid,
////zdescription as Zdescription,
//zpriority as Zpriority,
//zduedate as Zduedate,
////zreason as Zreason,
//zstatus as Zstatus,
//zcurrentworkitem as Zcurrentworkitem,
//zchangedby as Zchangedby,
//zchangedon as Zchangedon,
//zfinalizedon as Zfinalizedon,
//zfinalizedby as Zfinalizedby,
////znote as Znote,
////zfile_link as ZfileLink,
//zbusiness_partner_id_grouping as ZbusinessPartnerIdGrouping,
//zsalutation as Zsalutation,
//zsearch_term1 as ZsearchTerm1,
//zpostal_code_city as ZpostalCodeCity,
//zlanguage as Zlanguage,
//ztransportation_zone as ZtransportationZone,
//zpo_box_without_number as ZpoBoxWithoutNumber,
//zcompany_postal_code as ZcompanyPostalCode,
//zlegalform as Zlegalform,
//zdate_founded as ZdateFounded,
//zliquidationdate as Zliquidationdate,
//ztelephone_country_number_exte as ZtelephoneCountryNumberExte,
//zmobile_country_number as ZmobileCountryNumber,
//zfax_country_number_extension as ZfaxCountryNumberExtension,
////zwebsite as Zwebsite,
//zbprole_flcu00 as ZbproleFlcu00,
//zbprole_ukm000 as ZbproleUkm000,
//zbp_role_flcu01 as ZbpRoleFlcu01,
//zaddress_version as ZaddressVersion,
////ztitle as Ztitle,
//zsearch_term as ZsearchTerm,
//zstreet_house_number as ZstreetHouseNumber,
//zaddress_type as ZaddressType,
//zstandard_usage as ZstandardUsage,
//zidentification_type as ZidentificationType,
//zidentification_number as ZidentificationNumber,
//zresonsible_institute as ZresonsibleInstitute,
//zentry_date as ZentryDate,
//ztax_number_category as ZtaxNumberCategory,
////ztax_description as ZtaxDescription,
//ztax_number as ZtaxNumber,
//zindustry as Zindustry,
////zindustry_description as ZindustryDescription,
//zstandard_industry as ZstandardIndustry,
//zcompany_code as ZcompanyCode,
//zreconciliation_account as ZreconciliationAccount,
//zhead_office as ZheadOffice,
//zauthorization_group as ZauthorizationGroup,
//zvalue_adjustment as ZvalueAdjustment,
//zsort_key as ZsortKey,
//zplanning_group as ZplanningGroup,
//zrelease_group as ZreleaseGroup,
//zinterest_indicator as ZinterestIndicator,
//zinterest_calculation_frequenc as ZinterestCalculationFrequenc,
//zlast_key_date as ZlastKeyDate,
//zlast_interestringn as ZlastInterestringn,
//zprevious_account_number as ZpreviousAccountNumber,
//zbuying_group as ZbuyingGroup,
//zpersonnel_number as ZpersonnelNumber,
//zterms_of_payment as ZtermsOfPayment,
//zcredi_memo_payment_terms as ZcrediMemoPaymentTerms,
//zbe_charges_payment_term as ZbeChargesPaymentTerm,
//zcheck_cashing_time as ZcheckCashingTime,
//ztolerance_group as ZtoleranceGroup,
//zknown_egotiated_leave as ZknownEgotiatedLeave,
//zar_pledging_indicator as ZarPledgingIndicator,
//zpayment_history_record as ZpaymentHistoryRecord,
//zpayment_method as ZpaymentMethod,
//zalternative_payer as ZalternativePayer,
//zbill_of_exchangelimit as ZbillOfExchangelimit,
//zpayment_method_supplement as ZpaymentMethodSupplement,
//znext_payee as ZnextPayee,
//zlockbox as Zlockbox,
//zpayment_block as ZpaymentBlock,
//zhouse_bank as ZhouseBank,
//zindividual_payment as ZindividualPayment,
//zpayment_advice_by_edi as ZpaymentAdviceByEdi,
//zreason_code_conversion as ZreasonCodeConversion,
//zselection_rule as ZselectionRule,
//zpolicy_number as ZpolicyNumber,
//zamount_insured as ZamountInsured,
//zlead_months as ZleadMonths,
//zinstitute_number as ZinstituteNumber,
//zdeductible as Zdeductible,
//zaccounting_clerk as ZaccountingClerk,
//zaccount_with_number as ZaccountWithNumber,
//zaccount_memo as ZaccountMemo,
//zclerk_at_customer as ZclerkAtCustomer,
//zclerks_telephone_number as ZclerksTelephoneNumber,
//zaccount_statement as ZaccountStatement,
//zcollective_invoice_variant as ZcollectiveInvoiceVariant,
//zlocal_processing as ZlocalProcessing,
//zclerks_internet_address as ZclerksInternetAddress,
//zclerks_fax_number as ZclerksFaxNumber,
//zgrouping_key as ZgroupingKey,
//zdunning_area as ZdunningArea,
////zdunning_area_description as ZdunningAreaDescription,
//zwith_holding_tax_type as ZwithHoldingTaxType,
////zwith_holding_tax_type_descrip as ZwithHoldingTaxTypeDescrip,
//zcustomer_with_ci as ZcustomerWithCi,
//zsales as Zsales,
//zlegal_deparment as ZlegalDeparment,
//zcustomer_w_o_ci as ZcustomerWOCi,
//zaccounting as Zaccounting,
////zsales_organization as ZsalesOrganization,
//zdivision as Zdivision,
//zsales_district as ZsalesDistrict,
//zsales_office as ZsalesOffice,
//zsales_group as ZsalesGroup,
//zabc_class as ZabcClass,
//zaccount_at_customer as ZaccountAtCustomer,
//zswitch_off_rounding as ZswitchOffRounding,
//zorderprobability as Zorderprobability,
//zitemproposal as Zitemproposal,
//zunit_of_measure_group as ZunitOfMeasureGroup,
//zexchange_rate_type as ZexchangeRateType,
//zpp_customer_procedure as ZppCustomerProcedure,
//zprice_group as ZpriceGroup,
//zpricelist as Zpricelist,
//zcustomer_statistics_group as ZcustomerStatisticsGroup,
//zagency_business as ZagencyBusiness,
//zdocument_index_active as ZdocumentIndexActive,
//zdelivery_priority as ZdeliveryPriority,
//zshipping_conditions as ZshippingConditions,
//zdelivery_plant as ZdeliveryPlant,
//zorder_combination as ZorderCombination,
//zrelevant_pod as ZrelevantPod,
//zpod_timeframe as ZpodTimeframe,
//zcomplete_delivery as ZcompleteDelivery,
//zmaximum_number_of_part_delive as ZmaximumNumberOfPartDelive,
//zpartial_delivery_per_item as ZpartialDeliveryPerItem,
//zunlimited_tolerance as ZunlimitedTolerance,
//zunder_delivery_tolerance as ZunderDeliveryTolerance,
//zover_delivery_tolerance as ZoverDeliveryTolerance,
//zmanual_invoice_maintenance as ZmanualInvoiceMaintenance,
//zpricing as Zpricing,
//zinvoicing_dates as ZinvoicingDates,
//zpayment_gurantee_procedure as ZpaymentGuranteeProcedure,
//zsettlement_group as ZsettlementGroup,
//zaccount_assignment_group as ZaccountAssignmentGroup,
//zcustomer_group1 as ZcustomerGroup1,
//zcustomer_group2 as ZcustomerGroup2,
//zcustomer_group3 as ZcustomerGroup3,
//zcustomer_group4 as ZcustomerGroup4,
//zcustomer_group5 as ZcustomerGroup5,
//zship_to_buyer as ZshipToBuyer,
//zship_to_payer as ZshipToPayer,
//zbill_to_buyer as ZbillToBuyer,
//zbill_to_payer as ZbillToPayer,
//zonly_ship_to as ZonlyShipTo,
//zagent as Zagent,
////ztaxcategory as Ztaxcategory,
//ztax_classification as ZtaxClassification,
////ztax_category2 as ZtaxCategory2,
//ztax_classification2 as ZtaxClassification2,
//ztrading_partner as ZtradingPartner,
//zrisk_class as ZriskClass,
//zcheck_rule as ZcheckRule,
//zlimit_define as ZlimitDefine,
//zlimit as Zlimit,
//zvalidity_to as ZvalidityTo,
//zcredit_segment as ZcreditSegment,
//zcreated_by as ZcreatedBy,
//zcreated_date as ZcreatedDate,
//zupdated_by as ZupdatedBy,
//zupdated_date as ZupdatedDate,
//zrequest_type as ZrequestType,
//zassigned_to as ZassignedTo,
//zrequest_status as ZrequestStatus,
//zmdg_status as ZmdgStatus,
//zinitiator_name as ZinitiatorName,
//
//
//@EndUserText.label: 'Total No. Requests'
//@DefaultAggregation: #SUM
//1 as count_Request,
//
//@EndUserText.label: 'Total Request Received'
//@DefaultAggregation: #SUM
//case when zdate = $session.system_date and zstatus  = 'Received' then 1
//else 0 end as Daily_Inflow_Received,
//
//@EndUserText.label: 'Total Request Actioned'
//@DefaultAggregation: #SUM
//case when zdate = $session.system_date and zstatus  = 'Actioned' then 1
//else 0 end as Daily_Inflow_Actioned,
//
//@EndUserText.label: 'Request Extract'
//@DefaultAggregation: #SUM
//case when zdate >= $parameters.from_Date and zdate <= $parameters.to_date then 1 else 0
//end as Requests_Extract
//







}


//where  zdate <= $parameters.from_Date


