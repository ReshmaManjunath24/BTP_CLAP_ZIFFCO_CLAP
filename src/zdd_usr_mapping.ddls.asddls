@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for User Mapping'
define root view entity ZDD_USR_MAPPING as select from ztab_usr_mapping
{


key slno,
 users,
 emailid,
roles ,
isactive,
reviewer,
revieweridemail

}
