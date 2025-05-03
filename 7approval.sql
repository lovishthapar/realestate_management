CREATE OR REPLACE PROCEDURE add_approval(
    p_approval_id IN Approval.Approval_id%TYPE,
    p_approval_name IN Approval.Approval_name%TYPE,
    p_approval_type IN Approval.Approval_type%TYPE
)
IS
BEGIN
    INSERT INTO Approval(
        Approval_id,
        Approval_name,
        Approval_type
    )
    VALUES(
        p_approval_id,
        p_approval_name,
        p_approval_type
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_approval(
    p_approval_id IN Approval.Approval_id%TYPE,
    p_approval_name IN Approval.Approval_name%TYPE,
    p_approval_type IN Approval.Approval_type%TYPE
)
IS
BEGIN
    UPDATE
        Approval
    SET
        Approval_name = p_approval_name,
        Approval_type = p_approval_type
    WHERE 
        Approval_id = p_approval_id;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_approval(
    p_approval_id IN Approval.Approval_id%TYPE
)
IS
    v_approval Approval%ROWTYPE;
BEGIN
    SELECT * INTO v_approval
    FROM Approval
    WHERE Approval_id = p_approval_id;
    
    -- Print the approval details
    DBMS_OUTPUT.PUT_LINE('Approval ID: ' || v_approval.Approval_id);
    DBMS_OUTPUT.PUT_LINE('Approval Name: ' || v_approval.Approval_name);
    DBMS_OUTPUT.PUT_LINE('Approval Type: ' || v_approval.Approval_type);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Approval not found for Approval ID: ' || p_approval_id);
END;
/


CREATE OR REPLACE PROCEDURE delete_approval(
    p_approval_id IN Approval.Approval_id%TYPE
)
IS
BEGIN
    DELETE FROM Approval
    WHERE Approval_id = p_approval_id;
    COMMIT;
END;