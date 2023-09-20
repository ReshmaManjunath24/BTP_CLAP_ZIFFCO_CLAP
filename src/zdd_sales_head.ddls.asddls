@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition sales Head'
define root view entity ZDD_SALES_HEAD as select from ztab_sales_head
{
    key reviewer ,
    revieweridemail ,
    saleshead ,
    salesheademail ,
    financereviewer ,
    financerevieweremail 
    }
