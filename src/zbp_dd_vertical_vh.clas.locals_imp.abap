CLASS lsc_ZDD_VERTICAL_VH DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDD_VERTICAL_VH IMPLEMENTATION.

  METHOD adjust_numbers.
        SELECT FROM ZTAB_VERTICAL
        FIELDS MAX( Vertical )
        INTO @DATA(ld_max_partner1).

        lOOP AT mapped-vertical_vh REFERENCE INTO DATA(lr_Vertical).
            ld_max_partner1 += 1.
            lr_Vertical->vertical = ld_max_partner1.
        ENDLOOP.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
