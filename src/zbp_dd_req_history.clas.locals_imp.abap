CLASS lsc_ZDD_REQ_HISTORY DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

*  METHODS adjust_numbers REDEFINITION.
**
*   METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDD_REQ_HISTORY IMPLEMENTATION.

* METHOD adjust_numbers.
*
*        SELECT FROM ztab_req_history
*        FIELDS MAX( srno )
*        INTO @DATA(ld_max_srno).
*
*        lOOP AT mapped-History REFERENCE INTO DATA(lr_Vertical).
*            ld_max_srno += 1.
*            lr_Vertical->srno = ld_max_srno.
*        ENDLOOP.
*  ENDMETHOD.
*
*  METHOD cleanup_finalize.
*  ENDMETHOD.

ENDCLASS.
