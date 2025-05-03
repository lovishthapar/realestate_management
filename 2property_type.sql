CREATE OR REPLACE PROCEDURE insert_property_type(
    property_type_id_in IN Property_type.Property_type_id%TYPE,
    property_type_name_in IN Property_type.Property_type_name%TYPE,
    property_type_description_in IN Property_type.Property_type_description%TYPE
)
IS
BEGIN
    INSERT INTO Property_type (
        Property_type_id,
        Property_type_name,
        Property_type_description
    )
    VALUES (
        property_type_id_in,
        property_type_name_in,
        property_type_description_in
    );
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE update_property_type(
    p_property_type_id IN Property_type.Property_type_id%TYPE,
    p_property_type_name IN Property_type.Property_type_name%TYPE,
    p_property_type_description IN Property_type.Property_type_description%TYPE
) AS
BEGIN
    UPDATE Property_type
    SET
        Property_type_name = p_property_type_name,
        Property_type_description = p_property_type_description
    WHERE
        Property_type_id = p_property_type_id;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_property_type(
    p_property_type_id IN Property_type.Property_type_id%TYPE
)
IS
    v_property_type Property_type%ROWTYPE;
BEGIN
    SELECT * INTO v_property_type
    FROM Property_type
    WHERE Property_type_id = p_property_type_id;
    
    -- Print the property type details
    DBMS_OUTPUT.PUT_LINE('Property Type ID: ' || v_property_type.Property_type_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_property_type.Property_type_name);
    DBMS_OUTPUT.PUT_LINE('Description: ' || v_property_type.Property_type_description);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Property Type not found for Property Type ID: ' || p_property_type_id);
END;
/

CREATE OR REPLACE PROCEDURE delete_property_type(
    p_property_type_id IN Property_type.Property_type_id%TYPE
)
AS
BEGIN
    DELETE FROM Property_type
    WHERE Property_type_id = p_property_type_id;
    COMMIT;
END;