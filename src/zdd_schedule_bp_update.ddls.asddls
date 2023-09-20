@EndUserText.label: 'Data Definition for Schedule BP Update'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_MDG_BP_INFO'
define custom entity ZDD_SCHEDULE_BP_UPDATE

{
  key customer : sysuuid_x16;
  status : abap.char(1);
  
}
