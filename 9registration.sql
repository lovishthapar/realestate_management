-- Procedure to insert data into Registration table
CREATE OR REPLACE PROCEDURE insert_registration (
    p_id IN NUMBER,
    p_name IN VARCHAR2,
    p_type IN VARCHAR2,
    p_number IN VARCHAR2,
    p_date IN DATE,
    p_description IN VARCHAR2,
    p_buyer_id IN NUMBER,
    p_seller_id IN NUMBER
) AS
BEGIN
    INSERT INTO Registration (
        Registration_id,
        Registration_name,
        Registration_type,
        Registration_number,
        Registration_date,
        Registration_description,
        Registration_buyer_id,
        Registration_seller_id
    ) VALUES (
        p_id,
        p_name,
        p_type,
        p_number,
        p_date,
        p_description,
        p_buyer_id,
        p_seller_id
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Procedure to update data in Registration table
CREATE OR REPLACE PROCEDURE update_registration (
    p_id IN NUMBER,
    p_name IN VARCHAR2,
    p_type IN VARCHAR2,
    p_number IN VARCHAR2,
    p_date IN DATE,
    p_description IN VARCHAR2,
    p_buyer_id IN NUMBER,
    p_seller_id IN NUMBER
) AS
BEGIN
    UPDATE 
        Registration
    SET
        Registration_name = p_name,
        Registration_type = p_type,
        Registration_number = p_number,
        Registration_date = p_date,
        Registration_description = p_description,
        Registration_buyer_id = p_buyer_id,
        Registration_seller_id = p_seller_id
    WHERE
        Registration_id = p_id;
    COMMIT;
END;
/

-- Procedure to print data from Registration table
CREATE OR REPLACE PROCEDURE print_registration(
    p_registration_id IN Registration.Registration_id%TYPE
)
IS
    v_registration Registration%ROWTYPE;
BEGIN
    SELECT * INTO v_registration
    FROM Registration
    WHERE Registration_id = p_registration_id;
    
    -- Print the registration details
    DBMS_OUTPUT.PUT_LINE('Registration ID: ' || v_registration.Registration_id);
    DBMS_OUTPUT.PUT_LINE('Registration Name: ' || v_registration.Registration_name);
    DBMS_OUTPUT.PUT_LINE('Registration Type: ' || v_registration.Registration_type);
    DBMS_OUTPUT.PUT_LINE('Registration Number: ' || v_registration.Registration_number);
    DBMS_OUTPUT.PUT_LINE('Registration Date: ' || TO_CHAR(v_registration.Registration_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Registration Description: ' || v_registration.Registration_description);
    DBMS_OUTPUT.PUT_LINE('Registration Buyer ID: ' || v_registration.Registration_buyer_id);
    DBMS_OUTPUT.PUT_LINE('Registration Seller ID: ' || v_registration.Registration_seller_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Registration not found for Registration ID: ' || p_registration_id);
END;
/

-- Procedure to delete data from Registration table
CREATE OR REPLACE PROCEDURE delete_registration (
    p_id IN NUMBER
) AS
BEGIN
    DELETE FROM Registration
    WHERE Registration_id = p_id;
END delete_registration;