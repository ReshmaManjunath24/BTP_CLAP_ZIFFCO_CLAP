CLASS zcl_credit_limit_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    "_Deep structure type for BP creation
    TYPES: BEGIN OF mty_s_customer_crea.
             INCLUDE TYPE zcreditmgmtbusinesspartner.
    TYPES:   _CreditMgmtAccountTP TYPE STANDARD TABLE OF zcreditmanagementaccount WITH EMPTY KEY,
           END OF mty_s_customer_crea.

    DATA ls_BP_Data TYPE ztab_customers.
    DATA lt_BP_Data TYPE TABLE OF ztab_customers.
    DATA ls_Sales_Area TYPE ztab_salesarea.
    DATA lt_Sales_Area TYPE TABLE OF ztab_salesarea.

    CONSTANTS:
      c_destination TYPE string VALUE `S4D`,
      c_entity      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CREDITMGMTBUSINESSPARTNER'.

    METHODS:
      get_proxy
        RETURNING VALUE(ro_result) TYPE REF TO /iwbep/if_cp_client_proxy,
      get_customer_crea
        RETURNING VALUE(rs_customer_crea) TYPE mty_s_customer_crea,


*    create_credit_limit
*        IMPORTING
*          io_out TYPE REF TO if_oo_adt_classrun_out
*        RAISING
*          /iwbep/cx_gateway,

      create_credit_data
        IMPORTING

          iv_customer_num TYPE zdd_customer-zmdg_bp_id
          iv_segment type ztab_salesarea-zcredit_segment
        RAISING
          /iwbep/cx_gateway.

ENDCLASS.



CLASS ZCL_CREDIT_LIMIT_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
*        create_credit_limit( out ).
*        create_credit_data( out ).
      CATCH cx_root INTO DATA(lo_error).
        out->write( lo_error->get_text( ) ).
    ENDTRY.
  ENDMETHOD.


  METHOD get_proxy.

    TRY.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
          i_name       = c_destination
          i_authn_mode = if_a4c_cp_service=>service_specific
        ).

        DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        ro_result = cl_web_odata_client_factory=>create_v2_remote_proxy(
        EXPORTING
                    iv_service_definition_name = 'ZAPI_CRDTMBUSINESSPARTNER'
            io_http_client             = lo_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_CRDTMBUSINESSPARTNER/' ).
      CATCH cx_root.

    ENDTRY.
  ENDMETHOD.


  METHOD create_Credit_data.
    DATA:
     ls_create TYPE  zcreditmgmtbusinesspartner.

    DATA(ls_bp_crea) = get_customer_crea( ).

    IF ls_bp_data-zmdg_bp_id IS  INITIAL.
      SELECT * FROM ztab_customers  WHERE zmdg_status = 'A'   ORDER BY  zcreated_date DESCENDING INTO TABLE @lt_bp_data.
      LOOP AT lt_bp_data INTO ls_bp_data.
        SELECT * FROM ztab_salesarea WHERE zcustomer_num = @ls_bp_data-zcustomer_num AND zmdg_bp_id = @ls_bp_data-zmdg_bp_id and zis_credit_created = '' INTO @ls_sales_area.
        ENDSELECT.



*    DATA(ls_business_data) = VALUE mty_s_customer_crea(
*      BusinessPartner = '0050000063'
*      CrdtMgmtBusinessPartnerGroup = '01'
*      CreditWorthinessScoreValue = '0'
**  CrdtWrthnssScoreValdtyEndDate = '/Date(1492041600000)/'
**  CrdtWorthinessScoreLastChgDate = '/Date(1492041600000)/'
*      CreditRiskClass = 'D'
*      CalculatedCreditRiskClass =  ''
**  CreditRiskClassLastChangeDate =  '/Date(1492041600000)/'
*      CreditCheckRule = ''
*      CreditScoreAndLimitCalcRule = 'STANDARD'
*
*      ).




*
    APPEND VALUE #(
        BusinessPartner = ls_sales_area-zmdg_bp_id
*          CreditSegment = ls_sales_area-zcredit_segment
           CreditSegment = 'AE01'
         CreditLimitAmount = ls_sales_area-zlimit
*         CreditLimitValidityEndDate = ls_sales_area-zvalidity_to
         CreditSegmentCurrency = ls_sales_area-zsales_currency
       ) TO ls_bp_crea-_creditmgmtaccounttp.



**for testing purpose
*    APPEND VALUE #(
*        BusinessPartner = '50000121'
*          CreditSegment = 'AE01'
*         CreditLimitAmount = '500'
*         CreditLimitValidityEndDate = '0000000000'
*         CreditSegmentCurrency = 'AED'
*       ) TO ls_bp_crea-_creditmgmtaccounttp.



