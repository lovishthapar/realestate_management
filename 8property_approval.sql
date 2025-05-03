-- Procedure to insert data into Property_approval table
CREATE OR REPLACE PROCEDURE insert_property_approval(
    p_property_id IN Property_approval.Property_id%TYPE,
    p_approval_id IN Property_approval.Approval_id%TYPE
)
AS
BEGIN
    INSERT INTO Property_approval (
        Property_id,
        Approval_id
    )
    VALUES (
        p_property_id,
        p_approval_id
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Procedure to update data in Property_approval table
CREATE OR REPLACE PROCEDURE update_property_approval(
    p_property_id IN Property_approval.Property_id%TYPE,
    p_approval_id IN Property_approval.Approval_id%TYPE,
    p_new_property_id IN Property_approval.Property_id%TYPE,
    p_new_approval_id IN Property_approval.Approval_id%TYPE
)
AS
BEGIN
    UPDATE
        Property_approval
    SET
        Property_id = p_new_property_id,
        Approval_id = p_new_approval_id
    WHERE
        Property_id = p_property_id AND Approval_id = p_approval_id;
    COMMIT;
END;
/

-- Procedure to print data from Property_approval table
CREATE OR REPLACE PROCEDURE print_property_approval(
    p_property_id IN Property_approval.Property_id%TYPE,
    p_approval_id IN Property_approval.Approval_id%TYPE
)
IS
    v_property_approval Property_approval%ROWTYPE;
BEGIN
    SELECT * INTO v_property_approval
    FROM Property_approval
    WHERE Property_id = p_property_id AND Approval_id = p_approval_id;
    
    -- Print the property approval details
    DBMS_OUTPUT.PUT_LINE('Property ID: ' || v_property_approval.Property_id);
    DBMS_OUTPUT.PUT_LINE('Approval ID: ' || v_property_approval.Approval_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Property Approval not found for Property ID: ' || p_property_id || ' and Approval ID: ' || p_approval_id);
END;
/

-- Procedure to delete data from Property_approval table
CREATE OR REPLACE PROCEDURE delete_property_approval(
    p_property_id IN Property_approval.Property_id%TYPE,
    p_approval_id IN Property_approval.Approval_id%TYPE
)
AS
BEGIN
    DELETE FROM Property_approval
    WHERE Property_id = p_property_id AND Approval_id = p_approval_id;
    COMMIT;
END;