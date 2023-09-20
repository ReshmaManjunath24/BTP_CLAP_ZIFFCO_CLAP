CLASS zcl_mdg_bp_info DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun,
    if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
      c_destination TYPE string VALUE `S4D`.

    METHODS:
      get_client
        RETURNING VALUE(ro_result) TYPE REF TO if_web_http_client
        RAISING
                  cx_http_dest_provider_error
                  cx_web_http_client_error.
ENDCLASS.



CLASS ZCL_MDG_BP_INFO IMPLEMENTATION.


  METHOD get_client.
    DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
      i_name       = c_destination
      i_authn_mode = if_a4c_cp_service=>service_specific
    ).

    ro_result  = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA:
      lt_business_data TYPE TABLE OF ZMDGBUSINESSPARTNERIDSET.

    TRY.
        DATA(lo_client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZIFFCO_VALUEHELP_SRV'
            io_http_client             = get_client( )
            iv_relative_service_root   = '/sap/opu/odata/sap/ZIFFCO_VALUEHELP_SRV' ).

        DATA(lo_request) = lo_client_proxy->create_resource_for_entity_set( 'MDGBUSINESSPARTNERIDSET' )->create_request_for_read( ).
        lo_request->set_top( 300 )->set_skip( 250 ).

        DATA(lo_response) = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

     Data: ls_customer type ztab_customers,
           ls_customer_status type ztab_customers,
        lt_customer type STANDARD TABLE OF ztab_customers,
        lt_customer_status type STANDARD TABLE OF ztab_customers.

  SELECT * from ztab_customers where zmdg_request <> '' into table @lt_customer.
        LOOP at lt_customer into ls_customer.
            UPDATE ztab_salesarea
        SET zmdg_request = @ls_customer-zmdg_request,
            zmdg_bp_id  = @ls_customer-zmdg_bp_id,
            zbusiness_partner_id =  @ls_customer-zmdg_bp_id,
            zmdg_status = @ls_customer-zmdg_status
        WHERE zcustomer_num = @ls_customer-zcustomer_num.
        ENDLOOP.

 LOOP at  lt_business_data INTO DATA(Lv_business_Data).
 SHIFT Lv_business_Data-BpConverted LEFT DELETING LEADING '0'.
UPDATE ztab_customers
set zmdg_bp_id = @Lv_business_Data-bpconverted,
zmdg_status = @Lv_business_Data-mdgovchgreqgeneralstatus,
zbusiness_partner_id = @Lv_business_Data-bpconverted

WHERE zmdg_request = @Lv_business_Data-usmdcrequest.





UPDATE ztab_salesarea
SET  zmdg_bp_id = @Lv_business_Data-bpconverted,
zbusiness_partner_id = @Lv_business_Data-bpconverted,
zmdg_status = @Lv_business_Data-mdgovchgreqgeneralstatus
WHERE zmdg_request = @Lv_business_Data-usmdcrequest.




ENDLOOP.


 SELECT * from ztab_customers where zmdg_status = 'A' into table @lt_customer_status.
LOOP at lt_customer_status INTO ls_customer_status.



ls_customer_status-zrequest_status = 'Completed'.




update ztab_customers
set zrequest_status = @ls_customer_status-zrequest_status
where zmdg_status = 'A'.

ENDLOOP.






        out->write( 'Data on-premise found:' ).
        out->write( lt_business_data ).

      CATCH cx_root INTO DATA(lo_error).
        out->write( lo_error->get_text( ) ).


    ENDTRY.

*DATA: lt_result   TYPE table of  ZDD_SCHEDULE_BP_UPDATE .
*    LOOP AT lt_business_data INTO DATA(ls_approver).
*      APPEND VALUE #( customer = ls_approver-bpconverted
*                      status    = ls_approver-Mdgovchgreqgeneralstatus
*
*                    ) TO lt_result.
*                        lo_response->set_data( lt_result ).
*    ENDLOOP.



  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    "_Select
    DATA: BEGIN OF ls_filter_plain,
            documentid TYPE if_rap_query_filter=>tt_range_option,
          END OF ls_filter_plain.

    DATA: BEGIN OF ls_key,
            documentid TYPE sysuuid_x16,
          END OF ls_key.

    DATA(lv_top)         = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)        = io_request->get_paging( )->get_offset( ).
    DATA(lt_fields)      = io_request->get_requested_elements( ).
    DATA(lt_sort)        = io_request->get_sort_elements( ).
    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    LOOP AT lt_filter_cond ASSIGNING FIELD-SYMBOL(<ls_filter_cond>).
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_filter_plain TO FIELD-SYMBOL(<lv_any>).
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range.
      ASSIGN COMPONENT <ls_filter_cond>-name OF STRUCTURE ls_key TO <lv_any>.
      CHECK sy-subrc = 0.
      <lv_any> = <ls_filter_cond>-range[ 1 ]-low.
    ENDLOOP.
