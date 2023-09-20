@EndUserText.label: 'Workflow: Customer'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_WF_QP_CUSTOMER'
define root custom entity ZDD_WF_CUSTOMER
{
  key customer             : sysuuid_x16;
      zbusiness_unit_name  : abap.sstring( 255 );
      zcustomer_legal_name : abap.sstring( 255 );
      zsite_name           : abap.sstring( 255 );
      zcountry             : abap.sstring( 255 );
      //    Associations
      _approvers           : association [0..*] to ZDD_WF_CUSTOMER_APPROVERS on _approvers.customer = $projection.customer;
      _create_customer     : association [0..1] to ZDD_WF_CUSTOMER_CREAT_CUSTOMER on _create_customer.customer = $projection.customer;
      _change_customer     : association [0..1] to ZDD_WF_CUSTOMER_CHANG_CUSTOMER on _change_customer.customer = $projection.customer;
       _approvers_MD       : association [0..*] to ZDD_WF_GET_APPROVERS_MD on _approvers_MD.customer = $projection.customer;
       _credit_update      : association [0..1] to ZDD_UPDATE_CREDIT_LIMIT_API on _credit_update.customer = $projection.customer;
       _reviewers          : association [0..*] to  ZDD_WF_REVIEWERS_ENTITY on _reviewers.customer = $projection.customer;
      
}
