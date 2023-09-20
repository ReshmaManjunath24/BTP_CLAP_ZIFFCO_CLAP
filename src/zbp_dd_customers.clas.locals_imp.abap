CLASS lhc_CUSTOMER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR customer RESULT result.

    METHODS ValidationForBusinessUnit FOR VALIDATE ON SAVE
      IMPORTING keys FOR customer~ValidationForBusinessUnit.

ENDCLASS.

CLASS lhc_CUSTOMER IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidationForBusinessUnit.

 READ ENTITIES OF ZDD_CUSTOMER IN LOCAL MODE

*"Customer" Behavioural Definition name
  ENTITY Customer FIELDS ( zcustomer_num  zbusiness_unit_name zcustomer_legal_name zrequest_no zrequest_status )
  WITH CORRESPONDING #( keys )
  RESULT DATA(It_Customers).

  LOOP at It_Customers INTO DATA(Customer).
  SELECT FROM ZTAB_CUSTOMERS
  FIELDS zcustomer_num
  WHERE zbusiness_unit_name = @customer-zbusiness_unit_name
  AND zcustomer_legal_name = @customer-zcustomer_legal_name
  AND zrequest_no = @customer-zrequest_no
  AND zrequest_status = @customer-zrequest_status


*  UNION
*  SELECT FROM ztab_cm_Customer_D
*  FIELDS c_id
*  WHERE zbusiness_unit_name = @Customer-zbusiness_unit_name AND zcustomer_legal_name = @Customer-zcustomer_legal_name
 INTO TABLE @DATA(check_results).

 IF check_results is NOT INITIAL.
 data(message) = me->new_message(
 id = 'ZERROR_MSG'
 number = '001'
 severity = ms-error
 v1 = Customer-zbusiness_unit_name
 v2 = Customer-zcustomer_legal_name
 v3 = Customer-zrequest_status
 v4 = Customer-zrequest_no ).

 DATA reported_record LIKE LINE OF reported-Customer.
 reported_record-%tky = Customer-%tky.
 reported_record-%msg = message.
 reported_record-%element-zbusiness_unit_name = if_abap_behv=>mk-on.
 reported_record-%element-zcustomer_legal_name = if_abap_behv=>mk-on.
 reported_record-%element-zrequest_status = if_abap_behv=>mk-on.
 reported_record-%element-zrequest_no = if_abap_behv=>mk-on.
 APPEND reported_record to reported-Customer.


 data failed_record LIKE LINE OF failed-Customer.

 failed_record-%tky = Customer-%tky.
 APPEND failed_record to failed-Customer.


 ENDIF.
  ENDLOOP.


  ENDMETHOD.

ENDCLASS.