*data(ls_credit_data) = VALUE ZCREDITMANAGEMENTACCOUNT(
*BusinessPartner = '162'
*  CreditSegment = 'IN07'
*CreditLimitAmount = '75'
*CreditSegmentCurrency = 'INR'




* ).
    DATA(lo_request) = get_proxy( )->create_resource_for_entity_set( 'CREDITMGMTBUSINESSPARTNER' )->create_request_for_create( ).
*    ->create_request_for_create( ).
*   lo_request->set_business_data( ls_credit_data ).
*      lo_request->set_business_data( is_business_data = ls_business_data

    DATA(lo_data_description) = lo_request->create_data_descripton_node( ).
    lo_data_description->set_properties( VALUE  #( ( |BUSINESSPARTNER| )
    ( |CRDTMGMTBUSINESSPARTNERGROUP| )
    ( |CREDITWORTHINESSSCOREVALUE| )
*                ( |CRDTWRTHNSSSCOREVALDTYENDDATE| )
*                ( |CRDTWORTHINESSSCORELASTCHGDATE| )
    ( |CREDITRISKCLASS| )
    ( |CALCULATEDCREDITRISKCLASS| )
*                ( |CREDITRISKCLASSLASTCHANGEDATE| )
    ( |CREDITCHECKRULE| )
    ( |CREDITSCOREANDLIMITCALCRULE| ) ) ).


    lo_data_description->add_child( '_CREDITMGMTACCOUNTTP' )->set_properties(
           VALUE #(
                    ( |BUSINESSPARTNER| )
                    ( |CREDITSEGMENT| )
                    ( |CREDITLIMITAMOUNT| )
*                    ( |CREDITLIMITVALIDITYENDDATE| )
                    ( |CREDITSEGMENTCURRENCY| ) ) ).
    lo_request->set_deep_business_data( io_data_description = lo_data_description
                                               is_business_data    = ls_bp_crea ).


    DATA(lo_response) = lo_request->execute( ) .
    lo_response->get_business_data( IMPORTING es_business_data = ls_bp_crea ).


*    io_out->write( `create company:` ).
*    io_out->write( ls_bp_crea ).


    UPDATE ztab_salesarea
    set zis_credit_created = 'Yes'

    where zcustomer_num = @ls_bp_data-zcustomer_num.

      ENDLOOP.

    ENDIF.


  ENDMETHOD.


  METHOD get_customer_crea.
  SELECT * FROM ztab_customers  WHERE zmdg_status = 'A'   ORDER BY  zcreated_date DESCENDING INTO TABLE @lt_bp_data.
      LOOP AT lt_bp_data INTO ls_bp_data.
        SELECT * FROM ztab_salesarea WHERE zcustomer_num = @ls_bp_data-zcustomer_num AND zmdg_bp_id = @ls_bp_data-zmdg_bp_id and zis_credit_created = '' INTO @ls_sales_area.
        ENDSELECT.
                      ENDLOOP.

    "_Returns structure for BP creation with default values
    rs_customer_crea = VALUE #(
         businesspartner                 = ls_sales_area-zmdg_bp_id
*          businesspartner                 = '50000121'
         calcdcrdtworthinessscorevalue                       = '0'
         calcdcrdtworthinessscoreval_vc                   = ''
         calculatedcreditriskclass  = ''
         calculatedcreditriskclass_vc  = ''
         crdtmgmtbusinesspartnergroup  = '01'
         crdtmgmtbusinesspartnergrou_vc  = ''
         crdtworthinessscorelastchgdate  = ''
         crdtworthinessscorelastchgd_vc  = ''
         creditcheckrule  = ls_sales_area-zcheck_rule
*creditcheckrule  =  '03'
         creditcheckrule_vc  = ''
         creditriskclass  = ls_sales_area-zrisk_class
*creditriskclass  = 'E'
         creditriskclasslastchangedate  = ''
         creditriskclasslastchangeda_vc  = ''
         creditriskclass_vc  = ''
         creditscoreandlimitcalcrule  = 'B2C-EXIST'
         creditscoreandlimitcalcrule_vc  = ''
         creditworthinessscorevalue  = ''
         creditworthinessscorevalue_vc  = ''





          ).


*          APPEND VALUE #(
*         BusinessPartner = ls_bp_data-zmdg_bp_id
*
*       ) TO ls_bp_crea-.

  ENDMETHOD.
ENDCLASS.
