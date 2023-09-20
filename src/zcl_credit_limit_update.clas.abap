CLASS zcl_credit_limit_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
   INTERFACES if_rap_query_provider.


       METHODS:
      get_proxy
        RETURNING VALUE(ro_result) TYPE REF TO /iwbep/if_cp_client_proxy,
      read_data_with_filter
        IMPORTING
          io_out TYPE REF TO if_oo_adt_classrun_out
        RAISING
          /iwbep/cx_gateway,

      update_credit_data
        IMPORTING

          iv_customer_num TYPE zdd_clap1_view-zcustomer_num

        RAISING
          /iwbep/cx_gateway,

      update_credit_bulk
        IMPORTING

          iv_customer_num TYPE zcust_mass_upld-account_number
        RAISING
          /iwbep/cx_gateway.
  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
       tt_result TYPE STANDARD TABLE OF zcreditmanagementaccount WITH EMPTY KEY.

    CONSTANTS:
      c_destination TYPE string VALUE `S4D`,
      c_entity      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CREDITMANAGEMENTACCOUNT'.



ENDCLASS.



CLASS ZCL_CREDIT_LIMIT_UPDATE IMPLEMENTATION.


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


  METHOD if_oo_adt_classrun~main.

    TRY.
        read_data_with_filter( out ).
*        update_credit_data( out ).
      CATCH cx_root INTO DATA(lo_error).
        out->write( lo_error->get_text( ) ).
    ENDTRY.
  ENDMETHOD.


  METHOD read_data_with_filter.
    DATA:
      lt_BP    TYPE RANGE OF zcreditmanagementaccount-BusinessPartner,
      lt_found TYPE STANDARD TABLE OF zcreditmanagementaccount.



    DATA(lo_request) = get_proxy( )->create_resource_for_entity_set( c_entity )->create_request_for_read( ).

*    DATA(lo_filter_factory) = lo_request->create_filter_factory( ).
*    DATA(lo_filter)  = lo_filter_factory->create_by_range( iv_property_path = 'BUSINESSPARTNER' it_range = lt_BP ).
*    lo_request->set_filter( lo_filter ).

    DATA(lo_response) = lo_request->execute( ).
    lo_response->get_business_data( IMPORTING et_business_data = lt_found ).

    io_out->write( `Read with filter active:` ).
    io_out->write( lt_found ).
  ENDMETHOD.


  METHOD update_Credit_data.
    DATA:
     ls_updated TYPE  zcreditmanagementaccount,
     lt_sales_area type STANDARD TABLE OF ztab_salesarea,
     ls_sales_area type  ztab_salesarea.
    DATA ls_BP_Data TYPE ztab_customers.
    DATA lt_BP_Data TYPE TABLE OF ztab_customers.


    IF ls_bp_data-zmdg_bp_id IS  INITIAL.
      SELECT * FROM ztab_customers

      where
      zmdg_bp_id ='50000121'
*       zcustomer_num = @iv_customer_num
       ORDER BY  zupdated_date DESCENDING
       INTO TABLE @lt_bp_data.


      LOOP AT lt_bp_data INTO ls_bp_data.


      ENDLOOP.

    ENDIF.
 SELECT * FROM ztab_salesarea WHERE zcustomer_num = @iv_customer_num
* zmdg_bp_id = @ls_bp_data-zmdg_bp_id

* and zcredit_segment <> ''
  INTO TABLE @lt_sales_area.
LOOP AT lt_sales_area INTO ls_sales_area.

    DATA(ls_key) = VALUE zcreditmanagementaccount(
        businesspartner =  ls_sales_area-zmdg_bp_id

*        creditsegment = ls_sales_area-zcredit_segment
    creditsegment = 'AE01'
        ).
*    businesspartner = ls_sales_area-zmdg_bp_id





" Prepare the business data
data(ls_business_data) = VALUE zcreditmanagementaccount(
        BusinessPartner = ls_sales_area-zmdg_bp_id
*          CreditSegment = ls_sales_area-zcredit_segment
          CreditSegment = 'AE01'
         CreditLimitAmount = '888'
*         CreditLimitValidityEndDate = ls_sales_area-zvalidity_to
         CreditSegmentCurrency = ls_sales_area-zsales_currency


 ).

 DATA(lo_request) = get_proxy( )->create_resource_for_entity_set( 'CREDITMANAGEMENTACCOUNT'
      )->navigate_with_key( ls_key )->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-patch
    ).

    lo_request->set_business_data( is_business_data = ls_business_data it_provided_property = VALUE #(
*                    ( |BUSINESSPARTNER| )
*                    ( |CREDITSEGMENT| )
                    ( |CREDITLIMITAMOUNT| )
*                    ( |CREDITLIMITVALIDITYENDDATE| )
*                    ( |CREDITSEGMENTCURRENCY| )
                     ) ).

    DATA(lo_response) = lo_request->execute( ).


*    clear ls_business_data-CreditLimitAmount.
*    ls_business_data-CreditLimitAmount = '1000'.

ENDLOOP.



  ENDMETHOD.


    METHOD update_credit_bulk.
        DATA:
     ls_updated TYPE  zcreditmanagementaccount,
     lt_customer type STANDARD TABLE OF zcust_mass_upld,
     ls_customer type  zcust_mass_upld.
    DATA ls_BP_Data TYPE ztab_customers.
    DATA lt_BP_Data TYPE TABLE OF ztab_customers.



 SELECT * FROM zcust_mass_upld WHERE account_number = @iv_customer_num
* zmdg_bp_id = @ls_bp_data-zmdg_bp_id
 ORDER BY create_date DESCENDING
* and zcredit_segment <> ''
  INTO TABLE @lt_customer up to 1 ROWS.
LOOP AT lt_customer INTO ls_customer.
ENDLOOP.
    DATA(ls_key) = VALUE zcreditmanagementaccount(
        businesspartner =  ls_customer-account_number

        creditsegment = 'AE01'
*    creditsegment = ls_customer-zcredit_segment
        ).
*    businesspartner = ls_sales_area-zmdg_bp_id





" Prepare the business data
data(ls_business_data) = VALUE zcreditmanagementaccount(
        BusinessPartner = ls_customer-account_number
*          CreditSegment = ls_sales_area-zcredit_segment
          CreditSegment =  'AE01'
         CreditLimitAmount =  ls_customer-creditlimitamount
*         CreditLimitValidityEndDate = ls_sales_area-zvalidity_to
         CreditSegmentCurrency =  ls_customer-creditlimitcurrency


 ).

 DATA(lo_request) = get_proxy( )->create_resource_for_entity_set( 'CREDITMANAGEMENTACCOUNT'
      )->navigate_with_key( ls_key )->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-patch
    ).

    lo_request->set_business_data( is_business_data = ls_business_data it_provided_property = VALUE #(
*                    ( |BUSINESSPARTNER| )
*                    ( |CREDITSEGMENT| )
                    ( |CREDITLIMITAMOUNT| )
*                    ( |CREDITLIMITVALIDITYENDDATE| )
*                    ( |CREDITSEGMENTCURRENCY| )
                     ) ).

    DATA(lo_response) = lo_request->execute( ).


*    clear ls_business_data-CreditLimitAmount.
*    ls_business_data-CreditLimitAmount = '1000'.


    endmethod.
ENDCLASS.