Data ls_bp TYPE  ztab_customers.
    SELECT SINGLE *
        FROM ztab_customers

    INTO   @ls_bp.






 DATA:
      lt_business_data TYPE TABLE OF ZMDGBUSINESSPARTNERIDSET.

    TRY.
        DATA(lo_client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZIFFCO_VALUEHELP_SRV'
            io_http_client             = get_client( )
            iv_relative_service_root   = '/sap/opu/odata/sap/ZIFFCO_VALUEHELP_SRV' ).

        DATA(lo_request) = lo_client_proxy->create_resource_for_entity_set( 'MDGBUSINESSPARTNERIDSET' )->create_request_for_read( ).
*        lo_request->set_top( 300 )->set_skip( 0 ).

        DATA(lo_response) = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

     Data: ls_customer type ztab_customers,
           ls_customer_status type ztab_customers,
        lt_customer type STANDARD TABLE OF ztab_customers,
        lt_customer_status type STANDARD TABLE OF ztab_customers.

  SELECT * from ztab_customers where zmdg_request <> '' into table @lt_customer.
        LOOP at lt_customer into ls_customer.
            UPDATE ztab_salesarea
        SET zmdg_request = @ls_customer-zmdg_request,
            zmdg_bp_id  = @ls_customer-zmdg_bp_id,
            zbusiness_partner_id =  @ls_customer-zmdg_bp_id,
            zmdg_status = @ls_customer-zmdg_status
        WHERE zcustomer_num = @ls_customer-zcustomer_num.
        ENDLOOP.

 LOOP at  lt_business_data INTO DATA(Lv_business_Data).
 SHIFT Lv_business_Data-BpConverted LEFT DELETING LEADING '0'.
UPDATE ztab_customers
set zmdg_bp_id = @Lv_business_Data-bpconverted,
zmdg_status = @Lv_business_Data-mdgovchgreqgeneralstatus,
zbusiness_partner_id = @Lv_business_Data-bpconverted

WHERE zmdg_request = @Lv_business_Data-usmdcrequest.





UPDATE ztab_salesarea
SET  zmdg_bp_id = @Lv_business_Data-bpconverted,
zbusiness_partner_id = @Lv_business_Data-bpconverted,
zmdg_status = @Lv_business_Data-mdgovchgreqgeneralstatus
WHERE zmdg_request = @Lv_business_Data-usmdcrequest.




ENDLOOP.


 SELECT * from ztab_customers where zmdg_status = 'A' into table @lt_customer_status.
LOOP at lt_customer_status INTO ls_customer_status.



ls_customer_status-zrequest_status = 'Completed'.



*** Update Request Status ID in customer table
update ztab_customers
set zrequest_status = @ls_customer_status-zrequest_status,
is_active = 'NO'
where zmdg_status = 'A'.

ENDLOOP.
*** Update Business Partner ID in History table
update ztab_req_history
set zbusiness_partner_id = @ls_customer-zmdg_bp_id

where zcustomer_num = @ls_customer-zcustomer_num.


*** Update Business Partner ID in Comment table
update ztab_comment
set zbusiness_partner_id = @ls_customer-zmdg_bp_id

where zcustomer_num = @ls_customer-zcustomer_num.






*        out->write( 'Data on-premise found:' ).
*        out->write( lt_business_data ).
*
*      CATCH cx_root INTO DATA(lo_error).
*        out->write( lo_error->get_text( ) ).


    ENDTRY.
    "_1. select ztab_doc entry
    "_2. get excel data

    DATA:lt_result  TYPE TABLE of ZDD_SCHEDULE_BP_UPDATE.

*    DATA(lo_bp) = NEW zcl_wf_bp( ).
*    DATA(lt_bp) = lo_bp->try_to_update_bp(  ).
*

 APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).
   <ls_result>-customer = ls_bp-zcustomer_num.
                      <ls_result>-status = ls_customer-zmdg_status.

*                      role     = ls_approver-role

*    ENDLOOP.
    io_response->set_data( lt_result ).
    io_response->set_total_number_of_records( 1 ).
  ENDMETHOD.
ENDCLASS.
