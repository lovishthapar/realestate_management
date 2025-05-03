CREATE OR REPLACE PROCEDURE insert_seller(
    seller_id_in IN INT,
    seller_name_in IN VARCHAR2,
    seller_mobile_in IN VARCHAR2,
    seller_email_in IN VARCHAR2,
    seller_username_in IN VARCHAR2,
    seller_password_in IN VARCHAR2,
    seller_address_in IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Seller (
        Seller_id,
        Seller_name,
        Seller_mobile,
        Seller_email,  
        Seller_username,
        Seller_password,
        Seller_address
    )
    VALUES (
        seller_id_in,
        seller_name_in,
        seller_mobile_in,
        seller_email_in,
        seller_username_in,
        seller_password_in,
        seller_address_in
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_seller(
    seller_id_in IN INT,
    seller_name_in IN VARCHAR2,
    seller_mobile_in IN VARCHAR2,
    seller_email_in IN VARCHAR2,
    seller_username_in IN VARCHAR2,
    seller_password_in IN VARCHAR2,
    seller_address_in IN VARCHAR2
)
IS
BEGIN
    UPDATE Seller
    SET
        Seller_name = seller_name_in,
        Seller_mobile = seller_mobile_in,
        Seller_email = seller_email_in,
        Seller_username = seller_username_in,
        Seller_password = seller_password_in,
        Seller_address = seller_address_in
    WHERE
        Seller_id = seller_id_in;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_seller(
    p_seller_id IN Seller.Seller_id%TYPE
)
IS
    v_seller Seller%ROWTYPE;
BEGIN
    SELECT * INTO v_seller
    FROM Seller
    WHERE Seller_id = p_seller_id;
    
    -- Print the seller details
    DBMS_OUTPUT.PUT_LINE('Seller ID: ' || v_seller.Seller_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_seller.Seller_name);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_seller.Seller_mobile);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_seller.Seller_email);
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_seller.Seller_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_seller.Seller_password);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_seller.Seller_address);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Seller not found for Seller ID: ' || p_seller_id);
END;
/

CREATE OR REPLACE PROCEDURE delete_seller(
    p_seller_id INT
) AS
BEGIN
    DELETE FROM Seller
    WHERE Seller_id = p_seller_id;
    COMMIT;
END;
/