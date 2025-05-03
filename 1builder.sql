CREATE OR REPLACE PROCEDURE insert_builder(
    builder_id_in IN Builder.Builder_id%TYPE,
    builder_name_in IN Builder.Builder_name%TYPE,
    builder_mobile_in IN Builder.Builder_mobile%TYPE,
    builder_email_in IN Builder.Builder_email%TYPE,
    builder_username_in IN Builder.Builder_username%TYPE,
    builder_password_in IN Builder.Builder_password%TYPE,
    builder_address_in IN Builder.Builder_address%TYPE
)
IS
BEGIN
    INSERT INTO Builder (
        Builder_id,
        Builder_name,
        Builder_mobile,
        Builder_email,
        Builder_username,
        Builder_password,
        Builder_address
    )
    VALUES (
        builder_id_in,
        builder_name_in,
        builder_mobile_in,
        builder_email_in,
        builder_username_in,
        builder_password_in,
        builder_address_in
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_builder(
    p_id IN Builder.Builder_id%TYPE,
    p_name IN Builder.Builder_name%TYPE,
    p_mobile IN Builder.Builder_mobile%TYPE,
    p_email IN Builder.Builder_email%TYPE,
    p_username IN Builder.Builder_username%TYPE,
    p_password IN Builder.Builder_password%TYPE,
    p_address IN Builder.Builder_address%TYPE
)
IS
BEGIN
    UPDATE Builder
    SET
        Builder_name = p_name,
        Builder_mobile = p_mobile,
        Builder_email = p_email,
        Builder_username = p_username,
        Builder_password = p_password,
        Builder_address = p_address
    WHERE
        Builder_id = p_id;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE print_builder(
    p_builder_id IN Builder.Builder_id%TYPE
)
IS
    v_builder Builder%ROWTYPE;
BEGIN
    SELECT * INTO v_builder
    FROM Builder
    WHERE Builder_id = p_builder_id;
    
    -- Print the builder details
    DBMS_OUTPUT.PUT_LINE('Builder ID: ' || v_builder.Builder_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_builder.Builder_name);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_builder.Builder_mobile);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_builder.Builder_email);
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_builder.Builder_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_builder.Builder_password);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_builder.Builder_address);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Builder not found for Builder ID: ' || p_builder_id);
END;
/

CREATE OR REPLACE PROCEDURE delete_builder(
    p_id IN Builder.Builder_id%TYPE
)
IS
BEGIN
    DELETE FROM Builder
    WHERE Builder_id = p_id;
    COMMIT;
END;