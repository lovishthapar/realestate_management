CREATE OR REPLACE PROCEDURE insert_buyer(
    buyer_id_in IN INT,
    buyer_name_in IN VARCHAR2,
    buyer_mobile_in IN VARCHAR2,
    buyer_email_in IN VARCHAR2,
    buyer_username_in IN VARCHAR2,
    buyer_password_in IN VARCHAR2,
    buyer_address_in IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Buyer (
        Buyer_id,
        Buyer_name,
        Buyer_mobile,
        Buyer_email,
        Buyer_username,
        Buyer_password,
        Buyer_address
    )
    VALUES (
        buyer_id_in,
        buyer_name_in,
        buyer_mobile_in,
        buyer_email_in,
        buyer_username_in,
        buyer_password_in,
        buyer_address_in
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_buyer(
    p_buyer_id IN Buyer.Buyer_id%TYPE,
    p_buyer_name IN Buyer.Buyer_name%TYPE,
    p_buyer_mobile IN Buyer.Buyer_mobile%TYPE,
    p_buyer_email IN Buyer.Buyer_email%TYPE,
    p_buyer_username IN Buyer.Buyer_username%TYPE,
    p_buyer_password IN Buyer.Buyer_password%TYPE,
    p_buyer_address IN Buyer.Buyer_address%TYPE
)
IS
BEGIN
    UPDATE
        Buyer
    SET 
        Buyer_name = p_buyer_name,
        Buyer_mobile = p_buyer_mobile,
        Buyer_email = p_buyer_email,
        Buyer_username = p_buyer_username,
        Buyer_password = p_buyer_password,
        Buyer_address = p_buyer_address
    WHERE
        Buyer_id = p_buyer_id;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_buyer(
    p_buyer_id IN Buyer.Buyer_id%TYPE
)
IS
    v_buyer Buyer%ROWTYPE;
BEGIN
    SELECT * INTO v_buyer
    FROM Buyer
    WHERE Buyer_id = p_buyer_id;
    
    -- Print the buyer details
    DBMS_OUTPUT.PUT_LINE('Buyer ID: ' || v_buyer.Buyer_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_buyer.Buyer_name);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_buyer.Buyer_mobile);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_buyer.Buyer_email);
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_buyer.Buyer_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_buyer.Buyer_password);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_buyer.Buyer_address);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Buyer not found for Buyer ID: ' || p_buyer_id);
END;
/

CREATE OR REPLACE PROCEDURE delete_buyer(
    p_buyer_id IN Buyer.Buyer_id%TYPE
)
IS
BEGIN
    DELETE FROM Buyer
    WHERE Buyer_id = p_buyer_id;
    COMMIT;
END;