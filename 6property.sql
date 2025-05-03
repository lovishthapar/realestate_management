CREATE OR REPLACE PROCEDURE insert_property(
    p_property_id IN Property.Property_id%TYPE,
    p_property_name IN Property.Property_name%TYPE,
    p_property_type_id IN Property.Property_type_id%TYPE,
    p_property_description IN Property.Property_description%TYPE,
    p_property_builder_id IN Property.Property_builder_id%TYPE,
    p_property_seller_id IN Property.Property_seller_id%TYPE,
    p_property_buyer_id IN Property.Property_buyer_id%TYPE
)
IS
BEGIN
    INSERT INTO Property(
        Property_id,
        Property_name,
        Property_type_id,
        Property_description,
        Property_builder_id,
        Property_seller_id,
        Property_buyer_id
    )
    VALUES(
        p_property_id,
        p_property_name,
        p_property_type_id,
        p_property_description,
        p_property_builder_id,
        p_property_seller_id,
        p_property_buyer_id
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_property(
    p_property_id IN Property.Property_id%TYPE,
    p_property_name IN Property.Property_name%TYPE,
    p_property_type_id IN Property.Property_type_id%TYPE,
    p_property_description IN Property.Property_description%TYPE,
    p_property_builder_id IN Property.Property_builder_id%TYPE,
    p_property_seller_id IN Property.Property_seller_id%TYPE,
    p_property_buyer_id IN Property.Property_buyer_id%TYPE
)
IS
BEGIN
    UPDATE
        Property
    SET
        Property_name = p_property_name,
        Property_type_id = p_property_type_id,
        Property_description = p_property_description,
        Property_builder_id = p_property_builder_id,
        Property_seller_id = p_property_seller_id,
        Property_buyer_id = p_property_buyer_id
    WHERE
        Property_id = p_property_id;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_property(
    p_property_id IN Property.Property_id%TYPE
)
IS
    v_property Property%ROWTYPE;
BEGIN
    SELECT * INTO v_property
    FROM Property
    WHERE Property_id = p_property_id;
    
    -- Print the property details
    DBMS_OUTPUT.PUT_LINE('Property ID: ' || v_property.Property_id);
    DBMS_OUTPUT.PUT_LINE('Property Name: ' || v_property.Property_name);
    DBMS_OUTPUT.PUT_LINE('Property Type ID: ' || v_property.Property_type_id);
    DBMS_OUTPUT.PUT_LINE('Property Description: ' || v_property.Property_description);
    DBMS_OUTPUT.PUT_LINE('Property Builder ID: ' || v_property.Property_builder_id);
    DBMS_OUTPUT.PUT_LINE('Property Seller ID: ' || v_property.Property_seller_id);
    DBMS_OUTPUT.PUT_LINE('Property Buyer ID: ' || v_property.Property_buyer_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Property not found for Property ID: ' || p_property_id);
END;
/


CREATE OR REPLACE PROCEDURE delete_property(
    p_property_id IN Property.Property_id%TYPE
)
IS
BEGIN
    DELETE FROM Property
    WHERE Property_id = p_property_id;
    COMMIT;
END;