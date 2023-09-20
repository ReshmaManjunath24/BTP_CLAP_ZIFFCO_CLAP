CLASS lsc_ZDD_USR_MAPPING DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDD_USR_MAPPING IMPLEMENTATION.

  METHOD adjust_numbers.

        SELECT FROM ztab_usr_mapping
        FIELDS MAX( slno )
        INTO @DATA(ld_max_slno).

        lOOP AT mapped-User_Access REFERENCE INTO DATA(lr_Vertical).
            ld_max_slno += 1.
            lr_Vertical->slno = ld_max_slno.
        ENDLOOP.

  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
